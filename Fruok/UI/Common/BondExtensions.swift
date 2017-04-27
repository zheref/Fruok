//
//  BondExtensions.swift
//  Fruok
//
//  Created by Sergio Daniel Lozano on 4/25/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

#if os(macOS)
    
    import AppKit
    import ReactiveKit
    import Bond
    
    public extension ReactiveExtensions where Base: NSDatePicker {
        
        public var font: Bond<NSFont?> {
            return bond { $0.font = $1 }
        }
        
        public var editingDate: DynamicSubject<Date> {
            return dynamicSubject(
                signal: self.valueDidChange.eraseType(),
                
                get: { (datePicker: NSDatePicker) -> Date in
                    return datePicker.dateValue
                },
                
                set: { (datePicker: NSDatePicker, value: Date) in
                    datePicker.dateValue = value
                }
            )
        }
        
        public var valueDidChange: SafeSignal<NSDatePicker> {
            return NotificationCenter.default
                .reactive.notification(name: .NSControlTextDidChange, object: base)
                .map { $0.object as? NSDatePicker }
                .ignoreNil()
        }
        
        /// Interrogates the passed notification for details of how the field ended editing, and if it resigned its first responder status as a result.
        ///
        /// - Parameter notification: Notification of type `NSControlTextDidEndEditing`
        /// - Returns: true if the text field resigned first responder, false if it did not
        private static func resignedFirstResponder(in notification: Notification) -> Bool {
            guard
                notification.name == .NSControlTextDidEndEditing,
                let textField = notification.object as? NSTextField,
                let textMovement = notification.userInfo?["NSTextMovement"] as? Int
                else {
                    return false
            }
            
            let returnKeyPressed = (textMovement == NSReturnTextMovement)
            let tabKeyPressed = (textMovement == NSTabTextMovement || textMovement == NSBacktabTextMovement)
            let tabbedIntoTextField = tabKeyPressed && textField.nextKeyView == textField
            let tabbedOutOfTextField = tabKeyPressed && textField.nextKeyView == nil
            
            return (returnKeyPressed || tabbedIntoTextField || tabbedOutOfTextField)
        }
    }
    
    extension NSDatePicker: BindableProtocol {
        
        public func bind(signal: Signal<String, NoError>) -> Disposable {
            return reactive.stringValue.bind(signal: signal)
        }
    }
    
#endif
