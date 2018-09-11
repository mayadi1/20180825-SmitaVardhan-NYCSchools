//
//  SchoolTest.swift
//  NYCSchoolsTests
//  Created by Smita on 9/11/18.
//  Copyright © 2018 Smita. All rights reserved.
//


import XCTest

@testable import NYCSchools

class SchoolTest: XCTestCase{

  func testSuccessfulInit() {
    let testSuccessfulJson:JSON = ["schoolName": "Academy of Finance and Enterprise", "dbn": "24Q264"]
    XCTAssertNotNil(School(json:testSuccessfulJson))  }
}

private extension School{
  init?(json:JSON) {
    guard let schoolName = json["schoolName"] as? String,
      let dbn = json["dbn"] as? String else{
        return nil
    }
    self.schoolName = schoolName
    self.dbn = dbn
  }
}
