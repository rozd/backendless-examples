/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 10:50 AM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.domain
{
import com.backendless.data.IBackendlessEntity;

import flash.events.Event;

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.net.FileReference;

import mx.events.PropertyChangeEvent;

[Bindable]
[RemoteClass(alias="com.backendless.examples.flex.galery.domain.Item")]
public class Item extends EventDispatcher implements IBackendlessEntity
{
    public function Item()
    {
        super();
    }

    public var objectId:String;

    public var description:String;

    public var reference:String;

    public function copy(that:Object):void
    {
        this.objectId = that.objectId;
        this.description = that.description;
        this.reference = that.reference;
        this._fileURL = that.fileREF;
    }

    private var _fileURL:String;

    [Bindable(event="propertyChange")]
    public function get fileURL():String
    {
        return _fileURL;
    }

    public function set fileURL(value:String):void
    {
        if (_fileURL == value) return;

        const oldValue:Object = _fileURL;

        _fileURL = value;

        dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fileURL", oldValue, value));
        dispatchEvent(new Event("fileSourceChanged"));
    }

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
        return _fileREF ? _fileREF.data : _fileURL;
    }

    private function fileREF_completeHandler(event:Event):void
    {
        dispatchEvent(new Event("fileSourceChanged"));
    }
}
}
