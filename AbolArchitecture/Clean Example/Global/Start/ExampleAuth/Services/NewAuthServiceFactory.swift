// 
//  NewAuthServiceFactory.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 28.02.2025.
//

import UIKit
import DesignSystem

protocol NewAuthServiceFactoryProtocol {
    // Пример для реализации метода фабрики
    func setupLogoImageService() -> ImageViewServiceProtocol
    func setupLoginInputService(onTextChange: ((String?) -> Void)?) -> InputViewService
    func setupButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol
    func scanCardButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol
    // func setupSomeService() -> SomeServiceProtocol
}

final class NewAuthServiceFactory: NewAuthServiceFactoryProtocol {
    
    // Здесь создаем и конфигурируем как сервисы для View, так и сервисы для логики
    
    // Пример для реализации метода фабрики
    // MARK: someUISrevice
    
    // MARK: Logo
    func setupLogoImageService() -> ImageViewServiceProtocol {
        let logo = UIImage(named: "Ak Bars Logotype") ?? UIImage()
        let logoImageService = ImageViewService(
            style: .init(
                type: .custom(logo, CGSizeMake(123, 24)),
                color: .primary
            )
        )
        logoImageService.update(with: nil)
        return logoImageService
    }
    
    // MARK: Login
    func setupLoginInputService(onTextChange: ((String?) -> Void)?) -> InputViewService {
        let loginInputService = InputViewService(
            viewProperties: .init(
                textFieldViewProperties: .init(
                    text: .init(string: ""),
                    placeholder: .init(string: "Введите номер карты")
                ),
                stackViewInsets: .init(inset: 0),
                onTextChanged: onTextChange
            ),
            style: .init(
                state: .`default`,
                set: .simple,
                label: .on)
        )
        loginInputService.labelService.update(newText: .init(string: "Номер карты"))
        loginInputService.update(with: nil)
        
        return loginInputService
    }
    
    // MARK: Button
    func setupButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol {
        let buttonService = ButtonViewService(
            viewProperties: .init(
                attributedText: "Войти".attributed
            ),
            style: .init(
                size: .large,
                color: .accent,
                variant: .primary,
                state: .default,
                icon: .without
            )
        )
        buttonService.update(with: ButtonViewService.ButtonUpdateParameters(
            newOnTap: onTap
        ))
        return buttonService
    }
    
    func scanCardButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol {
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.green
        ]
        let attributedString = NSMutableAttributedString(string: "Отсканировать карту ",
                                                         attributes: textAttributes)
        
        let originalImage = UIImage(named: "ic 24 Camera")
            let templateImage = originalImage?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: templateImage)
            imageView.tintColor = .green
        
        
        let buttonService = ButtonViewService(
            viewProperties: .init(
                attributedText: attributedString
            ),
            style: .init(
                size: .large,
                color: .accent,
                variant: .secondary,
                state: .default,
                icon: .with(UIImage(named: "ic 24 Camera") ?? UIImage())
            )
        )
        buttonService.update(with: ButtonViewService.ButtonUpdateParameters(
            newOnTap: onTap
        ))
        return buttonService
    }
    
    // MARK: someSrevice
    // func setupSomeService() -> SomeServiceProtocol {
    //     let someService = SomeService()
    //     someService.update(with: nil)
    //     return someService
    // }
}
