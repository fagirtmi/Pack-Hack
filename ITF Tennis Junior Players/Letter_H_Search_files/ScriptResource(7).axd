﻿Type.registerNamespace("AjaxControlToolkit.Animation");AjaxControlToolkit.Animation.AnimationBehavior=function(c){var b=null,a=this;AjaxControlToolkit.Animation.AnimationBehavior.initializeBase(a,[c]);a._onLoad=b;a._onClick=b;a._onMouseOver=b;a._onMouseOut=b;a._onHoverOver=b;a._onHoverOut=b;a._onClickHandler=b;a._onMouseOverHandler=b;a._onMouseOutHandler=b};AjaxControlToolkit.Animation.AnimationBehavior.prototype={initialize:function(){var a=this;AjaxControlToolkit.Animation.AnimationBehavior.callBaseMethod(a,"initialize");var b=a.get_element();if(b){a._onClickHandler=Function.createDelegate(a,a.OnClick);$addHandler(b,"click",a._onClickHandler);a._onMouseOverHandler=Function.createDelegate(a,a.OnMouseOver);$addHandler(b,"mouseover",a._onMouseOverHandler);a._onMouseOutHandler=Function.createDelegate(a,a.OnMouseOut);$addHandler(b,"mouseout",a._onMouseOutHandler)}},dispose:function(){var b=null,a=this,c=a.get_element();if(c){if(a._onClickHandler){$removeHandler(c,"click",a._onClickHandler);a._onClickHandler=b}if(a._onMouseOverHandler){$removeHandler(c,"mouseover",a._onMouseOverHandler);a._onMouseOverHandler=b}if(a._onMouseOutHandler){$removeHandler(c,"mouseout",a._onMouseOutHandler);a._onMouseOutHandler=b}}a._onLoad=b;a._onClick=b;a._onMouseOver=b;a._onMouseOut=b;a._onHoverOver=b;a._onHoverOut=b;AjaxControlToolkit.Animation.AnimationBehavior.callBaseMethod(a,"dispose")},get_OnLoad:function(){return this._onLoad?this._onLoad.get_json():null},set_OnLoad:function(b){var a=this;if(!a._onLoad){a._onLoad=new AjaxControlToolkit.Animation.GenericAnimationBehavior(a.get_element());a._onLoad.initialize()}a._onLoad.set_json(b);a.raisePropertyChanged("OnLoad");a._onLoad.play()},get_OnLoadBehavior:function(){return this._onLoad},get_OnClick:function(){return this._onClick?this._onClick.get_json():null},set_OnClick:function(b){var a=this;if(!a._onClick){a._onClick=new AjaxControlToolkit.Animation.GenericAnimationBehavior(a.get_element());a._onClick.initialize()}a._onClick.set_json(b);a.raisePropertyChanged("OnClick")},get_OnClickBehavior:function(){return this._onClick},OnClick:function(){if(this._onClick)this._onClick.play()},get_OnMouseOver:function(){return this._onMouseOver?this._onMouseOver.get_json():null},set_OnMouseOver:function(b){var a=this;if(!a._onMouseOver){a._onMouseOver=new AjaxControlToolkit.Animation.GenericAnimationBehavior(a.get_element());a._onMouseOver.initialize()}a._onMouseOver.set_json(b);a.raisePropertyChanged("OnMouseOver")},get_OnMouseOverBehavior:function(){return this._onMouseOver},OnMouseOver:function(){var a=this;if(a._onMouseOver)a._onMouseOver.play();if(a._onHoverOver){if(a._onHoverOut)a._onHoverOut.quit();a._onHoverOver.play()}},get_OnMouseOut:function(){return this._onMouseOut?this._onMouseOut.get_json():null},set_OnMouseOut:function(b){var a=this;if(!a._onMouseOut){a._onMouseOut=new AjaxControlToolkit.Animation.GenericAnimationBehavior(a.get_element());a._onMouseOut.initialize()}a._onMouseOut.set_json(b);a.raisePropertyChanged("OnMouseOut")},get_OnMouseOutBehavior:function(){return this._onMouseOut},OnMouseOut:function(){var a=this;if(a._onMouseOut)a._onMouseOut.play();if(a._onHoverOut){if(a._onHoverOver)a._onHoverOver.quit();a._onHoverOut.play()}},get_OnHoverOver:function(){return this._onHoverOver?this._onHoverOver.get_json():null},set_OnHoverOver:function(b){var a=this;if(!a._onHoverOver){a._onHoverOver=new AjaxControlToolkit.Animation.GenericAnimationBehavior(a.get_element());a._onHoverOver.initialize()}a._onHoverOver.set_json(b);a.raisePropertyChanged("OnHoverOver")},get_OnHoverOverBehavior:function(){return this._onHoverOver},get_OnHoverOut:function(){return this._onHoverOut?this._onHoverOut.get_json():null},set_OnHoverOut:function(b){var a=this;if(!a._onHoverOut){a._onHoverOut=new AjaxControlToolkit.Animation.GenericAnimationBehavior(a.get_element());a._onHoverOut.initialize()}a._onHoverOut.set_json(b);a.raisePropertyChanged("OnHoverOut")},get_OnHoverOutBehavior:function(){return this._onHoverOut}};AjaxControlToolkit.Animation.AnimationBehavior.registerClass("AjaxControlToolkit.Animation.AnimationBehavior",AjaxControlToolkit.BehaviorBase);AjaxControlToolkit.Animation.GenericAnimationBehavior=function(a){AjaxControlToolkit.Animation.GenericAnimationBehavior.initializeBase(this,[a]);this._json=null;this._animation=null};AjaxControlToolkit.Animation.GenericAnimationBehavior.prototype={dispose:function(){this.disposeAnimation();AjaxControlToolkit.Animation.GenericAnimationBehavior.callBaseMethod(this,"dispose")},disposeAnimation:function(){if(this._animation)this._animation.dispose();this._animation=null},play:function(){var a=this;if(a._animation&&!a._animation.get_isPlaying()){a.stop();a._animation.play()}},stop:function(){if(this._animation)if(this._animation.get_isPlaying())this._animation.stop(true)},quit:function(){if(this._animation)if(this._animation.get_isPlaying())this._animation.stop(false)},get_json:function(){return this._json},set_json:function(c){var a=this;if(a._json!=c){a._json=c;a.raisePropertyChanged("json");a.disposeAnimation();var b=a.get_element();if(b){a._animation=AjaxControlToolkit.Animation.buildAnimation(a._json,b);if(a._animation)a._animation.initialize();a.raisePropertyChanged("animation")}}},get_animation:function(){return this._animation}};AjaxControlToolkit.Animation.GenericAnimationBehavior.registerClass("AjaxControlToolkit.Animation.GenericAnimationBehavior",AjaxControlToolkit.BehaviorBase);