import UIKit
import SnapKit

class PrdTableViewCell: UITableViewCell {
    var productImageView: UIImageView!
    var titleLabel: UILabel!
    var typeLabel: UILabel!
    var contentLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        productImageView = UIImageView()
        titleLabel = UILabel()
        typeLabel = UILabel()
        contentLabel = UILabel()
        for tmpView in [productImageView, titleLabel, typeLabel, contentLabel] {
            addSubview(tmpView as! UIView)
        }
        
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.snp.makeConstraints {
            (make) -> Void in
            make.width.height.equalTo(120)
            make.top.left.equalTo(20)
            // make.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
        
        typeLabel.modifyLabel(text: "類別", color: UIColor.lightGray, size: 12)
        typeLabel.snp.makeConstraints {
            (make) -> Void in
            make.top.equalTo(productImageView.snp.top)
            make.left.equalTo(productImageView.snp.right).offset(16)
            make.right.equalTo(contentView.snp.right).offset(-16)
        }
        
        titleLabel.modifyLabel(text: "商品", color: UIColor.black , size: 24)
        titleLabel.snp.makeConstraints {
            (make) -> Void in
            make.top.equalTo(typeLabel.snp.bottom).offset(3)
            make.left.equalTo(productImageView.snp.right).offset(16)
            make.right.equalTo(contentView.snp.right).offset(-16)
        }
        
        contentLabel.modifyLabel(text: "類別", color: UIColor.gray, size: 18)
        contentLabel.numberOfLines = 2
        contentLabel.snp.makeConstraints {
            (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(productImageView.snp.right).offset(16)
            make.right.equalTo(contentView.snp.right).offset(-16)
        }
        
//        contentView.snp.makeConstraints {
//            (make) -> Void in
//            make.bottom.equalTo(productImageView.snp.bottom)
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension UILabel {
    func modifyLabel(text:String, color:UIColor, size:CGFloat) {
        self.text = text
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: size)
    }
}
