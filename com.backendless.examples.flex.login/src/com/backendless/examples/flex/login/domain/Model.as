/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 16.02.13
 * Time: 12:01
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.domain
{
    import com.backendless.BackendlessUser;
import com.backendless.examples.flex.login.application.enum.Destination;

public class Model
    {
        public function Model()
        {
        }

        [Bindable]
        [Publish(objectId="destination")]
        public var destination:String = Destination.LOADING;

        [Publish]
        [Bindable]
        public var user:BackendlessUser;

        public function setUser(user:BackendlessUser):void
        {
            this.user = user;
        }
    }
}
