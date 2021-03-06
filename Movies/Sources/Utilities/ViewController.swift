import UIKit
import RxSwift

class ViewController<ViewModelType>: UIViewController, StoryboardInstantiable {

  var themedStatusBarStyle: UIStatusBarStyle?

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return themedStatusBarStyle ?? super.preferredStatusBarStyle
  }

  var viewModel: ViewModelType!

  var settings: Settings!

  var themes: Themes!

  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()
    setupThemes()
    setupBindings()
  }

  /// Sets up the views.
  func setupViews() {}

  /// Sets up the themes.
  func setupThemes() {

    themes.rx
      .bind({ $0.backgroundColor }, to: view.rx.backgroundColor)
      .disposed(by: disposeBag)

    themes.attrsStream
      .subscribe(onNext: { [weak self] theme in
        self?.themedStatusBarStyle = theme.statusBarStyle
        self?.setNeedsStatusBarAppearanceUpdate()
      })
      .disposed(by: disposeBag)
  }

  /// Sets up the bindings.
  func setupBindings() {}

}
