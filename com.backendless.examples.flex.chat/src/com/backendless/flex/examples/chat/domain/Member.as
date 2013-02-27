/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/26/13
 * Time: 6:59 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.domain
{
[Bindable]
[RemoteClass(alias="com.backendless.flex.examples.chat.domain.Member")]
public class Member
{
    public function Member()
    {
        super();
    }

    public var subscriptionId:String;

    public var name:String;

    public function copy(that:Object):void
    {
        this.subscriptionId = that.subscriptionId;
        this.name = that.name;
    }
}
}
