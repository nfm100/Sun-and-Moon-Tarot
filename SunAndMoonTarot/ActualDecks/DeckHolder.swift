//
//  DeckHolder.swift
//  Tarot?
//
//  Created by Nicholas Miravich on 6/28/24.
//

import Foundation

class DeckHolder: ObservableObject{
    
    @Published var decks: [String: [String: String]] = [
        "Standard": ["major_arcana_fool": "The Fool", "major_arcana_magician": "The Magician", "major_arcana_priestess": "The High Priestess", "major_arcana_empress": "The Empress", "major_arcana_emperor": "The Emperor", "major_arcana_hierophant": "The Hierophant", "major_arcana_lovers": "The Lovers", "major_arcana_chariot": "The Chariot", "major_arcana_strength": "Strength", "major_arcana_hermit": "The Hermit", "major_arcana_fortune": "Wheel of Fortune", "major_arcana_justice": "Justice", "major_arcana_hanged": "The Hanged Man", "major_arcana_death": "Death", "major_arcana_temperance": "Temperance", "major_arcana_devil": "The Devil", "major_arcana_tower": "The Tower", "major_arcana_star": "The Star", "major_arcana_moon": "The Moon", "major_arcana_sun": "The Sun", "major_arcana_judgement": "Judgment", "major_arcana_world": "The World", "minor_arcana_wands_ace": "Ace of Wands", "minor_arcana_wands_2": "Two of Wands", "minor_arcana_wands_3": "Three of Wands", "minor_arcana_wands_4": "Four of Wands", "minor_arcana_wands_5": "Five of Wands", "minor_arcana_wands_6": "Six of Wands", "minor_arcana_wands_7": "Seven of Wands", "minor_arcana_wands_8": "Eight of Wands", "minor_arcana_wands_9": "Nine of Wands", "minor_arcana_wands_10": "Ten of Wands", "minor_arcana_wands_page": "Page of Wands", "minor_arcana_wands_knight": "Knight of Wands", "minor_arcana_wands_queen": "Queen of Wands", "minor_arcana_wands_king": "King of Wands", "minor_arcana_cups_ace": "Ace of Cups", "minor_arcana_cups_2": "Two of Cups", "minor_arcana_cups_3": "Three of Cups", "minor_arcana_cups_4": "Four of Cups", "minor_arcana_cups_5": "Five of Cups", "minor_arcana_cups_6": "Six of Cups", "minor_arcana_cups_7": "Seven of Cups", "minor_arcana_cups_8": "Eight of Cups", "minor_arcana_cups_9": "Nine of Cups", "minor_arcana_cups_10": "Ten of Cups", "minor_arcana_cups_page": "Page of Cups", "minor_arcana_cups_knight": "Knight of Cups", "minor_arcana_cups_queen": "Queen of Cups", "minor_arcana_cups_king": "King of Cups", "minor_arcana_swords_ace": "Ace of Swords", "minor_arcana_swords_2": "Two of Swords", "minor_arcana_swords_3": "Three of Swords", "minor_arcana_swords_4": "Four of Swords", "minor_arcana_swords_5": "Five of Swords", "minor_arcana_swords_6": "Six of Swords", "minor_arcana_swords_7": "Seven of Swords", "minor_arcana_swords_8": "Eight of Swords", "minor_arcana_swords_9": "Nine of Swords", "minor_arcana_swords_10": "Ten of Swords", "minor_arcana_swords_page": "Page of Swords", "minor_arcana_swords_knight": "Knight of Swords", "minor_arcana_swords_queen": "Queen of Swords", "minor_arcana_swords_king": "King of Swords", "minor_arcana_pentacles_ace": "Ace of Pentacles", "minor_arcana_pentacles_2": "Two of Pentacles", "minor_arcana_pentacles_3": "Three of Pentacles", "minor_arcana_pentacles_4": "Four of Pentacles", "minor_arcana_pentacles_5": "Five of Pentacles", "minor_arcana_pentacles_6": "Six of Pentacles", "minor_arcana_pentacles_7": "Seven of Pentacles", "minor_arcana_pentacles_8": "Eight of Pentacles", "minor_arcana_pentacles_9": "Nine of Pentacles", "minor_arcana_pentacles_10": "Ten of Pentacles", "minor_arcana_pentacles_page": "Page of Pentacles", "minor_arcana_pentacles_knight": "Knight of Pentacles", "minor_arcana_pentacles_queen": "Queen of Pentacles", "minor_arcana_pentacles_king": "King of Pentacles"],
        
        
        "Rider Waite": [
            "the_fool_Waite": "The Fool", "the_magician_Waite": "The Magician", "the_high_priestess_Waite": "The High Priestess",
            "the_empress_Waite": "The Empress", "the_emperor_Waite": "The Emperor", "the_hierophant_Waite": "The Hierophant",
            "the_lovers_Waite": "The Lovers", "the_chariot_Waite": "The Chariot", "strength_Waite": "Strength",
            "the_hermit_Waite": "The Hermit", "the_wheel_of_fortune_Waite": "Wheel of Fortune", "justice_Waite": "Justice",
            "the_hanged_man_Waite": "The Hanged Man", "death_Waite": "Death", "temperance_Waite": "Temperance",
            "the_devil_Waite": "The Devil", "the_tower_Waite": "The Tower", "the_star_Waite": "The Star",
            "the_moon_Waite": "The Moon", "the_sun_Waite": "The Sun", "judgement_Waite": "Judgment", "the_world_Waite": "The World",
            "ace_of_wands_Waite": "Ace of Wands", "2_of_wands_Waite": "Two of Wands", "3_of_wands_Waite": "Three of Wands",
            "4_of_wands_Waite": "Four of Wands", "5_of_wands_Waite": "Five of Wands", "6_of_wands_Waite": "Six of Wands",
            "7_of_wands_Waite": "Seven of Wands", "8_of_wands_Waite": "Eight of Wands", "9_of_wands_Waite": "Nine of Wands",
            "10_of_wands_Waite": "Ten of Wands", "page_of_wands_Waite": "Page of Wands", "knight_of_wands_Waite": "Knight of Wands",
            "queen_of_wands_Waite": "Queen of Wands", "king_of_wands_Waite": "King of Wands", "ace_of_cups_Waite": "Ace of Cups",
            "2_of_cups_Waite": "Two of Cups", "3_of_cups_Waite": "Three of Cups", "4_of_cups_Waite": "Four of Cups",
            "5_of_cups_Waite": "Five of Cups", "6_of_cups_Waite": "Six of Cups", "7_of_cups_Waite": "Seven of Cups",
            "8_of_cups_Waite": "Eight of Cups", "9_of_cups_Waite": "Nine of Cups", "10_of_cups_Waite": "Ten of Cups",
            "page_of_cups_Waite": "Page of Cups", "knight_of_cups_Waite": "Knight of Cups", "queen_of_cups_Waite": "Queen of Cups",
            "king_of_cups_Waite": "King of Cups", "ace_of_swords_Waite": "Ace of Swords", "2_of_swords_Waite": "Two of Swords",
            "3_of_swords_Waite": "Three of Swords", "4_of_swords_Waite": "Four of Swords", "5_of_swords_Waite": "Five of Swords",
            "6_of_swords_Waite": "Six of Swords", "7_of_swords_Waite": "Seven of Swords", "8_of_swords_Waite": "Eight of Swords",
            "9_of_swords_Waite": "Nine of Swords", "10_of_swords_Waite": "Ten of Swords", "page_of_swords_Waite": "Page of Swords",
            "knight_of_swords_Waite": "Knight of Swords", "queen_of_swords_Waite": "Queen of Swords", "king_of_swords_Waite": "King of Swords",
            "ace_of_pentacles_Waite": "Ace of Pentacles", "2_of_pentacles_Waite": "Two of Pentacles", "3_of_pentacles_Waite": "Three of Pentacles",
            "4_of_pentacles_Waite": "Four of Pentacles", "5_of_pentacles_Waite": "Five of Pentacles", "6_of_pentacles_Waite": "Six of Pentacles",
            "7_of_pentacles_Waite": "Seven of Pentacles", "8_of_pentacles_Waite": "Eight of Pentacles", "9_of_pentacles_Waite": "Nine of Pentacles",
            "10_of_pentacles_Waite": "Ten of Pentacles", "page_of_pentacles_Waite": "Page of Pentacles", "knight_of_pentacles_Waite": "Knight of Pentacles",
            "queen_of_pentacles_Waite": "Queen of Pentacles", "king_of_pentacles_Waite": "King of Pentacles"
        ],
        
        
        "Everyday Witch": [
            "the_fool": "The Fool", "the_magician": "The Magician", "the_high_priestess": "The High Priestess",
            "the_empress": "The Empress", "the_emperor": "The Emperor", "the_hierophant": "The Hierophant",
            "the_lovers": "The Lovers", "the_chariot": "The Chariot", "strength": "Strength",
            "the_hermit": "The Hermit", "the_wheel_of_fortune": "Wheel of Fortune", "justice": "Justice",
            "the_hanged_man": "The Hanged Man", "death": "Death", "temperance": "Temperance",
            "the_devil": "The Devil", "the_tower": "The Tower", "the_star": "The Star",
            "the_moon": "The Moon", "the_sun": "The Sun", "judgement": "Judgment", "the_world": "The World",
            "ace_of_wands": "Ace of Wands", "2_of_wands": "Two of Wands", "3_of_wands": "Three of Wands",
            "4_of_wands": "Four of Wands", "5_of_wands": "Five of Wands", "6_of_wands": "Six of Wands",
            "7_of_wands": "Seven of Wands", "8_of_wands": "Eight of Wands", "9_of_wands": "Nine of Wands",
            "10_of_wands": "Ten of Wands", "page_of_wands": "Page of Wands", "knight_of_wands": "Knight of Wands",
            "queen_of_wands": "Queen of Wands", "king_of_wands": "King of Wands", "ace_of_cups": "Ace of Cups",
            "2_of_cups": "Two of Cups", "3_of_cups": "Three of Cups", "4_of_cups": "Four of Cups",
            "5_of_cups": "Five of Cups", "6_of_cups": "Six of Cups", "7_of_cups": "Seven of Cups",
            "8_of_cups": "Eight of Cups", "9_of_cups": "Nine of Cups", "10_of_cups": "Ten of Cups",
            "page_of_cups": "Page of Cups", "knight_of_cups": "Knight of Cups", "queen_of_cups": "Queen of Cups",
            "king_of_cups": "King of Cups", "ace_of_swords": "Ace of Swords", "2_of_swords": "Two of Swords",
            "3_of_swords": "Three of Swords", "4_of_swords": "Four of Swords", "5_of_swords": "Five of Swords",
            "6_of_swords": "Six of Swords", "7_of_swords": "Seven of Swords", "8_of_swords": "Eight of Swords",
            "9_of_swords": "Nine of Swords", "10_of_swords": "Ten of Swords", "page_of_swords": "Page of Swords",
            "knight_of_swords": "Knight of Swords", "queen_of_swords": "Queen of Swords", "king_of_swords": "King of Swords",
            "ace_of_pentacles": "Ace of Pentacles", "2_of_pentacles": "Two of Pentacles", "3_of_pentacles": "Three of Pentacles",
            "4_of_pentacles": "Four of Pentacles", "5_of_pentacles": "Five of Pentacles", "6_of_pentacles": "Six of Pentacles",
            "7_of_pentacles": "Seven of Pentacles", "8_of_pentacles": "Eight of Pentacles", "9_of_pentacles": "Nine of Pentacles",
            "10_of_pentacles": "Ten of Pentacles", "page_of_pentacles": "Page of Pentacles", "knight_of_pentacles": "Knight of Pentacles",
            "queen_of_pentacles": "Queen of Pentacles", "king_of_pentacles": "King of Pentacles"
        ],
        
        "English Magic": [
            "the_fool_English": "The Fool", "the_magician_English": "The Magician", "the_high_priestess_English": "The High Priestess",
            "the_empress_English": "The Empress", "the_emperor_English": "The Emperor", "the_hierophant_English": "The Hierophant",
            "the_lovers_English": "The Lovers", "the_chariot_English": "The Chariot", "strength_English": "Strength",
            "the_hermit_English": "The Hermit", "the_wheel_of_fortune_English": "Wheel of Fortune", "justice_English": "Justice",
            "the_hanged_man_English": "The Hanged Man", "death_English": "Death", "temperance_English": "Temperance",
            "the_devil_English": "The Devil", "the_tower_English": "The Tower", "the_star_English": "The Star",
            "the_moon_English": "The Moon", "the_sun_English": "The Sun", "judgement_English": "Judgment", "the_world_English": "The World",
            "ace_of_wands_English": "Ace of Wands", "2_of_wands_English": "Two of Wands", "3_of_wands_English": "Three of Wands",
            "4_of_wands_English": "Four of Wands", "5_of_wands_English": "Five of Wands", "6_of_wands_English": "Six of Wands",
            "7_of_wands_English": "Seven of Wands", "8_of_wands_English": "Eight of Wands", "9_of_wands_English": "Nine of Wands",
            "10_of_wands_English": "Ten of Wands", "page_of_wands_English": "Page of Wands", "knight_of_wands_English": "Knight of Wands",
            "queen_of_wands_English": "Queen of Wands", "king_of_wands_English": "King of Wands", "ace_of_cups_English": "Ace of Cups",
            "2_of_cups_English": "Two of Cups", "3_of_cups_English": "Three of Cups", "4_of_cups_English": "Four of Cups",
            "5_of_cups_English": "Five of Cups", "6_of_cups_English": "Six of Cups", "7_of_cups_English": "Seven of Cups",
            "8_of_cups_English": "Eight of Cups", "9_of_cups_English": "Nine of Cups", "10_of_cups_English": "Ten of Cups",
            "page_of_cups_English": "Page of Cups", "knight_of_cups_English": "Knight of Cups", "queen_of_cups_English": "Queen of Cups",
            "king_of_cups_English": "King of Cups", "ace_of_swords_English": "Ace of Swords", "2_of_swords_English": "Two of Swords",
            "3_of_swords_English": "Three of Swords", "4_of_swords_English": "Four of Swords", "5_of_swords_English": "Five of Swords",
            "6_of_swords_English": "Six of Swords", "7_of_swords_English": "Seven of Swords", "8_of_swords_English": "Eight of Swords",
            "9_of_swords_English": "Nine of Swords", "10_of_swords_English": "Ten of Swords", "page_of_swords_English": "Page of Swords",
            "knight_of_swords_English": "Knight of Swords", "queen_of_swords_English": "Queen of Swords", "king_of_swords_English": "King of Swords",
            "ace_of_pentacles_English": "Ace of Pentacles", "2_of_pentacles_English": "Two of Pentacles", "3_of_pentacles_English": "Three of Pentacles",
            "4_of_pentacles_English": "Four of Pentacles", "5_of_pentacles_English": "Five of Pentacles", "6_of_pentacles_English": "Six of Pentacles",
            "7_of_pentacles_English": "Seven of Pentacles", "8_of_pentacles_English": "Eight of Pentacles", "9_of_pentacles_English": "Nine of Pentacles",
            "10_of_pentacles_English": "Ten of Pentacles", "page_of_pentacles_English": "Page of Pentacles", "knight_of_pentacles_English": "Knight of Pentacles",
            "queen_of_pentacles_English": "Queen of Pentacles", "king_of_pentacles_English": "King of Pentacles"
        ],
    
        "Gothic": [
            "the_fool_Gothic": "The Fool", "the_magician_Gothic": "The Magician", "the_high_priestess_Gothic": "The High Priestess",
            "the_empress_Gothic": "The Empress", "the_emperor_Gothic": "The Emperor", "the_hierophant_Gothic": "The Hierophant",
            "the_lovers_Gothic": "The Lovers", "the_chariot_Gothic": "The Chariot", "strength_Gothic": "Strength",
            "the_hermit_Gothic": "The Hermit", "the_wheel_of_fortune_Gothic": "Wheel of Fortune", "justice_Gothic": "Justice",
            "the_hanged_man_Gothic": "The Hanged Man", "death_Gothic": "Death", "temperance_Gothic": "Temperance",
            "the_devil_Gothic": "The Devil", "the_tower_Gothic": "The Tower", "the_star_Gothic": "The Star",
            "the_moon_Gothic": "The Moon", "the_sun_Gothic": "The Sun", "judgement_Gothic": "Judgment", "the_world_Gothic": "The World",
            "ace_of_wands_Gothic": "Ace of Wands", "2_of_wands_Gothic": "Two of Wands", "3_of_wands_Gothic": "Three of Wands",
            "4_of_wands_Gothic": "Four of Wands", "5_of_wands_Gothic": "Five of Wands", "6_of_wands_Gothic": "Six of Wands",
            "7_of_wands_Gothic": "Seven of Wands", "8_of_wands_Gothic": "Eight of Wands", "9_of_wands_Gothic": "Nine of Wands",
            "10_of_wands_Gothic": "Ten of Wands", "page_of_wands_Gothic": "Page of Wands", "knight_of_wands_Gothic": "Knight of Wands",
            "queen_of_wands_Gothic": "Queen of Wands", "king_of_wands_Gothic": "King of Wands", "ace_of_cups_Gothic": "Ace of Cups",
            "2_of_cups_Gothic": "Two of Cups", "3_of_cups_Gothic": "Three of Cups", "4_of_cups_Gothic": "Four of Cups",
            "5_of_cups_Gothic": "Five of Cups", "6_of_cups_Gothic": "Six of Cups", "7_of_cups_Gothic": "Seven of Cups",
            "8_of_cups_Gothic": "Eight of Cups", "9_of_cups_Gothic": "Nine of Cups", "10_of_cups_Gothic": "Ten of Cups",
            "page_of_cups_Gothic": "Page of Cups", "knight_of_cups_Gothic": "Knight of Cups", "queen_of_cups_Gothic": "Queen of Cups",
            "king_of_cups_Gothic": "King of Cups", "ace_of_swords_Gothic": "Ace of Swords", "2_of_swords_Gothic": "Two of Swords",
            "3_of_swords_Gothic": "Three of Swords", "4_of_swords_Gothic": "Four of Swords", "5_of_swords_Gothic": "Five of Swords",
            "6_of_swords_Gothic": "Six of Swords", "7_of_swords_Gothic": "Seven of Swords", "8_of_swords_Gothic": "Eight of Swords",
            "9_of_swords_Gothic": "Nine of Swords", "10_of_swords_Gothic": "Ten of Swords", "page_of_swords_Gothic": "Page of Swords",
            "knight_of_swords_Gothic": "Knight of Swords", "queen_of_swords_Gothic": "Queen of Swords", "king_of_swords_Gothic": "King of Swords",
            "ace_of_pentacles_Gothic": "Ace of Pentacles", "2_of_pentacles_Gothic": "Two of Pentacles", "3_of_pentacles_Gothic": "Three of Pentacles",
            "4_of_pentacles_Gothic": "Four of Pentacles", "5_of_pentacles_Gothic": "Five of Pentacles", "6_of_pentacles_Gothic": "Six of Pentacles",
            "7_of_pentacles_Gothic": "Seven of Pentacles", "8_of_pentacles_Gothic": "Eight of Pentacles", "9_of_pentacles_Gothic": "Nine of Pentacles",
            "10_of_pentacles_Gothic": "Ten of Pentacles", "page_of_pentacles_Gothic": "Page of Pentacles", "knight_of_pentacles_Gothic": "Knight of Pentacles",
            "queen_of_pentacles_Gothic": "Queen of Pentacles", "king_of_pentacles_Gothic": "King of Pentacles"
        ],
        
        "Herbal": [
            "the_fool_Herbal": "The Fool", "the_magician_Herbal": "The Magician", "the_high_priestess_Herbal": "The High Priestess",
            "the_empress_Herbal": "The Empress", "the_emperor_Herbal": "The Emperor", "the_hierophant_Herbal": "The Hierophant",
            "the_lovers_Herbal": "The Lovers", "the_chariot_Herbal": "The Chariot", "strength_Herbal": "Strength",
            "the_hermit_Herbal": "The Hermit", "the_wheel_of_fortune_Herbal": "Wheel of Fortune", "justice_Herbal": "Justice",
            "the_hanged_man_Herbal": "The Hanged Man", "death_Herbal": "Death_Herbal", "temperance_Herbal": "Temperance",
            "the_devil_Herbal": "The Devil", "the_tower_Herbal": "The Tower", "the_star_Herbal": "The Star",
            "the_moon_Herbal": "The Moon", "the_sun_Herbal": "The Sun", "judgement_Herbal": "Judgment", "the_world_Herbal": "The World",
            "ace_of_wands_Herbal": "Ace of Wands", "2_of_wands_Herbal": "Two of Wands", "3_of_wands_Herbal": "Three of Wands",
            "4_of_wands_Herbal": "Four of Wands", "5_of_wands_Herbal": "Five of Wands", "6_of_wands_Herbal": "Six of Wands",
            "7_of_wands_Herbal": "Seven of Wands", "8_of_wands_Herbal": "Eight of Wands", "9_of_wands_Herbal": "Nine of Wands",
            "10_of_wands_Herbal": "Ten of Wands", "page_of_wands_Herbal": "Page of Wands", "knight_of_wands_Herbal": "Knight of Wands",
            "queen_of_wands_Herbal": "Queen of Wands", "king_of_wands_Herbal": "King of Wands", "ace_of_cups_Herbal": "Ace of Cups",
            "2_of_cups_Herbal": "Two of Cups", "3_of_cups_Herbal": "Three of Cups", "4_of_cups_Herbal": "Four of Cups",
            "5_of_cups_Herbal": "Five of Cups", "6_of_cups_Herbal": "Six of Cups", "7_of_cups_Herbal": "Seven of Cups",
            "8_of_cups_Herbal": "Eight of Cups", "9_of_cups_Herbal": "Nine of Cups", "10_of_cups_Herbal": "Ten of Cups",
            "page_of_cups_Herbal": "Page of Cups", "knight_of_cups_Herbal": "Knight of Cups", "queen_of_cups_Herbal": "Queen of Cups",
            "king_of_cups_Herbal": "King of Cups", "ace_of_swords_Herbal": "Ace of Swords", "2_of_swords_Herbal": "Two of Swords",
            "3_of_swords_Herbal": "Three of Swords", "4_of_swords_Herbal": "Four of Swords", "5_of_swords_Herbal": "Five of Swords",
            "6_of_swords_Herbal": "Six of Swords", "7_of_swords_Herbal": "Seven of Swords", "8_of_swords_Herbal": "Eight of Swords",
            "9_of_swords_Herbal": "Nine of Swords", "10_of_swords_Herbal": "Ten of Swords", "page_of_swords_Herbal": "Page of Swords",
            "knight_of_swords_Herbal": "Knight of Swords", "queen_of_swords_Herbal": "Queen of Swords", "king_of_swords_Herbal": "King of Swords",
            "ace_of_pentacles_Herbal": "Ace of Pentacles", "2_of_pentacles_Herbal": "Two of Pentacles", "3_of_pentacles_Herbal": "Three of Pentacles",
            "4_of_pentacles_Herbal": "Four of Pentacles", "5_of_pentacles_Herbal": "Five of Pentacles", "6_of_pentacles_Herbal": "Six of Pentacles",
            "7_of_pentacles_Herbal": "Seven of Pentacles", "8_of_pentacles_Herbal": "Eight of Pentacles", "9_of_pentacles_Herbal": "Nine of Pentacles",
            "10_of_pentacles_Herbal": "Ten of Pentacles", "page_of_pentacles_Herbal": "Page of Pentacles", "knight_of_pentacles_Herbal": "Knight of Pentacles",
            "queen_of_pentacles_Herbal": "Queen of Pentacles", "king_of_pentacles_Herbal": "King of Pentacles"
        ],
        
        "Hermetic": [
            "the_fool_Hermetic": "The Fool", "the_magician_Hermetic": "The Magician", "the_high_priestess_Hermetic": "The High Priestess",
            "the_empress_Hermetic": "The Empress", "the_emperor_Hermetic": "The Emperor", "the_hierophant_Hermetic": "The Hierophant",
            "the_lovers_Hermetic": "The Lovers", "the_chariot_Hermetic": "The Chariot", "strength_Int": "Strength",
            "the_hermit_Hermetic": "The Hermit", "the_wheel_of_fortune_Hermetic": "Wheel of Fortune", "justice_Int": "Justice",
            "the_hanged_man_Hermetic": "The Hanged Man", "death_Int": "Death", "temperance_Int": "Temperance",
            "the_devil_Hermetic": "The Devil", "the_tower_Hermetic": "The Tower", "the_star_Hermetic": "The Star",
            "the_moon_Hermetic": "The Moon", "the_sun_Hermetic": "The Sun", "judgement_Hermetic": "Judgment", "the_world_Hermetic": "The World",
            "ace_of_wands_Hermetic": "Ace of Wands", "2_of_wands_Hermetic": "Two of Wands", "3_of_wands_Hermetic": "Three of Wands",
            "4_of_wands_Hermetic": "Four of Wands", "5_of_wands_Hermetic": "Five of Wands", "6_of_wands_Hermetic": "Six of Wands",
            "7_of_wands_Hermetic": "Seven of Wands", "8_of_wands_Hermetic": "Eight of Wands", "9_of_wands_Hermetic": "Nine of Wands",
            "10_of_wands_Hermetic": "Ten of Wands", "page_of_wands_Hermetic": "Page of Wands", "knight_of_wands_Hermetic": "Knight of Wands",
            "queen_of_wands_Hermetic": "Queen of Wands", "king_of_wands_Hermetic": "King of Wands", "ace_of_cups_Hermetic": "Ace of Cups",
            "2_of_cups_Hermetic": "Two of Cups", "3_of_cups_Hermetic": "Three of Cups", "4_of_cups_Hermetic": "Four of Cups",
            "5_of_cups_Hermetic": "Five of Cups", "6_of_cups_Hermetic": "Six of Cups", "7_of_cups_Hermetic": "Seven of Cups",
            "8_of_cups_Hermetic": "Eight of Cups", "9_of_cups_Hermetic": "Nine of Cups", "10_of_cups_Hermetic": "Ten of Cups",
            "page_of_cups_Hermetic": "Page of Cups", "knight_of_cups_Hermetic": "Knight of Cups", "queen_of_cups_Hermetic": "Queen of Cups",
            "king_of_cups_Hermetic": "King of Cups", "ace_of_swords_Hermetic": "Ace of Swords", "2_of_swords_Hermetic": "Two of Swords",
            "3_of_swords_Hermetic": "Three of Swords", "4_of_swords_Hermetic": "Four of Swords", "5_of_swords_Hermetic": "Five of Swords",
            "6_of_swords_Hermetic": "Six of Swords", "7_of_swords_Hermetic": "Seven of Swords", "8_of_swords_Hermetic": "Eight of Swords",
            "9_of_swords_Hermetic": "Nine of Swords", "10_of_swords_Hermetic": "Ten of Swords", "page_of_swords_Hermetic": "Page of Swords",
            "knight_of_swords_Hermetic": "Knight of Swords", "queen_of_swords_Hermetic": "Queen of Swords", "king_of_swords_Hermetic": "King of Swords",
            "ace_of_pentacles_Hermetic": "Ace of Pentacles", "2_of_pentacles_Hermetic": "Two of Pentacles", "3_of_pentacles_Hermetic": "Three of Pentacles",
            "4_of_pentacles_Hermetic": "Four of Pentacles", "5_of_pentacles_Hermetic": "Five of Pentacles", "6_of_pentacles_Hermetic": "Six of Pentacles",
            "7_of_pentacles_Hermetic": "Seven of Pentacles", "8_of_pentacles_Hermetic": "Eight of Pentacles", "9_of_pentacles_Hermetic": "Nine of Pentacles",
            "10_of_pentacles_Hermetic": "Ten of Pentacles", "page_of_pentacles_Hermetic": "Page of Pentacles", "knight_of_pentacles_Hermetic": "Knight of Pentacles",
            "queen_of_pentacles_Hermetic": "Queen of Pentacles", "king_of_pentacles_Hermetic": "King of Pentacles"
        ],
        
        "International Icon": [
            "the_fool_Int": "The Fool", "the_magician_Int": "The Magician", "the_high_priestess_Int": "The High Priestess",
            "the_empress_Int": "The Empress", "the_emperor_Int": "The Emperor", "the_hierophant_Int": "The Hierophant",
            "the_lovers_Int": "The Lovers", "the_chariot_Int": "The Chariot", "strength": "Strength",
            "the_hermit_Int": "The Hermit", "the_wheel_of_fortune_Int": "Wheel of Fortune", "justice_Int": "Justice",
            "the_hanged_man_Int": "The Hanged Man", "death_Int": "Death", "temperance_Int": "Temperance_Int",
            "the_devil_Int": "The Devil", "the_tower_Int": "The Tower", "the_star_Int": "The Star",
            "the_moon_Int": "The Moon", "the_sun_Int": "The Sun", "judgement_Int": "Judgment", "the_world_Int": "The World",
            "ace_of_wands_Int": "Ace of Wands", "2_of_wands_Int": "Two of Wands", "3_of_wands_Int": "Three of Wands",
            "4_of_wands_Int": "Four of Wands", "5_of_wands_Int": "Five of Wands", "6_of_wands_Int": "Six of Wands",
            "7_of_wands_Int": "Seven of Wands", "8_of_wands_Int": "Eight of Wands", "9_of_wands_Int": "Nine of Wands",
            "10_of_wands_Int": "Ten of Wands", "page_of_wands_Int": "Page of Wands", "knight_of_wands_Int": "Knight of Wands",
            "queen_of_wands_Int": "Queen of Wands", "king_of_wands_Int": "King of Wands", "ace_of_cups_Int": "Ace of Cups",
            "2_of_cups_Int": "Two of Cups", "3_of_cups_Int": "Three of Cups", "4_of_cups_Int": "Four of Cups",
            "5_of_cups_Int": "Five of Cups", "6_of_cups_Int": "Six of Cups", "7_of_cups_Int": "Seven of Cups",
            "8_of_cups_Int": "Eight of Cups", "9_of_cups_Int": "Nine of Cups", "10_of_cups_Int": "Ten of Cups",
            "page_of_cups_Int": "Page of Cups", "knight_of_cups_Int": "Knight of Cups", "queen_of_cups_Int": "Queen of Cups",
            "king_of_cups_Int": "King of Cups", "ace_of_swords_Int": "Ace of Swords", "2_of_swords_Int": "Two of Swords",
            "3_of_swords_Int": "Three of Swords", "4_of_swords_Int": "Four of Swords", "5_of_swords_Int": "Five of Swords",
            "6_of_swords_Int": "Six of Swords", "7_of_swords_Int": "Seven of Swords", "8_of_swords_Int": "Eight of Swords",
            "9_of_swords_Int": "Nine of Swords", "10_of_swords_Int": "Ten of Swords", "page_of_swords_Int": "Page of Swords",
            "knight_of_swords_Int": "Knight of Swords", "queen_of_swords_Int": "Queen of Swords", "king_of_swords_Int": "King of Swords",
            "ace_of_pentacles_Int": "Ace of Pentacles", "2_of_pentacles_Int": "Two of Pentacles", "3_of_pentacles_Int": "Three of Pentacles",
            "4_of_pentacles_Int": "Four of Pentacles", "5_of_pentacles_Int": "Five of Pentacles", "6_of_pentacles_Int": "Six of Pentacles",
            "7_of_pentacles_Int": "Seven of Pentacles", "8_of_pentacles_Int": "Eight of Pentacles", "9_of_pentacles_Int": "Nine of Pentacles",
            "10_of_pentacles_Int": "Ten of Pentacles", "page_of_pentacles_Int": "Page of Pentacles", "knight_of_pentacles_Int": "Knight of Pentacles",
            "queen_of_pentacles_Int": "Queen of Pentacles", "king_of_pentacles_Int": "King of Pentacles"
        ]
        
        
        
    
    ]
    
