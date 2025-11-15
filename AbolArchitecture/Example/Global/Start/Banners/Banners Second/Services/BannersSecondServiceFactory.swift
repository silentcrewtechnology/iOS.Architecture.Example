// 
//  BannersSecondServiceFactory.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 02.03.2025.
//

import UIKit
import DesignSystem

protocol BannersSecondServiceFactoryProtocol {
    // Пример для реализации метода фабрики
    func setupButtonViewService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol
    // func setupSomeService() -> SomeServiceProtocol
}

final class BannersSecondServiceFactory: BannersSecondServiceFactoryProtocol {
    // Здесь создаем и конфигурируем как сервисы для View, так и сервисы для логики
    
    // Пример для реализации метода фабрики
    // MARK: Button
    func setupButtonViewService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol {
        let buttonService = ButtonViewService(
            viewProperties: .init(attributedText: "Переход на третий экран".attributed),
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
    
    // MARK: someSrevice
    // func setupSomeService() -> SomeServiceProtocol {
    //     let someService = SomeService()
    //     someService.update(with: nil)
    //     return someService
    // }
}
