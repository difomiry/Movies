import Swinject

class BaseCoordinator<ResultType, ContextType>: Coordinator<ResultType> {

  let context: ContextType

  let resolver: Resolver

  init(in context: ContextType, with resolver: Resolver) {
    self.context = context
    self.resolver = resolver
  }

}
