//
//  Ex+UILabel.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 24/08/23.
//

import UIKit
import CommonCrypto

extension String {
    
    func applyPatternOnNumbers(pattern: String, replacementCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
    
    // mask example: +XXX (XX) XXX-XXXX
    func formatNumber(with mask: String) -> String {
            let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            var result = ""
            var index = numbers.startIndex // numbers iterator

            // iterate over the mask characters until the iterator of numbers ends
            for ch in mask where index < numbers.endIndex {
                if ch == "X" {
                    // mask requires a number in this place, so take the next one
                    result.append(numbers[index])

                    // move numbers iterator to the next index
                    index = numbers.index(after: index)

                } else {
                    result.append(ch) // just append a mask character
                }
            }
            return result
        }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
    
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }
    
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    //MARK: - bonus number formatter
    func sumFormatter() -> String {
        
        var myNum: String = self
        var summ: String = ""
        var firstFragment: String = ""
        var secondFragment: String = ""
        
        if 4 <= myNum.count && myNum.count <= 6 {
            firstFragment = "" + myNum.suffix(3)
            myNum.removeLast(3)
            summ = myNum + " " + firstFragment
            return summ
        } else if 7 <= myNum.count && myNum.count <= 9 {
            firstFragment = "" + myNum.suffix(3)
            myNum.removeLast(3)
            secondFragment = "" + myNum.suffix(3)
            myNum.removeLast(3)
            summ = myNum + " " + secondFragment + " " + firstFragment
            return summ
        } else {
            return self
        }
    }
    
    func trim() -> String {
          return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    ///175.0 -> 175
    func trimLastElement() -> String {
        var str = self
        let last2Item = str.suffix(2)
        if last2Item == ".0" {
            str = "\(self.dropLast(2))"
        } else {
            str = self
        }
          return str
    }
    
    func convertToTimeForm() -> String {
        
        //"yyyy-MM-dd'T'HH:mm:ssZ"
        
        let iso8601DateFormatter = ISO8601DateFormatter()
        iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let date = iso8601DateFormatter.date(from: self) {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            let min = calendar.component(.minute, from: date)
            var value = ""
            
            if hour / 10 == 0 {
                value = "0\(hour):"
            } else {
                value = "\(hour):"
            }
            
            if min / 10 == 0 {
                value += "0\(min)"
            } else {
                value += "\(min)"
            }
            
            return value
        } else {
            return ""
        }
        
    }
    
//    func hmac(algorithm: CryptoAlgorithm, key: String) -> String {
//        let str = self.cString(using: String.Encoding.utf8)
//        let strLen = Int(self.lengthOfBytes(using: String.Encoding.utf8))
//        let digestLen = algorithm.digestLength
//        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
//        let keyStr = key.cString(using: String.Encoding.utf8)
//        let keyLen = Int(key.lengthOfBytes(using: String.Encoding.utf8))
//
//        CCHmac(algorithm.HMACAlgorithm, keyStr!, keyLen, str!, strLen, result)
//
//        let digest = stringFromResult(result: result, length: digestLen)
//
//        result.deallocate()
//
//        print("digest = ",digest)
//
//        return digest
//    }
//
//    private func stringFromResult(result: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String {
//        let hash = NSMutableString()
//        for i in 0..<length {
//            hash.appendFormat("%02x", result[i])
//        }
//        print("String(hash).lowercased() = ",String(hash).lowercased())
//        return String(hash).lowercased()
//    }


    
    
    
}




//
//enum CryptoAlgorithm {
//    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
//
//    var HMACAlgorithm: CCHmacAlgorithm {
//        var result: Int = 0
//        switch self {
//        case .MD5:      result = kCCHmacAlgMD5
//        case .SHA1:     result = kCCHmacAlgSHA1
//        case .SHA224:   result = kCCHmacAlgSHA224
//        case .SHA256:   result = kCCHmacAlgSHA256
//        case .SHA384:   result = kCCHmacAlgSHA384
//        case .SHA512:   result = kCCHmacAlgSHA512
//        }
//        return CCHmacAlgorithm(result)
//    }
//
//    var digestLength: Int {
//        var result: Int32 = 0
//        switch self {
//        case .MD5:      result = CC_MD5_DIGEST_LENGTH
//        case .SHA1:     result = CC_SHA1_DIGEST_LENGTH
//        case .SHA224:   result = CC_SHA224_DIGEST_LENGTH
//        case .SHA256:   result = CC_SHA256_DIGEST_LENGTH
//        case .SHA384:   result = CC_SHA384_DIGEST_LENGTH
//        case .SHA512:   result = CC_SHA512_DIGEST_LENGTH
//        }
//        return Int(result)
//    }
//}
