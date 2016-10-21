import UIKit
import PureLayout

class ItemViewController: UIViewController {

    // MARK: - Properties
    private var auctionId: String
    
    // MARK: - View Elements
    var titleLabel: UILabel
    var priceLabel: UILabel
    var imageView: UIImageView
    
    init(
        auctionId: String
        )
    {
        self.auctionId = auctionId
        
        titleLabel = UILabel.newAutoLayoutView()
        priceLabel = UILabel.newAutoLayoutView()
        imageView = UIImageView.newAutoLayoutView()

        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        apiRequest()
        addSubviews()
        addConstraints()
        configureSubviews()
    }
    
    // MARK: - View Setup
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(imageView)
    }
    
    private func configureSubviews() {
    }
    
    private func addConstraints() {
        titleLabel.autoPinToTopLayoutGuideOfViewController(self, withInset: 10.0)
        titleLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        titleLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        
        priceLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLabel, withOffset: 10.0)
        priceLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        
        imageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: priceLabel, withOffset: 10.0)
        imageView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        imageView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        imageView.autoSetDimensionsToSize(CGSize(width: 192, height: 192))

    }
    
    // MARK: - API
    private func apiRequest() {
        let url = Urls.item.rawValue + auctionId
        ApiClient.request(url, completion:{ data, res, error in
            let auction = Parser.itemParse(data)

            self.titleLabel.text = auction.title
            self.priceLabel.text = auction.price + "円"
            self.imageView.image = auction.image

        })
    }
}

