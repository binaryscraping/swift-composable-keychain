import Foundation

public struct KeychainClient {
  public var getString: (_ key: String) throws -> String?
  public var getData: (_ key: String) throws -> Data?
  public var setString: (_ value: String, _ key: String) throws -> Void
  public var setData: (_ value: Data, _ key: String) throws -> Void
  public var remove: (_ key: String) throws -> Void
  public var removeAll: () throws -> Void
  public var contains: (_ key: String) throws -> Bool

  public init(
    getString: @escaping (_ key: String) throws -> String?,
    getData: @escaping (_ key: String) throws -> Data?,
    setString: @escaping (_ value: String, _ key: String) throws -> Void,
    setData: @escaping (_ value: Data, _ key: String) throws -> Void,
    remove: @escaping (_ key: String) throws -> Void,
    removeAll: @escaping () throws -> Void,
    contains: @escaping (_ key: String) throws -> Bool
  ) {
    self.getString = getString
    self.getData = getData
    self.setString = setString
    self.setData = setData
    self.remove = remove
    self.removeAll = removeAll
    self.contains = contains
  }
}
