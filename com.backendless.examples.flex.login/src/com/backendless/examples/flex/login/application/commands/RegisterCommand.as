package com.backendless.examples.flex.login.application.commands
{
import com.backendless.Backendless;
import com.backendless.BackendlessUser;
import com.backendless.examples.flex.logging.Logger;
import com.backendless.examples.flex.login.application.enum.Destination;
import com.backendless.examples.flex.login.application.messages.NavigateToMessage;
import com.backendless.examples.flex.login.application.messages.RegisterMessage;
import com.backendless.examples.flex.login.domain.Model;

import mx.rpc.AsyncToken;
import mx.rpc.Fault;

public class RegisterCommand
{
    public function RegisterCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var model:Model;

    public function execute(msg:RegisterMessage):AsyncToken
    {
        const user:BackendlessUser = new BackendlessUser();
        user.password = msg.register.password;
        user.setProperty("email", msg.register.email);
        user.setProperty("name", msg.register.name);

	    return Backendless.UserService.register(user);
    }


    public function result(data:Object):void
    {
        Logger.get.error("Register success");

        model.setUser(Backendless.UserService.currentUser);

        dispatcher(new NavigateToMessage(Destination.CHECKMAIL));
    }

    public function error(fault:Fault):void
    {
        // handled at presentation layer

        Logger.get.error(fault.toString());
    }
}
}