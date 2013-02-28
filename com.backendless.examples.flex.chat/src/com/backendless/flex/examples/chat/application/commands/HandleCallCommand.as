/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/28/13
 * Time: 7:57 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.logging.Logger;
import com.backendless.flex.examples.chat.application.messages.HandleCallMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.ChatCall;
import com.backendless.flex.examples.chat.domain.ChatMember;
import com.backendless.media.MediaControl;

import mx.rpc.Responder;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class HandleCallCommand
{
    public function HandleCallCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public var callback:Function;

    public function execute(msg:HandleCallMessage):void
    {
        if (msg.message.member.isCurrent)
            return;

        if (chat.hasCallFrom(msg.message.member))
            return;

        chat.addMessage(msg.message);

        Backendless.MediaService.playLive("com.backendless.examples.flex", msg.message.member.subscriptionId,
            new Responder(
                function(event:ResultEvent):void
                {
                    var call:ChatCall = new ChatCall();
                    call.member = msg.message.member;
                    call.control = event.result as MediaControl;

                    chat.addCall(call);

                    callback(call);
                },
                function(event:FaultEvent):void
                {
                    Logger.error(event.toString());

                    callback(event);
                }
            )
        );
    }
}
}
