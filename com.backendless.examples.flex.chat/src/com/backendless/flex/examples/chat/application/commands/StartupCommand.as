/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/26/13
 * Time: 5:26 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.AppSettings;
import com.backendless.flex.examples.chat.application.enum.Destination;
import com.backendless.flex.examples.chat.application.messages.NavigateToMessage;
import com.backendless.flex.examples.chat.application.messages.StartupMessage;

public class StartupCommand
{
    public function StartupCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public function execute(msg:StartupMessage):void
    {
        Backendless.initApp(AppSettings.appId, AppSettings.devKey, AppSettings.version);

        dispatcher(new NavigateToMessage(Destination.NAME));
    }
}
}
