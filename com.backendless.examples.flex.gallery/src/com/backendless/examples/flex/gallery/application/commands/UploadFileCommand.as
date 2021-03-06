/*
 * Copyright (C) 2013 max.rozdobudko@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

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