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
import com.backendless.flex.examples.chat.application.messages.HandleCallInviteMessage;
import com.backendless.flex.examples.chat.application.messages.SayCallInfoMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.ChatCall;
import com.backendless.flex.examples.chat.domain.ChatMember;
import com.backendless.media.MediaControl;

import mx.rpc.Responder;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class HandleCallInviteCommand
{
    public function HandleCallInviteCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public var callback:Function;

    public function execute(msg:HandleCallInviteMessage):void
    {
        if (msg.message.member.isCurrent)
            return;

        dispatcher(new SayCallInfoMessage());
    }
}
}
