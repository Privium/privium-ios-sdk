//
//  Logger.swift
//  PriviumSDK
//
//  Created by Ryan Napolitano on 8/22/24.
//

// Sources/Core/Logger.swift
import Foundation

public class Logger {
    public static func log(_ message: String) {
        #if DEBUG
        print("[PriviumSDK] \(message)")
        #endif
    }
}

