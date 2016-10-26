$(function(){
	//包价格
	jQuery.validator.addMethod("servicepackagePrice", function(value, element) {
		return this.optional(element) || /^[1-9]\d{0,4}(\.\d{1,2})?$/.test(value);
    }, "价格输入不合法");
	//折扣
	jQuery.validator.addMethod("discount", function(value, element) {
		return this.optional(element) || /^[1](\.[0]{1,2})?|[0]\.\d{1,2}$/.test(value);
    }, "折扣输入不合法");

});