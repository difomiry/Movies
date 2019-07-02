import Foundation
import RxSwift

/// Base abstract coordinator generic over the return type of the `start()` method.
class Coordinator<ResultType> {

  /// Typealias which will allows to access a ResultType of the Coordainator by `CoordinatorName.CoordinationResult`.
  typealias CoordinationResult = ResultType

  /// Utility `DisposeBag` used by the subclasses.
  let disposeBag = DisposeBag()

  /// Unique identifier.
  private let identifier = UUID()

  /// Dictionary of the child coordinators.
  private var childCoordinators = [UUID: Any]()

  /// Stores coordinator to the `childCoordinators` dictionary.
  ///
  /// - Parameter coordinator: Child coordinator to store.
  private func store<T>(coordinator: Coordinator<T>) {
    childCoordinators[coordinator.identifier] = coordinator
  }

  /// Release coordinator from the `childCoordinators` dictionary.
  ///
  /// - Parameter coordinator: Coordinator to release.
  private func free<T>(coordinator: Coordinator<T>) {
    childCoordinators[coordinator.identifier] = nil
  }

  /// Coordinates to the coordinator.
  ///
  /// - Parameter coordinator: Coordinator to start.
  /// - Returns: Result of `start()` method.
  func coordinate<T>(to coordinator: Coordinator<T>) -> Observable<T> {
    store(coordinator: coordinator)
    return coordinator.start()
      .do(onNext: { [weak self] _ in self?.free(coordinator: coordinator) })
  }

  /// Starts job of the coordinator.
  ///
  /// - Returns: Result of coordinator job.
  func start() -> Observable<ResultType> {
    fatalError("`start()` method should be implemented.")
  }

}
