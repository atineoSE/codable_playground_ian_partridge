import Foundation
import PlaygroundSupport

struct API: Decodable
{
    let films: URL
    let people: URL
    let planets: URL
    let species: URL
    let starships: URL
    let vehicles: URL
}
struct Films: Decodable
{
    let count: Int
    let results: [Film]
}
struct Film: Decodable
{
    let title: String
    let episodeId: Int
    let url: URL
    let releaseDate: Date
    
// CodingKeys not needed when using keyDecodingStrategy = .convertFromSnakeCase
//    enum CodingKeys: CodingKey, String {
//        case title = "title"
//        case episodeId = "episode_id"
//        case url = "url"
//    }
}

//let session = URLSession(configuration: .default)
//let apiURL = URL(string: "https://swapi.co/api/")!
//let request = URLRequest(url: apiURL)
//let task = session.dataTask(with: request) { data, response, error in
//    guard error == nil, let data = data else {
//        return
//    }
//    let decoder = JSONDecoder()
//    do {
//        let api = try decoder.decode(API.self, from: data)
//        print(api)
//    } catch let error {
//        print(error)
//    }
//    PlaygroundPage.current.finishExecution()
//}
//task.resume()

let session2 = URLSession(configuration: .default)
let filmsURL = URL(string: "https://swapi.co/api/films")!
let request2 = URLRequest(url: filmsURL)
let task2 = session2.dataTask(with: request2) { data, response, error in
    guard error == nil, let data = data else {
        return
    }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-mm-dd"
    decoder.dateDecodingStrategy = .formatted(formatter)

    do {
        let films = try decoder.decode(Films.self, from: data)
        print(films)
    } catch let error {
        print(error)
    }
}
task2.resume()

PlaygroundPage.current.needsIndefiniteExecution = true
