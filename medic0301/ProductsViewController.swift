import UIKit

class ProductsViewController: UIViewController {
    var tableView: UITableView!
    var manager: PrdManager!
    var productList: [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init(kind: Int) {
        super.init(nibName: nil, bundle: nil)
        generateTableView(kind)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateTableView(_ kind: Int) {
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
        self.tableView.rowHeight = 152
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        manager.getProduct("http://kane1213.synology.me/maysbagel/api/product/?items&kind=\(kind)") {
            (res) in
            if let products:[ProductModel] = res.Data.content {
                for var product in products {
                    product.image = String(product.image.split(separator: ",")[0])
                }
                self.productList = products
                self.tableView.reloadData()
            }
        }
    }
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prdModel = productList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PrdTableViewCell
        cell.titleLabel.text = prdModel.title
        cell.contentLabel.text = prdModel.content
        let prdKind: ProductKind = ProductKind(rawValue: Int(prdModel.kind) ?? 0) ?? .none
        cell.typeLabel.text = prdKind.productTypeContent
        do {
            let imgPath = "http://kane1213.synology.me/maysbagel/images/\(String(prdModel.image.split(separator: ",")[0]))"
            // let urlstring = URL(fileURLWithPath: imgPath)
            if let imgUrl = URL(string: imgPath) {
                let imgData = try Data(contentsOf: imgUrl)
                cell.productImageView.image = UIImage(data: imgData)
            }
            
        } catch {
            print("image error")
        }
        return cell
    }
}
