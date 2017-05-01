//
//  WorkspaceCanvasViewController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa


protocol WorkspaceCanvasViewControllerProtocol : ViewControllerProtocol {
    
    func reloadSourceListData()
    
    func displayProjectConfig(into destination: DisplayDestination)
    
}


class WorkspaceCanvasViewController: NSViewController, WorkspaceCanvasViewControllerProtocol {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var splitView: NSSplitView!
    @IBOutlet weak var sourceListOutlineView: NSOutlineView!
    @IBOutlet weak var contentView: NSView!
    
    // MARK: - PROPERTIES
    
    var contentViewController: NSViewController?
    
    // MARK: - COMPUTED PROPERTIES
    
    
    // UNSAFE
    var model: WorkspaceCanvasViewModelProtocol {
        return vm as! WorkspaceCanvasViewModelProtocol
    }
    
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.vc = self
        
        setup()
    }
    
    
    override func viewDidAppear() {
        vm.ready()
    }
    
    
    // MARK: - INSTANCE METHODS
    
    
    func setup() {
        splitView.setPosition(200, ofDividerAt: 0)
    }
    
    
    // MARK: - WorkspaceCanvasViewControllerProtocol
    
    var vm: ViewControllerModelProtocol = WorkspaceCanvasViewModel()
    
    
    func closeMyWindow() {
        window?.close()
    }
    
    
    func reloadSourceListData() {
        sourceListOutlineView.reloadData()
    }
    
    
    func displayProjectConfig(into destination: DisplayDestination) {
        
        switch destination {
        case .intoSameView:
            contentViewController?.removeFromParentViewController()
            contentViewController = nil
            
            guard let model = model as? WorkspaceCanvasViewModel else { return }
            
            contentViewController = ProjectConfigViewController.create(withDelegate: model)
            
            if let vc = contentViewController {
                addChildViewController(vc)
                
                for subview in contentView.subviews {
                    subview.removeFromSuperview()
                }
                
                contentView.addSubview(vc.view)
            }
        default:
            return
        }
    }
    
    
}


extension WorkspaceCanvasViewController : NSOutlineViewDataSource {
    
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item = item as? WorkspaceSourceListItemVM {
            return item.children.count
        } else {
            return model.items.count
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        guard let item = item as? WorkspaceSourceListItemVM else {
            return false
        }
        
        return item.children.count > 0 || item.expandedIcon != nil
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let item = item as? WorkspaceSourceListItemVM {
            return item.children[index]
        } else {
            return model.items[index]
        }
    }
    
    
}


extension WorkspaceCanvasViewController : NSOutlineViewDelegate {
    
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        guard let item = item as? WorkspaceSourceListItemVM else {
            return nil
        }
        
        var view: NSTableCellView?
        
        view = outlineView.make(withIdentifier: "ItemCell", owner: self) as? NSTableCellView
        
        if let textField = view?.textField {
            textField.stringValue = item.title
        }
        
        return view
    }
    
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        guard let outlineView = notification.object as? NSOutlineView else {
            return
        }
        
        if let selectedItem = outlineView.item(atRow: outlineView.selectedRow)
            as? WorkspaceSourceListItemVM {
            
            model.userDidSelect(item: selectedItem)
        }
    }
    
    
}
