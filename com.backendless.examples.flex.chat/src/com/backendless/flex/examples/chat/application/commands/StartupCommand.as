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
import com.backendless.flex.examples.chat.application.Model;
import com.backendless.flex.examples.chat.application.enum.Destination;
import com.backendless.flex.examples.chat.application.messages.NavigateToMessage;
import com.backendless.flex.examples.chat.application.messages.StartupMessage;
import com.backendless.messaging.ISubscriptionResponder;

public class StartupCommand
{
    public function StartupCommand()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var responder:ISubscriptionResponder;

    public function execute(msg:StartupMessage):void
    {
        Backendless.initApp(AppSettings.appId, AppSettings.devKey, AppSettings.version);

        Backendless.MessagingService.subscribe("com.backendless.examples.flex.chat", responder);

        dispatcher(new NavigateToMessage(Destination.CHAT));
    }
}
}
