import Foundation

class Stops {
    init() async
    throws {
        let urlString = "\(serverDomain)/stops"
        
        guard let urlVal = URL(string: urlString) else {
            throw ApiError.urlError
        }
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: urlVal))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ApiError.badRequest }
        
        let thing = try JSONDecoder().decode([Stop].self, from: data)
    }
}
