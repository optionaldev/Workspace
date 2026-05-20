//
//  debug.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 04.05.2026.
//

import SwiftPrint

func debug(_ message: Any?,
           object: AnyObject? = nil,
           type: SwiftPrint.LogType = .error,
           filePath: String = #file,
           lineOfCode: UInt = #line,
           timestamp: Bool = true,
           persist: Bool = true)
{
    if let output = SwiftPrint.generateOutput(rawMessageOrInstance: message,
                                              objectForPrintingAddress: object,
                                              logType: type,
                                              filePath: filePath,
                                              lineOfCode: lineOfCode,
                                              includeTimestamp: timestamp,
                                              shouldPersist: persist)
    {
        Swift.print(output)
    }
}
