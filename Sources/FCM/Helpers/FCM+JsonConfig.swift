import Foundation
import Vapor

extension FCM {
	
    private struct ServiceAccountKey: Codable {
        var project_id: String
        var private_key: String
        var client_email: String
    }
    
    public convenience init(pathToServiceAccountKey path: String) throws {
        let fm = FileManager.default
        guard let data = fm.contents(atPath: path) else {
            throw InitializationError.pemNotFound(path: path)
        }
        guard let configuration = try? JSONDecoder().decode(ServiceAccountKey.self, from: data) else {
            throw InitializationError.pemBadJSON(path: path)
        }
        try self.init(email: configuration.client_email, projectId: configuration.project_id, key: configuration.private_key)
    }
}
