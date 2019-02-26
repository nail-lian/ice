// **********************************************************************
//
// Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************
//
// Ice version 3.7.2
//
// <auto-generated>
//
// Generated from file `Test.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

import Foundation

public enum MyEnum: UInt8
{
    case enum1 = 0
    case enum2 = 1
    case enum3 = 2
}

extension MyEnum: Ice.Streamable
{
    
    public init()
    {
        self = .enum1
    }
    
    public init(from ins: Ice.InputStream) throws
    {
        var rawValue = UInt8()
        try ins.read(enum: &rawValue, maxValue: 2)
        guard let val = MyEnum(rawValue: rawValue) else
        {
            throw MarshalException(reason: "invalid enum value")
        }
        self = val
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(enum: self.rawValue, maxValue: 2)
    }
}

public struct SmallStruct
{
    public var bo: Bool
    public var by: UInt8
    public var sh: Int16
    public var i: Int32
    public var l: Int64
    public var f: Float
    public var d: Double
    public var str: String
    public var e: Test.MyEnum
    public var p: Test.MyInterfacePrx?
    public init(bo: Bool, by: UInt8, sh: Int16, i: Int32, l: Int64, f: Float, d: Double, str: String, e: Test.MyEnum, p: Test.MyInterfacePrx?)
    {
        self.bo = bo
        self.by = by
        self.sh = sh
        self.i = i
        self.l = l
        self.f = f
        self.d = d
        self.str = str
        self.e = e
        self.p = p
    }
}

extension SmallStruct: Ice.Streamable
{
    
    public init()
    {
        self.bo = Bool()
        self.by = UInt8()
        self.sh = Int16()
        self.i = Int32()
        self.l = Int64()
        self.f = Float()
        self.d = Double()
        self.str = String()
        self.e = Test.MyEnum()
        self.p = Test.MyInterfacePrx?()
    }
    
    public init(from ins: Ice.InputStream) throws
    {
        self.bo = try Bool(from: ins)
        try self.by = UInt8(from: ins)
        try self.sh = Int16(from: ins)
        try self.i = Int32(from: ins)
        try self.l = Int64(from: ins)
        try self.f = Float(from: ins)
        try self.d = Double(from: ins)
        try self.str = String(from: ins)
        try self.e = Test.MyEnum(from: ins)
        try self.p = Test.MyInterfacePrx?(from: ins)
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(self.bo, self.by, self.sh, self.i, self.l, self.f, self.d, self.str, self.e, self.p)
    }
}

public struct ClassStruct: Hashable
{
    public var i: Int32
    public init(i: Int32)
    {
        self.i = i
    }
}

extension ClassStruct: Ice.Streamable
{
    
    public init()
    {
        self.i = Int32()
    }
    
    public init(from ins: Ice.InputStream) throws
    {
        try self.i = Int32(from: ins)
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(self.i)
    }
}

public protocol OptionalClassDisp: class
{
}

public class OptionalClass
{
    public var bo: Bool
    public var by: UInt8
    public var sh: Int16
    public var i: Int32
    public init(bo: Bool, by: UInt8, sh: Int16, i: Int32)
    {
        self.bo = bo
        self.by = by
        self.sh = sh
        self.i = i
    }
}

public protocol OptionalClassPrx: Ice.ObjectPrx
{
}

public typealias MyEnumS = [Test.MyEnum]
public typealias SmallStructS = [Test.SmallStruct]
public typealias MyClassS = [Test.MyClass?]
public typealias BoolSS = [Ice.BoolSeq]
public typealias ByteSS = [Ice.ByteSeq]
public typealias ShortSS = [Ice.ShortSeq]
public typealias IntSS = [Ice.IntSeq]
public typealias LongSS = [Ice.LongSeq]
public typealias FloatSS = [Ice.FloatSeq]
public typealias DoubleSS = [Ice.DoubleSeq]
public typealias StringSS = [Ice.StringSeq]
public typealias MyEnumSS = [Test.MyEnumS]
public typealias SmallStructSS = [Test.SmallStructS]
public typealias MyClassSS = [Test.MyClassS]
public typealias ByteBoolD = [UInt8:Bool]
public typealias ShortIntD = [Int16:Int32]
public typealias LongFloatD = [Int64:Float]
public typealias StringStringD = [String:String]
public typealias StringMyClassD = [String:Test.MyClass?]
public protocol MyClassDisp: class
{
}

