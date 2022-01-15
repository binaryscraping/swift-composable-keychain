extension KeychainClient {
  public static let noop = KeychainClient(
    getString: { _ in nil },
    getData: { _ in nil },
    setString: { _, _ in },
    setData: { _, _ in },
    remove: { _ in },
    removeAll: {},
    contains: { _ in false }
  )
}

#if DEBUG
  import XCTestDynamicOverlay

  extension KeychainClient {
    public static let failing = KeychainClient(
      getString: { key in
        XCTFail("\(Self.self).getString(\(key)) is unimplemented")
        return nil
      },
      getData: { key in
        XCTFail("\(Self.self).getData(\(key)) is unimplemented")
        return nil
      },
      setString: { _, key in
        XCTFail("\(Self.self).setString(_,\(key)) is unimplemented")
      },
      setData: { _, key in
        XCTFail("\(Self.self).setData(_,\(key)) is unimplemented")
      },
      remove: { key in
        XCTFail("\(Self.self).remove(\(key)) is unimplemented")
      },
      removeAll: {
        XCTFail("\(Self.self).removeAll() is unimplemented")
      },
      contains: { key in
        XCTFail("\(Self.self).contains(\(key)) is unimplemented")
        return false
      }
    )
  }
#endif
