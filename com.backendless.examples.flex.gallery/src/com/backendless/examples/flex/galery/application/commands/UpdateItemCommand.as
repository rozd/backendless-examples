/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:05 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.galery.application.enum.Destiantion;
import com.backendless.examples.flex.galery.application.messages.NavigateToMessage;
import com.backendless.examples.flex.galery.application.messages.UpdateItemMessage;
import com.backendless.examples.flex.galery.domain.Item;

import mx.rpc.Responder;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class UpdateItemCommand
{
    public function UpdateItemCommand()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public var callback:Function;

    public function execute(msg:UpdateItemMessage):void
    {
        Backendless.PersistenceService.of(Item).save(msg.item,
            new Responder(
                function(event:ResultEvent):void
                {
                    msg.item.copy(event.result as Item);

                    callback(event.result);

                    dispatcher(new NavigateToMessage(Destiantion.GALLERY));
                },
                function(event:FaultEvent):void
                {
                    callback(event.fault);

                    dispatcher(new NavigateToMessage(Destiantion.GALLERY));
                }
            )
        );
    }
}
}
