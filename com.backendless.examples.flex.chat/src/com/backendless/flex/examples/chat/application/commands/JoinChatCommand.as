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
import com.backendless.examples.flex.logging.Logger;
import com.backendless.flex.examples.chat.application.enum.Destination;
import com.backendless.flex.examples.chat.application.messages.JoinChatMessage;
import com.backendless.flex.examples.chat.application.messages.NavigateToMessage;
import com.backendless.flex.examples.chat.application.messages.SayHelloMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.Member;
import com.backendless.messaging.ISubscriptionResponder;
import com.backendless.messaging.SubscriptionOptions;

import mx.rpc.Responder;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class JoinChatCommand
{
    public function JoinChatCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    [Inject]
    public var subscriber:ISubscriptionResponder;

    public var callback:Function;

    public function execute(msg:JoinChatMessage):void
    {
        if (!chat.currentMember)
            chat.currentMember = new Member();

        chat.currentMember.name = msg.name;

        const options:SubscriptionOptions = new SubscriptionOptions();

        Backendless.MessagingService.subscribe("com.backendless.examples.flex.chat", subscriber, options,
            new Responder(
                function (event:ResultEvent):void
                {
                    chat.currentMember.subscriptionId = event.result as String;

                    dispatcher(new SayHelloMessage());
                    dispatcher(new NavigateToMessage(Destination.CHAT));

                    callback(event.result);
                },
                function (event:FaultEvent):void
                {
                     Logger.error(event.toString());
                }
            )
        );
    }

}
}
