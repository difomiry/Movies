import Foundation

var settings = UserDefaults.standard as Settings

protocol Settings {
  var theme: ThemeType { get set }
}

extension UserDefaults: Settings {

  var theme: ThemeType {
    get { return ThemeType(rawValue: string(forKey: #function) ?? "light") ?? .light }
    set { set(newValue.rawValue, forKey: #function) }
  }

}
