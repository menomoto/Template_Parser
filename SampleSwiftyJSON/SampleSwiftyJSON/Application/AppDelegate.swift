import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(
        application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?
        ) -> Bool
    {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let viewController = ItemViewController(auctionId: "q131401994")
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
}

class TestingAppDelegate: UIResponder, UIApplicationDelegate { }
