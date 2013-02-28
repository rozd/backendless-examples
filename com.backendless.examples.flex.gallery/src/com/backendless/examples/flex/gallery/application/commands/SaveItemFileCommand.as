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
 * Date: 2/21/13
 * Time: 10:37 AM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.application.commands
{
import com.backendless.examples.flex.gallery.application.messages.SaveItemMessage;
import com.backendless.examples.flex.gallery.application.messages.UploadFileMessage;
import com.backendless.examples.flex.gallery.domain.vo.UploadResult;
import com.backendless.examples.flex.logging.Logger;

import flash.events.ErrorEvent;

import org.spicefactory.lib.command.builder.Commands;
import org.spicefactory.lib.command.events.CommandFailure;

public class SaveItemFileCommand
{
    public function SaveItemFileCommand()
    {
        super();
    }

    public var callback:Function;

    public function execute(msg:SaveItemMessage):void
    {
        Commands
            .wrap(UploadFileCommand)
            .data(new UploadFileMessage(msg.item.fileREF, "backendless-examples-gallery"))
            .result(result)
            .error(error)
            .execute();
    }

    public function result(result:UploadResult):void
    {
//        msg.item.fileURL = data.fileURL;
        Logger.info("File saved");

        callback(result.url);
    }

    public function error(failure:ErrorEvent):void
    {
        Logger.error(failure.toString());

        callback(failure);
    }
}

}
