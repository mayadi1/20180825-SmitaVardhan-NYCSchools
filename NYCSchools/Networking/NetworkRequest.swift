//
//  NetworkRequest.swift
//  NYCSchools
//  Created by Smita on 9/11/18.
//  Copyright © 2018 Smita. All rights reserved.
//


import Foundation
import Alamofire

class NetworkRequest{
  
  
  //endpoint for Pagination of data from server, given more time I would have implemented the pagination in UITableviewController
  let schoolUrl = "https://data.cityofnewyork.us/resource/97mf-9njv.json?$limit=100&$offset=0"
  
  //here i am using the dbntext as a parameter to fetch the details of a particular school
  let satUrl = "https://data.cityofnewyork.us/resource/734v-jeq5.json?dbn="
  
  // MARK: - getSchoolList from the server using Alamofire
  enum GetSchoolFailureReason: Int, Error {
    case unAuthorized = 401
    case notFound = 404
  }
  
  typealias GetSchoolResult = Result<[School], GetSchoolFailureReason>
  typealias GetSchoolCompletion = (_ result: GetSchoolResult) -> Void
  
  
  func getSchoolList(completion: @escaping GetSchoolCompletion){
    
    guard let endPointUrl = URL(string: schoolUrl) else{
      return
    }
    Alamofire.request(endPointUrl)
      .validate()
      .responseJSON { response in
        switch response.result{
        case .success:
          do {
            guard let data = response.data else {
              completion(.failure(nil))
              return
            }
            let schools = try JSONDecoder().decode([School].self, from: data)
            completion(.success(payload: schools))
          }catch{
            completion(.failure(nil))
          }
        case .failure(_):
          if let statusCode = response.response?.statusCode,
            let reason = GetSchoolFailureReason(rawValue: statusCode) {
            completion(.failure(reason))
          }
          completion(.failure(nil))
        }
    }
  }
  
  // MARK: - getSAT Score
  
  enum GetSATFailureReason: Int, Error {
    case unAuthorized = 401
    case notFound = 404
  }
  
  typealias GetSATResult = Result<[Score], GetSATFailureReason>
  typealias GetSATCompletion = (_ result: GetSATResult) -> Void
  
  func getSatScore(dbn:String, completion: @escaping GetSATCompletion){
    let satDbnUrl = "\(satUrl)\(dbn)"
    guard let DbnUrl = URL(string:satDbnUrl) else{
      return
    }
    Alamofire.request(DbnUrl)
      .validate()
      .responseJSON { response in
        switch response.result{
        case .success:
          do{
            guard let  data = response.data else{
              completion(.failure(nil))
              return
            }
            let scores = try JSONDecoder().decode([Score].self, from: data)
            completion(.success(payload: scores))
          }catch{
            completion(.failure(nil))
          }
        case .failure(_):
          if let statusCode = response.response?.statusCode,
            let reason = GetSATFailureReason(rawValue: statusCode) {
            completion(.failure(reason))
          }
          completion(.failure(nil))
        }
    }
    
  }
  
  
}
