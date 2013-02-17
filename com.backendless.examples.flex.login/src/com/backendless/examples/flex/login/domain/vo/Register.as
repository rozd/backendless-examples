/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 16.02.13
 * Time: 13:46
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.domain.vo
{
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

[Bindable]
public class Register extends EventDispatcher
{
    public function Register()
    {
        super();
    }

    public var email:String;

    public var password:String;

    public var passwordVerify:String;

    public var name:String;
}
}
