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

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.net.FileReference;

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

    public var fileURL:String;

    [Transient]
    public var fileREF:FileReference;

    public function copy(that:Object):void
    {
        this.objectId = that.objectId;
        this.description = that.description;
        this.reference = that.reference;
        this.fileURL = that.fileREF;
    }
}
}