public class MyClass
{
    public var c: Test.MyClass?
    public var o: Ice.Object?
    public var s: Test.SmallStruct
    public var seq1: Ice.BoolSeq
    public var seq2: Ice.ByteSeq
    public var seq3: Ice.ShortSeq
    public var seq4: Ice.IntSeq
    public var seq5: Ice.LongSeq
    public var seq6: Ice.FloatSeq
    public var seq7: Ice.DoubleSeq
    public var seq8: Ice.StringSeq
    public var seq9: Test.MyEnumS
    public var seq10: Test.MyClassS
    public var d: Test.StringMyClassD
    public init(c: Test.MyClass?, o: Ice.Object?, s: Test.SmallStruct, seq1: Ice.BoolSeq, seq2: Ice.ByteSeq, seq3: Ice.ShortSeq, seq4: Ice.IntSeq, seq5: Ice.LongSeq, seq6: Ice.FloatSeq, seq7: Ice.DoubleSeq, seq8: Ice.StringSeq, seq9: Test.MyEnumS, seq10: Test.MyClassS, d: Test.StringMyClassD)
    {
        self.c = c
        self.o = o
        self.s = s
        self.seq1 = seq1
        self.seq2 = seq2
        self.seq3 = seq3
        self.seq4 = seq4
        self.seq5 = seq5
        self.seq6 = seq6
        self.seq7 = seq7
        self.seq8 = seq8
        self.seq9 = seq9
        self.seq10 = seq10
        self.d = d
    }
}

public protocol MyClassPrx: Ice.ObjectPrx
{
}

public protocol MyInterface: class
{
}

public protocol MyInterfacePrx: Ice.ObjectPrx
{
}

public extension MyInterfacePrx
{
}
public class _MyInterfacePrxI: _ObjectPrxI, MyInterfacePrx
{
    override public class func ice_staticId() -> String
    {
        return "::Test::MyInterface"
    }
}

public func checkedCast(prx: ObjectPrx, type: MyInterfacePrx.Protocol, facet: String? = nil, context: Context? = nil) throws -> MyInterfacePrx?
{
    return try _MyInterfacePrxI.checkedCast(prx: prx, facet: facet, context: context) as _MyInterfacePrxI?
}

public func uncheckedCast(prx: ObjectPrx, type: MyInterfacePrx.Protocol, facet: String? = nil, context: Context? = nil) -> MyInterfacePrx?
{
    return _MyInterfacePrxI.uncheckedCast(prx: prx, facet: facet, context: context) as _MyInterfacePrxI?
}

public extension Ice.InputStream
{
    func read(proxy: MyInterfacePrx.Protocol) throws -> MyInterfacePrx?
    {
        return try _MyInterfacePrxI.ice_read(from: self)
    }
    func read(proxyArray: MyInterfacePrx.Protocol) throws -> [MyInterfacePrx?]
    {
        #warning("add generated proxy arrays")
        preconditionFailure("TODO")
    }
    
}

public func ice_staticId(_: MyInterfacePrx.Protocol) -> String
{
    return _MyInterfacePrxI.ice_staticId()
}

public class MyException: Ice.UserException
{
    public var c: Test.MyClass?
    
    public init(c: Test.MyClass?)
    {
        self.c = c
    }
    
    required public init(from ins: Ice.InputStream) throws
    {
        try self.c = Test.MyClass?(from: ins)
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(self.c)
    }
    public class func ice_staticId() -> String
    {
        return "::Test::MyException"
    }
    
}

public enum NestedEnum: UInt8
{
    case nestedEnum1 = 0
    case nestedEnum2 = 1
    case nestedEnum3 = 2
}

extension NestedEnum: Ice.Streamable
{
    
    public init()
    {
        self = .nestedEnum1
    }
    
    public init(from ins: Ice.InputStream) throws
    {
        var rawValue = UInt8()
        try ins.read(enum: &rawValue, maxValue: 2)
        guard let val = NestedEnum(rawValue: rawValue) else
        {
            throw MarshalException(reason: "invalid enum value")
        }
        self = val
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(enum: self.rawValue, maxValue: 2)
    }
}

public struct NestedStruct
{
    public var bo: Bool
    public var by: UInt8
    public var sh: Int16
    public var i: Int32
    public var l: Int64
    public var f: Float
    public var d: Double
    public var str: String
    public var e: Test.Sub.NestedEnum
    public init(bo: Bool, by: UInt8, sh: Int16, i: Int32, l: Int64, f: Float, d: Double, str: String, e: Test.Sub.NestedEnum)
    {
        self.bo = bo
        self.by = by
        self.sh = sh
        self.i = i
        self.l = l
        self.f = f
        self.d = d
        self.str = str
        self.e = e
    }
}

extension NestedStruct: Ice.Streamable
{
    
