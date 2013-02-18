/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 19.02.13
 * Time: 00:01
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.todo.application.messages.FavoriteTodoMessage;
import com.backendless.examples.flex.todo.domain.Todo;
import com.backendless.examples.flex.todo.domain.Todos;

import mx.rpc.Responder;

import mx.rpc.events.FaultEvent;

import mx.rpc.events.ResultEvent;

public class FavoriteTodoCommand
{
    public function FavoriteTodoCommand()
    {
    }

    [Inject]
    public var model:Todos;

    public var callback:Function;

    public function execute(msg:FavoriteTodoMessage):void
    {
        msg.todo.favorite = !msg.todo.favorite;

        Backendless.PersistenceService.of(Todo).save(msg.todo,
            new Responder(
                function(event:ResultEvent):void
                {
                    model.updateTodo(msg.todo, event.result as Todo);

                    callback(event.result);
                },
                function(event:FaultEvent):void
                {
                    msg.todo.favorite = !msg.todo.favorite;

                    callback(event.fault);
                }
            ));
    }
}
}
