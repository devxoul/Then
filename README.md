Then
====

![Swift](https://img.shields.io/badge/Swift-2.1-orange.svg)
[![Build Status](https://travis-ci.org/devxoul/Then.svg)](https://travis-ci.org/devxoul/Then)
[![CocoaPods](http://img.shields.io/cocoapods/v/Then.svg)](https://cocoapods.org/pods/Then)

✨ Super sweet syntactic sugar for Swift initializers.


At a Glance
-----------

Initialize UILabel **then** setting its properties.

```swift
let label = UILabel().then {
    $0.textAlignment = .Center
    $0.textColor = .blackColor()
    $0.text = "Hello, World!"
}
```

This is equivalent with:

```swift
let label: UILabel = {
    let label = UILabel()
    label.textAlignment = .Center
    label.textColor = .blackColor()
    label.text = "Hello, World!"
    return label
}()
```

#### Not prefer using `$0`?

Give it a name. (e.g. `this`)

```swift
let label = UILabel().then { this in
    this.textAlignment = .Center
    this.textColor = .blackColor()
    this.text = "Hello, World!"
}
```


Real World Example
------------------

Exmaple usage in an UIViewController subclass.

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

- **For iOS 8+ projects:** Use [CocoaPods](https://cocoapods.org) with Podfile:

    ```ruby
    pod 'Then', '~> 0.1'
    ```


- **For iOS 7 projects:** Use [CocoaSeeds](https://github.com/devxoul/CocoaSeeds) with Seedfile:

    ```ruby
    github 'devxoul/Then', '0.1.0', :files => 'Then/Then.swift'
    ```


License
-------

**Then** is under MIT license. See the [LICENSE](LICENSE) file for more info.