    public init()
    {
        self.bo = Bool()
        self.by = UInt8()
        self.sh = Int16()
        self.i = Int32()
        self.l = Int64()
        self.f = Float()
        self.d = Double()
        self.str = String()
        self.e = Test.Sub.NestedEnum()
    }
    
    public init(from ins: Ice.InputStream) throws
    {
        try self.bo = Bool(from: ins)
        try self.by = UInt8(from: ins)
        try self.sh = Int16(from: ins)
        try self.i = Int32(from: ins)
        try self.l = Int64(from: ins)
        try self.f = Float(from: ins)
        try self.d = Double(from: ins)
        try self.str = String(from: ins)
        try self.e = Test.Sub.NestedEnum(from: ins)
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(self.bo, self.by, self.sh, self.i, self.l, self.f, self.d, self.str, self.e)
    }
}

public struct NestedClassStruct: Hashable
{
    public var i: Int32
    public init(i: Int32)
    {
        self.i = i
    }
}

extension NestedClassStruct: Ice.Streamable
{
    
    public init()
    {
        self.i = Int32()
    }
    
    public init(from ins: Ice.InputStream) throws
    {
        try self.i = Int32(from: ins)
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(self.i)
    }
}

public class NestedException: Ice.UserException
{
    public var str: String
    
    public init(str: String)
    {
        self.str = str
    }
    
    required public init(from ins: Ice.InputStream) throws
    {
        try self.str = String(from: ins)
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(self.str)
    }
    public class func ice_staticId() -> String
    {
        return "::Test::Sub::NestedException"
    }
    
}

public enum NestedEnum2: UInt8
{
    case nestedEnum4 = 0
    case nestedEnum5 = 1
    case nestedEnum6 = 2
}

extension NestedEnum2: Ice.Streamable
{
    
    public init()
    {
        self = .nestedEnum4
    }
    
    public init(from ins: Ice.InputStream) throws
    {
        var rawValue = UInt8()
        try ins.read(enum: &rawValue, maxValue: 2)
        guard let val = NestedEnum2(rawValue: rawValue) else
        {
            throw MarshalException(reason: "invalid enum value")
        }
        self = val
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(enum: self.rawValue, maxValue: 2)
    }
}

public struct NestedStruct2
{
    public var bo: Bool
    public var by: UInt8
    public var sh: Int16
    public var i: Int32
    public var l: Int64
    public var f: Float
    public var d: Double
    public var str: String
    public var e: Test2.Sub2.NestedEnum2
    public init(bo: Bool, by: UInt8, sh: Int16, i: Int32, l: Int64, f: Float, d: Double, str: String, e: Test2.Sub2.NestedEnum2)
    {
        self.bo = bo
        self.by = by
        self.sh = sh
        self.i = i
        self.l = l
        self.f = f
        self.d = d
        self.str = str
        self.e = e
    }
}

extension NestedStruct2: Ice.Streamable
{
    
    public init()
    {
        self.bo = Bool()
        self.by = UInt8()
        self.sh = Int16()
        self.i = Int32()
        self.l = Int64()
        self.f = Float()
        self.d = Double()
        self.str = String()
        self.e = Test2.Sub2.NestedEnum2()
    }
    
    public init(from ins: Ice.InputStream) throws
    {
        try self.bo = Bool(from: ins)
        try self.by = UInt8(from: ins)
        try self.sh = Int16(from: ins)
        try self.i = Int32(from: ins)
        try self.l = Int64(from: ins)
        try self.f = Float(from: ins)
        try self.d = Double(from: ins)
        try self.str = String(from: ins)
        try self.e = Test2.Sub2.NestedEnum2(from: ins)
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(self.bo, self.by, self.sh, self.i, self.l, self.f, self.d, self.str, self.e)
    }
}

public struct NestedClassStruct2: Hashable
{
    public var i: Int32
    public init(i: Int32)
    {
        self.i = i
    }
}

extension NestedClassStruct2: Ice.Streamable
{
    
    public init()
    {
        self.i = Int32()
    }
    
    public init(from ins: Ice.InputStream) throws
    {
        try self.i = Int32(from: ins)
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(self.i)
    }
}

public class NestedException2: Ice.UserException
{
    public var str: String
    
    public init(str: String)
    {
        self.str = str
    }
    
    required public init(from ins: Ice.InputStream) throws
    {
        try self.str = String(from: ins)
    }
    
    public func ice_write(to os: Ice.OutputStream)
    {
        os.write(self.str)
    }
    public class func ice_staticId() -> String
    {
        return "::Test2::Sub2::NestedException2"
    }
    
}
