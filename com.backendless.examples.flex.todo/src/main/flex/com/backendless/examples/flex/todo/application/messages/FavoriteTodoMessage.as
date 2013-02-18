/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 19.02.13
 * Time: 00:01
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.application.messages
{
import com.backendless.examples.flex.todo.domain.Todo;

public class FavoriteTodoMessage
{
    public function FavoriteTodoMessage(todo:Todo)
    {
        super();

        this.todo = todo;
    }

    public var todo:Todo;
}
}
