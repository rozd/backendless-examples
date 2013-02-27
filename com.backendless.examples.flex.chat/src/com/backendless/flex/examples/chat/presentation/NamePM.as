/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 4:15 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.presentation
{
import com.backendless.flex.examples.chat.application.messages.JoinChatMessage;

public class NamePM implements INamePM
{
    public function NamePM()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Bindable]
    public var name:String;

    public function join():void
    {
        if (!this.name)
            return;

        dispatcher(new JoinChatMessage(name));
    }
}
}
