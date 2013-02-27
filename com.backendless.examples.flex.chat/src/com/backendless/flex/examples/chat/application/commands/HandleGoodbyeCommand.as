/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 2:08 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.flex.examples.chat.application.messages.HandleGoodbyeMessage;
import com.backendless.flex.examples.chat.application.messages.HandleMessageMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.Member;
import com.backendless.flex.examples.chat.domain.enum.MessageHeader;
import com.backendless.flex.examples.chat.domain.enum.MessageType;
import com.backendless.messaging.Message;

public class HandleGoodbyeCommand
{
    public function HandleGoodbyeCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public function execute(msg:HandleGoodbyeMessage):void
    {
        chat.removeMember(msg.message.member.subscriptionId);
    }
}
}
