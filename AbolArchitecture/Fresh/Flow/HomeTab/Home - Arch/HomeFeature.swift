//
//  HomeFeature.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 14.11.2024.
//

import Foundation
import Architecture
import DesignSystem

// Заменить в Templates
final class HomeFeature: FeatureProtocol {
    
    private var buttonService: ButtonViewServiceProtocol?
    private var inputService: InputViewServiceProtocol?
    private var labelService: LabelViewServiceProtocol?
    private let builder: HomeVCBuilder
    private var inputText: String = ""
    
    deinit {
        print("💀 удалился HomeFeature")
    }
    
    private enum Action {
        case updateLabel(text: String)
        case runNewFlow
        case initializeFeature
    }
    
    init(
        builder: HomeVCBuilder = .init(with: HomeVC.ViewProperties()),
        buttonService: ButtonViewServiceProtocol? = nil,
        inputService: InputViewServiceProtocol? = nil,
        labelService: LabelViewServiceProtocol? = nil
    ) {
        self.builder = builder
        self.buttonService = buttonService
        self.inputService = inputService
        self.labelService = labelService
    }
    
    private func handleAction(_ action: Action) {
        switch action {
        case .updateLabel(let text):
            labelService?.update(with: .init(newText: text.attributed))
        case .runNewFlow:
            runNewFlow?(TabBarFlow.homeWelcome(inputText))
        case .initializeFeature:
            guard let buttonService,
                  let inputService,
                  let labelService else { return }
            builder.viewUpdater.handle(.initial(.init(
                buttonView: buttonService.view,
                inputView: inputService.view,
                labelView: labelService.view
            )))
        }
    }
    
    private func setupUIServices() {
        setupButtonService()
        setupInputService()
        setupLabelService()
    }
    
    var runNewFlow: ((Any) -> Void)?
    
    func runFlow(data: Any?) -> (any BuilderProtocol)? {
        setupUIServices()
        handleAction(.initializeFeature)
        return builder
    }
    
    private func initialFeature() {
        guard let buttonService,
              let inputService,
              let labelService else { return }
        builder.viewUpdater.handle(.initial(.init(
            buttonView: buttonService.view,
            inputView: inputService.view,
            labelView: labelService.view
        )))
    }
}

extension HomeFeature {
    private func setupButtonService() {
        if inputService == nil {
            buttonService = ButtonViewService(
                viewProperties: .init(
                    attributedText: "Вход".attributed
                ),
                style: .init(
                    size: .large,
                    color: .accent,
                    variant: .primary,
                    state: .default,
                    icon: .without
                )
            )
            buttonService?.update(with: nil)
        }
        
        buttonService?.update(with: ButtonViewService.ButtonUpdateParameters(
            newOnTap: { [weak self] in
                guard let self else { return }
                self.handleAction(.runNewFlow)
            }
        ))
    }
    
    private func setupInputService() {
        if inputService == nil {
            inputService = InputViewService(
                viewProperties: .init(
                    textFieldViewProperties: .init(
                        text: .init(string: ""),
                        placeholder: .init(string: "Your name")
                    ),
                    minHeight: 80,
                    stackViewInsets: .init(inset: 0)
                ),
                style: .init(state: .`default`, set: .simple)
            )
            inputService?.update(with: nil)
        }
        
        inputService?.onTextChange = { [weak self] text in
            guard let self = self else { return }
            self.inputText = text
            self.handleAction(.updateLabel(text: text))
        }
    }
    
    private func setupLabelService() {
        guard labelService == nil else { return }
        labelService = LabelViewService(
            viewProperties: .init(text: "Введите имя".attributed),
            style: .init(variant: .default(customColor: .Semantic.LightTheme.Content.Base.primary))
        )
        labelService?.update(with: nil)
    }
}
