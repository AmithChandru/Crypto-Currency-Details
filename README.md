drt Readme

-Adding the necessary dependencies
-Application flow
-Comments in the files
-Errors

Adding the necessary dependencies:
    Before running the project please make sure to get the dependencies as there are few additional dependencies added which
    necessary to run the application.

Application flow:
    Main function executes a widget named 'homePage' which is the model for the application. From here 'searchBar' is executed
    and based on the user input, either 'pendingArea' or 'cryptoDetails' is displayed. Once 'cryptoDetails' is executed a clickable
    text is shown to display the 'orderBook'. API calls required for the application is stored in 'API_Calls' file.

Comments in the files:
    For few complex logics and also why few statements are used, comments are used to explain the logic behind it.

Errors:
    RangeError may occur if there is no internet connectivity or the API calls do not respond.