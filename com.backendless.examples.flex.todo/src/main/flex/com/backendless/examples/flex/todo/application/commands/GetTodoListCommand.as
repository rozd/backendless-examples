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
		
		model.setTodoList(db.find(query));
    }
}
}
