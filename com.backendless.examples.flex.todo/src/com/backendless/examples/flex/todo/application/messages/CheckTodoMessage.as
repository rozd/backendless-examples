/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 18.02.13
 * Time: 08:39
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.application.messages
{
import com.backendless.examples.flex.todo.domain.Todo;

public class CheckTodoMessage
{
    public function CheckTodoMessage(todo:Todo)
    {
        super();

        this.todo = todo;
    }

    public var todo:Todo;
}
}
