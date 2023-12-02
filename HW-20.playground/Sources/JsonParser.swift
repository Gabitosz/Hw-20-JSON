import Foundation

public class JsonParser {
    
    public init() {}
    
    public static func parseJson(with data: Data) {
        let decoder = JSONDecoder()
        
        do {
            let jsonCards = try decoder.decode(Cards.self, from: data)
            print("Cards Count: \(jsonCards.cards.count)")
            
            if jsonCards.cards.count > 0 {
                let card = jsonCards.cards[0]
                print("Card Name: \(card.name)")
                print("Card Type: \(card.type)")
                print("Mana Cost: \(card.manaCost?.replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "") ?? "N/A")")
                print("Set: \(card.set)")
                print("Rarity: \(card.rarity)")
                print("Power: \(card.power ?? "N/A")")
                print("Toughness: \(card.toughness ?? "N/A")")
                print("-------------------------------------")
            }
        } catch let error {
            print("Error decoding JSON: \(error)")
        }
    }
}
