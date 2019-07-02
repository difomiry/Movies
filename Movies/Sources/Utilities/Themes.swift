import RxTheme

typealias Themes = ThemeService<ThemeType>

protocol Theme {
  var statusBarStyle: UIStatusBarStyle { get }
  var navigationBarBackgroundColor: UIColor { get }
  var navigationBarForegroundColor: UIColor { get }
  var navigationBarTitleTextAttributes: [NSAttributedString.Key: Any] { get }
  var backgroundColor: UIColor { get }
  var barStyle: UIBarStyle { get }
  var cellBackgroundColor: UIColor { get }
  var cellForegroundColor: UIColor { get }
  var cellSeparatorColor: UIColor { get }
}

enum ThemeType: String {
  case light
  case dark
}

fileprivate struct Dark: Theme {
  var statusBarStyle: UIStatusBarStyle = .lightContent
  var navigationBarBackgroundColor: UIColor = .black
  var navigationBarForegroundColor: UIColor = .white
  var navigationBarTitleTextAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.white]
  var backgroundColor: UIColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
  var barStyle: UIBarStyle = .black
  var cellBackgroundColor: UIColor = .black
  var cellForegroundColor: UIColor = .white
  var cellSeparatorColor: UIColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
}

fileprivate struct Light: Theme {
  var statusBarStyle: UIStatusBarStyle = .default
  var navigationBarBackgroundColor: UIColor = .white
  var navigationBarForegroundColor: UIColor = .black
  var navigationBarTitleTextAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black]
  var backgroundColor: UIColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
  var barStyle: UIBarStyle = .default
  var cellBackgroundColor: UIColor = .white
  var cellForegroundColor: UIColor = .black
  var cellSeparatorColor: UIColor = .lightGray
}

extension ThemeType: ThemeProvider {

  var associatedObject: Theme {
    switch self {
    case .light:
      return Light()
    case .dark:
      return Dark()
    }
  }

}
