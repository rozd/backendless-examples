package com.backendless.examples.flex.login.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.logging.Logger;
import com.backendless.examples.flex.login.application.enum.Destination;
import com.backendless.examples.flex.login.application.messages.LoginMessage;
import com.backendless.examples.flex.login.application.messages.NavigateToMessage;
import com.backendless.examples.flex.login.domain.Model;

import mx.rpc.AsyncToken;
import mx.rpc.Fault;

public class LoginCommand
{
    public function LoginCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var model:Model;

    public function execute(msg:LoginMessage):AsyncToken
    {
        Logger.info("Login");

        return Backendless.UserService.login(msg.login.email, msg.login.password);
    }

    public function result(user:Object):void
    {
        Logger.info("Login success");

        model.setUser(Backendless.UserService.currentUser);

        dispatcher(new NavigateToMessage(Destination.LOGGEDIN));
    }

    public function error(fault:Fault):void
    {
        // handled at presentation level

        Logger.error(fault.toString());
    }
}
}