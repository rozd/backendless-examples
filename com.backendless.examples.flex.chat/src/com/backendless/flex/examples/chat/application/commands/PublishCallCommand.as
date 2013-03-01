/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/28/13
 * Time: 7:29 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.logging.Logger;
import com.backendless.flex.examples.chat.application.messages.PublishCallMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.flex.examples.chat.domain.ChatCall;
import com.backendless.media.RecordingControl;
import com.backendless.media.StreamSettings;

import flash.media.Camera;
import flash.media.Microphone;

import mx.rpc.Responder;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class PublishCallCommand
{
    public function PublishCallCommand()
    {
        super();
    }

    [Inject]
    public var chat:Chat;

    public var callback:Function;

    public function execute(msg:PublishCallMessage):void
    {
        if (chat.currentCall)
        {
            return;
        }

        chat.currentCall = new ChatCall();
        chat.currentCall.member =  chat.currentMember;

        const settings:StreamSettings = new StreamSettings();
        settings.camera = Camera.getCamera();
        settings.microphone = Microphone.getEnhancedMicrophone();


        try
        {
            Backendless.MediaService.publishLive("default", "asdsad",
                new Responder(
                    function(control:RecordingControl):void
                    {
                        callback(control);
                    },
                    function(info:Object):void
                    {
                        callback(new Error(info.code));

                        Logger.error(info.code);
                    }
                ),
                settings
            );
        }
        catch (e:Error)
        {
            trace(e.getStackTrace());
        }
    }

}
}
