##Contribution Guidelines##

###Adding new views to the Workspace Canvas###
1. Add a new group into the group `Workspace` and add the corresponding folders in the project file system to match groups hierarchy. Make sure the group's name has an proper and clear name which describes the intention of the new view in a brief way. From now on that new view name will be called `ModuleName`
2. Add storyboard matching just created group's name `ModuleName.storyboard` (extension is added automatically according to your macOS preferences).
3. Go to `KUI.swift` and under the enumeration `Storyboard` add a new case named `ModuleName`.
4. 
3. Add Cocoa class subclassing NSViewController/UIViewController and naming it after the recently created storyboard ending with VC `ModuleNameVC`.
4. Change class name suffix VC to ViewController `ModuleNameViewController`.
5. Create new Swift file with name `ModuleNameVM.swift`. Once on it create a new protocol named `ModuleNameViewModelProtocol` inheriting from `ViewControllerModelProtocol` and then a class named `ModuleNameViewModel` implementing the recently created protocol.
6. Implement symbols in class to conform protocol requirements.
7. Above the start of the view controller class definition created before, create a new protocol named `ModuleNameViewControllerProtocol` inheriting from `ViewControllerProtocol`.
8. Implement just created protocol into the just created class: `class ModuleNameViewController : NSViewController, ModuleNameViewControllerProtocol {`.
9. Implement symbols in class to conform protocol requirements, making sure to initialize required property `vm` as a new fresh created instance of your view model `ModuleNameViewModel` created before.
10. In the `viewDidLoad`, just after the super call type `vm.vc = self` and then `vm.ready()`.
11. Create a new class-member method named create() as in:
```
public static func create() -> ModuleNameViewController {
    let storyboard = NSStoryboard(name: KUI.Storyboard.ModuleName.rawValue, bundle: nil)
        
    let viewController = storyboard.instantiateController(
        withIdentifier: KUI.ViewController.ProjectConfig.rawValue)
            as! ProjectConfigViewController
        
    if viewController.vm is ProjectConfigViewModelProtocol {
        (viewController.vm as! ProjectConfigViewModelProtocol).delegate = delegate
    }
        
    return viewController
}
```

###Getting access to the FXML content from a new Workspace canvas view###
1. Create a new protocol in `ModuleNameVM.swift` in the very beginning named `ModuleNameDelegate` inheriting from `FXMLPermissioned`.
2. Declare a new property into the VM protocol as `var delegate: ModuleNameDelegate? { get set }` and implement it in the actual class just by copying/pasting and removing `{ get set }`.
3. Go to `WorkspaceCanvasVM.swift` and at the bottom at a new extension of the class implementing the recently created protocol