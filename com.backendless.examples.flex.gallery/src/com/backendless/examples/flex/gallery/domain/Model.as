/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 3:02 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.domain
{
import com.backendless.examples.flex.gallery.application.enum.Destiantion;

public class Model
{
    public function Model()
    {
        super();
    }

    [Bindable]
    [Publish(objectId="destination")]
    public var destination:String = Destiantion.LOADING;
}
}
