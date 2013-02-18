/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 18.02.13
 * Time: 08:37
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.presentation
{
import com.backendless.examples.flex.todo.application.messages.AddTodoMessage;
import com.backendless.examples.flex.todo.application.messages.CheckTodoMessage;
import com.backendless.examples.flex.todo.application.messages.RemoveTodoMessage;
import com.backendless.examples.flex.todo.domain.Todo;

import mx.collections.IList;

public class TodoPM implements ITodoPM
{
    public function TodoPM()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Bindable]
    public var newTodoLabel:String;

    [Bindable]
    [Subscribe(objectId="todos")]
    public var todos:IList;



    public function addTodo(label:String):void
    {
        const todo:Todo = new Todo();
        todo.label = label;

        this.newTodoLabel = null;

        dispatcher(new AddTodoMessage(todo));
    }

    public function removeTodo(todo:Todo):void
    {
        dispatcher(new RemoveTodoMessage(todo));
    }

    public function checkTodo(todo:Todo):void
    {
        dispatcher(new CheckTodoMessage(todo));
    }

    public function favoriteTodo(todo:Todo):void
    {
    }

    //----------------------------------------------------------------
    //----------------------------------------------------------------

    [CommandResult(type="com.backendless.examples.flex.todo.application.messages.AddTodoMessage")]
    public function addTodoResult(data:Object, trigger:AddTodoMessage):void
    {

    }

    [CommandError(type="com.backendless.examples.flex.todo.application.messages.AddTodoMessage")]
    public function addTodoError(data:Object, trigger:AddTodoMessage):void
    {
        this.newTodoLabel = trigger.todo.label;
    }
}
}
