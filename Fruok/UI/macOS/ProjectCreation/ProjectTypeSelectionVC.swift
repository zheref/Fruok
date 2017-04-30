//
//  ProjectTypeSelectionViewController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/8/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa


protocol ProjectTypeSelectionViewControllerProtocol : ViewControllerProtocol {
    
    var parentVC: ProjectCreationContainerViewControllerProtocol? { get set }
    
    func reload()
    
    func cancelByDismissing()
    
    func changeToProjectOptionsForm()
    
}


class ProjectTypeSelectionViewController: NSViewController, ProjectTypeSelectionViewControllerProtocol {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var projectTypesCollectionView: NSCollectionView!
    
    // MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        vm.vc = self
    }
    
    
    override func viewDidAppear() {
        configureCollectionView()
        vm.ready()
    }
    
    
    // MARK: - PROJECTTYPESELECTIONVIEWCONTROLLER PROTOCOL
    
    var vm: ViewControllerModelProtocol = ProjectTypeSelectionViewModel() {
        didSet {
            
        }
    }
    
    var model: ProjectTypeSelectionViewModelProtocol {
        return vm as! ProjectTypeSelectionViewModelProtocol
    }
    
    var parentVC: ProjectCreationContainerViewControllerProtocol?
    
    func reload() {
        projectTypesCollectionView.reloadData()
    }
    
    
    func cancelByDismissing() {
        parentVC?.cancelByDismissingWindow()
    }
    
    
    func changeToProjectOptionsForm() {
        parentVC?.presentProjectOptionsForm(withPreviousVM: model)
    }
    
    
    // MARK: - ACTIONS
    
    
    @IBAction func userDidClickCancel(_ sender: Any) {
        model.userDidCancel()
    }
    
    
    @IBAction func userDidClickNext(_ sender: Any) {
        model.userWillingNext()
    }
    
    // MARK: - INSTANCE METHODS
    
    private func configureCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 90, height: 90)
        flowLayout.sectionInset = EdgeInsets(top: 9.0, left: 9.0, bottom: 9.0, right: 9.0)
        flowLayout.minimumInteritemSpacing = 15.0
        flowLayout.minimumLineSpacing = 15.0
        projectTypesCollectionView.collectionViewLayout = flowLayout
        
        view.wantsLayer = true
        
        projectTypesCollectionView.layer?.backgroundColor = NSColor.white.cgColor
    }
    
}

extension ProjectTypeSelectionViewController : NSCollectionViewDataSource {
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.itemsCount
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = projectTypesCollectionView.makeItem(withIdentifier: "ProjectTypeCollectionViewItem", for: indexPath)
        guard let collectionViewItem = item as? ProjectTypeCollectionViewItem else { return item }
        
        let collectionItemViewModel = model.projectTypesModels[indexPath.item]
        collectionViewItem.vm = collectionItemViewModel
        
        return collectionViewItem
    }
    
}

extension ProjectTypeSelectionViewController : NSCollectionViewDelegate {
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        if indexPaths.count > 1 {
            print("Only 1 project type should be selected")
        } else {
            if let indexPath = indexPaths.first {
                let collectionItemViewModel = model.projectTypesModels[indexPath.item]
                model.selectedProjectTypeModel = collectionItemViewModel
            }
        }
    }
    
}
