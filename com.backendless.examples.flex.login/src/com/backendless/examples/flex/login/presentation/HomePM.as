/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 13:36
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.presentation
{
import com.backendless.examples.flex.login.presentation.*;
import com.backendless.examples.flex.login.application.enum.Destination;
import com.backendless.examples.flex.login.application.messages.StartupMessage;

import flash.events.Event;

import flash.events.EventDispatcher;

public class HomePM extends EventDispatcher implements IHomePM
{
    public function HomePM()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Bindable]
    public var selectedIndex:int;

    [Subscribe(objectId="destination")]
    public function set destination(dest:String):void
    {
        switch (dest)
        {
            case Destination.LOGIN      : selectedIndex = 0; break;
            case Destination.CHECKMAIL  : selectedIndex = 1; break;
            case Destination.LOGGEDIN   : selectedIndex = 2; break;
            default : selectedIndex = -1;
        }
    }

    public function startup():void
    {
        dispatcher(new StartupMessage());
    }
}
}