    @Published var CardNamesFullList: [String] = ["The Fool", "The Magician", "The High Priestess", "The Empress", "The Emperor", "The Hierophant", "The Lovers", "The Chariot", "Strength", "The Hermit", "Wheel of Fortune", "Justice", "The Hanged Man", "Death", "Temperance", "The Devil", "The Tower", "The Star", "The Moon", "The Sun", "Judgment", "The World", "Ace of Wands", "Two of Wands", "Three of Wands", "Four of Wands", "Five of Wands", "Six of Wands", "Seven of Wands", "Eight of Wands", "Nine of Wands", "Ten of Wands", "Page of Wands", "Knight of Wands", "Queen of Wands", "King of Wands", "Ace of Cups", "Two of Cups", "Three of Cups", "Four of Cups", "Five of Cups", "Six of Cups", "Seven of Cups", "Eight of Cups", "Nine of Cups", "Ten of Cups", "Page of Cups", "Knight of Cups", "Queen of Cups", "King of Cups", "Ace of Swords", "Two of Swords", "Three of Swords", "Four of Swords", "Five of Swords", "Six of Swords", "Seven of Swords", "Eight of Swords", "Nine of Swords", "Ten of Swords", "Page of Swords", "Knight of Swords", "Queen of Swords", "King of Swords", "Ace of Pentacles", "Two of Pentacles", "Three of Pentacles", "Four of Pentacles", "Five of Pentacles", "Six of Pentacles", "Seven of Pentacles", "Eight of Pentacles", "Nine of Pentacles", "Ten of Pentacles", "Page of Pentacles", "Knight of Pentacles", "Queen of Pentacles", "King of Pentacles"]
    
    

    @Published var selectedDeck: String {
            didSet {
                UserDefaults.standard.set(selectedDeck, forKey: "selectedDeck")
            }
        }
        
        init() {
            self.selectedDeck = UserDefaults.standard.string(forKey: "selectedDeck") ?? "Rider Waite"
        }
        
        func getCurrentDeck() -> [String: String] {
            return decks[selectedDeck] ?? [:]
        }
}

