// 
//  HomeServiceFactory.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 02.03.2025.
//

import UIKit
import DesignSystem

protocol HomeServiceFactoryProtocol {
    // Пример для реализации метода фабрики
    func setupBannersButtonViewService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol
    func setupTitleNameViewService(text: String) -> TitleViewServiceProtocol
    
    // func setupSomeService() -> SomeServiceProtocol
}

final class HomeServiceFactory: HomeServiceFactoryProtocol {
    // Здесь создаем и конфигурируем как сервисы для View, так и сервисы для логики
    
    // MARK: Button
    func setupBannersButtonViewService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol {
        let buttonService = ButtonViewService(
            viewProperties: .init(
                attributedText: "Флоу Баннеров".attributed
            ),
            style: .init(
                size: .large,
                color: .light,
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
    
    // MARK: Title Name
    func setupTitleNameViewService(text: String) -> TitleViewServiceProtocol {
        let titleService = TitleViewService(
            viewProperties: .init(
                title: .init(string: text)
            ),
            style: .init(size: .extraLarge, color: .primary)
        )

        return titleService
    }
    
    // MARK: someSrevice
    // func setupSomeService() -> SomeServiceProtocol {
    //     let someService = SomeService()
    //     someService.update(with: nil)
    //     return someService
    // }
}
