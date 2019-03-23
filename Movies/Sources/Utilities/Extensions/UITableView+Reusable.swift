import UIKit

extension UITableView {

  func register<T: UITableViewCell>(_ type: T.Type) where T: NibReusable {
    register(type.nib, forCellReuseIdentifier: type.reuseIdentifier)
  }

  func register<T: UITableViewCell>(_ type: T.Type) where T: Reusable {
    register(type.self, forCellReuseIdentifier: type.reuseIdentifier)
  }

  func dequeue<T: UITableViewCell>() -> T where T: Reusable {
    return dequeueReusableCell(withIdentifier: T.reuseIdentifier) as! T
  }

  func dequeue<T: UITableViewCell>(_ indexPath: IndexPath) -> T where T: Reusable {
    return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
  }

  func register<T: UITableViewHeaderFooterView>(_ type: T.Type) where T: NibReusable {
    register(type.nib, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
  }

  func register<T: UITableViewHeaderFooterView>(_ type: T.Type) where T: Reusable {
    register(type.self, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
  }

  func dequeue<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
    return dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
  }

}
