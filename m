Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4F2010D51C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2019 12:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfK2LqB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Nov 2019 06:46:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35600 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2LqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Nov 2019 06:46:01 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11EC323F;
        Fri, 29 Nov 2019 12:45:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575027958;
        bh=HfJtYMq3H8DRkuTkQHN1bHi0lSI+fDSl9Talkigl/1Y=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CSB7m6KkjaLz/rlr5oqhnxs48RWuzoM0RM7NVeMq0uf/xNhvTUmfgp+fW+XDxUXqP
         GDQV/G46onrtqAkyYG12XLlJtt/hK5cvgTOYEe3R4Qj6q8J7wOP9g/UX8kx3yJ+0qn
         ADoPowNDj4IUah06mbEzXDRdEW2jWDYrjR6Is6qM=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] max9286: simplify i2c-mux parsing
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
 <20191121165631.5744-1-kieran.bingham@ideasonboard.com>
 <20191121173541.sb4ycbinjkhvzmso@uno.localdomain>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <a951c2c4-b590-491e-77e1-2a8d2793c6f8@ideasonboard.com>
Date:   Fri, 29 Nov 2019 11:45:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121173541.sb4ycbinjkhvzmso@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 21/11/2019 17:35, Jacopo Mondi wrote:
> Hi Kieran,
> 
> On Thu, Nov 21, 2019 at 04:56:31PM +0000, Kieran Bingham wrote:
>>  - Identify each enabled i2c-mux channel in a single pass
>>
>> The parse_dt function iterates each node in the i2c-mux for each endpoint looking for a match.
>> The only purpose of these iterations is to determine if the corresponding i2c-channel
>> is enabled. (status = 'okay').
>>
>> Iterate the i2c-mux nodes in a single pass storing the enable state
>> in a local i2c_mux_mask for use when parsing the endpoints.
>>
> 
> I very much agree with this :)

Great,

> 
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>  drivers/media/i2c/max9286.c | 84 +++++++++++++++----------------------
>>  1 file changed, 34 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index 34cb6f3b40c2..a36132becdc7 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -1097,55 +1097,6 @@ static int max9286_is_bound(struct device *dev, void *data)
>>  	return 0;
>>  }
>>
>> -static struct device_node *max9286_get_i2c_by_id(struct device_node *parent,
>> -						 u32 id)
>> -{
>> -	struct device_node *i2c_mux;
>> -	struct device_node *child;
>> -
>> -	/* Balance the of_node_put() performed by of_find_node_by_name() */
>> -	of_node_get(parent);
>> -
>> -	i2c_mux = of_find_node_by_name(parent, "i2c-mux");
>> -	if (!i2c_mux) {
>> -		printk("max9286: Failed to find i2c-mux node\n");
>> -		return NULL;
>> -	}
>> -
>> -	for_each_child_of_node(i2c_mux, child) {
>> -		u32 i2c_id = 0;
>> -
>> -		if (of_node_cmp(child->name, "i2c") != 0)
>> -			continue;
>> -		of_property_read_u32(child, "reg", &i2c_id);
>> -		if (id == i2c_id)
>> -			return child;
>> -	}
>> -
>> -	return NULL;
>> -}
>> -
>> -static int max9286_check_i2c_bus_by_id(struct device *dev, int id)
>> -{
>> -	struct device_node *i2c_np;
>> -
>> -	i2c_np = max9286_get_i2c_by_id(dev->of_node, id);
>> -	if (!i2c_np) {
>> -		dev_err(dev, "Failed to find corresponding i2c@%u\n", id);
>> -		return -ENODEV;
>> -	}
>> -
>> -	if (!of_device_is_available(i2c_np)) {
>> -		dev_dbg(dev, "Skipping port %u with disabled I2C bus\n", id);
>> -		of_node_put(i2c_np);
>> -		return -ENODEV;
>> -	}
>> -
>> -	of_node_put(i2c_np);
>> -
>> -	return 0;
>> -}
>> -
>>  static void max9286_cleanup_dt(struct max9286_priv *priv)
>>  {
>>  	struct max9286_source *source;
>> @@ -1167,11 +1118,44 @@ static void max9286_cleanup_dt(struct max9286_priv *priv)
>>  static int max9286_parse_dt(struct max9286_priv *priv)
>>  {
>>  	struct device *dev = &priv->client->dev;
>> +	struct device_node *i2c_mux;
>> +	struct device_node *child = NULL;
>>  	struct device_node *ep_np = NULL;
> 
> Nit: could you re-use child or ep_np ?

Yes, that would reduce local vars. I'll do this now.


> 
>> +	unsigned int i2c_mux_mask = 0;
>>  	int ret;
>>
>> +	/* Balance the of_node_put() performed by of_find_node_by_name() */
> 
> Do you need this comment ?


It was non-obvious to me at least when I added it /why/ I had to get it.
But perhaps now I've got further along, it's more clear why.

DT references are a pain :-D
Lots of places where they are implicitly reduced in loops etc..



>> +	of_node_get(dev->of_node);
>> +	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
>> +	if (!i2c_mux) {
>> +		dev_err(dev, "Failed to find i2c-mux node\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Identify which i2c-mux channels are enabled */
>> +	for_each_child_of_node(i2c_mux, child) {
>> +		u32 id = 0;
>> +
>> +		if (of_node_cmp(child->name, "i2c") != 0)
>> +			continue;
> 
> With the new bindings in yaml format and the associated verification,
> this should not happen.

Aha, yes I think you're right - well in that case I'm happy to drop it,
and simplify the code.
>> +
>> +		of_property_read_u32(child, "reg", &id);
>> +		if (id >= MAX9286_NUM_GMSL)
>> +			continue;
>> +
>> +		if (!of_device_is_available(child)) {
>> +			dev_dbg(dev, "Skipping port %u with disabled I2C bus\n", id);
>> +			continue;
>> +		}
>> +
>> +		i2c_mux_mask |= BIT(id);
>> +	}
>> +	of_node_put(child);
>> +	of_node_put(i2c_mux);
>> +
>>  	v4l2_async_notifier_init(&priv->notifier);
>>
>> +	/* Parse the endpoints */
>>  	for_each_endpoint_of_node(dev->of_node, ep_np) {
> 
> dev->of_node is reused here, do you need to get it again ?

Urggh, no idea ... I'll investigate.
The earlier one crashed on me, this one did not ... but better to get it
'right'.


> All minors though, squash this on the next max9286 submission if you
> feel to.

Thanks.

--
Kieran


> 
> Thanks
>    j
> 
>>  		struct max9286_source *source;
>>  		struct of_endpoint ep;
>> @@ -1214,7 +1198,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>>  		}
>>
>>  		/* Skip if the corresponding GMSL link is unavailable. */
>> -		if (max9286_check_i2c_bus_by_id(dev, ep.port))
>> +		if (!(i2c_mux_mask & BIT(ep.port)))
>>  			continue;
>>
>>  		if (priv->sources[ep.port].fwnode) {
>> --
>> 2.20.1
>>

-- 
Regards
--
Kieran
