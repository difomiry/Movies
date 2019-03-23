import UIKit
import RxSwift

final class VersionCell: UITableViewCell, NibReusable {

  // MARK: - Views

  @IBOutlet private var titleLabel: UILabel!

  // MARK: - Properties

  private var disposeBag = DisposeBag()

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

extension VersionCell {
  
  fileprivate func setup() {

    if let text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
      titleLabel.text = "Version \(text)"
    }

    themes.rx
      .bind({ $0.cellBackgroundColor }, to: rx.backgroundColor)
      .disposed(by: disposeBag)

    themes.rx
      .bind({ $0.cellForegroundColor }, to: titleLabel.rx.textColor)
      .disposed(by: disposeBag)
  }

}
