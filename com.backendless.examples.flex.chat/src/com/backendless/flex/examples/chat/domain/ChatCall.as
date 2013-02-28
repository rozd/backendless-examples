/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/28/13
 * Time: 8:01 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.domain
{
import com.backendless.media.MediaControl;

[Bindable]
[RemoteClass(alias="com.backendless.flex.examples.chat.domain.ChatCall")]
public class ChatCall
{
    public function ChatCall()
    {
        super();
    }

    public var member:ChatMember;
    public var control:MediaControl;
}
}
