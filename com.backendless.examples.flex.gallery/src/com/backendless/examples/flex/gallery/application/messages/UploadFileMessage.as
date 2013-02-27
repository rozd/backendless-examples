package com.backendless.examples.flex.gallery.application.messages
{
import flash.net.FileReference;

public class UploadFileMessage
{
    public function UploadFileMessage(file:FileReference, path:String, uploadId:String=null)
    {
        super();

        this.file = file;
        this.path = path;
        this.uploadId = uploadId;
    }

    public var file:FileReference;
    public var path:String
    public var uploadId:String;
}
}