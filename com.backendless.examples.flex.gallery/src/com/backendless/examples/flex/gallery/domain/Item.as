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
 * Date: 2/19/13
 * Time: 10:50 AM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.domain
{
import com.backendless.data.IBackendlessEntity;

import flash.events.Event;

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.net.FileReference;
import flash.net.FileReference;

import mx.events.PropertyChangeEvent;

[Bindable]
[RemoteClass(alias="com.backendless.examples.flex.gallery.domain.Item")]
public class Item extends EventDispatcher implements IBackendlessEntity
{
    public function Item()
    {
        super();
    }

    public var objectId:String;

    public var description:String;

    public var reference:String;

    public var fileURL:String;

    [Transient]
    public var fileName:String;

    private var _fileREF:FileReference;

    [Transient]
    [Bindable(event="propertyChange")]
    public function get fileREF():FileReference
    {
        return _fileREF;
    }

    public function set fileREF(value:FileReference):void
    {
        if (_fileREF == value) return;

        const oldValue:Object = _fileREF;

        if (_fileREF)
            _fileREF.removeEventListener(Event.COMPLETE, fileREF_completeHandler);

        _fileREF = value;

        if (_fileREF)
            _fileREF.addEventListener(Event.COMPLETE, fileREF_completeHandler);

        dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fileREF", oldValue, value));
    }

    [Bindable(event="fileSourceChanged")]
    public function getFileSource():Object
    {
        return _fileREF ? _fileREF.data : fileURL;
    }

    public function copy(that:Object):void
    {
        this.objectId = that.objectId;
        this.description = that.description;
        this.reference = that.reference;
        this.fileURL = that.fileREF;
    }

    private function fileREF_completeHandler(event:Event):void
    {
        this.fileName = FileReference(event.target).name;

        dispatchEvent(new Event("fileSourceChanged"));
    }
}
}
