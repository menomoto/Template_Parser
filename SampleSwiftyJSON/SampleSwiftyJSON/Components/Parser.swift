import UIKit
import SwiftyJSON

// MARK: - Parser
class Parser {
    
    class func itemParse(data: NSData?) -> Auction {
        var auction = Auction()
        if let data = data {
            let json = JSON(data: data.jsonp2Json())
            let result = json["ResultSet"]["Result"]
            
            if let title = result["Title"].string {
                auction.title = title
            }
            
            if let price = result["Price"].string {
                auction.price = price
            }
            
            if let imageUrl = result["Img"]["Image1"].string {
                auction.image = UIImage.imageWithUrl(imageUrl)
            }
        }
        return auction
    }
    
}


// MARK: - Extensions
extension UIImage {
    class func imageWithUrl(url: String) -> UIImage {
        let httpsUrl = url.stringByReplacingOccurrencesOfString("http", withString: "https")
        if let imageUrl = NSURL(string: httpsUrl),
            let data = NSData(contentsOfURL: imageUrl),
            let image: UIImage = UIImage(data: data) {
            return image
        }
        
        return UIImage()
    }
}


extension NSData {
    func jsonp2Json() -> NSData {
        if let jsonpString: String = NSString(data: self, encoding:NSUTF8StringEncoding) as? String {
            let jsonString = jsonpString.stringByReplacingOccurrencesOfString("loaded(", withString: "").stringByReplacingOccurrencesOfString(")", withString: "")
            if let data = jsonString.dataUsingEncoding(NSUTF8StringEncoding) {
                return data
            }
        }
        return NSData()
    }
}
