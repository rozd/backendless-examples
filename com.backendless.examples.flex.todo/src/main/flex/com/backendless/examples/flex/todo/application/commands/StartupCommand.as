/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/18/13
 * Time: 5:35 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.application.commands {
import com.backendless.Backendless;
import com.backendless.examples.flex.AppSettings;
import com.backendless.examples.flex.todo.application.messages.GetTodoListMessage;
import com.backendless.examples.flex.todo.application.messages.StartupMessage;

public class StartupCommand
{
    public function StartupCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public function execute(msg:StartupMessage):void
    {
        Backendless.initApp(AppSettings.APP_ID, AppSettings.DEV_KEY, AppSettings.VERSION);

        dispatcher(new GetTodoListMessage());
    }
}
}
