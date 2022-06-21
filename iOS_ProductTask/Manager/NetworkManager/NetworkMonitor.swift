import SystemConfiguration

class NetworkMonitor {
    
    static let shared = NetworkMonitor()
    private init() {

    }

    
    let reachability = SCNetworkReachabilityCreateWithName(nil, "localhost")
    var flags = SCNetworkReachabilityFlags()
    
    var isConnected: Bool {
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        return flags.contains(.reachable)
    }
}

