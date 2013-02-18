/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/18/13
 * Time: 5:49 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.presentation
{
import com.backendless.examples.flex.todo.application.messages.StartupMessage;

public class MainPM implements IMainPM
{
    public function MainPM()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public function startup():void
    {
        dispatcher(new StartupMessage());
    }
}
}
