import RxSwift
import RxTheme

final class MoreViewModel {

  let tapSettings: AnyObserver<Void>

  let openSettings: Observable<Void>

  init() {
    let _settings = PublishSubject<Void>()
    tapSettings = _settings.asObserver()
    openSettings = _settings.asObservable()
  }

}
