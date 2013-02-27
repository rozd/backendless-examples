/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 2:12 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.Backendless;
import com.backendless.flex.examples.chat.application.messages.LeaveChatMessage;
import com.backendless.flex.examples.chat.application.messages.SayGoodbyeMessage;

public class LeaveChatCommand
{
    public function LeaveChatCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public function execute(msg:LeaveChatMessage):void
    {
        Backendless.MessagingService.unsubscribe();

        dispatcher(new SayGoodbyeMessage());
    }
}
}
