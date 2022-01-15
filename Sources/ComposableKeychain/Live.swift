import KeychainAccess

extension KeychainClient {

  public static func live(keychain: Keychain) -> KeychainClient {
    return KeychainClient(
      getString: { try keychain.get($0) },
      getData: { try keychain.getData($0) },
      setString: { try keychain.set($0, key: $1) },
      setData: { try keychain.set($0, key: $1) },
      remove: { try keychain.remove($0) },
      removeAll: { try keychain.removeAll() },
      contains: { try keychain.contains($0) }
    )
  }
}
