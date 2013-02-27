/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 3:17 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.Backendless;
import com.backendless.flex.examples.chat.application.messages.ReplyHelloMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.enum.MessageHeader;
import com.backendless.flex.examples.chat.domain.enum.MessageType;
import com.backendless.flex.examples.chat.domain.messages.HelloMessage;
import com.backendless.messaging.PublishOptions;

public class ReplyHelloCommand
{
    public function ReplyHelloCommand()
    {
        super ();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public function execute(msg:ReplyHelloMessage):void
    {
        const publish:PublishOptions = new PublishOptions();
        publish.addHeader(MessageHeader.MESSAGE_TYPE, MessageType.HELLO);
        publish.addHeader(MessageHeader.IS_REPLY, true);
        publish.publisherId = chat.currentMember.subscriptionId;

        const message:HelloMessage = new HelloMessage();
        message.member = chat.currentMember;
        message.isReply = true;

        Backendless.MessagingService.publish(message);
    }
}
}
