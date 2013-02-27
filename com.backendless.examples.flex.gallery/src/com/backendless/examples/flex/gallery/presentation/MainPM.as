/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:47 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.presentation
{
import com.backendless.examples.flex.gallery.application.messages.StartupMessage;

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
