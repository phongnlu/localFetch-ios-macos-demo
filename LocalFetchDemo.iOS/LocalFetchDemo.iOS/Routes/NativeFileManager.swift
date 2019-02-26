//
//  NativeFileManager.swift
//  LocalFetchDemo.iOS
//
//  Created by plu on 2/25/19.
//  Copyright © 2019 plu. All rights reserved.
//

import Foundation
import XWKWebView

public class NativeFileManager: NSObject {
    @objc func postRead(_ payload: AnyObject?, _ promise: XWKWebViewPromise) {
        print("payload from JS: \(payload)")
        
        
        guard let payload = payload,
            let body = payload["body"] as? AnyObject,
            let resource = body["resource"] as? String else {
                print("failed to read payload")
                return
        }
        
        if let file = readFile(resource) {
            let nativePayload = "{\"data\": \"\(file)\"}"
            promise.resolve(nativePayload)
        } else {
            promise.reject("{\"data\": \"Error reading file\"}")
        }
    }
    
    func readFile(_ file: String) -> String? {
        let fileArr = file.components(separatedBy: ".")

        if let filepath = Bundle.main.path(forResource: fileArr[0], ofType: fileArr[1]) {
            do {
                let contents = try String(contentsOfFile: filepath)
                if let sourceBase64Encoded = contents.data(using: .utf8)?.base64EncodedString() {
                    return sourceBase64Encoded
                } else {
                    return nil
                }
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
