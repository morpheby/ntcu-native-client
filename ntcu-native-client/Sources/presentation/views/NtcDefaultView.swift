//
//  NtcDefaultView.swift
//  ntcu-native-client
//
//  Created by Илья Михальцов on 10/13/16.
//  Copyright © 2016 morpheby. All rights reserved.
//

import Cocoa

@IBDesignable
class NtcDefaultView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        NSLog("%@ (used under %@) not intended for CG drawing, use CA.",
              NtcDefaultView.className(), self.className)
        super.draw(dirtyRect)
    }

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override var wantsUpdateLayer: Bool {
        get {
            return true
        }
    }

    override func updateLayer() {
        super.updateLayer()

        guard let l = layer else {
            fatalError("\(NtcViewError.NoLayerPresent(view: self))")
        }

        l.backgroundColor = NSColor(srgbRed: 0.9, green: 0.9, blue: 1.0, alpha: 1.0).cgColor
    }

    private final func setupView() {
        if !wantsLayer {
            wantsLayer = true
            NSLog("%@ view has a potential problem: wantsLayer property not set by default. Review", self)
        }
        layerContentsRedrawPolicy = .onSetNeedsDisplay
        setNeedsDisplay(bounds)
    }
}

enum NtcViewError: Error, CustomStringConvertible {
    case NoLayerPresent(view: NtcDefaultView)

    var description: String {
        switch(self) {
        case let .NoLayerPresent(view):
            return "No backing layer found for class \(view.className) of object \(view)"
        }
    }
}

