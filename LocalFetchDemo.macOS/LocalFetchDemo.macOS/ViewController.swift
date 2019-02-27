//
//  ViewController.swift
//  LocalFetchDemo.macOS
//
//  Created by plu on 2/20/19.
//  Copyright © 2019 plu. All rights reserved.
//

import Cocoa
import WebKit
import XWKWebView
import LocalFetch

class ViewController: NSViewController {
    private var xwkWebView: XWKWebView?
    private var localFetch: LocalFetch?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.window?.setFrame(NSRect(x:0, y:0, width: 600, height: 800), display: true)
        let webView = WKWebView(frame: NSRect(x: 0, y: 0, width: 600, height: 800), configuration: WKWebViewConfiguration())
        view.addSubview(webView)        
        
        // Uncomment this to test loading html from remote
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

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

