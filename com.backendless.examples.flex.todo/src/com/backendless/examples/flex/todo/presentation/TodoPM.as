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

    public function addTodo():void
    {
        const todo:Todo = new Todo();
        todo.label = newTodoLabel;

        this.newTodoLabel = "";

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
}
}
