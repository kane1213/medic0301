import Foundation
class DetailPrdModel {
    var productImageURL: URL?
    var productName: String = "商品名稱"
    var productType: ProductType = .none
    var productPrice: String = "商品價格"
    var productTag: String?
    var productDescription: String?
    var relativeProducts: [SimPrdModel]?
    var productID: String!
    
    /*
     {
     thumbnailURL: "",
     name: "",
     type: 2,
     price: "0"
     }
     */
    
    init(productInformation: [String: Any]) {
        
        if let thumbnailURL =
            productInformation["thumbnailURL"] as? String {
            productImageURL = URL(string: thumbnailURL)
        }
        
        if let name = productInformation["name"] as? String {
            productName = name
        }
        
        if let type = productInformation["type"] as? Int,
            let enumType = ProductType(rawValue: type) {
            productType = enumType
        }
        
        if let price = productInformation["price"] as? String {
            productPrice = price
        }
        
        if let tag = productInformation["tag"] as? String {
            productTag = tag
        }
        
        if let description = productInformation["description"] as? String {
            productDescription = description
        }
        
        if let products = productInformation["products"] as? [[String: AnyHashable]] {
            var models: [SimPrdModel] = []
            products.forEach { (productInformation) in
                models.append(SimPrdModel(productInformation: productInformation))
            }
            relativeProducts = models
        }
        
        if let identifier = productInformation["id"] as? String {
            productID = identifier
        }
    }
    
}
