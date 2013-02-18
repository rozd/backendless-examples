/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 21:28
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.domain
{
import mx.collections.ArrayList;
import mx.collections.IList;

public class Todos
{
    public function Todos()
    {
    }

    [Bindable]
    [Publish(objectId="todos")]
    public var list:IList = new ArrayList();

    public function addTodo(todo:Todo):void
    {
        list.addItem(todo);
    }

    public function removeTodo(todo:Todo):void
    {
        list.removeItemAt(list.getItemIndex(todo));
    }
}
}
