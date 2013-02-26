/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/26/13
 * Time: 5:49 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.messages
{
import com.backendless.messaging.Message;

public class ReceiveMessage
{
    public function ReceiveMessage(msg:Message)
    {
        super();

        this.message = msg;
    }

    public var message:Message;
}
}
