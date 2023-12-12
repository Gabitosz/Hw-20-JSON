import Foundation

public class NetworkRequestManager {
    
    public init() {}
    
    public static func fetchData(for cardName: String, from urlInfo: String) {
        let url = urlInfo + cardName
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("Request is Successful! Status code: \(response.statusCode)")
                if let data = data {
                    JsonParser.parseJson(with: data, countOfCards: 100)
                }
            }
        }.resume()
    }
}
