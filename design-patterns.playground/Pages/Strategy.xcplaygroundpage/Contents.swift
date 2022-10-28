protocol Strategy {
    func execute()
}

protocol Context {
    func setStrategy(_ strategy: Strategy)
    func executeStrategy()
}

class FastestRoute: Strategy {
    func execute() {
        print("taking the fastest route!")
    }
}

class ShortestRoute: Strategy {
    func execute() {
        print("taking the shortest route!")
    }
}

class Driving: Context {
    var strategy: Strategy? = nil
    func setStrategy(_ strategy: Strategy) {
        self.strategy = strategy
    }
    func executeStrategy() {
        guard let strategy = strategy else { return }
        strategy.execute()
    }
}

let driving = Driving()
let routeA = FastestRoute()
let routeB = ShortestRoute()

driving.setStrategy(routeA)
driving.executeStrategy()
driving.setStrategy(routeB)
driving.executeStrategy()
