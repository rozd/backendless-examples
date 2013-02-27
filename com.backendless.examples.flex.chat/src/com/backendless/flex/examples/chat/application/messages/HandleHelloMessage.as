/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 2:09 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.messages
{
import com.backendless.flex.examples.chat.domain.messages.HelloMessage;

public class HandleHelloMessage
{
    public function HandleHelloMessage(msg:HelloMessage)
    {
        super();

        this.message = msg;
    }

    public var message:HelloMessage;
}
}
