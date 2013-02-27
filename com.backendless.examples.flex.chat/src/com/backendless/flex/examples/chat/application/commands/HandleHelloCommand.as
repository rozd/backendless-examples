/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 2:48 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.examples.flex.components.Message;
import com.backendless.flex.examples.chat.application.messages.HandleHelloMessage;
import com.backendless.flex.examples.chat.application.messages.ReplyHelloMessage;
import com.backendless.flex.examples.chat.application.messages.SayHelloMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.Member;
import com.backendless.flex.examples.chat.domain.enum.MessageHeader;
import com.backendless.flex.examples.chat.domain.messages.HelloMessage;

public class HandleHelloCommand
{
    public function HandleHelloCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public function execute(msg:HandleHelloMessage):void
    {
        const message:HelloMessage = msg.message as HelloMessage;

        chat.addMember(message.member);

        if (!message.isReply)
            dispatcher(new ReplyHelloMessage());
    }
}
}
