//
//  ViewController.swift
//  LocalFetchDemo.iOS
//
//  Created by plu on 2/20/19.
//  Copyright © 2019 plu. All rights reserved.
//

import UIKit
import WebKit
import XWKWebView
import LocalFetch

class ViewController: UIViewController {
    private var xwkWebView: XWKWebView?
    private var localFetch: LocalFetch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100), configuration: WKWebViewConfiguration())
        view.addSubview(webView)
        
        webView.load(URLRequest(url: URL(string: "http://127.0.0.1:8888/index.html")!))
        
        xwkWebView = XWKWebView(webView)
        guard let xwkWebView = xwkWebView else {
            print("failed to instantiate XWKWebView")
            return
        }
        localFetch = LocalFetch(xwkWebView)
        localFetch?.registerRouteBase(NativeFileManager(), routeBase: "fileManager")
        localFetch?.registerRouteBase(System(), routeBase: "os")
    }
}

