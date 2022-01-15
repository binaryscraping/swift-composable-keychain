import Foundation

public struct KeychainClient {
  public var getString: (_ key: Key) throws -> String?
  public var getData: (_ key: Key) throws -> Data?
  public var setString: (_ value: String, _ key: Key) throws -> Void
  public var setData: (_ value: Data, _ key: Key) throws -> Void
  public var remove: (_ key: Key) throws -> Void
  public var removeAll: () throws -> Void
  public var contains: (_ key: Key) throws -> Bool

  public init(
    getString: @escaping (_ key: Key) throws -> String?,
    getData: @escaping (_ key: Key) throws -> Data?,
    setString: @escaping (_ value: String, _ key: Key) throws -> Void,
    setData: @escaping (_ value: Data, _ key: Key) throws -> Void,
    remove: @escaping (_ key: Key) throws -> Void,
    removeAll: @escaping () throws -> Void,
    contains: @escaping (_ key: Key) throws -> Bool
  ) {
    self.getString = getString
    self.getData = getData
    self.setString = setString
    self.setData = setData
    self.remove = remove
    self.removeAll = removeAll
    self.contains = contains
  }

  /// Type safe key used for looking up the Keychain.
  ///
  /// Example:
  /// ```swift
  /// extension KeychainClient.Key {
  ///   static let currentSession = Key("current_session")
  /// }
  ///
  /// let keychain = KeychainClient.live(...)
  /// let data = try keychain.getData(.currentSession)
  /// ```
  public struct Key: RawRepresentable {
    public var rawValue: String

    public init(rawValue: String) {
      self.rawValue = rawValue
    }

    public init(_ rawValue: String) {
      self.init(rawValue: rawValue)
    }
  }
}
