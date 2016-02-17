Then
====

![Swift](https://img.shields.io/badge/Swift-2.1-orange.svg)
[![Build Status](https://travis-ci.org/devxoul/Then.svg)](https://travis-ci.org/devxoul/Then)
[![CocoaPods](http://img.shields.io/cocoapods/v/Then.svg)](https://cocoapods.org/pods/Then)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

✨ Super sweet syntactic sugar for Swift initializers.


At a Glance
-----------

Initialize UILabel **then** set its properties.

```swift
let label = UILabel().then {
    $0.textAlignment = .Center
    $0.textColor = .blackColor()
    $0.text = "Hello, World!"
}
```

This is equivalent to:

```swift
let label: UILabel = {
    let label = UILabel()
    label.textAlignment = .Center
    label.textColor = .blackColor()
    label.text = "Hello, World!"
    return label
}()
```

You can use `then()` to all of `NSObject` subclasses.

```swift
let queue = NSOperationQueue().then {
    $0.maxConcurrentOperationCount = 1
    return
}
```

> **Why `return`?** See [Trouble Shooting](#trouble-shooting).

Want to use with your own types? Just make extensions.

```swift
extension MyType: Then {}

let instance = MyType().then {
    $0.really = "awesome!"
}
```


Real World Example
------------------

Here's an example usage in an UIViewController subclass.

```swift
final class MyViewController: UIViewController {

    let titleLabel = UILabel().then {
        $0.textColor = .blackColor()
        $0.textAlignment = .Center
    }

    let tableView = UITableView().then {
        $0.backgroundColor = .clearColor()
        $0.separatorStyle = .None
        $0.registerClass(MyCell.self, forCellReuseIdentifier: "myCell")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.tableView)
    }

}
```


Installation
------------

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

    ```ruby
    pod 'Then', '~> 1.0'
    ```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

    ```
    github "devxoul/Then" ~> 1.0
    ```

- **For iOS 7 projects** with [CocoaSeeds](https://github.com/devxoul/CocoaSeeds):

    ```ruby
    github 'devxoul/Then', '1.0.1', :files => 'Sources/*.swift'
    ```

- **Using [Swift Package Manager](https://swift.org/package-manager)**:

    ```swift
    import PackageDescription

    let package = Package(
        name: "MyAwesomeApp",
        dependencies: [
            .Package(url: "https://github.com/devxoul/Then", "1.0.1"),
        ]
    )
    ```
    
    
Trouble Shooting
----------------

- **Compile error with single line closure on value types**

    ```swift
    let value = MyStruct().then {
        $0.isThenAwesome = true
    } // Compile Error!
    ```

    > error: Cannot convert value of type '_ -> ()' to expected argument type 'inout MyStruct -> Void'

    A possible workaround is: Just add return statement.
    
    ```swift
    let value = MyStruct().then {
        $0.isThenAwesome = true
        return // put this line
    }
    ```


License
-------

**Then** is under MIT license. See the [LICENSE](LICENSE) file for more info.
