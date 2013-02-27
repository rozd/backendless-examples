/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 2:16 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.Backendless;
import com.backendless.flex.examples.chat.application.messages.SayHelloMessage;
import com.backendless.flex.examples.chat.application.messages.SendMessageMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.enum.MessageHeader;
import com.backendless.flex.examples.chat.domain.enum.MessageType;
import com.backendless.flex.examples.chat.domain.messages.HelloMessage;
import com.backendless.messaging.PublishOptions;

import mx.rpc.Responder;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class SayHelloCommand
{
    public function SayHelloCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public function execute(msg:SayHelloMessage):void
    {
        const options:PublishOptions = new PublishOptions();
        options.publisherId = chat.currentMember.subscriptionId;

        const message:HelloMessage = new HelloMessage();
        message.member = chat.currentMember;

        Backendless.MessagingService.publish(message, options);
    }
}
}
