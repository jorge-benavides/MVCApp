protocol Subscriber {
    func notify(_ news: String)
}

protocol NewsAgency {
    func addObserver(_ subscriber: Subscriber)
    func setNews(_ news: String)
}

class CNN: NewsAgency {
    var subscribers: [Subscriber] = []

    func addObserver(_ subscriber: Subscriber) {
        subscribers.append(subscriber)
    }

    func setNews(_ news: String) {
        subscribers.forEach {
            $0.notify(news)
        }
    }
}

class User: Subscriber {
    func notify(_ news: String) {
        print(news)
    }
}

let cnn = CNN()
let user = User()

cnn.addObserver(user)
cnn.setNews("Good weather today!")
