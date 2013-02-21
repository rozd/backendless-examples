/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 13:36
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.presentation
{
import com.backendless.examples.flex.login.application.messages.StartupMessage;

import flash.events.EventDispatcher;

public class MainPM extends EventDispatcher implements IMainPM
{
    public function MainPM()
    {
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
