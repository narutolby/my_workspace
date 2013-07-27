/*
 *  @author lby
 *  @date 2012- 7-23
 */
(function ($) {
    $.extend($.fn, {
        commonUpload: (function ($) {
            var $key= $("#keyword");
            var bindUpload = function (options) {
                var defaultSetting = {
                    swf: 'js/uploadify/uploadify.swf',
                    uploader: '../resourceOperation/upload.json?user=' + user,
                    removeCompleted: true,
                    buttonText: '',
                    fileSizeLimit: '30MB',
                    formData: {'Keyword': ' '},
                    preventCaching: false,
                    onUploadSuccess: function (file, data, response) {
                        data = eval('('+data+')');
                        var keys = data.keys;
                        var tmp = [];
                        tmp.push("<li><strong style='font-size:15px;color:red'>关键字:</strong></li>")
                        for(var i=0;i<keys.length;i++){
                            if(i==10){
                                break;
                            }
                            tmp.push("<li><strong style='font-size:14px'>"+keys[i]+"</strong></li>");
                        }
                        $key.html(tmp.join(""));
                        options.onUploadSuccessTmp(file,data,response);
                    },
                    onUploadError: function (file, errorCode, errorMsg, errorString) {
                        $.messager.alert('The file ' + file.name
                            + ' could not be uploaded: ' + errorString);
                    }
                };
                var setting = $.extend({}, defaultSetting, options);
                this.uploadify(setting);
            };
            return function (options) {
                if (this.length == 0) {
                    return this;
                }
                return this.each(function () {
                    var $this = $(this);
                    if (this.tagName.toLowerCase != "input" && $this.attr("id") == "") {
                        throw Error("dom必须为input且id不能为空");
                        return;
                    }
                    bindUpload.call($this,options);
                });
            }
        })($)
    });
})(jQuery);
