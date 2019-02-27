//
//  System.swift
//  LocalFetchDemo.iOS
//
//  Created by plu on 2/26/19.
//  Copyright © 2019 plu. All rights reserved.
//

import Foundation
import XWKWebView

public class System: NSObject {
    @objc func getInfo(_ payload: AnyObject?, _ promise: XWKWebViewPromise) {
        print("payload from JS: \(payload)")
        
        let os = ProcessInfo().operatingSystemVersion
        let osStr = String(os.majorVersion) + "." + String(os.minorVersion) + "." + String(os.patchVersion)
        let nativePayload = "{\"data\": \"\(osStr)\"}"
        promise.resolve(nativePayload)
    }
}
