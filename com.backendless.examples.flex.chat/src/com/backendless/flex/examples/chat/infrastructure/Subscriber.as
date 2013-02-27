/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/26/13
 * Time: 5:43 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.infrastructure
{
import com.backendless.examples.flex.logging.Logger;
import com.backendless.flex.examples.chat.application.messages.HandleMessageMessage;
import com.backendless.messaging.ISubscriptionResponder;
import com.backendless.messaging.Message;

import mx.collections.ArrayCollection;
import mx.rpc.events.FaultEvent;

public class Subscriber implements ISubscriptionResponder
{
    public function Subscriber()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public function received(messages:ArrayCollection):void
    {
        for each (var msg:Message in messages)
        {
            dispatcher(new HandleMessageMessage(msg));
        }
    }

    public function error(error:FaultEvent):void
    {
        Logger.error(error.toString());
    }
}
}
