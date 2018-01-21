//
//  ColumnTextView.swift
//  ColumnTextViewApp
//
//  Created by Imanou on 21/01/2018.
//  Copyright © 2018 Imanou. All rights reserved.
//

/*
 Source: https://robots.thoughtbot.com/ios-text-kit-basics
 */

import UIKit

class ColumnTextView: UIView {
    
    private let textStorage: NSTextStorage
    private let columnCount = 2
    private let interColumnMargin = 10
    
    override init(frame: CGRect) {
        let url = Bundle.main.url(forResource: "Text", withExtension: "txt")!
        textStorage = try! NSTextStorage(url: url, options: [:], documentAttributes: nil)
        textStorage.addLayoutManager(NSLayoutManager())
        
        super.init(frame: frame)
        
        backgroundColor = .white
        contentMode = .redraw
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let layoutManager = textStorage.layoutManagers.first else { return }
        
        // Remove existing text containers since we will recreate them
        while !layoutManager.textContainers.isEmpty {
            layoutManager.removeTextContainer(at: 0)
        }
        
        // Calculate sizes for text containers
        let totalMargin = interColumnMargin * (columnCount - 1)
        let columnWidth = (bounds.size.width - CGFloat(totalMargin)) / CGFloat(columnCount)
        let columnSize = CGSize(width: columnWidth, height: bounds.size.height)
        
        // Create new containers of the appropriate size
        for _ in 0 ..< Int(columnCount) {
            let container = NSTextContainer(size: columnSize)
            layoutManager.addTextContainer(container)
        }
        
        var (x, y) = (bounds.origin.x, bounds.origin.y)
        for textContainer in layoutManager.textContainers {
            let glyphRange = layoutManager.glyphRange(for: textContainer)
            layoutManager.drawGlyphs(forGlyphRange: glyphRange, at: CGPoint(x: x, y: y))
            x += columnSize.width + CGFloat(interColumnMargin)
        }
    }
    
}

