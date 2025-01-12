//
//  UIWindow+Extension.swift
//  WordleClone
//
//  Created by Ali Görkem Aksöz on 12.01.2025.
//

import UIKit

extension UIWindow {
    static var key: UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegae = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegae.window else {
            return nil
        }
        return window
    }
}
