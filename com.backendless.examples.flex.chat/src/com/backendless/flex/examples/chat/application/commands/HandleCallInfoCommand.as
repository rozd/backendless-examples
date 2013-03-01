/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 3/1/13
 * Time: 10:41 AM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.logging.Logger;
import com.backendless.flex.examples.chat.application.messages.HandleCallInfoMessage;
import com.backendless.flex.examples.chat.application.messages.SystemMessageMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.ChatCall;
import com.backendless.flex.examples.chat.domain.messages.CallInfoMessage;
import com.backendless.flex.examples.chat.domain.messages.SystemMessage;
import com.backendless.media.MediaControl;

import mx.rpc.Responder;

import mx.rpc.events.FaultEvent;

import mx.rpc.events.ResultEvent;

import mx.utils.StringUtil;

public class HandleCallInfoCommand
{
    public function HandleCallInfoCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public var callback:Function;

    public function execute(msg:HandleCallInfoMessage):void
    {
        const message:CallInfoMessage = msg.message;

        if (message.member.isCurrent)
            return;

        if (chat.hasCallFrom(message.member))
            return;

        dispatcher(new SystemMessageMessage(StringUtil.substitute("Received call from {0}", message.member.name)));

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
