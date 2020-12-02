import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: Ceasar())
    
    let ceasar = Ceasar()
    
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> EventLoopFuture<View> in
        return req.view.render("test")
    }
    
    app.get("greeter", ":name") { req -> EventLoopFuture<View> in
        let name = req.parameters.get("name")!
        return req.view.render("hello", ["name": name, "title": "Hello World!"])
    }
    
    app.get("ceasar", "encode", ":target", ":shift", use: ceasar.encode)
    app.get("ceasar", "decode", ":target", ":shift", use: ceasar.decode)

    
    
}

