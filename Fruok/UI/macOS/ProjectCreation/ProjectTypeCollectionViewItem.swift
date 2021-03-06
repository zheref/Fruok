//
//  ProjectTypeCollectionViewItem.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/9/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

class ProjectTypeCollectionViewItem: NSCollectionViewItem, ViewModelRepresentant {
    
    public var vm: ViewModelProtocol? {
        didSet {
            guard isViewLoaded else { return }
            if let model = vm as? ProjectTypeCollectionItemViewModel {
                if let assetName = model.imageAssetName {
                    imageView?.image = NSImage(named: assetName)
                } else {
                    imageView?.image = nil
                }
                
                textField?.stringValue = model.title
            } else {
                imageView?.image = nil
                textField?.stringValue = ""
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            //view.layer?.borderWidth = isSelected ? 5.0 : 0.0
            view.layer?.backgroundColor = isSelected ? NSColor.darkGray.cgColor : NSColor.white.cgColor
            textField?.textColor = isSelected ? NSColor.white : NSColor.black
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.white.cgColor
    }
    
}
