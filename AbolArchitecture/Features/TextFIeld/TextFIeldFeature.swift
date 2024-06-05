//
//  TextFIeldFeature.swift
//  AbolArchitecture
//
//  Created by firdavs on 05.06.2024.
//

import Architecture
import Foundation

final class TextFIeldFeature: FeatureCoordinatorProtocol {
    
    private let textFieldVCBuilder: TextFieldVCBuilder
    private let textFieldDelegate: TextFieldDelegate
    
    init() {
        self.textFieldDelegate = TextFieldDelegate()
        let vp = TextFieldVC.ViewProperties(
            delegate: self.textFieldDelegate,
            textFiledText: "--".attributed,
            labelText: "--".attributed
        )
        self.textFieldVCBuilder = TextFieldVCBuilder(
            with: vp
        )
        
        setupTextFieldDelegate()
    }
   
    var runNewFlow: ((Any) -> Void)?
    
    func runFlow(data: Any?) -> (any BuilderProtocol)? {
        textFieldVCBuilder.view.setTabBar(with: .textField)
        return textFieldVCBuilder
    }
    
    private func setupTextFieldDelegate(){
        textFieldDelegate.textFieldEdit = { [weak self] text in
            self?.textFieldVCBuilder.viewUpdater.state = .upateLabel(text.attributed)
        }
    }
}
