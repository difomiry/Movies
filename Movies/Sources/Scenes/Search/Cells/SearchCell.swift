import UIKit
import RxSwift

final class SearchCell: Cell<SearchCellViewModel> {

  // MARK: - Views

  @IBOutlet private var titleLabel: UILabel!

  override func bind() {
    titleLabel.text = viewModel.result.originalTitle
  }

  override func setupTheme() {
    super.setupTheme()

    themes.rx
      .bind({ $0.cellForegroundColor }, to: titleLabel.rx.textColor)
      .disposed(by: disposeBag)
  }

}
