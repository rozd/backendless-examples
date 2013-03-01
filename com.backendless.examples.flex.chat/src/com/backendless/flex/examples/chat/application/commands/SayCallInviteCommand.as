/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/28/13
 * Time: 7:45 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.Backendless;
import com.backendless.flex.examples.chat.application.messages.SayCallInfoMessage;
import com.backendless.flex.examples.chat.application.messages.SayCallInviteMessage;
import com.backendless.flex.examples.chat.application.messages.SendMessageMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.messages.CallInviteMessage;
import com.backendless.messaging.PublishOptions;

public class SayCallInviteCommand
{
    public function SayCallInviteCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public function execute(msg:SayCallInviteMessage):void
    {
        const message:CallInviteMessage = new CallInviteMessage();

        dispatcher(new SendMessageMessage(message));

        dispatcher(new SayCallInfoMessage());
    }
}
}
