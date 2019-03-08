import Foundation
class PrdManager {
    
    func getProduct() {
        let urlString: String = "http://kane1213.synology.me/maysbagel/api/product/?items";
        // let url = URL(string: urlString);
        // let url2 = NSURL(string: urlString);
        
        
        let jsonObj = getJSON(urlToRequest: urlString)
        print(jsonObj)
        
        
//        URLSession.shared.dataTask(with: (url2 as? URL)!, completionHandler: {(data, response, error) -> Void in
//
//            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
//
//                print(jsonObj!.value(forKey: "Data"))
//
//
//                if let prdArray = jsonObj!.value(forKey: "Data") as? NSArray {
//                    print(prdArray)
//                }
//
//
//            }
//            
//        }).resume()
        
        
        
//        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response,
//            error) in
//            print("test123")
//            // 先判斷error
//            if error != nil{
//
//            }else{
//
//                //data就是download下來的資料...
//                // 先解開 optional...   -> urlContent
//                //  然後在呼叫 JSONSerialization.jsonObject
//                //   由於他是會throws  ,  所以要用  do catch 的方式
//                if let urlContent = data{
//                    do{
//                        let jsonresult =   try  JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
//                        print(jsonresult)
//                    }catch{
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//
//        })
        
    }
    
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOf: NSURL(string: urlToRequest) as! URL)
    }
    
    func parseJSON(inputData: NSData) -> NSDictionary{
        var error: NSError?
        var boardsDictionary: NSDictionary = JSONSerialization.JSONObjectWithData(inputData, options: JSONSerialization.ReadingOptions.MutableContainers, error: &error) as NSDictionary
        
        return boardsDictionary
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
