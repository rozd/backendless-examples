/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 3/1/13
 * Time: 10:41 AM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.messages
{
import com.backendless.flex.examples.chat.domain.messages.CallInfoMessage;

public class HandleCallInfoMessage
{
    public function HandleCallInfoMessage(message:CallInfoMessage)
    {
        super();

        this.message = message;
    }

    public var message:CallInfoMessage;
}
}
