/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 3/1/13
 * Time: 10:12 AM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.flex.examples.chat.application.messages.SayCallInfoMessage;
import com.backendless.flex.examples.chat.application.messages.SendMessageMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.messages.CallInfoMessage;

public class SayCallInfoCommand
{
    public function SayCallInfoCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public function execute(msg:SayCallInfoMessage):void
    {
        const message:CallInfoMessage = new CallInfoMessage();
        message.call = chat.currentCall;

        dispatcher(new SendMessageMessage(message));
    }
}
}
