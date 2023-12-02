import Foundation

public struct Cards: Decodable {
    public let cards: [Card]
    
    public init(cards: [Card]) {
        self.cards = cards
    }
}

public struct Card: Decodable {
    public let name: String
    public let type: String
    public let manaCost: String?
    public let set: String
    public let rarity: String
    public let power: String?
    public let toughness: String?
    public let artist: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case manaCost
        case set
        case rarity
        case power
        case toughness
        case artist
    }
    
    public init(name: String, type: String, manaCost: String?, set: String, rarity: String, power: String?, toughness: String?, artist: String) {
        self.name = name
        self.type = type
        self.manaCost = manaCost
        self.set = set
        self.rarity = rarity
        self.power = power
        self.toughness = toughness
        self.artist = artist
    }
}

