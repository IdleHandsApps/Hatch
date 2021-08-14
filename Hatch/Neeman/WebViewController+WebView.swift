import WebKit

extension WebViewController {
    
    
    open func setupDelegates() {
        if let url = rootURL {
            if navigationDelegate == nil {
                navigationDelegate = WebViewNavigationDelegate(rootURL: url, delegate: self)
            }
            webView.navigationDelegate = navigationDelegate
            uiDelegate = WebViewUIDelegate(baseURL: url)
        }
        
        uiDelegate?.delegate = self
        webView.uiDelegate = uiDelegate
    }
    
    /**
     Autolayout the main web view.
     
     - parameter webView: The web view to layout.
     */
    open func autolayoutWebView(_ webView: WKWebView) {
        guard let superview = webView.superview else {
            fatalError()
        }
        webView.translatesAutoresizingMaskIntoConstraints = false
        let views = ["webView":webView]
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView(>=0)]|",
            options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView(>=0)]|",
            options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
    }
 
}
