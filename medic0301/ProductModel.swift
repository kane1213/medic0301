import Foundation

struct ProductAPIResult: Codable {
    var State: Bool
    var Data: PageableModel
}

struct PageableModel: Codable {
    var content: [ProductModel]
    var total: Int
}

struct ProductModel: Codable {
    var id: String
    var title: String
    var kind: String
    var content: String
    var image: String
    var create_time: String
}

enum ProductKind: Int {
    case none = 0
    case bread
    case cake
    case coffee
    
    var productTypeContent: String {
        switch self {
        case .none:
            return "未定義"
        case .bread:
            return "麵包"
        case .cake:
            return "蛋糕"
        case .coffee:
            return "咖啡"
        }
    }
}
