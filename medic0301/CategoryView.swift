import UIKit
import SnapKit
class CategoryView: UIView {
    var titleLabel: UILabel!
    var contentLabel: UILabel!
    var backgroundImg: UIImageView!
    // var imageUIView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.blue
        backgroundImg = UIImageView()
        addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height)
            make.center.equalTo(self.snp.center)
        }
        backgroundImg.contentMode = .scaleAspectFill
        backgroundImg.clipsToBounds = true
        backgroundImg.layer.cornerRadius = 30

        titleLabel = UILabel()
        addSubview(titleLabel)
        titleLabel.modifyLabel(text: "product title", color: UIColor.white, size: 32)
        titleLabel.shadowColor = UIColor.black
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.centerY).offset(5)
        }
        
        contentLabel = UILabel()
        addSubview(contentLabel)
        contentLabel.modifyLabel(text: "product content", color: UIColor.white, size: 24)
        contentLabel.shadowColor = UIColor.black
        contentLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(titleLabel.snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom).offset(-8)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
