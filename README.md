# SVNIT-Team9

We have created an Android application using flutter. and we have created API's Using flask.
In the android Application user can search for the stock and can can get acess to the OHLC graph of the stock and can compare the graph for different time ranges like a day or a month or for the complete time period. User can also read candle sticks graph, line graph and bar graph for that time and can compare the price to predict the market. user can also have a look at which stocks he/she have been looking for in the search menu. User can read about the information of the company the history of the company.

We have hosted our API's globally so that there is no need to host API's on localhost before running the application you can run the application from anydevice without facing any problems.

Repository for OHLC Engine.

Note : To explore the app, simply download the apk from release section and install on any android device.

# Frontend (Android app)
## Video demo (Youtube)
https://youtu.be/6h1M1l8jOtY

## Screenshots
![Screenshot_1630446203](https://user-images.githubusercontent.com/64666687/131580665-6f29a11e-bfb4-4c30-a4f9-e40529b50243.png)
![Screenshot_1630446250](https://user-images.githubusercontent.com/64666687/131580808-d608e212-0db7-44fe-9c8b-3db7a7fdc2d9.png)
![Screenshot_1630446238](https://user-images.githubusercontent.com/64666687/131580859-451a2ea3-158b-4942-9953-84fb8ca21e7a.png)
![Screenshot_1630446255](https://user-images.githubusercontent.com/64666687/131580922-c8536278-511d-4a57-829f-0ecb2455a2fb.png)


## How to run the code

### Written code directory
root/Mobile app/app/lib/

Note: To run and analyse the code, flutter must be installed in your system, if flutter is installed in your system follow Part 1 else follow Part 2.
Part 1
Step 1: Download or clone this repo by from github. 
Link of repo:
https://github.com/prakash-cr7/SVNIT-Team9.git

Step 2: Go to project root and execute the following command in console to get the required dependencies:

flutter pub get 
Step 3: To run the application, execute the following code in console:

flutter run


Part 2 (Installing Flutter in your System)
To install flutter in your system, follow the steps given in Flutter documentation, It is very well documented, you will not find any difficulties.

Flutter documentation to install flutter in your system:

https://flutter.dev/docs/get-started/install

# Backend (API creation)

Here I had created API using **Flask(Python)** for reading data from .JSON file so that it can be Easy to Access and created different Endpoint as requirements

**API USE GUIDELINE**

**API LINK (Heroku Deploy)** : https://api-for-hackathon.herokuapp.com/

**Various Request types**:

**1. TO GET ALL DATA (For Get All data)**

Link : https://api-for-hackathon.herokuapp.com/all-ohlc/

**2. TO GET COMPANY SPECIFIC DATA**

Link : https://api-for-hackathon.herokuapp.com/ohlc/KEY_OF_COMPANY

Eg. https://api-for-hackathon.herokuapp.com/ohlc/AAPL for company with key AAPL

Eg. https://api-for-hackathon.herokuapp.com/ohlc/GOOGL for company with key GOOGL

**3. TO GET COMPANY SPECIFIC DATA IN SPECIFIC DATE RANGE**

Link : https://api-for-hackathon.herokuapp.com/ohlc-datewise/START_DATE-to-END_DATE-KEY_OF_COMPANY

Here START_DATE in YYYY-MM-DD format also same for END_DATE

Eg. https://api-for-hackathon.herokuapp.com/ohlc-datewise/2020-03-03-to-2021-08-24-GOOGL for get all data from date 2020-03-03 to 2021-08-24 for GOOGL company

Eg. https://api-for-hackathon.herokuapp.com/ohlc-datewise/2021-07-05-to-2021-08-01-MS for get all data from date 2021-07-05 to 2021-08-01 for MS company

**4. TO GET RECENT VALUES(MOST RECENT DATA (latest DATE data))**

Link : https://api-for-hackathon.herokuapp.com/ohlc-latest/ 

company's Latest Value(Last DATE data which available (here : 2021-08-25)) 

**For More Reffer :** https://docs.google.com/document/d/1VVw-lv5YQrM0cSeOoXl9H5aM32pbDXO0MLzoWOtIHKc/edit?usp=sharing
