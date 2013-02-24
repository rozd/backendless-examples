/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/21/13
 * Time: 10:37 AM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.application.commands
{
import com.backendless.examples.flex.galery.application.messages.SaveItemMessage;
import com.backendless.examples.flex.galery.application.messages.UploadFileMessage;
import com.backendless.examples.flex.galery.domain.vo.UploadResult;
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
