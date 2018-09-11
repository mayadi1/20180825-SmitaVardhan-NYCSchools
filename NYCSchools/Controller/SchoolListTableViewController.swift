//
//  ViewController.swift
//  NYCSchools
//  Created by Smita on 9/11/18.
//  Copyright © 2018 Smita. All rights reserved.
//
// This class shows the data fetched from the networking apis in the form of a list in UITableView.

import UIKit
import SVProgressHUD

class SchoolListTableViewController: UITableViewController {

  let networkCall = NetworkRequest()
  var schoolArray = [School]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    SVProgressHUD.show()
    getData()
  }

 
  //Fetching  School List from server
  func getData(){
    
    networkCall.getSchoolList { [weak self] result in
    
    switch result{
    case .success(let schoolList):
      guard schoolList.count > 0 else {
        SVProgressHUD.dismiss()
        return
      }
      self?.schoolArray = schoolList
      DispatchQueue.main.async {
        SVProgressHUD.dismiss()
        self?.tableView.reloadData()
       }
    case .failure(let error):
      SVProgressHUD.dismiss()
      Alert.showBasicAlert(title: "Error Connecting", message: error?.getErrorMessage() ?? "Loading failed, Check your Network Connection", vc: self!)
    }
  }
}
  

   // MARK: - Navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "schoolIdentifier",
    let destinationVC = segue.destination as? SATViewController,
    let indexP = tableView.indexPathForSelectedRow{
      guard let dbnText = schoolArray[indexP.row].dbn else{
        return
      }
    destinationVC.dbnText = dbnText
    }
  }
}


// MARK: - UITableViewDatasource
extension SchoolListTableViewController{
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return schoolArray.count
}

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? SchoolTableViewCell else{
      return UITableViewCell()
    }
    let data = schoolArray[indexPath.row]
    cell.schoolNameLbl.text = data.schoolName
    
    return cell
    }
}

// MARK: - Networking.GetSchoolFailureReason
fileprivate extension NetworkRequest.GetSchoolFailureReason {
  func getErrorMessage() -> String? {
    switch self {
    case .unAuthorized:
      return "Unauthorized"
    case .notFound:
      return "Could not complete request, please try again."
    }
  }
}
