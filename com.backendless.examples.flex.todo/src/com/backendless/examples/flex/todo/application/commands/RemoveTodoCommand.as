/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 17:23
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.application.commands
{
import com.backendless.examples.flex.todo.application.messages.RemoveTodoMessage;
import com.backendless.examples.flex.todo.domain.Todos;

public class RemoveTodoCommand
{
    public function RemoveTodoCommand()
    {
    }

    [Inject]
    public var model:Todos;

    public function execute(msg:RemoveTodoMessage):void
    {
        model.removeTodo(msg.todo);
    }
}
}
