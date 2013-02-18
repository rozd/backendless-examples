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
import com.backendless.BackendlessDataQuery;
import com.backendless.data.IDataStore;
import com.backendless.examples.flex.todo.application.messages.GetTodoListMessage;
import com.backendless.examples.flex.todo.domain.Todo;
import com.backendless.examples.flex.todo.domain.Todos;

import mx.collections.ArrayCollection;

import mx.collections.ArrayList;
import mx.collections.IList;
import mx.rpc.AsyncToken;
import mx.rpc.Fault;
import mx.rpc.Responder;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class GetTodoListCommand
{
    public function GetTodoListCommand()
    {
        super();
    }

    [Inject]
    public var model:Todos;

    public var callback:Function;

    public function execute(msg:GetTodoListMessage):void
    {
        const db:IDataStore = Backendless.PersistenceService.of(Todo);

        const query:BackendlessDataQuery = new BackendlessDataQuery();

        db.find(query,
            new Responder(
                function(event:ResultEvent):void
                {
                    const list:Array = []; // event.result as IList;

                    for each (var o:Object in event.result.data)
                    {
                        var todo:Todo = new Todo();
                        todo.copy(o);

                        list.push(todo);
                    }

                    model.setTodoList(new ArrayCollection(list));

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
