/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 16.02.13
 * Time: 11:45
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.presentation
{
import com.backendless.examples.flex.login.domain.vo.Login;
import com.backendless.examples.flex.login.domain.vo.Register;

public interface ILoginPM
    {
        function get userLogin():Login;
        function set userLogin(value:Login):void;

        function get userRegister():Register;
        function set userRegister(value:Register):void;

        function get loginErrorString():String;
        function set loginErrorString(value:String):void;

        function get registerErrorString():String;
        function set registerErrorString(value:String):void;

        function get isSigningIn():Boolean;
        function set isSigningIn(value:Boolean):void;

        function get isRegistering():Boolean;
        function set isRegistering(value:Boolean):void;

        function reset():void;

        function verify():Boolean;

        function login():void;

        function register():void;

        function logout():void;

        function ok():void;
    }
}
