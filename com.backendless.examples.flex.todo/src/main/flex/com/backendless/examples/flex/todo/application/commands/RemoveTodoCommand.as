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
import com.backendless.examples.flex.todo.application.messages.RemoveTodoMessage;
import com.backendless.examples.flex.todo.domain.Todo;
import com.backendless.examples.flex.todo.domain.Todos;

import mx.rpc.Responder;

import mx.rpc.events.FaultEvent;

import mx.rpc.events.ResultEvent;

public class RemoveTodoCommand
{
    public function RemoveTodoCommand()
    {
    }

    [Inject]
    public var model:Todos;

    public var callback:Function;

    public function execute(msg:RemoveTodoMessage):void
    {
        Backendless.PersistenceService.of(Todo).remove(msg.todo,
            new Responder(
                function(event:ResultEvent):void
                {
                    model.removeTodo(msg.todo);

                    callback(event.result);
                },
                function(event:FaultEvent):void
                {
                    callback(event.fault);
                }
            ));
    }
}
}
