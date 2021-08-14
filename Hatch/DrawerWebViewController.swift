//
//  DrawerWebViewController.swift
//  Hatch
//
//  Created by Fraser Scott-Morrison on 13/08/21.
//

import Foundation
import WebKit

class DrawerWebViewController: WebViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Account"
    }
    
    /**
     Called when the webView updates the value of its title property.
     
     - parameter webView: The instance of WKWebView that updated its title property.
     - parameter title: The value that the WKWebView updated its title property to.
     */
    @objc override open func webView(_ webView: WKWebView, didChangeTitle title: String?) {
        //navigationItem.title = title?.replacingOccurrences(of: " | Hatch", with: "")//
    }
    
    /**
     Sets up the main web view.
     */
    @objc override open func setupWebView() {
        let webViewConfig = DrawerWebViewConfiguration()
        
        webView = WKWebView(frame: view.bounds, configuration: webViewConfig)
        webView.allowsBackForwardNavigationGestures = true
        setupDelegates()
        
        view.insertSubview(webView, at: 0)
        autolayoutWebView(webView)
    }
}
