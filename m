Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5F015BC5A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2020 11:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbgBMKHY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Feb 2020 05:07:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44242 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729531AbgBMKHY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 05:07:24 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CED59504;
        Thu, 13 Feb 2020 11:07:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581588442;
        bh=oIIh3RzDHKdztgVuA5lIik27olUj9jZvuNwQ0f9zFJ4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=n3g/PRUGaqyzvDSZ07ULyPLUrVvxyc2e1JiD+/lDoKjKPQzm2dZa1sBOdxJyIw7/6
         bm5FzpjHSSFzWLGX1XWFpK2tQ9UsA200glW5MLF0esfhsFeVIVgvzh5CxAzhEEdPkR
         y1NoudtMC5BiUaBERGCzZ98Rm8/RgCCK1T7TiSaE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 1/2] max9286: Split out async registration
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
 <20200212173727.19476-2-kieran.bingham+renesas@ideasonboard.com>
 <20200213094614.fqie2a7smfjiyzv7@uno.localdomain>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ff9361c1-aae4-4bd3-3851-3e205c53f342@ideasonboard.com>
Date:   Thu, 13 Feb 2020 10:07:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200213094614.fqie2a7smfjiyzv7@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 13/02/2020 09:46, Jacopo Mondi wrote:
> Hi Kieran,
>   very nice thanks for handling this

:-)

> Just a few minors

:-s hehe

> 
> On Wed, Feb 12, 2020 at 05:37:26PM +0000, Kieran Bingham wrote:
>> Move all the V4L2 Subdev Async registration so that it can only happen once
>> we know we will not need to -EPROBE_DEFER...
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/media/i2c/max9286.c | 88 +++++++++++++++++++++++--------------
>>  1 file changed, 55 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index 1b4ff3533795..03c5fa232b6d 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -503,6 +503,49 @@ static const struct v4l2_async_notifier_operations max9286_notify_ops = {
>>  	.unbind = max9286_notify_unbind,
>>  };
>>
>> +static int max9286_v4l2_async_register(struct max9286_priv *priv)
> 
> Could you capture in the function name this actually deals with
> notifiers ? Like max9286_notifier_register() or similar...

I'd like to keep the 'v4l2' in there somewhere...

	max9286_v4l2_notifier_register() ?

But then maybe even that could be confused with the notifiers/async
handling for the max9286 itself.

My aim was that max9286_v4l2_async_{un,}register() dealt with subdevices
connected to the max9286 only ...

For ~20 lines of code, it could be inlined up a level into
max9286_v4l2_register() but I do perhaps like trying to keep the
symmetry clean somehow.

<scratch that - below tells me not to inline>


>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct max9286_source *source = NULL;
>> +	int ret;
>> +
> 
> Do we want to init and register the notifier if there are no sources
> connected ? I would keep
> 
> 	if (!priv->nsources)
> 		return 0;
> 
> here or in the caller.

Ah yes, I had thought about that but clearly not acted upon it much.

If we know there is nothing to notify us, I guess we won't expect any
need to register the notifications!

Although this would certainly mean keeping the sources registration in
their own functions.


