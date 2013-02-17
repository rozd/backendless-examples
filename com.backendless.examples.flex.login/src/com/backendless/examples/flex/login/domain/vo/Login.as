/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 16.02.13
 * Time: 13:45
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.domain.vo
{
import flash.events.EventDispatcher;

    [Bindable]
    public class Login extends EventDispatcher
    {
        public function Login()
        {
            super();
        }

        public var email:String;

        public var password:String;
    }
}
