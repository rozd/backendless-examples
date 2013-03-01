/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/28/13
 * Time: 7:57 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.messages
{
import com.backendless.flex.examples.chat.domain.messages.CallInviteMessage;

public class HandleCallInviteMessage
{
    public function HandleCallInviteMessage(message:CallInviteMessage)
    {
        super();

        this.message = message;
    }

    public var message:CallInviteMessage;
}
}
