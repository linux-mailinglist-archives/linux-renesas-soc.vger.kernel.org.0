Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3EC1A458C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 13:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgDJLPf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 07:15:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40286 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgDJLPb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 07:15:31 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D17A5329;
        Fri, 10 Apr 2020 13:15:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586517330;
        bh=EC1Za9eW5ayrdbiizZc2mUGuvzN/kcydyN/KK+vY6fo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RsMl3mmEriIW3Xg7tCFjYtChXNDacoM3uCrHvj8hHbnj7faR1UY/L7pt8w0t5kVsQ
         9sND9qwlvvfYe+xJl7UqBGH6OT6FCiAqqZI8mYmTVCW7j9rUPTx4VHgNugGBlu1zoA
         hKObqcQSI8XpvwhFBUXHRo7BygaWARNs0KBkZjPg=
Date:   Fri, 10 Apr 2020 14:15:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 02/13] squash! max9286: convert probe kzalloc
Message-ID: <20200410111519.GA4751@pendragon.ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-3-kieran.bingham+renesas@ideasonboard.com>
 <20200409163333.GA25086@pendragon.ideasonboard.com>
 <ef7fc3df-c84f-0c3d-a34f-73460a9c1478@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef7fc3df-c84f-0c3d-a34f-73460a9c1478@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Fri, Apr 10, 2020 at 09:20:25AM +0100, Kieran Bingham wrote:
> On 09/04/2020 17:33, Laurent Pinchart wrote:
> > On Thu, Apr 09, 2020 at 01:11:51PM +0100, Kieran Bingham wrote:
> >> v8:
> >>  - Convert probe kzalloc usage to devm_ variant
> > 
> > This isn't worse than the existing code, but are you aware that devm_*
> > should not be used in this case ? The memory should be allocated with
> > kzalloc() and freed in the .release() operation.
> 
> This change was at the request of a review comment from Sakari.
> 
> From:
> https://lore.kernel.org/linux-media/4139f241-2fde-26ad-fe55-dcaeb76ad6cc@ideasonboard.com/
>
> >>> +
> >>> +static int max9286_probe(struct i2c_client *client)
> >>> +{
> >>> +	struct max9286_priv *priv;
> >>> +	unsigned int i;
> >>> +	int ret;
> >>> +
> >>> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> >>> +	if (!priv)
> >>> +		return -ENOMEM;
> >> 
> >> You won't lose anything by using the devm_ variant here.
> > 
> > Indeed,
> > 
> >>> +
> >>> +	priv->client = client;
> >>> +	i2c_set_clientdata(client, priv);
> >>> +
> >>> +	for (i = 0; i < MAX9286_N_SINKS; i++)
> >>> +		max9286_init_format(&priv->fmt[i]);
> >>> +
> >>> +	ret = max9286_parse_dt(priv);
> >>> +	if (ret)
> >>> +		return ret;
> >> 
> >> But you can avoid accidental memory leaks for nothing. :-)
> > 
> > It would be good not to leak indeed!
> 
> I understand that there are lifetime issues in V4L2 - but in my opinion
> that needs to be handled by core V4l2 (and or support from driver core
> framework).

I'm afraid that's not possible. The V4L2 core can't delay remove().
There are helpers we could create to simplify correct memory management
for drivers, but in any case, devm_kzalloc() isn't correct.

There are also issues in the core that would make unbinding unsafe even
if correctly implemented in this driver, but a correct implementation in
drivers will be required in any case.

As I said before this patch isn't a regression as memory allocation is
already broken here, but it doesn't go in the right direction either.

> Also - isn't it highly unlikely to affect the max9286? Isn't the
> lifetime issue that the device can be unplugged while the file handle is
> open?
> 
> I don't think anyone is going to 'unplug' the max9286 while it's active :-)

No, but someone could unbind it through sysfs. In any case it's not an
excuse to not implement memory allocation correctly :-)

> >> ---
> >>  drivers/media/i2c/max9286.c | 5 +----
> >>  1 file changed, 1 insertion(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> >> index b84d2daa6561..0a43137b8112 100644
> >> --- a/drivers/media/i2c/max9286.c
> >> +++ b/drivers/media/i2c/max9286.c
> >> @@ -1155,7 +1155,7 @@ static int max9286_probe(struct i2c_client *client)
> >>  	unsigned int i;
> >>  	int ret;
> >>  
> >> -	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> >> +	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
> >>  	if (!priv)
> >>  		return -ENOMEM;
> >>  
> >> @@ -1232,7 +1232,6 @@ static int max9286_probe(struct i2c_client *client)
> >>  	max9286_configure_i2c(priv, false);
> >>  err_free:
> >>  	max9286_cleanup_dt(priv);
> >> -	kfree(priv);
> >>  
> >>  	return ret;
> >>  }
> >> @@ -1253,8 +1252,6 @@ static int max9286_remove(struct i2c_client *client)
> >>  
> >>  	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> >>  
> >> -	kfree(priv);
> >> -
> >>  	return 0;
> >>  }
> >>  

-- 
Regards,

Laurent Pinchart
