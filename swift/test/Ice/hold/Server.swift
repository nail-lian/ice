//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

import Ice
import TestCommon
import Dispatch

public class TestFactoryI: TestFactory {
    public class func create() -> TestHelper {
        return Server()
    }
}

class Server: TestHelperI {
    public override func run(args: [String]) throws {

        let (communicator, _) = try self.initialize(args: args)
        defer {
            communicator.destroy()
        }

        communicator.getProperties().setProperty(key: "TestAdapter1.Endpoints", value: getTestEndpoint(num: 0))
        communicator.getProperties().setProperty(key: "TestAdapter1.ThreadPool.Size", value: "5")
        communicator.getProperties().setProperty(key: "TestAdapter1.ThreadPool.SizeMax", value: "5")
        communicator.getProperties().setProperty(key: "TestAdapter1.ThreadPool.SizeWarn", value: "0")
        communicator.getProperties().setProperty(key: "TestAdapter1.ThreadPool.Serialize", value: "0")
        let adapter1 = try communicator.createObjectAdapter(name: "TestAdapter1",
                                                            queue: DispatchQueue(label: "ice.hold.server.TestAdapter1",
                                                                                 attributes: .concurrent))
        _ = try adapter1.add(servant: HoldI(adapter: adapter1, helper: self), id: Ice.stringToIdentity("hold"))

        communicator.getProperties().setProperty(key: "TestAdapter2.Endpoints", value: getTestEndpoint(num: 1))
        communicator.getProperties().setProperty(key: "TestAdapter2.ThreadPool.Size", value: "5")
        communicator.getProperties().setProperty(key: "TestAdapter2.ThreadPool.SizeMax", value: "5")
        communicator.getProperties().setProperty(key: "TestAdapter2.ThreadPool.SizeWarn", value: "0")
        communicator.getProperties().setProperty(key: "TestAdapter2.ThreadPool.Serialize", value: "1")
        let adapter2 = try communicator.createObjectAdapter(name: "TestAdapter2",
                                                            queue: DispatchQueue(label: "ice.hold.server.TestAdapter2",
                                                                                attributes: .concurrent))
        _ = try adapter2.add(servant: HoldI(adapter: adapter2, helper: self), id: Ice.stringToIdentity("hold"))

        try adapter1.activate()
        try adapter2.activate()
        serverReady()
        communicator.waitForShutdown()
    }
}