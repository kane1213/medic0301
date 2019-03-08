//
//  ViewController.swift
//  medic0301
//
//  Created by Mini on 2019/3/1.
//  Copyright © 2019 Mini. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
    var noticeBtn: UIButton!
    var tableView: UITableView!
    var manager: PrdManager!
    var productList: [SimPrdModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = PrdManager()
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(PrdTableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 180
        manager.getProduct()
        manager.getProductList { (productModels) in
            self.productList = productModels
            self.tableView.reloadData()
        }
    }
    
    func createNotiButton() {
        noticeBtn = UIButton()
        view.addSubview(noticeBtn)
        noticeBtn.translatesAutoresizingMaskIntoConstraints = false
        noticeBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        noticeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noticeBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        noticeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        noticeBtn.setTitle("notice", for: .normal)
        noticeBtn.backgroundColor = UIColor.red
        noticeBtn.addTarget(self, action:#selector(showNotification), for: .touchUpInside)
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prdModel = productList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PrdTableViewCell
        cell.productNameLabel.text = prdModel.productName
        cell.productPriceLabel.text = prdModel.productPrice
        cell.productTypeLabel.text = prdModel.productType.productTypeContent
        
        do {
            let imgData = try Data(contentsOf: prdModel.productImageURL!)
            cell.productImageView.image = UIImage(data: imgData)
        } catch {
            print("image error")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prdModel = productList[indexPath.row]
        manager.getDetailProduct(productID: prdModel.productID)
        { (detail) in
            

            if let detailInfo = detail {
                DispatchQueue.main.async {
                    print("---ACCESS1---")
                    let nextVC = DetailViewController(prdInfo: detailInfo)
                    self.navigationController?.pushViewController(nextVC, animated: true)
                    print("---ACCESS2---")
                    if let selectIdxPath = tableView.indexPathForSelectedRow {
                        tableView.deselectRow(at: selectIdxPath, animated: true)
                    }
                    print("---ACCESS3---")
                }
            }
            
        }
    }
    
}
