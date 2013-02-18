/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 17:23
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.application.commands
{
import com.backendless.examples.flex.todo.application.messages.AddTodoMessage;
import com.backendless.examples.flex.todo.domain.Todos;

public class AddTodoCommand
{
    public function AddTodoCommand()
    {
    }

    [Inject]
    public var model:Todos;

    public function execute(msg:AddTodoMessage):void
    {
        model.addTodo(msg.todo);
    }

}
}
