import Vapor
import Foundation

struct Vigenere: RouteCollection {
    func boot(routes: RoutesBuilder) throws {}
 
    func encode(req: Request) throws -> String {
        // Encodes a string with a given key via a Vigenere Cipher
        
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz").map{String($0)}
        
        // Gets the parameters passed
        let target : String = (req.parameters.get("target")?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))!
        let shift: String = (req.parameters.get("key")?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))!
        
        // Initialises the Target string to an array of Single-Character Strings (NOT Chars) & gets length
        let array = Array(target).map{String($0)}
        let arrayLen = array.count
        
        // Initialises the Shift string to an array of Single-Character Strings (NOT Chars) & gets length
        var shiftArr = Array(shift).map{String($0)}
        print(shiftArr)
        var shiftArrLen = shiftArr.count
        
        while arrayLen > shiftArrLen {
            shiftArr = shiftArr + shiftArr
            shiftArrLen = shiftArr.count
        }
        
        var indexShift = [Int]()
        
        for chara in shiftArr {
            let index = alphabet.firstIndex(of: chara)!
            indexShift.append(index)
        }
        print(shiftArr)
        print(indexShift)
        var final = [String]()
        
        for chara in array {
            let indexInArr = array.firstIndex(of: chara)!
            var indexInAlpha = alphabet.firstIndex(of: chara)!
            indexInAlpha += indexShift[indexInArr]
            while indexInAlpha > 25 {
                indexInAlpha = indexInAlpha - 26
            }
            final.append(alphabet[indexInAlpha])
            print(alphabet[indexInAlpha])
        }
        
        print(final.joined())
        return final.joined()
    }
    
    func decode(req: Request) throws -> String {
        // Encodes a string with a given key via a Vigenere Cipher
        
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz").map{String($0)}
        
        // Gets the parameters passed
        let target : String = (req.parameters.get("target")?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))!
        let shift: String = (req.parameters.get("key")?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))!
        
        // Initialises the Target string to an array of Single-Character Strings (NOT Chars) & gets length
        let array = Array(target).map{String($0)}
        let arrayLen = array.count
        
        // Initialises the Shift string to an array of Single-Character Strings (NOT Chars) & gets length
        var shiftArr = Array(shift).map{String($0)}
        print(shiftArr)
        var shiftArrLen = shiftArr.count
        
        while arrayLen > shiftArrLen {
            shiftArr = shiftArr + shiftArr
            shiftArrLen = shiftArr.count
        }
        
        var indexShift = [Int]()
        
        for chara in shiftArr {
            let index = alphabet.firstIndex(of: chara)!
            indexShift.append(index)
        }
        print(shiftArr)
        print(indexShift)
        var final = [String]()
        
        for chara in array {
            let indexInArr = array.firstIndex(of: chara)!
            var indexInAlpha = alphabet.firstIndex(of: chara)!
            indexInAlpha -= indexShift[indexInArr]
            while indexInAlpha > 25 {
                indexInAlpha = indexInAlpha - 26
            }
            final.append(alphabet[indexInAlpha])
            print(alphabet[indexInAlpha])
        }
        
        print(final.joined())
        return final.joined()

    }
}
