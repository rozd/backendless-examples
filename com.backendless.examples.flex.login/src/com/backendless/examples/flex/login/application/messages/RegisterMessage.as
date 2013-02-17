/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 12:48
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.login.application.messages
{
    import com.backendless.examples.flex.login.domain.vo.Register;

    public class RegisterMessage
    {
        public function RegisterMessage(register:Register)
        {
            super();

            this.register = register;
        }

        public var register:Register;
    }
}
