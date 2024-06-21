
import Foundation

struct AppConfig {
    
    enum PlistKey: String {
        case newsUrl
    }
    
    static fileprivate var infoDict: [String: Any] {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            } else {
                fatalError("Plist file not found")
            }
        }
    }
    
    static func configValue(_ key: PlistKey) -> String {
        return infoDict[key.rawValue] as! String
    }
}

struct NetworkConfig: NetworkConfigProtocol {
    let baseURL = "http://bazihero.com/api/"
    let staticHeaders: [String : String] = [:]
    
}
