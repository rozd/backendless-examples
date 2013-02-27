/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 7:40 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.presentation
{
import com.backendless.flex.examples.chat.application.messages.LeaveChatMessage;
import com.backendless.flex.examples.chat.application.messages.SendMessageMessage;

import flash.events.EventDispatcher;

import mx.collections.IList;

public class ChatPM extends EventDispatcher implements IChatPM
{
    public function ChatPM()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Bindable]
    [Subscribe(objectId="messages")]
    public var messages:IList;

    [Bindable]
    public var message:String;

    public function send():void
    {
        if (!this.message)
            return;

        dispatcher(new SendMessageMessage(this.message));
    }

    public function leave():void
    {
        dispatcher(new LeaveChatMessage());
    }
}
}
