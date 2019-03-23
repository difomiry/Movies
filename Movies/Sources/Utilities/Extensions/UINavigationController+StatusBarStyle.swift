import UIKit

extension UINavigationController {

  open override var childForStatusBarStyle: UIViewController? {
    return topViewController
  }

}
