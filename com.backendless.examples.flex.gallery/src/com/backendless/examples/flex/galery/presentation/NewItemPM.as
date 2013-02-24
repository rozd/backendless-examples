/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/20/13
 * Time: 5:50 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.presentation
{
import com.backendless.examples.flex.galery.application.enum.Destiantion;
import com.backendless.examples.flex.galery.application.messages.BrowseFileMessage;
import com.backendless.examples.flex.galery.application.messages.NavigateToMessage;
import com.backendless.examples.flex.galery.application.messages.SaveItemMessage;
import com.backendless.examples.flex.galery.domain.Item;

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

    [CommandError(type="com.backendless.examples.flex.galery.application.messages.SaveItemMessage")]
    public function registerError(event:ErrorEvent, trigger:SaveItemMessage):void
    {
        this.saveErrorString = event.text;
    }
}
}
