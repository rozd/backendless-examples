/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 3:05 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.flex.examples.chat.application.messages.SystemMessageMessage;
import com.backendless.flex.examples.chat.domain.Chat;

public class SystemMessageCommand
{
    public function SystemMessageCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var chat:Chat;

    public function execute(msg:SystemMessageMessage):void
    {

    }
}
}
