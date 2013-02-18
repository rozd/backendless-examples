/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 18.02.13
 * Time: 08:33
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.todo.application.messages.CheckTodoMessage;
import com.backendless.examples.flex.todo.domain.Todo;
import com.backendless.examples.flex.todo.domain.Todos;

import mx.rpc.Responder;

import mx.rpc.events.FaultEvent;

import mx.rpc.events.ResultEvent;

public class CheckTodoCommand
{
    public function CheckTodoCommand()
    {
    }

    [Inject]
    public var model:Todos;

    public var callback:Function;

    public function execute(msg:CheckTodoMessage):void
    {
        model.checkTodo(msg.todo);

        Backendless.PersistenceService.of(Todo).save(msg.todo,
            new Responder(
                function(event:ResultEvent):void
                {
                    model.updateTodo(msg.todo, event.result as Todo);

                    callback(event.result);
                },
                function(event:FaultEvent):void
                {
                    model.checkTodo(msg.todo);

                    callback(event.fault);
                }
            ));
    }
}
}
