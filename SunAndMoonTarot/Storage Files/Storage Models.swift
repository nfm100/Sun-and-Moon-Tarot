import Foundation
import CloudKit

class TarotReading: ObservableObject, Identifiable, Codable {
    @Published var date: Date
    @Published var cards: [String]
    @Published var type: String
    var recordID: String? // Add recordID property

    enum CodingKeys: String, CodingKey {
        case date, cards, type, recordID
    }

    // Custom initializer
    init(date: Date, cards: [String], type: String, recordID: String? = nil) {
        self.date = date
        self.cards = cards
        self.type = type
        self.recordID = recordID
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(Date.self, forKey: .date)
        cards = try container.decode([String].self, forKey: .cards)
        type = try container.decode(String.self, forKey: .type)
        recordID = try container.decodeIfPresent(String.self, forKey: .recordID)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(cards, forKey: .cards)
        try container.encode(type, forKey: .type)
        try container.encode(recordID, forKey: .recordID)
    }

    // Method to convert a TarotReading to a CKRecord
    func toCKRecord() -> CKRecord {
        let record: CKRecord
        if let recordID = recordID {
            record = CKRecord(recordType: "TarotReading", recordID: CKRecord.ID(recordName: recordID))
        } else {
            record = CKRecord(recordType: "TarotReading")
        }
        record["date"] = date as NSDate
        record["cards"] = cards as NSArray
        record["type"] = type as NSString
        return record
    }

    // Initializer to create a TarotReading from a CKRecord
    init?(record: CKRecord) {
        guard let date = record["date"] as? Date,
              let cards = record["cards"] as? [String],
              let type = record["type"] as? String else {
            return nil
        }
        self.date = date
        self.cards = cards
        self.type = type
        self.recordID = record.recordID.recordName
    }
}
