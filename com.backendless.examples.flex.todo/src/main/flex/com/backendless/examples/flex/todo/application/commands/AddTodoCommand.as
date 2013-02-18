/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 17:23
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.todo.application.messages.AddTodoMessage;
import com.backendless.examples.flex.todo.domain.Todo;
import com.backendless.examples.flex.todo.domain.Todos;

import mx.rpc.AsyncToken;
import mx.rpc.Fault;
import mx.rpc.Responder;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class AddTodoCommand
{
    public function AddTodoCommand()
    {
    }

    [Inject]
    public var model:Todos;

    private var todo:Todo;

    public var callback:Function;

    public function execute(msg:AddTodoMessage):void
    {
        model.addTodo(msg.todo);

        Backendless.PersistenceService.of(Todo).save(msg.todo,
            new Responder(
                function(event:ResultEvent):void
                {
                    model.updateTodo(msg.todo, event.result as Todo);

                    callback(event.result);
                },
                function(event:FaultEvent):void
                {
                    model.removeTodo(msg.todo);

                    callback(event.fault);
                }
            ));
    }
}
}
