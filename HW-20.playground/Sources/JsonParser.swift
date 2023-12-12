import Foundation

public class JsonParser {
    
    public init() {}
    
    public static func parseJson(with data: Data, countOfCards: Int) {
        let decoder = JSONDecoder()
        
        do {
            let jsonCards = try decoder.decode(Cards.self, from: data)
            print("Cards Count: \(jsonCards.cards.count)")
            
            if jsonCards.cards.count > 0 && jsonCards.cards.count >= countOfCards {
                printInfoAboutCards(cardsInJson: jsonCards, countOfNeededCards: countOfCards)
                
            } else if jsonCards.cards.count > 0 && jsonCards.cards.count < countOfCards {
                printInfoAboutCards(cardsInJson: jsonCards, countOfNeededCards: jsonCards.cards.count)
            }
        } catch let error {
            print("Error decoding JSON: \(error)")
        }
    }
    
    static func printInfoAboutCards(cardsInJson: Cards, countOfNeededCards: Int) {
        for card in cardsInJson.cards {
            
            if card.name.contains("opt") || card.name.contains("Opt")  {
                continue
            }
            Card.printInfoAbout(card: card)
        }
        let optCards = cardsInJson.cards.filter { $0.name == "Opt"}
        for card in optCards {
            Card.printInfoAbout(card: card)
        }
    }
}
