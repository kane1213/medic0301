import Foundation
enum ProductType: Int {
    case none = 0
    case health
    case cloth
    case electronics
    
    var productTypeContent: String {
        switch self {
        case .none:
            return "未定義"
        case .health:
            return "健康"
        case .cloth:
            return "服飾"
        case .electronics:
            return "電子產品"
        }
    }
}

class SimPrdModel {
    var productImageURL: URL?
    var productName: String = "商品名稱"
    var productType: ProductType = .none
    var productPrice: String = "商品價格"
    var productID: String!
    
    init(productInformation: [String: AnyHashable]) {
        
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
        
        if let identifier = productInformation["id"] as? String {
            productID = identifier
        }
    }
}
