/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 21:29
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.presentation
{
import com.backendless.examples.flex.todo.domain.Todo;

import mx.collections.ArrayCollection;

public interface ITodoPM
{
    function get newTodoLabel():String;
    function set newTodoLabel(value:String):void;

    function get todoList():ArrayCollection;
    function set todoList(value:ArrayCollection):void;

    function addTodo(label:String):void;

    function removeTodo(todo:Todo):void;

    function checkTodo(todo:Todo):void;

    function favoriteTodo(todo:Todo):void;
}
}
