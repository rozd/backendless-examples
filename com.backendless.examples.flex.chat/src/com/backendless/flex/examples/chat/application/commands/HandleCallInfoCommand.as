/*
 * Copyright (C) 2013 max.rozdobudko@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

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
import com.backendless.errors.MediaError;
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

        var call:ChatCall = new ChatCall();
        call.member = msg.message.member;

        chat.addCall(call);

        dispatcher(new SystemMessageMessage(StringUtil.substitute("Received call from {0}", message.member.name)));

        Backendless.MediaService.playLive("default", msg.message.member.subscriptionId,
            new Responder(
                function(control:MediaControl):void
                {
                    call.control = control;
                    control.start();

                    callback(call);
                },
                function(error:MediaError):void
                {
                    Logger.error(error.getStackTrace());

                    callback(error);
                }
            )
        );
    }
}
}
