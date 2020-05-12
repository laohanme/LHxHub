//
//  LHString.swift
//  
//
//  Created by laohanme on 12/05/2020.
//

import Foundation
import CommonCrypto

public extension String {
    
    var isValidEmail: Bool {
        matches("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
    
    var md5: String? {
        guard let data = self.data(using: String.Encoding.utf8) else { return nil }
        
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash: [UInt8] = [UInt8](repeating: 0, count: length)
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }

        return (0..<length).map { String(format: "%02x", hash[$0]) }.joined()
    }
    
    func inserting(separator: String, every n: Int) -> String {
        var result: String = ""
        let characters = Array(self)
        stride(from: 0, to: count, by: n).forEach {
            result += String(characters[$0..<min($0+n, count)])
            if $0 + n < count {
                result += separator
            }
        }
        return result
    }
    
    private func matches(_ expression: String) -> Bool {
        if let range = range(of: expression, options: .regularExpression, range: nil, locale: nil) {
            return range.lowerBound == startIndex && range.upperBound == endIndex
        } else {
            return false
        }
    }
}
