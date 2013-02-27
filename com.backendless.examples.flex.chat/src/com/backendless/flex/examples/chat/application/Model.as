/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/26/13
 * Time: 5:30 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application
{
import com.backendless.flex.examples.chat.application.enum.Destination;

public class Model
{
    public function Model()
    {
    }

    [Bindable]
    [Publish(objectId="destination")]
    public var destination:String = Destination.INIT;
}
}
