/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 2:55 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.flex.examples.chat.application.messages.HandleTextMessage;
import com.backendless.flex.examples.chat.domain.Chat;

public class HandleTextCommand
{
    public function HandleTextCommand()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public function execute(msg:HandleTextMessage):void
    {
        chat.addTextMessage(msg.message);
    }
}
}
