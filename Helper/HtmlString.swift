//
//  HtmlString.swift
//  Pavefs
//
//  Created by Zacharias Giakoumi on 12/29/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import Foundation
import UIKit
extension String {
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = dataUsingEncoding(NSUTF8StringEncoding)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
