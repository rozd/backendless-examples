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

import flash.events.Event;

import flash.events.EventDispatcher;

import flash.net.FileReference;

import mx.events.PropertyChangeEvent;

public class NewItemPM extends EventDispatcher implements INewItemPM
{
    public function NewItemPM()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Bindable]
    [Subscribe(objectId="selectedItem")]
    public var item:Item;

    private var _fileName:String;

    [Bindable]
    public function get fileName():String
    {
        return _fileName;
    }

    public function set fileName(value:String):void
    {
        _fileName = value;
    }

    public function browse():void
    {
        if (!item.fileREF)
        {
            item.fileREF = new FileReference();
            item.fileREF.addEventListener(Event.SELECT, fileREF_selectHandler, false, 0, true);
        }

        dispatcher(new BrowseFileMessage(item.fileREF));
    }

    public function submit():void
    {
        dispatcher(new SaveItemMessage(item));
    }

    public function cancel():void
    {
        dispatcher(new NavigateToMessage(Destiantion.GALLERY));
    }

    private function fileREF_selectHandler(event:Event):void
    {
        this.fileName = item.fileREF.name;
    }

}
}
