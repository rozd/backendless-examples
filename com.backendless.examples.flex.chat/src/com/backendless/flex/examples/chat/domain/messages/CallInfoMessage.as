/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 3/1/13
 * Time: 10:27 AM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.domain.messages
{
import com.backendless.flex.examples.chat.domain.ChatCall;
import com.backendless.flex.examples.chat.domain.ChatMessage;

public class CallInfoMessage extends ChatMessage
{
    public static const TYPE:String = "CallInfoMessage";

    public function CallInfoMessage()
    {
        super(TYPE);
    }

    public var call:ChatCall;

    public var isReply:Boolean = false;

    override public function copy(that:Object):void
    {
        super.copy(that);

        this.isReply = that.isReply;

        this.call = new ChatCall();
        this.call.copy(that.call);
    }
}
}
