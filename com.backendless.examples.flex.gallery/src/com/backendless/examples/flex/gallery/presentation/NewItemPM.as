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
 * Date: 2/20/13
 * Time: 5:50 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.presentation
{
import com.backendless.examples.flex.gallery.application.enum.Destiantion;
import com.backendless.examples.flex.gallery.application.messages.BrowseFileMessage;
import com.backendless.examples.flex.gallery.application.messages.NavigateToMessage;
import com.backendless.examples.flex.gallery.application.messages.SaveItemMessage;
import com.backendless.examples.flex.gallery.domain.Item;

import flash.events.ErrorEvent;

import flash.events.Event;

import flash.events.EventDispatcher;

import flash.net.FileReference;

import mx.events.PropertyChangeEvent;
import mx.rpc.Fault;

public class NewItemPM extends EventDispatcher implements INewItemPM
{
    public function NewItemPM()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Bindable]
    [Subscribe(objectId="selectedItem")]
    public var item:Item;

    [Bindable]
    public var saveErrorString:String;

    public function browse():void
    {
        if (!item.fileREF)
            item.fileREF = new FileReference();

        dispatcher(new BrowseFileMessage(item.fileREF));
    }

    public function submit():void
    {
        this.saveErrorString = null;

        dispatcher(new SaveItemMessage(item));
    }

    public function cancel():void
    {
        this.saveErrorString = null;

        dispatcher(new NavigateToMessage(Destiantion.GALLERY));
    }

    [CommandError(type="com.backendless.examples.flex.gallery.application.messages.SaveItemMessage")]
    public function registerError(event:ErrorEvent, trigger:SaveItemMessage):void
    {
        this.saveErrorString = event.text;
    }
}
}
