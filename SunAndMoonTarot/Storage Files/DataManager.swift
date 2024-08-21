import SwiftUI
import CloudKit

class DataManager: ObservableObject {
    @Published var readings: [TarotReading] = []
    private let fileName = "readings.json"
    private var privateDatabase: CKDatabase {
        return CKContainer.default().privateCloudDatabase
    }

    init() {
        loadLocalReadings()
        fetchFromCloudKit()
    }

    func addReading(reading: TarotReading) {
        readings.append(reading)
        saveLocalReadings()
        saveToCloudKit(reading: reading)
    }

    func removeReading(at index: Int) {
        guard index < readings.count else { return }
        let reading = readings.remove(at: index)
        saveLocalReadings()
        if let recordID = reading.recordID {
            deleteFromCloudKit(recordID: CKRecord.ID(recordName: recordID))
        }
    }

    func clearReadings() {
        readings.removeAll()
        saveLocalReadings()
        clearCloudKit()
    }

    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    private func getFileURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent(fileName)
    }

    private func saveLocalReadings() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(readings)
            try data.write(to: getFileURL())
        } catch {
            print("Error saving local readings: \(error.localizedDescription)")
        }
    }

    private func loadLocalReadings() {
        let fileURL = getFileURL()
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return }
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL)
            readings = try decoder.decode([TarotReading].self, from: data)
        } catch {
            print("Error loading local readings: \(error.localizedDescription)")
        }
    }

    private func saveToCloudKit(reading: TarotReading) {
        let record = reading.toCKRecord()
        privateDatabase.save(record) { [weak self] savedRecord, error in
            guard let self = self, let savedRecord = savedRecord, error == nil else {
                print("Error saving record to CloudKit: \(String(describing: error))")
                return
            }
            DispatchQueue.main.async {
                if let index = self.readings.firstIndex(where: { $0.id == reading.id }) {
                    self.readings[index].recordID = savedRecord.recordID.recordName
                    self.saveLocalReadings()
                }
            }
        }
    }

    private func deleteFromCloudKit(recordID: CKRecord.ID) {
        privateDatabase.delete(withRecordID: recordID) { _, error in
            if let error = error {
                print("Error deleting record from CloudKit: \(error.localizedDescription)")
            }
        }
    }

    private func clearCloudKit() {
        let query = CKQuery(recordType: "TarotReading", predicate: NSPredicate(value: true))
        privateDatabase.fetch(withQuery: query, inZoneWith: nil, desiredKeys: nil, resultsLimit: CKQueryOperation.maximumResults) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let (matchResults, _)):
                let recordIDs = matchResults.compactMap { try? $0.1.get().recordID }
                let deleteOperation = CKModifyRecordsOperation(recordsToSave: nil, recordIDsToDelete: recordIDs)
                deleteOperation.modifyRecordsCompletionBlock = { _, deletedRecordIDs, error in
                    if let error = error {
                        print("Error clearing records from CloudKit: \(error.localizedDescription)")
                    }
                }
                self.privateDatabase.add(deleteOperation)
            case .failure(let error):
                print("Error fetching records from CloudKit: \(error.localizedDescription)")
            }
        }
    }

    func fetchFromCloudKit() {
        let query = CKQuery(recordType: "TarotReading", predicate: NSPredicate(value: true))
        privateDatabase.perform(query, inZoneWith: nil) { [weak self] results, error in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching records from CloudKit: \(error.localizedDescription)")
                return
            }
            guard let results = results else { return }
            DispatchQueue.main.async {
                self.readings = results.compactMap { TarotReading(record: $0) }
                self.saveLocalReadings()
            }
        }
    }
    
    func isICloudAvailable() -> Bool {
        var available = false
        CKContainer.default().accountStatus { status, error in
            if status == .available {
                available = true
            }
        }
        return available
    }

    func syncLocalToCloud() {
        guard isICloudAvailable() else { return }
        for reading in readings {
            if reading.recordID == nil {
                saveToCloudKit(reading: reading)
            }
        }
    }
}

