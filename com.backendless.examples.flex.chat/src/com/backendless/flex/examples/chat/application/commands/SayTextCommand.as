/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/28/13
 * Time: 7:49 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.flex.examples.chat.application.helpers.MessageHelper;
import com.backendless.flex.examples.chat.application.messages.SayTextMessage;
import com.backendless.flex.examples.chat.application.messages.SendMessageMessage;
import com.backendless.flex.examples.chat.domain.messages.TextMessage;

public class SayTextCommand
{
    public function SayTextCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public function execute(msg:SayTextMessage):void
    {
        const message:TextMessage = new TextMessage();
        message.text = msg.text;

        dispatcher(new SendMessageMessage(message));
    }
}
}
