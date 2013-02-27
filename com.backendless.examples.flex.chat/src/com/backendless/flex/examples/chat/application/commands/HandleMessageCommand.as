/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 2:08 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.examples.flex.logging.Logger;
import com.backendless.flex.examples.chat.application.messages.HandleGoodbyeMessage;
import com.backendless.flex.examples.chat.application.messages.HandleHelloMessage;
import com.backendless.flex.examples.chat.application.messages.HandleMessageMessage;
import com.backendless.flex.examples.chat.application.messages.HandleTextMessage;
import com.backendless.flex.examples.chat.domain.enum.MessageHeader;
import com.backendless.flex.examples.chat.domain.messages.GoodbyeMessage;
import com.backendless.flex.examples.chat.domain.messages.HelloMessage;
import com.backendless.flex.examples.chat.domain.messages.Message;
import com.backendless.flex.examples.chat.domain.messages.TextMessage;

public class HandleMessageCommand
{
    public function HandleMessageCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public function execute(msg:HandleMessageMessage):void
    {
        var message:Message;

        switch (msg.message.data.type)
        {
            case HelloMessage.TYPE :

                message = new HelloMessage();
                message.copy(msg.message.data);

                dispatcher(new HandleHelloMessage(message as HelloMessage));

                break;

            case GoodbyeMessage.TYPE :

                message = new GoodbyeMessage();
                message.copy(msg.message.data);

                dispatcher(new HandleGoodbyeMessage(message as GoodbyeMessage));

                break;

            case TextMessage.TYPE :

                message = new TextMessage();
                message.copy(msg.message.data);

                dispatcher(new HandleTextMessage(message as TextMessage));
                break;

            default :
                Logger.print("{0} {1}: '{2}'", "[WARNING]", "Unknown message type", msg.message.headers[MessageHeader.MESSAGE_TYPE]);
                break;
        }
    }
}
}
