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

  func testThen() {
    let queue = OperationQueue().then {
      $0.name = "awesome"
      $0.maxConcurrentOperationCount = 5
    }
    XCTAssertEqual(queue.name, "awesome")
    XCTAssertEqual(queue.maxConcurrentOperationCount, 5)
  }

  func testWith() {
    let user = User().with {
      $0.name = "devxoul"
      $0.email = "devxoul@gmail.com"
    }
    XCTAssertEqual(user.name, "devxoul")
    XCTAssertEqual(user.email, "devxoul@gmail.com")
  }

  func testDo() {
    UserDefaults.standard.do {
      $0.removeObject(forKey: "username")
      $0.set("devxoul", forKey: "username")
      $0.synchronize()
    }
    XCTAssertEqual(UserDefaults.standard.string(forKey: "username"), "devxoul")
  }

}
