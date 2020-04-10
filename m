Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE331A42ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 09:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgDJHUs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 03:20:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34602 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgDJHUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 03:20:48 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B765329;
        Fri, 10 Apr 2020 09:20:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586503247;
        bh=tFMI0mNtVR39dPPoUAS4kwoq5cDx/PgdYkp+PZYi1kw=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=wgvMpCsN7hqZ/r1Ee/CU10PE9d/dZqhT1pmLBIuMhyIHtwwXuI9/S5KEqcUD21WLJ
         szma8OdXMHkd+WOb3HjKBCWR6zEE3Ft2Nk8bYxo1U5z/CJQf5mPRZ51b8sFYQ1zVys
         2Q5eKyCqGciTMopdhYnE6rkwCE/lvWqUSuGRBoXs=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] squash! i2c: max9286: Put of node on error
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200409121202.11130-3-kieran.bingham+renesas@ideasonboard.com>
 <20200409170806.1842811-1-jacopo+renesas@jmondi.org>
 <20200409202027.4qmv7oy2p3n2arc6@uno.localdomain>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <67da976f-1cec-e871-e401-9fe2afb002f3@ideasonboard.com>
Date:   Fri, 10 Apr 2020 08:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200409202027.4qmv7oy2p3n2arc6@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/04/2020 21:20, Jacopo Mondi wrote:
> Dunno why, I formatted the patch in a way others interested parties
> have been removed from the Cc list, just noticed :/
> 
> It's such a minor fix I won't bother resending I think
> 
> On Thu, Apr 09, 2020 at 07:08:06PM +0200, Jacopo Mondi wrote:
>> Put the device of node in case of dt parsing error.
>>
>> Fixes: 9eed4185c7a0 ("media: i2c: Add MAX9286 driver")
> 
> Also this is a leftover from where this was intended to be sent out a
> patch on it's own
> 

Added to my branch, so it will be included in the next squash.

Thanks.

--
Kieran


>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> ---
>>  drivers/media/i2c/max9286.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index 241deed0f270..bac9696f83b4 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -1121,6 +1121,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>>  	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
>>  	if (!i2c_mux) {
>>  		dev_err(dev, "Failed to find i2c-mux node\n");
>> +		of_node_put(dev->of_node);
>>  		return -EINVAL;
>>  	}
>>
>> @@ -1168,6 +1169,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>>  					of_fwnode_handle(node), &vep);
>>  			if (ret) {
>>  				of_node_put(node);
>> +				of_node_put(dev->of_node);
>>  				return ret;
>>  			}
>>
>> @@ -1177,6 +1179,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>>  					vep.bus_type);
>>  				v4l2_fwnode_endpoint_free(&vep);
>>  				of_node_put(node);
>> +				of_node_put(dev->of_node);
>>  				return -EINVAL;
>>  			}
>>
>> @@ -1214,6 +1217,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>>  		priv->nsources++;
>>  	}
>>  	of_node_put(node);
>> +	of_node_put(dev->of_node);
>>
>>  	priv->route_mask = priv->source_mask;
>>
>> --
>> 2.26.0
>>

