/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 8:01 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.domain.messages
{
import com.backendless.flex.examples.chat.domain.Member;

import flash.events.EventDispatcher;

[Bindable]
[RemoteClass(alias="com.backendless.flex.examples.chat.domain.messages.HelloMessage")]
public class HelloMessage extends Message
{
    public static const TYPE:String = "HelloMessage";

    public function HelloMessage()
    {
        super(TYPE);
    }

    public var isReply:Boolean;

    override public function copy(that:Object):void
    {
        super.copy(that);

        this.member = new Member();
        this.member.copy(that.member);

        this.isReply = that.isReply;
    }
}
}
