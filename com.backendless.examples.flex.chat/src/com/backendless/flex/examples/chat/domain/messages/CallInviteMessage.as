/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/28/13
 * Time: 7:45 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.domain.messages
{
import com.backendless.flex.examples.chat.domain.ChatMessage;

public class CallInviteMessage extends ChatMessage
{
    public static const TYPE:String = "CallInviteMessage";

    public function CallInviteMessage()
    {
        super(TYPE);
    }

    override public function copy(that:Object):void
    {
        super.copy(that);
    }

}
}
