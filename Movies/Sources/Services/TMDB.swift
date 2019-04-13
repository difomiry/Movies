import Moya

enum TimeWindow: String {
  case day
  case week
}

enum ImageSize: String {
  case original
  case w500
}

enum TMDB {
  case discover
  case trending(TimeWindow)
  case search(String, Int)
  case movie(Int)
  case image(ImageSize, String)
}

extension TMDB: TargetType {

  var baseURL: URL {
    switch self {
    case .image:
      return URL(string: "https://image.tmdb.org/t/p/")!
    default:
      return URL(string: "https://api.themoviedb.org/3/")!
    }
  }

  var path: String {
    switch self {
    case .discover:
      return "discover/movie"
    case let .trending(timeWindow):
      return "trending/movie/\(timeWindow)"
    case .search:
      return "search/movie"
    case let .movie(id):
      return "movie/\(id)"
    case let .image(imageSize, path):
      return "\(imageSize)/\(path)"
    }
  }

  var method: Method {
    return .get
  }

  var sampleData: Data {
    return .init()
  }

  var task: Task {

    var parameters = [String: Any]()

    parameters["api_key"] = Configuration.apiKey

    switch self {
    case let .search(query, page):
      parameters["query"] = query
      parameters["page"] = page
    default:
      break
    }

    return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
  }

  var headers: [String : String]? {
    return nil
  }




}
