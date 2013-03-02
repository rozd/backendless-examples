/*
 * Copyright (C) 2013 max.rozdobudko@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

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
import com.backendless.media.RecordingControl;

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

    [Transient]
    public var recordControl:RecordingControl;

    public function copy(that:Object):void
    {
        this.member = new ChatMember();
        this.member.copy(that.member);

        this.control = that.control;
    }

}
}
