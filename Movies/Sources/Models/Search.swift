import Foundation

struct Search: Codable {
    
  let page, totalResults, totalPages: Int?
  let results: [Result]?

  enum CodingKeys: String, CodingKey {
    case page
    case totalResults = "total_results"
    case totalPages = "total_pages"
    case results
  }

  struct Result: Codable {

    let voteCount, id: Int?
    let video: Bool?
    let voteAverage: Double?
    let title: String?
    let popularity: Double?
    let posterPath, originalLanguage, originalTitle: String?
    let genreIds: [Int]?
    let backdropPath: String?
    let adult: Bool?
    let overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
      case voteCount = "vote_count"
      case id, video
      case voteAverage = "vote_average"
      case title, popularity
      case posterPath = "poster_path"
      case originalLanguage = "original_language"
      case originalTitle = "original_title"
      case genreIds = "genre_ids"
      case backdropPath = "backdrop_path"
      case adult, overview
      case releaseDate = "release_date"
    }

  }

}
