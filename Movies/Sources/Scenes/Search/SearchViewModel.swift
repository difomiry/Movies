import RxSwift
import RxCocoa
import RxOptional
import Moya
import RxMoya

final class SearchViewModel {

  fileprivate let moyaProvider: MoyaProvider<TMDB>

  init(moyaProvider: MoyaProvider<TMDB>) {
    self.moyaProvider = moyaProvider
  }

  func search(query: Observable<String>) -> Driver<[Search.Result]> {
    return query.flatMapLatest { query -> Observable<[Search.Result]?> in
      if query.isEmpty {
        return .just(nil)
      }
      return self.moyaProvider.rx.request(.search(query, 1))
        .map(Search.self)
        .map { $0.results }
        .asObservable()
    }
    .asDriver(onErrorJustReturn: nil)
    .filterNil()
  }

}
