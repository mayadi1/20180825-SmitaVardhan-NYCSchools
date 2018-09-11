//
//  MockSchool.swift
//  NYCSchoolsTests
//  Created by Smita on 9/11/18.
//  Copyright © 2018 Smita. All rights reserved.
//


import Foundation
@testable import NYCSchools

extension School {
  static func with(schoolName: String = "Academy of Finance and Enterprise", dbn: String = "24Q264") -> School
  {
    return School(schoolName: schoolName, dbn:dbn)
  }
}
