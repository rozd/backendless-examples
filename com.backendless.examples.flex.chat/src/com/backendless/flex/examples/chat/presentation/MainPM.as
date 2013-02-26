/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/26/13
 * Time: 6:54 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.presentation
{
import com.backendless.flex.examples.chat.application.messages.StartupMessage;

public class MainPM implements IMainPM
{
    public function MainPM()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Bindable]
    [Subscribe(objectId="destination")]
    public var destination:String;

    public function startup():void
    {
        dispatcher(new StartupMessage());
    }
}
}
