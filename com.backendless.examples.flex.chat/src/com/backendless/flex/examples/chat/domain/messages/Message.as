/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 8:00 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.domain.messages
{
import com.backendless.flex.examples.chat.domain.Member;

import flash.events.EventDispatcher;

[Bindable]
[RemoteClass(alias="com.backendless.flex.examples.chat.domain.messages.Message")]
public class Message extends EventDispatcher
{
    public function Message(type:String)
    {
        super();

        this.type = type;
    }

    public var member:Member;

    public var type:String;

    public function copy(that:Object):void
    {
        this.type = that.type;

        this.member = new Member();
        this.member.copy(that.member);
    }


}
}
