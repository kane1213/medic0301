import UIKit
import UserNotifications
import SnapKit
class ViewController: UIViewController {
    var noticeBtn: UIButton!
    var manager: PrdManager!
    var mainScroll:UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        manager = PrdManager()
        generateCategories(manager.categories)
        
    }
    
    func generateCategories(_ items: [categoryModel]) {
        mainScroll = UIScrollView()
        view.addSubview(mainScroll)
        
        mainScroll.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        mainScroll.isPagingEnabled = false
        for category in items {
            var item: CategoryView = CategoryView()
            item.titleLabel.text = category.name
            mainScroll.addSubview(item)
            item.layer.cornerRadius = 30
            item.snp.makeConstraints({ (make) in
                make.height.equalTo(220)
                make.left.equalTo(mainScroll.snp.left).offset(10)
                make.right.equalTo(view.safeAreaLayoutGuide).offset(-10)
                if mainScroll.subviews.count == 1 {
                    make.top.equalTo(mainScroll.snp.top).offset(10)
                } else {
                    if let last:UIView = mainScroll.subviews[mainScroll.subviews.count - 2] {
                        make.top.equalTo(last.snp.bottom).offset(10)
                    }
                }
                
                if mainScroll.subviews.count == items.count {
                     make.bottom.equalTo(mainScroll.snp.bottom).offset(20)
                }
            })
            item.tag = category.kind
            item.backgroundImg.image = UIImage(named: "c\(category.kind)")
            let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.navigateToProducts))
            
            item.addGestureRecognizer(gesture)
        }
    }
    
    func createNotiButton() {
        noticeBtn = UIButton()
        view.addSubview(noticeBtn)
        noticeBtn.snp.makeConstraints {
            (make)->Void in
            make.center.equalTo(view.snp.center)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        noticeBtn.setTitle("notice", for: .normal)
        noticeBtn.backgroundColor = UIColor.red
        noticeBtn.addTarget(self, action:#selector(showNotification), for: .touchUpInside)
    }
    
    @objc func navigateToProducts(_ sender: UITapGestureRecognizer) {
        if let key:Int = sender.view!.tag {
            let nextViewController = ProductsViewController(kind: key)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    @objc func showNotification(_ button:UIButton) {
        let noti = UNMutableNotificationContent()
        noti.title = "local notification"
        noti.subtitle = "local subtitle"
        noti.body = "test body"
        noti.badge = 1
        noti.sound = UNNotificationSound.default
        noti.userInfo = ["direct-link": "https://www.google.com"]
        let imgURL: URL = Bundle.main.url(forResource: "bread", withExtension: "jpg")!
        let attch = try! UNNotificationAttachment(identifier: "image", url: imgURL, options: nil)
        noti.attachments = [attch]
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: noti, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in print("establish notification")
        })
    }
}
