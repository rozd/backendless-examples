/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 8:03 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.domain.messages
{
public class GoodbyeMessage extends Message
{
    public static const TYPE:String = "GoodbyeMessage";

    public function GoodbyeMessage()
    {
        super(TYPE);
    }
}
}
