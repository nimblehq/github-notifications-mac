//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

    var lastUpdate: String?

    override func loadView() {
        let mainView = UIView()
        mainView.backgroundColor = .systemGray5
        mainView.isUserInteractionEnabled = true
        mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapScreen)))
        self.view = mainView
    }

    @objc func didTapScreen() {
        fetchNotifications()
    }

    func fetchNotifications() {
        let url = URL(string: "https://api.github.com/notifications")!

        var request = URLRequest(url: url)
        request.setValue("token [token]", forHTTPHeaderField: "Authorization")
        request.setValue(lastUpdate, forHTTPHeaderField: "If-Modified-Since")
        // Needs this to ignore cache to show in result
        request.cachePolicy = .reloadIgnoringCacheData
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            if let httpResponse = response as? HTTPURLResponse {
                print("status code \(httpResponse.statusCode)")
                 if let lastUpdate = httpResponse.allHeaderFields["Last-Modified"] as? String {
                    self?.lastUpdate = lastUpdate
                    lastUpdate
                 }
            }
        }
        task.resume()
    }
}

PlaygroundPage.current.liveView = MyViewController()
