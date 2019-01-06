import Foundation
import Vapor

extension FCM {
    public convenience init() throws {
        if let fcmEmail = Environment.get("fcmEmail"),
            let fcmKeyPath = Environment.get("fcmKeyPath"),
            let fcmProjectId = Environment.get("fcmProjectId") {
            try self.init(email: fcmEmail, projectId: fcmProjectId, pathToKey: fcmKeyPath)
        } else if let fcmServiceAccountKeyPath = Environment.get("fcmServiceAccountKeyPath") {
            try self.init(pathToServiceAccountKey: fcmServiceAccountKeyPath)
        } else {
            throw InitializationError.variablesNotSet
        }
    }
}