> 
>> +	v4l2_async_notifier_init(&priv->notifier);
>> +
>> +	for_each_source(priv, source) {
>> +		unsigned int i = to_index(priv, source);
>> +
>> +		dev_err(dev, "Registering v4l2-async for source %d\n", i);
> 
> dev_err ?
> 

Already removed, left over debug print.


>> +
>> +		source->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
>> +		source->asd.match.fwnode = source->fwnode;
>> +
>> +		ret = v4l2_async_notifier_add_subdev(&priv->notifier,
>> +						     &source->asd);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to add subdev for source %d", i);
>> +			v4l2_async_notifier_cleanup(&priv->notifier);
> 
> v4l2_async_notifier_cleanup() does fwnode_handle_put() on the async
> subdevs registered to the notifier but not yet completed. All the other
> sources have to be put as well I think.
> 
> How to do so might be not nice, as you would need to keep track of which
> sources have been registered to the notifier already and put the other
> ones in the error path.

Or can we move all fwnode refcounting back to cleanup_dt perhaps?

I'll have a look.

> 
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	priv->notifier.ops = &max9286_notify_ops;
>> +
>> +	ret = v4l2_async_subdev_notifier_register(&priv->sd, &priv->notifier);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register subdev_notifier");
>> +		v4l2_async_notifier_cleanup(&priv->notifier);
> 
> Here it's fine to call notifier_cleanup()
> 
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void max9286_v4l2_async_unregister(struct max9286_priv *priv)
>> +{
>> +	v4l2_async_notifier_unregister(&priv->notifier);
>> +	v4l2_async_notifier_cleanup(&priv->notifier);
> 
> I would first cleanup() then unregister() even if they deal with two
> different sets of asds (done and registred-but-not-yet-done ones).


Looking at max9286_v4l2_async_register(), the
v4l2_async_subdev_notifier_register() call is last.

Therefore that would make it the first thing to cleanup in the reverse
procedure?


> 
>> +}
>> +
>>  static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>>  {
>>  	struct max9286_priv *priv = sd_to_max9286(sd);
>> @@ -870,6 +913,13 @@ static int max9286_init(struct device *dev)
>>  		goto err_regulator;
>>  	}
>>
>> +	/* Register v4l2 async notifiers */
>> +	ret = max9286_v4l2_async_register(priv);
>> +	if (ret) {
>> +		dev_err(dev, "Unable to register V4L2 async notifiers\n");
>> +		goto err_regulator;
>> +	}
>> +
>>  	v4l2_i2c_subdev_init(&priv->sd, client, &max9286_subdev_ops);
>>  	priv->sd.internal_ops = &max9286_subdev_internal_ops;
>>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> @@ -884,7 +934,7 @@ static int max9286_init(struct device *dev)
>>  	priv->sd.ctrl_handler = &priv->ctrls;
>>  	ret = priv->ctrls.error;
>>  	if (ret)
>> -		goto err_regulator;
>> +		goto err_async;
>>
>>  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>>
>> @@ -927,6 +977,8 @@ static int max9286_init(struct device *dev)
>>  	max9286_i2c_mux_close(priv);
>>  err_put_node:
>>  	fwnode_handle_put(ep);
>> +err_async:
>> +	max9286_v4l2_async_unregister(priv);
>>  err_regulator:
>>  	regulator_disable(priv->regulator);
>>  	priv->poc_enabled = false;
>> @@ -938,14 +990,6 @@ static void max9286_cleanup_dt(struct max9286_priv *priv)
>>  {
>>  	struct max9286_source *source;
>>
>> -	/*
>> -	 * Not strictly part of the DT, but the notifier is registered during
>> -	 * max9286_parse_dt(), and the notifier holds references to the fwnodes
>> -	 * thus the cleanup is here to mirror the registration.
>> -	 */
>> -	v4l2_async_notifier_unregister(&priv->notifier);
>> -	v4l2_async_notifier_cleanup(&priv->notifier);
>> -
>>  	for_each_source(priv, source) {
>>  		fwnode_handle_put(source->fwnode);
> 
> Wasn't this a double fwnode_handle_put() ? We called
> notifier_cleanup() and then put all sources again manually.
> 
> I don't see one more get() when the asd gets registered to the
> notifier with v4l2_async_notifier_add_subdev() so I'm afraid this
> would result in a duplicated put(). Am I wrong ?

Agh, all the implicit transfers of ownerships for refcnting with fwnodes
is horrible.

I hadn't actually noticed that _notifier_cleanup() was doing
fwnode_handle_puts() ...

But indeed, all of that was pre-existing before this patch series. Not
something I was looking to modify as part of this patch.

Lets fix that issue on top.

(which is going to get squashed in all the same, but I'm not going to
change /this/ patch for it)


> It was there already, but I think it happens in this patch as
> well: if max9286_init() fails calls max9286_v4l2_unregister() which
> then calls max9286_v4l2_async_unregister() which put all the
> not-yet-completed subdevs by calling v4l2_async_notifier_cleanup().
> Then in the probe() function error path we then call
> max9286_cleanup_dt() which puts again all the registered sources
> regardless of their completed status.

> I would call max9286_cleanup_dt() only if max9286_init() has not been
> called yet. If we get to register subdevs to the notifier, I would
> then provide a function that calls v4l2_async_notifier_cleanup() and
> then manually puts all sources not yet registered. I'm afraid this
> would need to keep a status flag in the source, unless you have a more
> elegant solution.

It seems like we also have the issue where we need to cleanup partially
registered sources, (i.e. if some have registered, and some haven't) ...
so how about a per-source flag to note that the device /got/ registered,
and thus 'ownership' moved to V4L2 v4l2_async_notifier_cleanup() to _put().

Then we can maintain a single cleanup function still, and it will be
handled on a per-node basis.

--
KB



> 
> Thanks
>    j
> 
>>  		source->fwnode = NULL;
>> @@ -958,7 +1002,6 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>>  	struct device_node *i2c_mux;
>>  	struct device_node *node = NULL;
>>  	unsigned int i2c_mux_mask = 0;
>> -	int ret;
>>
>>  	of_node_get(dev->of_node);
>>  	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
>> @@ -986,8 +1029,6 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>>  	of_node_put(node);
>>  	of_node_put(i2c_mux);
>>
>> -	v4l2_async_notifier_init(&priv->notifier);
>> -
>>  	/* Parse the endpoints */
>>  	for_each_endpoint_of_node(dev->of_node, node) {
>>  		struct max9286_source *source;
>> @@ -1056,34 +1097,14 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>>  			continue;
>>  		}
>>
>> -		source->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
>> -		source->asd.match.fwnode = source->fwnode;
>> -
>> -		ret = v4l2_async_notifier_add_subdev(&priv->notifier,
>> -						     &source->asd);
>> -		if (ret) {
>> -			v4l2_async_notifier_cleanup(&priv->notifier);
>> -			of_node_put(node);
>> -			return ret;
>> -		}
>> -
>>  		priv->source_mask |= BIT(ep.port);
>>  		priv->nsources++;
>>  	}
>>  	of_node_put(node);
>>
>> -	/* Do not register the subdev notifier if there are no devices. */
>> -	if (!priv->nsources)
>> -		return 0;
>> -
>>  	priv->route_mask = priv->source_mask;
>> -	priv->notifier.ops = &max9286_notify_ops;
>> -
>> -	ret = v4l2_async_subdev_notifier_register(&priv->sd, &priv->notifier);
>> -	if (ret)
>> -		v4l2_async_notifier_cleanup(&priv->notifier);
>>
>> -	return ret;
>> +	return 0;
>>  }
>>
>>  static int max9286_probe(struct i2c_client *client)
>> @@ -1182,6 +1203,7 @@ static int max9286_remove(struct i2c_client *client)
>>
>>  	fwnode_handle_put(priv->sd.fwnode);
>>  	v4l2_async_unregister_subdev(&priv->sd);
>> +	max9286_v4l2_async_unregister(priv);
>>
>>  	if (priv->poc_enabled)
>>  		regulator_disable(priv->regulator);
>> --
>> 2.20.1
>>

