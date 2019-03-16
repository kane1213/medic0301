import Foundation

struct categoryModel {
    var name: String = ""
    var kind: Int = 0
    init(_ nameStr:String,_ kindInt: Int) {
        name = nameStr
        kind = kindInt
    }
}

class PrdManager {
    
    enum JSONError: String, Error {
        case unknownError = "Error: Unknowned"
        case noData = "Error: No Data"
        case parseFailed = "Error: Parse Failed"
    }
    func getProduct(_ urlString: String, completion: @escaping (ProductAPIResult) -> Void) {
        let request =
            URLRequest(url: URL(string: urlString)!)
        
        let requestTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                guard error == nil else {
                    throw JSONError.unknownError
                }
                guard data != nil else {
                    throw JSONError.noData
                }
                guard let _ = try JSONSerialization.jsonObject(with: data!, options:[]) as? NSDictionary else {
                    throw JSONError.parseFailed
                }
                let decoder = JSONDecoder()
                if let result = try? decoder.decode(ProductAPIResult.self, from: data!) {
                    completion(result)
                
                } else {
                    // completion(nil)
                }
                
            } catch {
                // print(error)
            }
        }
        requestTask.resume()
    }
    
    func getProductList(completion: ([SimPrdModel]) -> Void) {
        var productModels: [SimPrdModel] = []
        sampleSimpleProducts.forEach { (productInformation) in
            let productModel = SimPrdModel(productInformation: productInformation)
            productModels.append(productModel)
        }
        completion(productModels)
    }
    
    func getDetailProduct(productID: String,
                          completion: (DetailPrdModel?) -> Void) {
        if let detailProductInformation = sampleDetailProducts[productID] {
            completion(DetailPrdModel(productInformation: detailProductInformation))
        } else {
            completion(nil)
        }
    }
    
    let categories: [categoryModel] =
        [
            categoryModel("Bread", 1),
            categoryModel("Cake", 2),
            categoryModel("Coffee", 3),
            categoryModel("Other", 4)
        ]
    
    let sampleSimpleProducts: [[String : AnyHashable]] =
        [
            [
                "thumbnailURL": "https://cdn.shopify.com/s/files/1/0254/0393/products/850f703a1f213d87f2054a6417a81a5e_500x.jpg?v=1549880851",
                "name": "商品1",
                "type": 0,
                "price": "0",
                "id": "1"
            ],
            [
                "thumbnailURL": "https://cdn.shopify.com/s/files/1/0254/0393/products/4a844ae5ec2477548d18792359959e6f_1500x.jpg?v=1548036458",
                "name": "商品2",
                "type": 1,
                "price": "10",
                "id": "2"
            ],
            [
                "thumbnailURL": "https://cdn.shopify.com/s/files/1/0254/0393/products/800x800_b_0395d27a-b076-423d-a55a-5ce99565867e_500x.jpg?v=1548849438",
                "name": "Next 雲端智慧攝影機 ",
                "type": 1,
                "price": "10",
                "id": "3"
            ],
            [
                "thumbnailURL": "https://cdn.shopify.com/s/files/1/0254/0393/products/17a3682e5effe127c9d54d25878950d1_500x.jpg?v=1538120966",
                "name": "循環風扇",
                "type": 1,
                "price": "10",
                "id": "4"
            ]
    ]
    
    let sampleDetailProducts = [
        "1": [
            "thumbnailURL": "https://cdn.shopify.com/s/files/1/0254/0393/products/850f703a1f213d87f2054a6417a81a5e_500x.jpg?v=1549880851",
            "name": "商品1",
            "type": 0,
            "price": "0",
            "id": "1",
            "tag": "標籤1",
            "description": "商品敘述1",
            "product": [
                [
                    "thumbnailURL": "",
                    "name": "商品1",
                    "type": 0,
                    "price": "0",
                    "id": "1"
                ],
                [
                    "thumbnailURL": "",
                    "name": "商品2",
                    "type": 1,
                    "price": "10",
                    "id": "2"
                ]
            ]
        ],
        "2": [
            "thumbnailURL": "https://cdn.shopify.com/s/files/1/0254/0393/products/4a844ae5ec2477548d18792359959e6f_1500x.jpg?v=1548036458",
            "name": "商品2",
            "type": 1,
            "price": "10",
            "id": "2",
            "tag": "標籤2",
            "description": "商品敘述2",
            "product": [
                [
                    "thumbnailURL": "",
                    "name": "商品1",
                    "type": 0,
                    "price": "0",
                    "id": "1"
                ],
                [
                    "thumbnailURL": "",
                    "name": "商品2",
                    "type": 1,
                    "price": "10",
                    "id": "2"
                ]
            ]
        ],
        "3": [
            "thumbnailURL": "https://cdn.shopify.com/s/files/1/0254/0393/products/800x800_b_0395d27a-b076-423d-a55a-5ce99565867e_500x.jpg?v=1548849438",
            "name": "商品3",
            "type": 1,
            "price": "10",
            "id": "3",
            "tag": "標籤3",
            "description": "商品敘述3",
            "product": []
        ],
        "4": [
            "thumbnailURL": "https://cdn.shopify.com/s/files/1/0254/0393/products/17a3682e5effe127c9d54d25878950d1_500x.jpg?v=1538120966",
            "name": "商品4",
            "type": 1,
            "price": "10",
            "id": "4",
            "tag": "標籤4",
            "description": "商品敘述4",
            "product": [
                [
                    "thumbnailURL": "",
                    "name": "商品2",
                    "type": 1,
                    "price": "10",
                    "id": "2"
                ]
            ]
        ],
        ]
}
