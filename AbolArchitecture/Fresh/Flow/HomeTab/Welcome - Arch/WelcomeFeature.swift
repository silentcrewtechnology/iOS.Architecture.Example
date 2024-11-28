// 
//  WelcomeFeature.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 26.11.2024.
//

import Foundation
import Architecture
import DesignSystem

final class WelcomeFeature: FeatureProtocol {
    
    private var labelService: LabelViewService?
    
    deinit {
        print("💀 удалился WelcomeFeature")
    }
    
    private let builder: WelcomeVCBuilder
    
    init(
        builder: WelcomeVCBuilder = .init(with: WelcomeVC.ViewProperties())
    ) {
        self.builder = builder
        setupUIServices()
    }
    
    private func setupUIServices() {
        labelService = .init(
            viewProperties: .init(text: "".attributed),
            style: .init(variant: .default(customColor: .Semantic.LightTheme.Content.Base.primary))
        )
        labelService?.update()
    }
    
    // MARK: Переходы с экрана
    
    var runNewFlow: ((Any) -> Void)?
    
    func runFlow(data: Any?) -> (any BuilderProtocol)? {
        initialFeature()
        
        if let text = data as? String {
            labelService?.update(with: .init(newText: text.attributed))
        }
        return builder
    }
    
    private func initialFeature() {
        guard let labelService else { return }
        builder.viewUpdater.handle(.initial(.init(labelView: labelService.view)))
    }
}
