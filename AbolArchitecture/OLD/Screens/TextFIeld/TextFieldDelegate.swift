////
////  TextFieldDelegate.swift
////  AbolArchitecture
////
////  Created by firdavs on 05.06.2024.
////
//
//import UIKit
//import Architecture
//
//final class TextFieldDelegate: NSObject, UITextFieldDelegate {
//    
//    var textFieldEdit: Closure<String>?
//    
//    func textField(
//        _ textField: UITextField,
//        shouldChangeCharactersIn range: NSRange,
//        replacementString string: String
//    ) -> Bool {
//        textFieldEdit?(textField.text!)
//        return true
//    }
//}
