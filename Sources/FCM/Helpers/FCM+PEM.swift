import Foundation
import Vapor

extension FCM {
    public convenience init(email: String, projectId: String, pathToKey path: String) throws {
        let fm = FileManager.default
        guard let data = fm.contents(atPath: path) else {
            throw InitializationError.pemNotFound(path: path)
        }
        guard let key = String(data: data, encoding: .utf8) else {
            throw InitializationError.pemBadJSON(path: path)
        }
        try self.init(email: email, projectId: projectId, key: key)
    }
}
