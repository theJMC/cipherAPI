import Vapor
import Foundation

struct Ceasar: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let ceasar = routes.grouped("ceasar")
        ceasar.get(use: encode)
        ceasar.get(use: decode)
    }
    
    func encode(req: Request) throws -> String {
        // Cesar Cipher Encodes the given text using the shift
        
        // Var Init
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz").map{String($0)}
        let target : String = (req.parameters.get("target")?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))!
        let array = Array(target).map{String($0)}
        let shift = Int(req.parameters.get("shift")!)
        
        var final = [String]()
        for chara in array {
            let shiftedChar = alphabet.firstIndex(of: chara)! + shift!
            let finalShift = shiftedChar % alphabet.count
            final.append(String(alphabet[finalShift]))
        }
        return final.joined()
    }
    
    func decode(req: Request) throws -> String {
        // Cesar Cipher Decodes the given text using the shift
        
        // Var Init
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz").map{String($0)}
        let target : String = (req.parameters.get("target")?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))!
        let array = Array(target).map{String($0)}
        let shift = Int(req.parameters.get("shift")!)
        
        var final = [String]()
        for chara in array {
            let shiftedChar = alphabet.firstIndex(of: chara)! - shift!
            let finalShift = shiftedChar % alphabet.count
            final.append(String(alphabet[finalShift]))
        }
        return final.joined()
    }
}
