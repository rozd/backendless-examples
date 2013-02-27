/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:05 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.gallery.application.enum.Destiantion;
import com.backendless.examples.flex.gallery.application.messages.NavigateToMessage;
import com.backendless.examples.flex.gallery.application.messages.SaveItemMessage;
import com.backendless.examples.flex.gallery.domain.Gallery;
import com.backendless.examples.flex.gallery.domain.Item;
import com.backendless.examples.flex.logging.Logger;

import mx.rpc.Responder;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class SaveItemCommand
{
    public function SaveItemCommand()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var gallery:Gallery;

    public var callback:Function;

    public function execute(msg:SaveItemMessage, fileURL:String=null):void
    {
        gallery.addItem(msg.item);

        msg.item.fileURL = fileURL;

        Backendless.PersistenceService.of(Item).save(msg.item,
            new Responder(
                function(event:ResultEvent):void
                {
                    Logger.info("Item saved successfully.");

                    msg.item.copy(event.result as Item);

                    dispatcher(new NavigateToMessage(Destiantion.GALLERY));

                    callback(event.result);
                },
                function(event:FaultEvent):void
                {
                    Logger.error(event.toString());

                    gallery.removeItem(msg.item);

                    dispatcher(new NavigateToMessage(Destiantion.GALLERY));

                    callback(event.fault);
                }
            )
        );
    }
}
}
