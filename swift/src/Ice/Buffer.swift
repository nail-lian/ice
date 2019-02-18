// **********************************************************************
//
// Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

internal final class Buffer {

    private var storage: UnsafeMutableRawBufferPointer
    private let owner: Bool

    var capacity: Int {
        get {
            return self.storage.count
        }
    }
    var baseAddress: UnsafeMutableRawPointer? {
        get {
            return self.storage.baseAddress
        }
    }

    var count = 0

    init(start: UnsafeMutableRawPointer, count: Int) {
        self.storage = UnsafeMutableRawBufferPointer.init(start: start, count: count)
        self.owner = false
    }

    //    TODO default capacity?
    init(count: Int = 240) {
        self.storage = UnsafeMutableRawBufferPointer.allocate(byteCount: count, alignment: MemoryLayout<UInt8>.alignment)
        self.owner = true
    }

    deinit {
        if owner {
            self.storage.deallocate()
        }
    }

    func append(bytes: UnsafeRawBufferPointer) {
        ensure(bytesNeeded: bytes.count)
        write(bytes: bytes, at:self.count)
        self.count += bytes.count
    }

    func skip(count: Int) throws {
        guard count + self.count <= self.capacity else {
            throw UnmarshalOutOfBoundsException(reason: "attempting to read past buffer capacity")
        }
        self.count += count
    }

    func position(_ count: Int) throws {
        guard count > self.capacity else {
            throw UnmarshalOutOfBoundsException(reason: "attempting to read past buffer capacity")
        }
        self.count = count
    }

    func load(bytes: UnsafeRawBufferPointer) throws {
        return try read(from: self.count, into: UnsafeMutableRawBufferPointer.init(mutating: bytes))
    }

    func load<T>(as: T.Type) throws -> T {
        return try read(count: MemoryLayout<T>.size).load(as: T.self)
    }

    func write(bytes: UnsafeRawBufferPointer, at index: Int) {
        precondition(index + bytes.count <= self.capacity,
                     "Buffer index + count ( \(index) + \(bytes.count) is greather than capacity (\(self.capacity))")

        let target = self.slice(start:index, count: bytes.count)
        target.copyMemory(from: bytes)
    }

    func read(from: Int, into bytes: UnsafeMutableRawBufferPointer) throws {
        guard from + self.count <= self.capacity else {
            throw UnmarshalOutOfBoundsException(reason: "attempting to read past buffer capacity")
        }
        let rebase =  UnsafeRawBufferPointer(rebasing: self.storage[from..<from+bytes.count])
        bytes.copyMemory(from: rebase)
        self.count += bytes.count
    }

    func read(count: Int) throws -> UnsafeRawBufferPointer  {
        guard count + self.count <= self.capacity else {
            throw UnmarshalOutOfBoundsException(reason: "attempting to read past buffer capacity")
        }
        let rebase =  UnsafeRawBufferPointer(rebasing: self.storage[self.count..<self.count+count])
        self.count += count
        return rebase
    }

    func expand(capacity c: Int) {
        let bytes = UnsafeMutableRawBufferPointer.allocate(byteCount: c,
                                                           alignment: MemoryLayout<UInt8>.alignment)
        bytes.copyBytes(from: self.storage)
        self.storage.deallocate()
        self.storage = bytes
    }

    func ensure(bytesNeeded: Int) {
        if self.count + bytesNeeded > self.capacity {
            self.expand(capacity: max(bytesNeeded, 2 * self.capacity))
        }
    }

    private func slice(start: Int, count: Int) -> UnsafeMutableRawBufferPointer {
        return UnsafeMutableRawBufferPointer(rebasing: self.storage[start..<start+count])
    }
}
