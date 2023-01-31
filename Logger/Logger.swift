//
//  Logger.swift
//  Logger
//
//  Created by Oktay Tanrıkulu on 31.01.2023.
//

import Foundation

enum Logger {
    
    struct Scope {
        let file: String
        let function: String
        let line: Int
        
        var path: String {
            "\((file as NSString).lastPathComponent):\(line) ► \(function)"
        }
    }
    
    enum LogLevel {
        case info, warning, error
        
        fileprivate var prefix: String {
            switch self {
            case .info:
                return "ℹ️ INFO"
            case .warning:
                return "⚠️ WARNING"
            case .error:
                return "❌ ERROR"
            }
        }
    }
    
    fileprivate static func handleLog(level: LogLevel,
                                      message: String,
                                      showScope: Bool,
                                      scope: Scope) {
        let components = ["[\(level.prefix)] ►", message]
        
        var logString = components.joined(separator: " ")
        
        if showScope {
            logString += " 👉 \(scope.path)"
        }
        
        #if DEBUG
        print(logString)
        #endif
    }
    
    static func info(_ log: StaticString,
                     showScope: Bool = true,
                     file: String = #file,
                     function: String = #function,
                     line: Int = #line) {
        
        let scope = Scope(file: file, function: function, line: line)
        
        Logger.handleLog(level: .info,
                         message: log.description,
                         showScope: showScope,
                         scope: scope)
    }
    
    static func warning(_ log: StaticString,
                        showScope: Bool = true,
                        file: String = #file,
                        function: String = #function,
                        line: Int = #line) {
        
        let scope = Scope(file: file, function: function, line: line)
        
        Logger.handleLog(level: .warning,
                         message: log.description,
                         showScope: showScope,
                         scope: scope)
    }
    
    static func error(_ log: StaticString,
                      showScope: Bool = true,
                      file: String = #file,
                      function: String = #function,
                      line: Int = #line) {
        
        let scope = Scope(file: file, function: function, line: line)
        
        Logger.handleLog(level: .error,
                         message: log.description,
                         showScope: showScope,
                         scope: scope)
    }
}
