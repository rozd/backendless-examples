/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 13:12
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.application.commands
{
    import com.backendless.Backendless;
import com.backendless.examples.flex.logging.Logger;
import com.backendless.examples.flex.login.application.enum.Destination;
import com.backendless.examples.flex.login.application.messages.LogoutMessage;
import com.backendless.examples.flex.login.application.messages.NavigateToMessage;

    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    public class LogoutCommand
    {
        public function LogoutCommand()
        {
        }

        [MessageDispatcher]
        public var dispatcher:Function

        public function execute(msg:LogoutMessage):AsyncToken
        {
            return Backendless.UserService.logout();
        }

        public function result(user:Object):void
        {
            Logger.get.info("Logout success");

            dispatcher(new NavigateToMessage(Destination.LOGIN));
        }

        public function error(fault:Fault):void
        {
            // handled at presentation level

            Logger.get.error(fault.faultString);
        }

    }
}
