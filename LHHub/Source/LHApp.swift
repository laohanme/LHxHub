//
//  LHApp.swift
//  LHHub
//
//  Created by laohanme on 05/05/2020.
//  Copyright © 2020 laohanme. All rights reserved.
//

import UIKit

public enum OpenSystemType: String {
    case calendar = "calshow://"
    case photos = "photos-redirect://"
    case maps = "maps://"
    case settings
}

public struct LHApp {
    
    // MARK: Open system apps on device by type
    /// Request to open system app by `openSystemType`
    public static func openSystem(open type: OpenSystemType) {
        switch type {
        case .photos, .calendar, .maps:
            DispatchQueue.main.async {
                guard let url = URL(string: type.rawValue) else { return }
                openURL(url: url)
            }
        case .settings:
            DispatchQueue.main.async {
                guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
                openURL(url: url)
            }
        }
    }
    
    private static func openURL(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url as URL)
            }
        } else {
            isEnableLog ? print("***** LH - Maybe is the device have no installed the apps *****") : nil
        }
    }
}
