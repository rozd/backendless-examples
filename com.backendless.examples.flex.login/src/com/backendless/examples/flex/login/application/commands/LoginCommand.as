package com.backendless.examples.flex.login.application.commands
{
import com.backendless.Backendless;
import com.backendless.BackendlessUser;
import com.backendless.examples.flex.login.application.enum.Destination;
import com.backendless.examples.flex.login.application.messages.LoginMessage;
import com.backendless.examples.flex.login.application.messages.NavigateToMessage;
import com.backendless.examples.flex.login.domain.Model;
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
        return Backendless.UserService.login(msg.login.email, msg.login.password);

//			return ServiceStub.result(Backendless.UserService.currentUser);
//			return ServiceStub.fault(new Fault("0000", "Bla bla bla"));
    }

    public function result(user:Object):void
    {
        model.setUser(Backendless.UserService.currentUser);

        dispatcher(new NavigateToMessage(Destination.LOGGEDIN));
    }

    public function error(fault:Fault):void
    {
        // handled at presentation level
    }
}
}