Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C796526C275
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 14:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgIPMEL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 08:04:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50262 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbgIPKch (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 06:32:37 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 301FD57F;
        Wed, 16 Sep 2020 12:30:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600252258;
        bh=bq8JOgYtfbTgci4Z2CMiRZs2gfY9Fc26Ta11Cn2aIM4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZNJPijepkpE3R7yAlC4dR+LiAoxbluksW+bDmSE5gxwFYl/ZAoaFWE5rMHV9XuPWl
         klyKQoQ+HsD3EuwghLRe4DhjZYdH4hfwYM+EQP7oNxQOJ+0rjKsbW2+dKD20VmrzY4
         IiyB/l8hLG239NC3N/UWEg2gsqQXOelPNc3jfawo=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: i2c: max9286: Fix async subdev size
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20200914155749.183030-1-jacopo+renesas@jmondi.org>
 <20200914233008.GF15543@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2cdbe0b5-14fc-c6eb-80df-3adaf19ac844@ideasonboard.com>
Date:   Wed, 16 Sep 2020 11:30:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914233008.GF15543@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15/09/2020 00:30, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Mon, Sep 14, 2020 at 05:57:49PM +0200, Jacopo Mondi wrote:
>> Since commit:
>> 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
>> the async subdevice registered to the max9286 notifier is dynamically
>> allocated by the v4l2 framework by using
>> the v4l2_async_notifier_add_fwnode_subdev function. In order to allocate
>> enough space for max9286_asd structure that encloses the async subdevice
>> paired with a pointer to the corresponding source, pass to the framework
>> the size of the whole structure in place of the one of the enclosed async
>> subdev.
>>
>> Fixes: 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> ---
>>  drivers/media/i2c/max9286.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
>> index c82c1493e099..746c411b79a0 100644
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -579,8 +579,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
>>  		struct v4l2_async_subdev *asd;
>>
>>  		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
>> -							    source->fwnode,
>> -							    sizeof(*asd));
>> +			source->fwnode, sizeof(struct max9286_asd));
> 
> I'd write
> 
> 		struct v4l2_async_subdev *asd;
> 		struct max9286_asd *masd;
> 
> 		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
> 							    source->fwnode,
> 							    sizeof(*masd));

Ha, at first glance that looks like you're dereferencing an
uninitialised pointer though.

But it's only the sizeof - so the actual pointer doesn't matter at that
point ;-)

--
Kieran


> 		if (IS_ERR(asd)) {
> 			dev_err(dev, "Failed to add subdev for source %u: %ld",
> 				i, PTR_ERR(asd));
> 			v4l2_async_notifier_cleanup(&priv->notifier);
> 			return PTR_ERR(asd);
> 		}
> 
> 		masd = to_max9286_asd(asd);
> 		masd->source = source;
> 
> just to be able to avoid the ugly indentiation, but that's really
> nitpicking :-) With or without that, sorry for breaking the driver in
> the first place, and
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>>  		if (IS_ERR(asd)) {
>>  			dev_err(dev, "Failed to add subdev for source %u: %ld",
>>  				i, PTR_ERR(asd));
> 

