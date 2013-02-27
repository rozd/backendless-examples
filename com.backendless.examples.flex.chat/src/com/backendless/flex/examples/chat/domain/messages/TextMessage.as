/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 7:59 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.domain.messages
{
[RemoteClass(alias="com.backendless.flex.examples.chat.domain.messages.TextMessage")]
public class TextMessage extends Message
{
    public static const TYPE:String = "TextMessage";

    public function TextMessage()
    {
        super(TYPE);
    }

    [Bindable]
    public var text:String;

    override public function copy(that:Object):void
    {
        super.copy(that);

        this.text = that.text;
    }
}
}
