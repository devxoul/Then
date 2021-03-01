//
//  ThenTests.swift
//  ThenTests
//
//  Created by 전수열 on 12/24/15.
//  Copyright © 2015 Suyeol Jeon. All rights reserved.
//

import XCTest
@testable import Then

struct User {
  var name: String?
  var email: String?
}
extension User: Then {}

class ThenTests: XCTestCase {

  func testThen_NSObject() {
    let queue = OperationQueue().then {
      $0.name = "awesome"
      $0.maxConcurrentOperationCount = 5
    }
    XCTAssertEqual(queue.name, "awesome")
    XCTAssertEqual(queue.maxConcurrentOperationCount, 5)
  }

  func testThenIf_NSObject() {
    let shouldModifyQueue = false
    let queue = OperationQueue().thenIf(shouldModifyQueue) {
      $0.name = "awesome"
      $0.maxConcurrentOperationCount = 5
    }
    XCTAssertNotEqual(queue.name, "awesome")
    XCTAssertNotEqual(queue.maxConcurrentOperationCount, 5)
  }

  func testWith() {
    let user = User().with {
      $0.name = "devxoul"
      $0.email = "devxoul@gmail.com"
    }
    XCTAssertEqual(user.name, "devxoul")
    XCTAssertEqual(user.email, "devxoul@gmail.com")
  }

  func testWithIf() {
    let shouldModifyUser = false
    let user = User().withIf(shouldModifyUser) {
      $0.name = "devxoul"
      $0.email = "devxoul@gmail.com"
    }
    XCTAssertNotEqual(user.name, "devxoul")
    XCTAssertNotEqual(user.email, "devxoul@gmail.com")
  }
    
  func testWith_Array() {
    let array = [1, 2, 3].with { $0.append(4) }
    XCTAssertEqual(array, [1, 2, 3, 4])
  }

  func testWithIf_Array() {
    let shouldModifyArray = false
    let array = [1, 2, 3].withIf(shouldModifyArray) { $0.append(4) }
    XCTAssertNotEqual(array, [1, 2, 3, 4])
  }
    
  func testWith_Dictionary() {
    let dict = ["Korea": "Seoul", "Japan": "Tokyo"].with {
      $0["China"] = "Beijing"
    }
    XCTAssertEqual(dict, ["Korea": "Seoul", "Japan": "Tokyo", "China": "Beijing"])
  }

  func testWithIf_Dictionary() {
    let shouldModifyDict = false
    let dict = ["Korea": "Seoul", "Japan": "Tokyo"].withIf(shouldModifyDict) {
      $0["China"] = "Beijing"
    }
    XCTAssertNotEqual(dict, ["Korea": "Seoul", "Japan": "Tokyo", "China": "Beijing"])
  }
    
  func testWith_Set() {
    let set = Set(["A", "B", "C"]).with {
      $0.insert("D")
    }
    XCTAssertEqual(set, Set(["A", "B", "C", "D"]))
  }

  func testWithIf_Set() {
    let shouldModifySet = false
    let set = Set(["A", "B", "C"]).withIf(shouldModifySet) {
      $0.insert("D")
    }
    XCTAssertNotEqual(set, Set(["A", "B", "C", "D"]))
  }
    
  func testDo() {
    UserDefaults.standard.do {
      $0.removeObject(forKey: "username")
      $0.set("devxoul", forKey: "username")
      $0.synchronize()
    }
    XCTAssertEqual(UserDefaults.standard.string(forKey: "username"), "devxoul")
  }
    
  func testDoIf() {
    UserDefaults.standard.do {
      $0.removeObject(forKey: "username")
      $0.synchronize()
    }
    XCTAssertNotEqual(UserDefaults.standard.string(forKey: "username"), "devxoul")
    let shouldModifyUserDefaults = false
    UserDefaults.standard.doIf(shouldModifyUserDefaults) {
      $0.removeObject(forKey: "username")
      $0.set("devxoul", forKey: "username")
      $0.synchronize()
    }
    XCTAssertNotEqual(UserDefaults.standard.string(forKey: "username"), "devxoul")
  }

  func testDoRethrows() {
    XCTAssertThrowsError(
      try NSObject().do { _ in
        throw NSError(domain: "", code: 0)
      }
    )
  }

  func testDoIfRethrows() {
    let shouldThrowError = false
    XCTAssertNoThrow(
      try NSObject().doIf(shouldThrowError) { _ in
        throw NSError(domain: "", code: 0)
      }
    )
  }

}
