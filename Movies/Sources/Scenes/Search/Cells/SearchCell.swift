import UIKit
import RxSwift

final class SearchCell: UITableViewCell, NibReusable {

  // MARK: - Views

  @IBOutlet private var titleLabel: UILabel!

  // MARK: - Properties

  private var disposeBag = DisposeBag()
  
  var viewModel: SearchCellViewModel! {
    didSet {
      titleLabel.text = viewModel.result.originalTitle
    }
  }

  // MARK: - UITableViewCell

  override func awakeFromNib() {
    super.awakeFromNib()

    setup()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    disposeBag = DisposeBag()
    
    setup()
  }

}

// MARK: - Setup

extension SearchCell {

  fileprivate func setup() {

    themes.rx
      .bind({ $0.cellBackgroundColor }, to: rx.backgroundColor)
      .disposed(by: disposeBag)
    
    themes.rx
      .bind({ $0.cellForegroundColor }, to: titleLabel.rx.textColor)
      .disposed(by: disposeBag)
  }
  
}
