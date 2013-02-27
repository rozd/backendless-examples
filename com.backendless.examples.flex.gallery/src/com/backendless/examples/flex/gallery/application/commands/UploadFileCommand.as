package com.backendless.examples.flex.gallery.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.gallery.application.messages.SaveItemMessage;
import com.backendless.examples.flex.gallery.application.messages.UploadFileMessage;
import com.backendless.examples.flex.gallery.domain.vo.UploadResult;
import com.backendless.examples.flex.logging.Logger;

import flash.events.DataEvent;
import flash.events.ErrorEvent;
import flash.events.ErrorEvent;
import flash.events.IEventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;

public class UploadFileCommand
{
    public function UploadFileCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public var callback:Function;

    public function execute(msg:SaveItemMessage):void
    {
        addListeners(msg.item.fileREF);

        Backendless.FileService.upload(msg.item.fileREF, "backendless-examples-gallery");
    }

    private function addListeners(target:IEventDispatcher):void
    {
        target.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, uploadCompleteDataHandler);
        target.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        target.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
    }

    private function removeListeners(target:IEventDispatcher):void
    {
        target.removeEventListener(DataEvent.UPLOAD_COMPLETE_DATA, uploadCompleteDataHandler);
        target.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        target.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
    }

    private function uploadCompleteDataHandler(event:DataEvent):void
    {
        removeListeners(event.target as IEventDispatcher);

        const response:Object = JSON.parse(event.data);

        if (response.hasOwnProperty("message"))
        {
            Logger.error(response.message);

            callback(new ErrorEvent(ErrorEvent.ERROR, false, false, response.message));
        }
        else
        {
            Logger.info("File uploaded");

            callback(response.fileURL);
        }
    }

    private function ioErrorHandler(event:IOErrorEvent):void
    {
        Logger.error(event.toString());

        removeListeners(event.target as IEventDispatcher);

        callback(event);
    }

    private function securityErrorHandler(event:SecurityErrorEvent):void
    {
        Logger.error(event.toString());

        removeListeners(event.target as IEventDispatcher);

        callback(event);
    }
}
}