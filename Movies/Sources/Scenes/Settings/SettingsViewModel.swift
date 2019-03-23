import RxSwift

final class SettingsViewModel {

  enum CellType {
    case themeSwitcher
    case version
  }

  let cells = Observable<[CellType]>.just([.themeSwitcher, .version])

}
