//
//  DrawerWebViewConfiguration.swift
//  Hatch
//
//  Created by Fraser Scott-Morrison on 13/08/21.
//

import Foundation
import WebKit

class DrawerWebViewConfiguration: WebViewConfiguration {
    
    override func addJavascript() {
        addCSSScript()
        addScript("AtDocumentStart.js", injectionTime: .atDocumentStart)
        addScript("DrawerAtDocumentEnd.js", injectionTime: .atDocumentEnd)
    }
    
    /**
     Injects WebView.css into the page.
     */
    override func addCSSScript() {
        let script = WKUserScript(source: Injector(cssFilename: "DrawerWebView.css").javascriptForCSS(),
                                  injectionTime: .atDocumentStart,
                                  forMainFrameOnly: true)
        userContentController.addUserScript(script)
    }
    /**
     Inject a script at the specified injection time.
     
     - parameter scriptName:    The name of the script to inject.
     - parameter injectionTime: The point at which to inject the script.
     */
    override public func addScript(_ scriptName: String, injectionTime: WKUserScriptInjectionTime) {
        let content = Injector(cssFilename: "DrawerWebView.css").stringFromContentInFileName(scriptName)
        let script = WKUserScript(source: content!, injectionTime: injectionTime, forMainFrameOnly: false)
        userContentController.addUserScript(script)
    }
}
