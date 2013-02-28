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
import com.backendless.flex.examples.chat.application.messages.StartCallMessage;
import com.backendless.flex.examples.chat.domain.Chat;
import com.backendless.media.StreamSettings;

import flash.media.Camera;
import flash.media.Microphone;

import mx.rpc.Responder;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class StartCallCommand
{
    public function StartCallCommand()
    {
        super();
    }

    [Inject]
    public var chat:Chat;

    public function execute(msg:StartCallMessage):void
    {
        const settings:StreamSettings = new StreamSettings();
        settings.camera = Camera.getCamera();
        settings.microphone = Microphone.getEnhancedMicrophone();

        Backendless.MediaService.publishLive("com.backendless.examples.flex", chat.currentMember.subscriptionId,
            new Responder(
                function(event:ResultEvent):void
                {

                },
                function(event:FaultEvent):void
                {
                    Logger.error(event.toString());
                }
            ),
            settings
        );
    }

}
}
