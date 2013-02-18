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

import mx.collections.ArrayCollection;

import mx.collections.IList;

import spark.collections.Sort;

import spark.collections.SortField;

public class TodoPM implements ITodoPM
{
    public function TodoPM()
    {
        super();

        const sort:Sort = new Sort();
        sort.fields = [new SortField("done")];

        todoList = new ArrayCollection();
        todoList.sort = sort;
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Bindable]
    public var newTodoLabel:String;

    [Bindable]
    public var todoList:ArrayCollection;

    private var _originalList:IList;

    [Bindable]
    [Subscribe(objectId="todos")]
    public function get originalList():IList
    {
        return _originalList;
    }

    public function set originalList(value:IList):void
    {
        _originalList = value;

        todoList.source = _originalList ? _originalList.toArray() : [];
    }

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
