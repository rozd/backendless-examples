/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 2:09 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.messages
{
import com.backendless.messaging.Message;

public class HandleMessageMessage
{
    public function HandleMessageMessage(msg:Message)
    {
        super();

        this.message = msg;
    }

    public var message:Message;
}
}
