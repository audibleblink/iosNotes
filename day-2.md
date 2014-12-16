# Day 2

## Views and the View Heiarchy

- A view is an instance of UIView or one of its subclasses.
- A view knows how to draw itself.
- A view handles events, like touches.
- A view exists within a hierarchy of views. The root of this hierarchy is the application’s window.

Every application has a single instance of UIWindow that serves as the container for all the views in the application. Anything inside of this is a subview.

Subviews are array-like structures that hold other views.   
Views take frames for initialization. Frames are two structs implemented as CGRect types.

```swift
CGRect(origin: <#CGPoint#>, size: <#CGSize#>)
```

Here, we'll add a sub-view to the window object.

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
    let firstView = HypnosisView(frame: firstFrame)
    firstView.backgroundColor = UIColor.blueColor()
    window!.addSubview(firstView)
    window!.backgroundColor = UIColor.whiteColor()
    window!.makeKeyAndVisible()
    return true
}
```

__THE RUN LOOP__

When an application starts, a loop begins, listening for input. An input is marked as an Event. If a listener has been marked for that event, we enter the Do stage. Do will carry out any logic the developer designates. Sort of like callbacks. Once that work is finished, the views no longer reflect any state changes the Do stage may have enacted. The views were maked as 'Dirty' by the Do phase. We then enter the Draw phase. Any views marked dirty will be redrawn. The process repeats.

__Marking your Views as dirty__

To get a view on the list of dirty views, you must send it the message setNeedsDisplay(). The subclasses of UIView that are part of the iOS SDK send themselves setNeedsDisplay() whenever their content changes. For example, an instance of UILabel will send itself setNeedsDisplay() when its text property changes, since changing the text of a label requires the label to re-render its layer. In custom UIView subclasses, like HypnosisView, you must send this message yourself.

Example:

```swift
var relativeX: CGFloat = 0.0 { didSet {
        setNeedsDisplay()
    }
}
var relativeY: CGFloat = 0.0 {
didSet {
        setNeedsDisplay()
    }
}
var relativeWidth: CGFloat = 0.0 {
didSet {
        setNeedsDisplay()
    }
}
var relativeHeight: CGFloat = 0.0 {
didSet {
        setNeedsDisplay()
    }
}
```



## UIScrollView and Delegation

### __UIScrollView__  

ScrollViews display a portion of information that is larger than the screen. A webpage is longer than the height of your phone. The SrollView lets you scroll through it. UIScrollView is a subclass of UIView, so it can be initialized using init(frame:) and it can be added as a subview to another view.

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.mainScreen().bounds)

    // Create CGRects for frames
    var screenRect = window!.bounds
    var bigRect = screenRect
    bigRect.size.width *= 2.0
    bigRect.size.height *= 2.0
 
    // Create a screen-sized scroll view and add it to the window
    let scrollView = UIScrollView(frame: screenRect)
    window!.addSubview(scrollView)
 
    // Create a super-sized hypnosis view and add it to the scroll view
    let hypnosisView = HypnosisView(frame: bigRect)
    scrollView.addSubview(hypnosisView)
 
    // Tell the scroll view how big its content area is
    scrollView.contentSize = bigRect.size
    window!.backgroundColor = UIColor.whiteColor()
    window!.makeKeyAndVisible()
    return true
}

```


### Delegation

These are like callbacks. They're not like callbacks in that delegates can receive messages from 2 different functions and compare information.

In delegation, an object can only send its delegate messages from a specific set listed in a protocol. Every UIScrollView has a delegate property, and we can set this property to point to the object that we want to receive the “scroll view did scroll” method. For Hypnosister, this object is the AppDelegate.

```swift
scrollView.delegate = self //self is the class in which it's declared

// Since the delegate is THIS class, and UIScrollView calls the 
// scrollViewDidScroll from its delegate, we must implement
// that method here too

func scrollViewDidScroll(scrollView: UIScrollView) {
    println("Content offset: \(scrollView.contentOffset)")
}
```

__Protocols__

These are a list of messages that an object is allowed to send its delegate

```swift
protocol UIScrollViewDelegate : NSObjectProtocol {
    optional func scrollViewDidScroll(scrollView: UIScrollView)
    optional func scrollViewDidZoom(scrollView: UIScrollView)
    optional func scrollViewWillBeginDragging(scrollView: UIScrollView)
    optional func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
}
```

A class must explicitly conform to a delegate protocol. In this scenario, AppDelegate must agree to accept the messages that its internal ScrollView instance will be sending it.  


```swift
class AppDelegate: UIResponder, UIApplicationDelegate, UIScrollViewDelegate {
...
...
scrollView.delegate = self
```





- contracts?


### View Controllers

