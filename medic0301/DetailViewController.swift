import UIKit
class DetailViewController: UIViewController {
    var prdInf: DetailPrdModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
    }
    
    init(prdInfo: DetailPrdModel) {
        super.init(nibName: nil, bundle: nil)
        self.prdInf = prdInfo
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
