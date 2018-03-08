public let OOREDOO = "Ooredoo"
public let TELENOR = "Telenor"
public let MPT = "MPT"
public let UNKNOWN = "Unknown"

public  let GSM_TYPE = "GSM"
public let WCDMA_TYPE = "WCDMA"
public let CDMA_450_TYPE = "CDMA 450 MHz"
public let CDMA_800_TYPE = "CDMA 800 MHz"

open class PhoneValidator {
    
    open class func isValidMMPhoneNumber(phoneNumber: String) -> Bool {
        let number = sanitizeNumber(phoneNumber: phoneNumber)
        let MMPhoneRegex = "^(09|\\+?950?9|\\+?95950?9)\\d{7,9}$"
        return validate(number, MMPhoneRegex)
    }
    
    open class func sanitizeNumber(phoneNumber: String) -> String {
        var number = phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)
        number = number.replacingOccurrences(of: " ", with: "")
        number = number.replacingOccurrences(of: "-", with: "")
        
        let countryCodeRegex = "^\\+?950?9\\d+$"
        if validate(number, countryCodeRegex) {
            let doubleCountryCodeRegex = "^\\+?95950?9\\d{7,9}$"
            if validate(number, doubleCountryCodeRegex) {
                number = number.stringByReplacingFirstOccurrenceOfString(target: "9595", withString: "95")
            }
            
            let zeroBeforeAreaCodeRegex = "^\\+?9509\\d{7,9}$"
            if validate(number, zeroBeforeAreaCodeRegex) {
                number = number.stringByReplacingFirstOccurrenceOfString(target: "9509", withString: "959")
            }
        }
        return number
    }
    
    class func validate(_ input: String, _ regex: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
            return regex.firstMatch(in: input, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input.count)) != nil
        } catch {
            return false
        }
    }
    
    open class func getTelecomName(phoneNumber: String) -> String {
        let ooredoo_regex = "^(09|\\+?959)9(7|6)\\d{7}$"
        let telenor_regex = "^(09|\\+?959)7(9|8|7)\\d{7}$"
        let mpt_regex = "^(09|\\+?959)(5\\d{6}|4\\d{7,8}|2\\d{6,8}|3\\d{7,8}|6\\d{6}|8\\d{6}|7\\d{7}|9(0|1|9)\\d{5,6})$"
        var telecomName = UNKNOWN
        var number = phoneNumber
        if isValidMMPhoneNumber(phoneNumber: phoneNumber) {
            number = sanitizeNumber(phoneNumber: phoneNumber)
            if validate(number, ooredoo_regex) {
                telecomName = OOREDOO
            } else if validate(number, telenor_regex) {
                telecomName = TELENOR
            } else if validate(number, mpt_regex) {
                telecomName = MPT
            }
        }
        return telecomName
    }
    
    open class func getNetworkType(phoneNumber: String) -> String {
        let ooredoo_regex = "^(09|\\+?959)9(7|6)\\d{7}$"
        let telenor_regex = "^(09|\\+?959)7(9|8|7)\\d{7}$"
        let mpt_regex = "^(09|\\+?959)(5\\d{6}|4\\d{7,8}|2\\d{6,8}|3\\d{7,8}|6\\d{6}|8\\d{6}|7\\d{7}|9(0|1|9)\\d{5,6})$"
        var networkType = UNKNOWN
        var number = phoneNumber
        if isValidMMPhoneNumber(phoneNumber: phoneNumber) {
            number = sanitizeNumber(phoneNumber: phoneNumber)
            if validate(number, ooredoo_regex) || validate(number, telenor_regex) {
                networkType = GSM_TYPE
            } else if validate(number, mpt_regex) {
                let wcdma_regex = "^(09|\\+?959)(55\\d{5}|25[2-4]\\d{6}|26\\d{7}|4(4|5|6)\\d{7})$"
                let cdma_450_regex = "^(09|\\+?959)(8\\d{6}|6\\d{6}|49\\d{6})$"
                let cdma_800_regex = "^(09|\\+?959)(3\\d{7}|73\\d{6}|91\\d{6})$"
                
                if validate(number, wcdma_regex) {
                    networkType = WCDMA_TYPE
                } else if validate(number, cdma_450_regex) {
                    networkType = CDMA_450_TYPE
                } else if validate(number, cdma_800_regex) {
                    networkType = CDMA_800_TYPE
                } else {
                    networkType = GSM_TYPE
                }
            }
        }
        return networkType
    }
}
extension String {
    func stringByReplacingFirstOccurrenceOfString(
        target: String, withString replaceString: String) -> String {
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }
}
