import KeychainAccess

extension KeychainClient {
  /// Creates a live implementation of the KeychainClient.
  /// - Parameter keychain: Configured Keychain instance to use.
  /// - Returns: The KeychainClient.
  public static func live(keychain: Keychain) -> KeychainClient {
    return KeychainClient(
      getString: { try keychain.get($0.rawValue) },
      getData: { try keychain.getData($0.rawValue) },
      setString: { try keychain.set($0, key: $1.rawValue) },
      setData: { try keychain.set($0, key: $1.rawValue) },
      remove: { try keychain.remove($0.rawValue) },
      removeAll: { try keychain.removeAll() },
      contains: { try keychain.contains($0.rawValue) }
    )
  }
}
