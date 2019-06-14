# Then

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![CocoaPods](http://img.shields.io/cocoapods/v/Then.svg)](https://cocoapods.org/pods/Then)
[![Build Status](https://travis-ci.org/devxoul/Then.svg?branch=master)](https://travis-ci.org/devxoul/Then)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

✨ Super sweet syntactic sugar for Swift initializers.

## At a Glance

Initialize UILabel **then or build** set its properties.

```swift
let label = UILabel().then {
  $0.textAlignment = .center
  $0.textColor = .black
  $0.text = "Hello, World!"
}

let label:UILabel = .build{
  $0.textAlignment = .center
  $0.textColor = .black
  $0.text = "Hello, World!"
}

```

This is equivalent to:

```swift
let label: UILabel = {
  let label = UILabel()
  label.textAlignment = .center
  label.textColor = .black
  label.text = "Hello, World!"
  return label
}()
```

## Tips and Tricks

- You can use `then()` to all of `NSObject` subclasses.

    ```swift
    let queue = OperationQueue().then {
      $0.maxConcurrentOperationCount = 1
    }
    ```

- Want to use with your own types? Just make extensions.

    ```swift
    extension MyType: Then {}
    
    let instance = MyType().then {
      $0.really = "awesome!"
    }
    ```

- Use `with()` when copying the value types.

    ```swift
    let newFrame = oldFrame.with {
      $0.size.width = 200
      $0.size.height = 100
    }
    newFrame.width // 200
    newFrame.height // 100
    ```

- Use `do()` to do something with less typing.

    ```swift
    UserDefaults.standard.do {
      $0.set("devxoul", forKey: "username")
      $0.set("devxoul@gmail.com", forKey: "email")
      $0.synchronize()
    }
    ```

## Real World Example

Here's an example usage in an UIViewController subclass.

```swift
final class MyViewController: UIViewController {

  let titleLabel = UILabel().then {
    $0.textColor = .black
    $0.textAlignment = .center
  }

  let tableView = UITableView().then {
    $0.backgroundColor = .clear
    $0.separatorStyle = .none
    $0.register(MyCell.self, forCellReuseIdentifier: "myCell")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.titleLabel)
    self.view.addSubview(self.tableView)
  }

}
```

## Installation

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

    ```ruby
    pod 'Then'
    ```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

    ```
    github "devxoul/Then"
    ```

- **Using [Swift Package Manager](https://swift.org/package-manager)**:

    ```swift
    import PackageDescription

    let package = Package(
      name: "MyAwesomeApp",
      dependencies: [
        .Package(url: "https://github.com/devxoul/Then", majorVersion: 2),
      ]
    )
    ```

## License

**Then** is under MIT license. See the [LICENSE](LICENSE) file for more info.
