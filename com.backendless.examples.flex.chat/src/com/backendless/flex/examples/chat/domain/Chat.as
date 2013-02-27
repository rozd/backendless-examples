/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/26/13
 * Time: 5:53 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.domain
{
import com.backendless.flex.examples.chat.domain.messages.Message;

import mx.collections.ArrayCollection;

import mx.collections.ArrayList;

import mx.collections.IList;

public class Chat
{
    public function Chat()
    {
    }

    private var membersMap:Object = {};

    [Bindable]
    public var currentMember:Member;

    [Bindable]
    public var members:IList = new ArrayList();

    [Bindable]
    [Publish(objectId="messages")]
    public var messages:IList = new ArrayCollection();

    public function addTextMessage(message:Message):void
    {
        messages.addItem(message);
    }

    public function addMember(member:Member):Boolean
    {
        if (membersMap[member.subscriptionId])
            return false;

        members.addItem(member);

        membersMap[member.subscriptionId] = member;

        return true;
    }

    public function removeMember(id:String):Boolean
    {
        if (!membersMap[id])
            return false;

        const n:int = members.length;
        for (var i:int = 0; i < n; i++)
        {
            if (members.getItemAt(i).subscriptionId == id)
            {
                members.removeItemAt(i);
                break;
            }
        }

        membersMap[id] = null;

        return true;
    }
}
}
