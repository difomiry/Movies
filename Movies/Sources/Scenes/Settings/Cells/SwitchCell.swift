import UIKit
import RxSwift
import RxCocoa

final class SwitchCell: UITableViewCell, NibReusable {

  // MARK: - Views

  @IBOutlet private var titleLabel: UILabel!

  private let switchView = UISwitch(frame: .zero)

  // MARK: - Properties

  private var disposeBag = DisposeBag()

  // MARK: - UITableViewCell

  override func awakeFromNib() {
    super.awakeFromNib()

    accessoryView = switchView

    switchView.isOn = settings.theme == .dark

    setup()
  }

  override func prepareForReuse() {
    super.prepareForReuse()

    disposeBag = DisposeBag()

    setup()
  }

}

// MARK: - Setup

extension SwitchCell {

  fileprivate func setup() {

    themes.rx
      .bind({ $0.cellBackgroundColor }, to: rx.backgroundColor)
      .disposed(by: disposeBag)

    themes.rx
      .bind({ $0.cellForegroundColor }, to: titleLabel.rx.textColor)
      .disposed(by: disposeBag)

    switchView.rx.value
      .subscribe(onNext: { themes.switch($0 ? .dark : .light) })
      .disposed(by: disposeBag)

    themes.typeStream
      .subscribe(onNext: { settings.theme = $0 })
      .disposed(by: disposeBag)
  }

}
