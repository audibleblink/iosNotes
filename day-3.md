# Day 3

## View Controllers

Our window (the screen; UIWindow) has a property called rootViewController.  
This gets set on app launch. It calls a View Controller and fetches its lazily loaded property called `view`

View Controller (UIViewController)
- loadView function runs
  - if we are programatically adding views, we must override this function
  - viewDidLoad() get called automatically


__Model__
- holds data
- not alot of behavior

__View__
- can draw itself
- handles user input
  - only collecting, no parsing or validating info
  - run listener in the View Controller

__Controller__
- holds most of the logic
