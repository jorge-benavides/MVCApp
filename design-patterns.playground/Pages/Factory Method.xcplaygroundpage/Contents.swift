protocol Car {
    var type: String { get }
}

protocol CarFactory {
    func makeCar() -> Car
}

class Sedan: Car {
    var type: String {
        "Sedan"
    }
}

class SedanFactory: CarFactory {
    func makeCar() -> Car {
        return Sedan()
    }
}

struct Example {
    let factory: CarFactory

    func run() {
        let car = factory.makeCar()
        print(car.type)
    }
}

let example = Example(factory: SedanFactory())
example.run()
