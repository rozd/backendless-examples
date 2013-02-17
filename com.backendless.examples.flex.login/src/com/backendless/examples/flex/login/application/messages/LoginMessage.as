/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 12:47
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.application.messages
{
    import com.backendless.examples.flex.login.domain.vo.Login;

    public class LoginMessage
    {
        public function LoginMessage(login:Login)
        {
            super();

            this.login = login;
        }

        public var login:Login;
    }
}
