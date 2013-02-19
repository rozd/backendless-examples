/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 8:16 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.application.commands
{
import com.backendless.Backendless;
import com.backendless.BackendlessDataQuery;
import com.backendless.data.IDataStore;
import com.backendless.examples.flex.galery.application.enum.Destiantion;
import com.backendless.examples.flex.galery.application.messages.GetGalleryMessage;
import com.backendless.examples.flex.galery.application.messages.NavigateToMessage;
import com.backendless.examples.flex.galery.domain.Gallery;
import com.backendless.examples.flex.galery.domain.Item;
import com.backendless.examples.flex.galery.domain.Model;

import mx.collections.ArrayList;
import mx.rpc.Responder;

import mx.rpc.events.FaultEvent;

import mx.rpc.events.ResultEvent;

public class GetGalleryCommand
{
    public function GetGalleryCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public var callback:Function;

    [Inject]
    public var gallery:Gallery;

    [Inject]
    public var model:Model;

    public function execute(msg:GetGalleryMessage):void
    {
        const db:IDataStore = Backendless.PersistenceService.of(Item);

        const query:BackendlessDataQuery = new BackendlessDataQuery();

        db.find(query,
            new Responder(
                function(event:ResultEvent):void
                {
                    const list:Array = []; // event.result as IList;

                    for each (var o:Object in event.result.data)
                    {
                        var todo:Item = new Item();
                        todo.copy(o);

                        list.push(todo);
                    }

                    gallery.setList(new ArrayList(list));

                    dispatcher(new NavigateToMessage(Destiantion.GALLERY));

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
