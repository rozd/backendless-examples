/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 12:29
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.AppSettings;
import com.backendless.examples.flex.login.application.enum.Destination;
import com.backendless.examples.flex.login.application.messages.NavigateToMessage;
import com.backendless.examples.flex.login.application.messages.StartupMessage;

public class StartupCommand
    {
        public function StartupCommand()
        {
        }

        [MessageDispatcher]
        public var dispatcher:Function;

        public function execute(msg:StartupMessage):void
        {
            Backendless.initApp(AppSettings.appId, AppSettings.devKey, AppSettings.version);

            if (Backendless.UserService.currentUser)
                dispatcher(new NavigateToMessage(Destination.LOGGEDIN));
            else
                dispatcher(new NavigateToMessage(Destination.LOGIN));
        }
    }
}
