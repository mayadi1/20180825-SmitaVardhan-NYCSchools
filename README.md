# 20180825-SmitaVardhan-NYCSchools


This is an mobile client application for [NYCSchools](https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2). NYCSchools app displays list of NYC Schools and then shows additional information about the school like SAT scores in various categories. It is written in Swift 4 and XCode 9.4. It uses a simple restful service to get data from the server and display it in a list format in a tableview.



## Documentation
The app is currently designed using Apples MVC pattern but can be modified into MVVM also.
The end point for getting the data from server is customized for pagination but because of less time I could not implement pagination in the tableview. So, Right now the app is only showing data for 100 rows but if paging is done it will show more data depending on the offset.
The app also tests the model classes and similarly can be used to test the networking code also.
This app uses Alamofire version 4.7 for making networking calls and SVProgressHud for loding indicator using cocoapods 
