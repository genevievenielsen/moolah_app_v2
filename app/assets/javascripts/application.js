// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery

//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  $('.alert').delay(4000).fadeOut('slow');


  $("#item_expiration_date").datepicker({ dateFormat: "DD d MM, yy" });

  !function(a){!function(){window.Tags||(window.Tags={}),jQuery(function(){return a.tags=function(b,c){var d,e,f,g,h,i,j,k=this;null==c&&(c={});for(d in c)g=c[d],this[d]=g;if(this.bootstrapVersion||(this.bootstrapVersion="3"),this.readOnly||(this.readOnly=!1),this.suggestOnClick||(this.suggestOnClick=!1),this.suggestions||(this.suggestions=[]),this.restrictTo=null!=c.restrictTo?c.restrictTo.concat(this.suggestions):!1,this.exclude||(this.exclude=!1),this.displayPopovers=null!=c.popovers?!0:null!=c.popoverData,this.popoverTrigger||(this.popoverTrigger="hover"),this.tagClass||(this.tagClass="btn-info"),this.tagSize||(this.tagSize="md"),this.promptText||(this.promptText="Enter tags..."),this.caseInsensitive||(this.caseInsensitive=!1),this.readOnlyEmptyMessage||(this.readOnlyEmptyMessage="No tags to display..."),this.maxNumTags||(this.maxNumTags=-1),this.beforeAddingTag||(this.beforeAddingTag=function(){}),this.afterAddingTag||(this.afterAddingTag=function(){}),this.beforeDeletingTag||(this.beforeDeletingTag=function(){}),this.afterDeletingTag||(this.afterDeletingTag=function(){}),this.definePopover||(this.definePopover=function(a){return'associated content for "'+a+'"'}),this.excludes||(this.excludes=function(){return!1}),this.tagRemoved||(this.tagRemoved=function(){}),this.pressedReturn||(this.pressedReturn=function(){}),this.pressedDelete||(this.pressedDelete=function(){}),this.pressedDown||(this.pressedDown=function(){}),this.pressedUp||(this.pressedUp=function(){}),this.$element=a(b),null!=c.tagData?this.tagsArray=c.tagData:(f=a(".tag-data",this.$element).html(),this.tagsArray=null!=f?f.split(","):[]),c.popoverData)this.popoverArray=c.popoverData;else for(this.popoverArray=[],j=this.tagsArray,h=0,i=j.length;i>h;h++)e=j[h],this.popoverArray.push(null);return this.getTags=function(){return k.tagsArray},this.getTagsContent=function(){return k.popoverArray},this.getTagsWithContent=function(){var a,b,c,d;for(a=[],b=c=0,d=k.tagsArray.length-1;d>=0?d>=c:c>=d;b=d>=0?++c:--c)a.push({tag:k.tagsArray[b],content:k.popoverArray[b]});return a},this.getTag=function(a){var b;return b=k.tagsArray.indexOf(a),b>-1?k.tagsArray[b]:null},this.getTagWithContent=function(a){var b;return b=k.tagsArray.indexOf(a),{tag:k.tagsArray[b],content:k.popoverArray[b]}},this.hasTag=function(a){return k.tagsArray.indexOf(a)>-1},this.removeTagClicked=function(b){return"A"===b.currentTarget.tagName&&(k.removeTag(a("span",b.currentTarget.parentElement).html()),a(b.currentTarget.parentNode).remove()),k},this.removeLastTag=function(){return k.tagsArray.length>0&&(k.removeTag(k.tagsArray[k.tagsArray.length-1]),k.canAddByMaxNum()&&k.enableInput()),k},this.removeTag=function(a){if(k.tagsArray.indexOf(a)>-1){if(k.beforeDeletingTag(a)===!1)return;k.popoverArray.splice(k.tagsArray.indexOf(a),1),k.tagsArray.splice(k.tagsArray.indexOf(a),1),k.renderTags(),k.afterDeletingTag(a),k.canAddByMaxNum()&&k.enableInput()}return k},this.canAddByRestriction=function(a){return this.restrictTo===!1||-1!==this.restrictTo.indexOf(a)},this.canAddByExclusion=function(a){return(this.exclude===!1||-1===this.exclude.indexOf(a))&&!this.excludes(a)},this.canAddByMaxNum=function(){return-1===this.maxNumTags||this.tagsArray.length<this.maxNumTags},this.addTag=function(a){var b;if(k.canAddByRestriction(a)&&!k.hasTag(a)&&a.length>0&&k.canAddByExclusion(a)&&k.canAddByMaxNum()){if(k.beforeAddingTag(a)===!1)return;b=k.definePopover(a),k.popoverArray.push(b||null),k.tagsArray.push(a),k.afterAddingTag(a),k.renderTags(),k.canAddByMaxNum()||k.disableInput()}return k},this.addTagWithContent=function(a,b){if(k.canAddByRestriction(a)&&!k.hasTag(a)&&a.length>0){if(k.beforeAddingTag(a)===!1)return;k.tagsArray.push(a),k.popoverArray.push(b),k.afterAddingTag(a),k.renderTags()}return k},this.renameTag=function(a,b){return k.tagsArray[k.tagsArray.indexOf(a)]=b,k.renderTags(),k},this.setPopover=function(a,b){return k.popoverArray[k.tagsArray.indexOf(a)]=b,k.renderTags(),k},this.clickHandler=function(a){return k.makeSuggestions(a,!0)},this.keyDownHandler=function(a){var b,c;switch(b=null!=a.keyCode?a.keyCode:a.which){case 13:return a.preventDefault(),k.pressedReturn(a),e=a.target.value,-1!==k.suggestedIndex&&(e=k.suggestionList[k.suggestedIndex]),k.addTag(e),a.target.value="",k.renderTags(),k.hideSuggestions();case 46:case 8:if(k.pressedDelete(a),""===a.target.value&&k.removeLastTag(),1===a.target.value.length)return k.hideSuggestions();break;case 40:if(k.pressedDown(a),""!==k.input.val()||-1!==k.suggestedIndex&&null!=k.suggestedIndex||k.makeSuggestions(a,!0),c=k.suggestionList.length,k.suggestedIndex=k.suggestedIndex<c-1?k.suggestedIndex+1:c-1,k.selectSuggested(k.suggestedIndex),k.suggestedIndex>=0)return k.scrollSuggested(k.suggestedIndex);break;case 38:if(k.pressedUp(a),k.suggestedIndex=k.suggestedIndex>0?k.suggestedIndex-1:0,k.selectSuggested(k.suggestedIndex),k.suggestedIndex>=0)return k.scrollSuggested(k.suggestedIndex);break;case 9:case 27:return k.hideSuggestions(),k.suggestedIndex=-1}},this.keyUpHandler=function(a){var b;return b=null!=a.keyCode?a.keyCode:a.which,40!==b&&38!==b&&27!==b?k.makeSuggestions(a,!1):void 0},this.getSuggestions=function(b,c){var d=this;return this.suggestionList=[],this.caseInsensitive&&(b=b.toLowerCase()),a.each(this.suggestions,function(a,e){var f;return f=d.caseInsensitive?e.substring(0,b.length).toLowerCase():e.substring(0,b.length),d.tagsArray.indexOf(e)<0&&f===b&&(b.length>0||c)?d.suggestionList.push(e):void 0}),this.suggestionList},this.makeSuggestions=function(b,c,d){return null==d&&(d=null!=b.target.value?b.target.value:b.target.textContent),k.suggestedIndex=-1,k.$suggestionList.html(""),a.each(k.getSuggestions(d,c),function(a,b){return k.$suggestionList.append(k.template("tags_suggestion",{suggestion:b}))}),k.$(".tags-suggestion").mouseover(k.selectSuggestedMouseOver),k.$(".tags-suggestion").click(k.suggestedClicked),k.suggestionList.length>0?k.showSuggestions():k.hideSuggestions()},this.suggestedClicked=function(a){return e=a.target.textContent,-1!==k.suggestedIndex&&(e=k.suggestionList[k.suggestedIndex]),k.addTag(e),k.input.val(""),k.makeSuggestions(a,!1,""),k.input.focus(),k.hideSuggestions()},this.hideSuggestions=function(){return k.$(".tags-suggestion-list").css({display:"none"})},this.showSuggestions=function(){return k.$(".tags-suggestion-list").css({display:"block"})},this.selectSuggestedMouseOver=function(b){return a(".tags-suggestion").removeClass("tags-suggestion-highlighted"),a(b.target).addClass("tags-suggestion-highlighted"),a(b.target).mouseout(k.selectSuggestedMousedOut),k.suggestedIndex=k.$(".tags-suggestion").index(a(b.target))},this.selectSuggestedMousedOut=function(b){return a(b.target).removeClass("tags-suggestion-highlighted")},this.selectSuggested=function(b){var c;return a(".tags-suggestion").removeClass("tags-suggestion-highlighted"),c=k.$(".tags-suggestion").eq(b),c.addClass("tags-suggestion-highlighted")},this.scrollSuggested=function(a){var b,c,d,e;return c=k.$(".tags-suggestion").eq(a),d=k.$(".tags-suggestion").eq(0),b=c.position(),e=d.position(),null!=b?k.$(".tags-suggestion-list").scrollTop(b.top-e.top):void 0},this.adjustInputPosition=function(){var b,c,d,e,f,g;return f=k.$(".tag").last(),g=f.position(),c=null!=g?g.left+f.outerWidth(!0):0,d=null!=g?g.top:0,e=k.$element.width()-c,a(".tags-input",k.$element).css({paddingLeft:Math.max(c,0),paddingTop:Math.max(d,0),width:e}),b=null!=g?g.top+f.outerHeight(!0):22,k.$element.css({paddingBottom:b-k.$element.height()})},this.renderTags=function(){var b;return b=k.$(".tags"),b.html(""),k.input.attr("placeholder",0===k.tagsArray.length?k.promptText:""),a.each(k.tagsArray,function(c,d){return d=a(k.formatTag(c,d)),a("a",d).click(k.removeTagClicked),a("a",d).mouseover(k.toggleCloseColor),a("a",d).mouseout(k.toggleCloseColor),k.displayPopovers&&k.initializePopoverFor(d,k.tagsArray[c],k.popoverArray[c]),b.append(d)}),k.adjustInputPosition()},this.renderReadOnly=function(){var b;return b=k.$(".tags"),b.html(0===k.tagsArray.length?k.readOnlyEmptyMessage:""),a.each(k.tagsArray,function(c,d){return d=a(k.formatTag(c,d,!0)),k.displayPopovers&&k.initializePopoverFor(d,k.tagsArray[c],k.popoverArray[c]),b.append(d)})},this.disableInput=function(){return this.$("input").prop("disabled",!0)},this.enableInput=function(){return this.$("input").prop("disabled",!1)},this.initializePopoverFor=function(b,d,e){return c={title:d,content:e,placement:"bottom"},"hoverShowClickHide"===k.popoverTrigger?(a(b).mouseover(function(){return a(b).popover("show"),a(".tag").not(b).popover("hide")}),a(document).click(function(){return a(b).popover("hide")})):c.trigger=k.popoverTrigger,a(b).popover(c)},this.toggleCloseColor=function(b){var c,d;return d=a(b.currentTarget),c=d.css("opacity"),c=.8>c?1:.6,d.css({opacity:c})},this.formatTag=function(a,b,c){var d;return null==c&&(c=!1),d=b.replace("<","&lt;").replace(">","&gt;"),k.template("tag",{tag:d,tagClass:k.tagClass,isPopover:k.displayPopovers,isReadOnly:c,tagSize:k.tagSize})},this.addDocumentListeners=function(){return a(document).mouseup(function(a){var b;return b=k.$(".tags-suggestion-list"),0===b.has(a.target).length?k.hideSuggestions():void 0})},this.template=function(a,b){return Tags.Templates.Template(this.getBootstrapVersion(),a,b)},this.$=function(b){return a(b,this.$element)},this.getBootstrapVersion=function(){return Tags.bootstrapVersion||this.bootstrapVersion},this.initializeDom=function(){return this.$element.append(this.template("tags_container"))},this.init=function(){return this.$element.addClass("bootstrap-tags").addClass("bootstrap-"+this.getBootstrapVersion()),this.initializeDom(),this.readOnly?(this.renderReadOnly(),this.removeTag=function(){},this.removeTagClicked=function(){},this.removeLastTag=function(){},this.addTag=function(){},this.addTagWithContent=function(){},this.renameTag=function(){},this.setPopover=function(){}):(this.input=a(this.template("input",{tagSize:this.tagSize})),this.suggestOnClick&&this.input.click(this.clickHandler),this.input.keydown(this.keyDownHandler),this.input.keyup(this.keyUpHandler),this.$element.append(this.input),this.$suggestionList=a(this.template("suggestion_list")),this.$element.append(this.$suggestionList),this.renderTags(),this.canAddByMaxNum()||this.disableInput(),this.addDocumentListeners())},this.init(),this},a.fn.tags=function(b){var c,d;return d={},c="number"==typeof b?b:-1,this.each(function(e,f){var g;return g=a(f),null==g.data("tags")&&g.data("tags",new a.tags(this,b)),c===e||0===e?d=g.data("tags"):void 0}),d}})}.call(this),function(){window.Tags||(window.Tags={}),Tags.Helpers||(Tags.Helpers={}),Tags.Helpers.addPadding=function(a,b,c){return null==b&&(b=1),null==c&&(c=!0),c?0===b?a:Tags.Helpers.addPadding("&nbsp"+a+"&nbsp",b-1):a}}.call(this),function(){var a;window.Tags||(window.Tags={}),Tags.Templates||(Tags.Templates={}),(a=Tags.Templates)["2"]||(a["2"]={}),Tags.Templates["2"].input=function(a){var b;return null==a&&(a={}),b=function(){switch(a.tagSize){case"sm":return"small";case"md":return"medium";case"lg":return"large"}}(),"<input type='text' class='tags-input input-"+b+"' />"}}.call(this),function(){var a;window.Tags||(window.Tags={}),Tags.Templates||(Tags.Templates={}),(a=Tags.Templates)["2"]||(a["2"]={}),Tags.Templates["2"].tag=function(a){return null==a&&(a={}),"<div class='tag label "+a.tagClass+" "+a.tagSize+"' "+(a.isPopover?"rel='popover'":"")+">    <span>"+Tags.Helpers.addPadding(a.tag,2,a.isReadOnly)+"</span>    "+(a.isReadOnly?"":"<a><i class='remove icon-remove-sign icon-white' /></a>")+"  </div>"}}.call(this),function(){var a;window.Tags||(window.Tags={}),Tags.Templates||(Tags.Templates={}),(a=Tags.Templates)["3"]||(a["3"]={}),Tags.Templates["3"].input=function(a){return null==a&&(a={}),"<input type='text' class='form-control tags-input input-"+a.tagSize+"' />"}}.call(this),function(){var a;window.Tags||(window.Tags={}),Tags.Templates||(Tags.Templates={}),(a=Tags.Templates)["3"]||(a["3"]={}),Tags.Templates["3"].tag=function(a){return null==a&&(a={}),"<div class='tag label "+a.tagClass+" "+a.tagSize+"' "+(a.isPopover?"rel='popover'":"")+">    <span>"+Tags.Helpers.addPadding(a.tag,2,a.isReadOnly)+"</span>    "+(a.isReadOnly?"":"<a><i class='remove glyphicon glyphicon-remove-sign glyphicon-white' /></a>")+"  </div>"}}.call(this),function(){var a;window.Tags||(window.Tags={}),Tags.Templates||(Tags.Templates={}),(a=Tags.Templates).shared||(a.shared={}),Tags.Templates.shared.suggestion_list=function(a){return null==a&&(a={}),'<ul class="tags-suggestion-list dropdown-menu"></ul>'}}.call(this),function(){var a;window.Tags||(window.Tags={}),Tags.Templates||(Tags.Templates={}),(a=Tags.Templates).shared||(a.shared={}),Tags.Templates.shared.tags_container=function(a){return null==a&&(a={}),'<div class="tags"></div>'}}.call(this),function(){var a;window.Tags||(window.Tags={}),Tags.Templates||(Tags.Templates={}),(a=Tags.Templates).shared||(a.shared={}),Tags.Templates.shared.tags_suggestion=function(a){return null==a&&(a={}),"<li class='tags-suggestion'>"+a.suggestion+"</li>"}}.call(this),function(){window.Tags||(window.Tags={}),Tags.Templates||(Tags.Templates={}),Tags.Templates.Template=function(a,b,c){return null!=Tags.Templates[a]&&null!=Tags.Templates[a][b]?Tags.Templates[a][b](c):Tags.Templates.shared[b](c)}}.call(this)}(window.jQuery);


});
