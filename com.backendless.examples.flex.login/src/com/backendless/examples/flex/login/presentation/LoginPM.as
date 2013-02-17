/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 12:41
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.presentation
{
import com.backendless.examples.flex.login.application.enum.Destination;
import com.backendless.examples.flex.login.application.messages.LoginMessage;
import com.backendless.examples.flex.login.application.messages.LogoutMessage;
import com.backendless.examples.flex.login.application.messages.NavigateToMessage;
import com.backendless.examples.flex.login.application.messages.RegisterMessage;
import com.backendless.examples.flex.login.domain.vo.Login;
import com.backendless.examples.flex.login.domain.vo.Register;

import mx.rpc.Fault;

public class LoginPM implements ILoginPM
    {
        public function LoginPM()
        {
            super();

            reset();
        }

        //---------------------------------------------------------------------
        //
        //  Variables
        //
        //---------------------------------------------------------------------

        [MessageDispatcher]
        public var dispatcher:Function;

        //---------------------------------------------------------------------
        //
        //  Properties
        //
        //---------------------------------------------------------------------

        //--------------------------------
        //  Properties: ILoginPM
        //--------------------------------

        [Bindable]
        public var userLogin:Login;

        [Bindable]
        public var userRegister:Register;

        [Bindable]
        public var loginErrorString:String;

        [Bindable]
        public var registerErrorString:String;

        [Bindable]
        [CommandStatus(type="com.backendless.examples.flex.login.application.messages.LoginMessage")]
        public var isSigningIn:Boolean;

        [Bindable]
        [CommandStatus(type="com.backendless.examples.flex.login.application.messages.RegisterMessage")]
        public var isRegistering:Boolean;

        //---------------------------------------------------------------------
        //
        //  Methods
        //
        //---------------------------------------------------------------------

        public function reset():void
        {
            this.userLogin = new Login();

            this.userRegister = new Register();
        }

        public function verify():Boolean
        {
            return true;
        }

        public function login():void
        {
            dispatcher(new LoginMessage(userLogin));
        }

        public function logout():void
        {
            dispatcher(new LogoutMessage());
        }

        public function register():void
        {
            if (verify())
            {
                dispatcher(new RegisterMessage(userRegister));
            }

        }

        public function ok():void
        {
            reset();

            dispatcher(new NavigateToMessage(Destination.LOGIN));
        }

        [CommandError(type="com.backendless.examples.flex.login.application.messages.LoginMessage")]
        public function loginError(fault:Fault, trigger:LoginMessage):void
        {
            this.loginErrorString = fault.faultString;
        }

        [CommandError(type="com.backendless.examples.flex.login.application.messages.RegisterMessage")]
        public function registerError(fault:Fault, trigger:RegisterMessage):void
        {
            this.registerErrorString = fault.faultString;
        }
    }
}
