package com.backendless.examples.flex.galery.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.galery.application.messages.UploadFileMessage;
import com.backendless.examples.flex.galery.domain.vo.UploadResult;

import flash.events.DataEvent;
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

    public function execute(msg:UploadFileMessage):void
    {
        addListeners(msg.file);

        Backendless.FileService.upload(msg.file, msg.path);
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

        callback(new UploadResult(JSON.parse(event.data).fileURL));
    }

    private function ioErrorHandler(event:IOErrorEvent):void
    {
        removeListeners(event.target as IEventDispatcher);

        callback(event);
    }

    private function securityErrorHandler(event:SecurityErrorEvent):void
    {
        removeListeners(event.target as IEventDispatcher);

        callback(event);
    }
}
}