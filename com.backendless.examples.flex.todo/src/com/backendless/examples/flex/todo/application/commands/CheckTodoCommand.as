/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 18.02.13
 * Time: 08:33
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.application.commands
{
import com.backendless.examples.flex.todo.application.messages.CheckTodoMessage;

public class CheckTodoCommand
{
    public function CheckTodoCommand()
    {
    }

    public function execute(msg:CheckTodoMessage):void
    {
        msg.todo.done = !msg.todo.done;
    }
}
}
