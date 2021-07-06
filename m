Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA103BDB41
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jul 2021 18:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhGFQUk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jul 2021 12:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhGFQUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jul 2021 12:20:40 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE58AC06175F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jul 2021 09:17:59 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y42so3999508lfa.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jul 2021 09:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1ODYYB2QtCfI4VTne1epa4291ax2k9Udt/QyHiMMPZs=;
        b=gztLyweZ9FU1xl1/2wFgZEOmWl+qxgYAlMLk/UHlPIQqcSDOUWAQO0/csSC+KyKAhq
         PS9a4X5qAat2k2YrFA+YGIwP9NdNnXqF5Eejamwi2ZGyg3XCRrBDQmrFlYJk7L8ZSKq0
         3ikoLgDoQdjqtmwHAU/an0g9v+mfdyDaFHjYIu+pU/J0yG1r2mLuw8QkMGtVQO0xtLVN
         okKDN/MkvPKeietgwTdXryt6W7gVnKOqMhRepBw06cLvLtnlZH+QNQQTxd0YLe9yHeIx
         u3Dkh+868p/5CCSH8qKUZaixs7D23w59qn35y+qGCU2lNUb0AWOTGLlNgA13BuxXsMd4
         3hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1ODYYB2QtCfI4VTne1epa4291ax2k9Udt/QyHiMMPZs=;
        b=bSRPpGX6L7trb23NoInqpFrrnucSRTJMvqJUg5dhix+MACEEL3sV7at0aszeISWIBb
         LAeOoMfw4H2ohtAUWfy4eytPNX2P39UoE6VA+uEyBj8JKy6gq7Smxpr7bZZmAVbL0Qts
         6QrWNhxfGjJXCA29TNcI6N7rd+2LCoI9KFm8bhLlz8+g3SvV5+kCl3UrA/98KxNZXBWA
         L5srL7St38Y2seEncdRTtBKhdsp1rFuVqEvIkRn0l4n4KcjcB5adw15uY1rWy4YiU2Pl
         0Ojr0eQAhJNNiQvr+HrUjSJu9BmxRYrj4vZvsvnjWCgww0MpmA0+EmFFP7TD1FtsflYH
         HNtg==
X-Gm-Message-State: AOAM530jJNKRte+ufbx+Yg6YjW9VI7zqRo6T8zkGCEz6tW5wBHPVo2ON
        6N6DMqE/3qevwrGH6F3XzMlP8Q==
X-Google-Smtp-Source: ABdhPJy5/ufvys2ah1U8F/IK+tJRKG4SPh1zlKGO0Kk81MoSBUpb1lA+7gb9ftylvKhMpXg55XomQw==
X-Received: by 2002:ac2:4556:: with SMTP id j22mr7251084lfm.162.1625588278256;
        Tue, 06 Jul 2021 09:17:58 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id q15sm792397lfm.235.2021.07.06.09.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 09:17:57 -0700 (PDT)
Date:   Tue, 6 Jul 2021 18:17:57 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] rcar-vin: Refactor controls creation for video
 device
Message-ID: <YOSCNRbLfPqPSG03@oden.dyn.berto.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-2-niklas.soderlund+renesas@ragnatech.se>
 <20210706160842.ruwejskmpbp6nyff@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210706160842.ruwejskmpbp6nyff@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello :-)

On 2021-07-06 18:08:42 +0200, Jacopo Mondi wrote:
> Hi again,
> 
> On Tue, Apr 13, 2021 at 08:02:43PM +0200, Niklas Söderlund wrote:
> > The controls for the video device are created in different code paths
> > depending on if the driver is using the media graph centric model (Gen3)
> > or the device centric model (Gen2 and earlier). This have lead to code
> > duplication that can be consolidated.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 82 +++++++++++----------
> >  1 file changed, 45 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index cb3025992817d625..c798dc9409e4cdcd 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -405,6 +405,45 @@ static const struct v4l2_ctrl_ops rvin_ctrl_ops = {
> >  	.s_ctrl = rvin_s_ctrl,
> >  };
> >
> > +static void rvin_free_controls(struct rvin_dev *vin)
> > +{
> > +	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > +	vin->vdev.ctrl_handler = NULL;
> > +}
> > +
> > +static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
> > +{
> > +	int ret;
> > +
> > +	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
> 
> Not a big deal, but 16 because we have to reserve space for the
> eventual subdevice controls ?

Yes, again for Gen2 where the controls of the subdevice are exposed on 
the video device. IIRC the number 16 comes from the soc-camera ancestor 
for this driver.

> 
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* The VIN directly deals with alpha component. */
> > +	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > +			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > +
> > +	if (vin->ctrl_handler.error) {
> > +		ret = vin->ctrl_handler.error;
> > +		rvin_free_controls(vin);
> > +		return ret;
> > +	}
> > +
> > +	/* For the non-MC mode add controls from the subdevice. */
> > +	if (subdev) {
> > +		ret = v4l2_ctrl_add_handler(&vin->ctrl_handler,
> > +					    subdev->ctrl_handler, NULL, true);
> > +		if (ret < 0) {
> > +			rvin_free_controls(vin);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> > +
> > +	return 0;
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Async notifier
> >   */
> > @@ -490,28 +529,10 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
> >  		return ret;
> >
> >  	/* Add the controls */
> > -	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
> > +	ret = rvin_create_controls(vin, subdev);
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > -			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > -
> > -	if (vin->ctrl_handler.error) {
> > -		ret = vin->ctrl_handler.error;
> > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > -		return ret;
> > -	}
> > -
> > -	ret = v4l2_ctrl_add_handler(&vin->ctrl_handler, subdev->ctrl_handler,
> > -				    NULL, true);
> > -	if (ret < 0) {
> > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > -		return ret;
> > -	}
> > -
> > -	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> > -
> >  	vin->parallel.subdev = subdev;
> >
> >  	return 0;
> > @@ -522,10 +543,8 @@ static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
> >  	rvin_v4l2_unregister(vin);
> >  	vin->parallel.subdev = NULL;
> >
> > -	if (!vin->info->use_mc) {
> > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > -		vin->vdev.ctrl_handler = NULL;
> > -	}
> > +	if (!vin->info->use_mc)
> > +		rvin_free_controls(vin);
> >  }
> >
> >  static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
> > @@ -935,21 +954,10 @@ static int rvin_mc_init(struct rvin_dev *vin)
> >  	if (ret)
> >  		rvin_group_put(vin);
> >
> > -	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);
> > +	ret = rvin_create_controls(vin, NULL);
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > -			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > -
> > -	if (vin->ctrl_handler.error) {
> > -		ret = vin->ctrl_handler.error;
> > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > -		return ret;
> > -	}
> > -
> > -	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> > -
> >  	return ret;
> >  }
> >
> > @@ -1446,7 +1454,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
> >  	return 0;
> >
> >  error_group_unregister:
> > -	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > +	rvin_free_controls(vin);
> >
> >  	if (vin->info->use_mc) {
> >  		mutex_lock(&vin->group->lock);
> > @@ -1481,7 +1489,7 @@ static int rcar_vin_remove(struct platform_device *pdev)
> >  		rvin_group_put(vin);
> >  	}
> >
> > -	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > +	rvin_free_controls(vin);
> >
> >  	rvin_dma_unregister(vin);
> >
> > --
> > 2.31.1
> >

-- 
Regards,
Niklas Söderlund
