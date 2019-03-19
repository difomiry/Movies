import UIKit
import RxSwift

class BaseViewController: UIViewController {

  /// Utility `DisposeBag` used by the subclasses.
  let disposeBag = DisposeBag()

}
