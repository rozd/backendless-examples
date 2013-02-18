/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 18.02.13
 * Time: 08:38
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.application.messages
{
import com.backendless.examples.flex.todo.domain.Todo;

public class RemoveTodoMessage
{
    public function RemoveTodoMessage(todo:Todo)
    {
        super();

        this.todo = todo;
    }

    public var todo:Todo;
}
}
