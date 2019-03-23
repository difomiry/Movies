import UIKit
import SwinjectStoryboard

extension StoryboardInstantiable where Self: UIViewController {

  static var storyboardName: String {
    return String(describing: self).replacingOccurrences(of: "ViewController", with: "")
  }

  static var storyboardIdentifier: String {
    return String(describing: self)
  }

  static func instantiate() -> Self {
    let storyboard = SwinjectStoryboard.create(name: self.storyboardName, bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: self.storyboardIdentifier) as! Self
  }

}
