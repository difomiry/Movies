import UIKit
import RxSwift

class Cell<ViewModelType>: UITableViewCell, NibReusable {

  var viewModel: ViewModelType! {
    didSet {
      bind()
    }
  }

  var settings: Settings! {
    didSet {
      setupSettings()
    }
  }

  var themes: Themes! {
    didSet {
      setupTheme()
    }
  }

  private(set) var disposeBag = DisposeBag()

  override func awakeFromNib() {
    super.awakeFromNib()

    setup()
  }

  override func prepareForReuse() {
    super.prepareForReuse()

    disposeBag = DisposeBag()

    setup()
  }

  func setup() {}

  func setupSettings() {}

  func setupTheme() {

    themes.rx
      .bind({ $0.cellBackgroundColor }, to: rx.backgroundColor)
      .disposed(by: disposeBag)
  }

  func bind() {}

}
