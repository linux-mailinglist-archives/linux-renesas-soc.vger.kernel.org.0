Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67ECA3C1643
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jul 2021 17:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbhGHPti (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jul 2021 11:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbhGHPtf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 11:49:35 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832DEC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jul 2021 08:46:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t17so17153404lfq.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jul 2021 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TD8Smt1bXWAJ7MMJq+svsfAjl057mvEFrd7U4Uaqb+4=;
        b=zvRA6A7C1CG1aPTKXwxdfxoSLUC1vszrgFrP/qa515sNWs2nE1Eb6xVKjWRs9Whvql
         Xo2o1LPgnTdxhJNXxMk2yREqfURrMsFSubM3zo+dGzEfuqGFL56IgKUi9z9P996IueyZ
         p+wPG2DSq/tFizlDMgTrl22WCyOcWdmT5FS8ZNeLVoA+MGtztrc3s9zNvgB/meuSWn76
         xXs1u6Lhj+Uvleu/NofA1ag6tXDR36DgmX1hHKai8xrVoFrndN5Pw+p7Gq7Cu95xouLC
         DJf5ZDaUb2kNbd2QFAQRW88EUFrEql7zXCAZ2VP2O5wZ31WOfpKvKQdGA8wH825n4RbH
         j4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TD8Smt1bXWAJ7MMJq+svsfAjl057mvEFrd7U4Uaqb+4=;
        b=ojfCoiu3gtfa6dE8cG9rh/GDhak/5GoRMNqURacA948U/2JwFM9M7tYwvKU+sHu7kL
         ilbgYWdjPvp5hyM6PumTIMSJZ7xTD3IFaN/pUUAEx501LSqKT+mSm2ul46t6h0P9SQtP
         ybtJE3IkrKBbPYm9eSuD6BphwAhRMLPJPPzEVH/1BQwda7nzZsAUBKvVnqRbEI6kWWNI
         jvdM0ljh5BJZig4ErOBtzyPRznddfvEMT6KEV7bsfuNLKoQqXmzagA5zuYZ6EjECR6gM
         DNRcpLm1lG/mh0kElp5gTCAaaFKxFX/1w5vzn/2j7Cn0tJpuF2Paoru9RTr9VyI2hD9D
         4d4w==
X-Gm-Message-State: AOAM532CvSrzRztUUdY4IKdlmNlUAJV7RrLB3d+jfw3YEYUQK5vIxPux
        O3JHPfmwJ1gi1zEwrwLsQxyMj8pJTB3GFjQd
X-Google-Smtp-Source: ABdhPJw5YpEHXPgniVFiQCVAq8WVBxRpDZg+J0gslyaMPxKOyNcYVbyOmA9jGDYAsM7RlBrIA5NimQ==
X-Received: by 2002:a05:6512:15a2:: with SMTP id bp34mr23897999lfb.40.1625759210804;
        Thu, 08 Jul 2021 08:46:50 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id x14sm246457lfg.220.2021.07.08.08.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 08:46:49 -0700 (PDT)
Date:   Thu, 8 Jul 2021 17:46:48 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 08/11] rcar-vin: Create a callback to setup media links
Message-ID: <YOcd6FgzdSbUV5kk@oden.dyn.berto.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-9-niklas.soderlund+renesas@ragnatech.se>
 <20210707103355.wu75k2zskwq2ofy4@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210707103355.wu75k2zskwq2ofy4@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your review effort.

On 2021-07-07 12:33:55 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Tue, Apr 13, 2021 at 08:02:50PM +0200, Niklas Söderlund wrote:
> > New IP versions will have different media graphs and require a different
> > link setup. Breakout the specific link setup to a callback that are
> > associated with the group.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 97 ++++++++++++---------
> >  drivers/media/platform/rcar-vin/rcar-vin.h  |  3 +
> >  2 files changed, 57 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index 2628637084ae2aa9..d03ecd443b01c2b3 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -247,7 +247,8 @@ static void rvin_group_cleanup(struct rvin_group *group)
> >  	mutex_destroy(&group->lock);
> >  }
> >
> > -static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> > +static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
> > +			   void (*link_setup)(struct rvin_dev *))
> >  {
> >  	struct media_device *mdev = &group->mdev;
> >  	const struct of_device_id *match;
> > @@ -263,6 +264,8 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
> >
> >  	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
> >
> > +	group->link_setup = link_setup;
> > +
> >  	mdev->dev = vin->dev;
> >  	mdev->ops = &rvin_media_ops;
> >
> > @@ -295,7 +298,8 @@ static void rvin_group_release(struct kref *kref)
> >  	mutex_unlock(&rvin_group_lock);
> >  }
> >
> > -static int rvin_group_get(struct rvin_dev *vin)
> > +static int rvin_group_get(struct rvin_dev *vin,
> > +			  void (*link_setup)(struct rvin_dev *))
> >  {
> >  	struct rvin_group *group;
> >  	u32 id;
> > @@ -327,7 +331,7 @@ static int rvin_group_get(struct rvin_dev *vin)
> >  			goto err_group;
> >  		}
> >
> > -		ret = rvin_group_init(group, vin);
> > +		ret = rvin_group_init(group, vin, link_setup);
> >  		if (ret) {
> >  			kfree(group);
> >  			vin_err(vin, "Failed to initialize group\n");
> > @@ -386,7 +390,6 @@ static void rvin_group_put(struct rvin_dev *vin)
> >  static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> >  {
> >  	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
> > -	const struct rvin_group_route *route;
> >  	unsigned int i;
> >  	int ret;
> >
> > @@ -410,44 +413,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
> >  		}
> >  	}
> >
> > -	/* Create all media device links between VINs and CSI-2's. */
> > -	mutex_lock(&vin->group->lock);
> > -	for (route = vin->info->routes; route->mask; route++) {
> > -		struct media_pad *source_pad, *sink_pad;
> > -		struct media_entity *source, *sink;
> > -		unsigned int source_idx;
> > -
> > -		/* Check that VIN is part of the group. */
> > -		if (!vin->group->vin[route->vin])
> > -			continue;
> > -
> > -		/* Check that VIN' master is part of the group. */
> > -		if (!vin->group->vin[rvin_group_id_to_master(route->vin)])
> > -			continue;
> > -
> > -		/* Check that CSI-2 is part of the group. */
> > -		if (!vin->group->remotes[route->csi].subdev)
> > -			continue;
> > -
> > -		source = &vin->group->remotes[route->csi].subdev->entity;
> > -		source_idx = rvin_group_csi_channel_to_pad(route->channel);
> > -		source_pad = &source->pads[source_idx];
> > -
> > -		sink = &vin->group->vin[route->vin]->vdev.entity;
> > -		sink_pad = &sink->pads[0];
> > -
> > -		/* Skip if link already exists. */
> > -		if (media_entity_find_link(source_pad, sink_pad))
> > -			continue;
> > -
> > -		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
> > -		if (ret) {
> > -			vin_err(vin, "Error adding link from %s to %s\n",
> > -				source->name, sink->name);
> > -			break;
> > -		}
> > -	}
> > -	mutex_unlock(&vin->group->lock);
> > +	vin->group->link_setup(vin);
> 
> Compared to the previuous version, we've lost the ability to return
> erros on failures in link creation. Is it intentional ?

This is a good point, I will fix it for v2 (same for the comment in the 
ISP case you point out in 11/11).

> 
> Thanks
>    j
> 
> >
> >  	return ret;
> >  }
> > @@ -953,6 +919,51 @@ static int rvin_parallel_init(struct rvin_dev *vin)
> >   * CSI-2
> >   */
> >
> > +static void rvin_csi2_setup_links(struct rvin_dev *vin)
> > +{
> > +	const struct rvin_group_route *route;
> > +	int ret;
> > +
> > +	/* Create all media device links between VINs and CSI-2's. */
> > +	mutex_lock(&vin->group->lock);
> > +	for (route = vin->info->routes; route->mask; route++) {
> > +		struct media_pad *source_pad, *sink_pad;
> > +		struct media_entity *source, *sink;
> > +		unsigned int source_idx;
> > +
> > +		/* Check that VIN is part of the group. */
> > +		if (!vin->group->vin[route->vin])
> > +			continue;
> > +
> > +		/* Check that VIN' master is part of the group. */
> > +		if (!vin->group->vin[rvin_group_id_to_master(route->vin)])
> > +			continue;
> > +
> > +		/* Check that CSI-2 is part of the group. */
> > +		if (!vin->group->remotes[route->csi].subdev)
> > +			continue;
> > +
> > +		source = &vin->group->remotes[route->csi].subdev->entity;
> > +		source_idx = rvin_group_csi_channel_to_pad(route->channel);
> > +		source_pad = &source->pads[source_idx];
> > +
> > +		sink = &vin->group->vin[route->vin]->vdev.entity;
> > +		sink_pad = &sink->pads[0];
> > +
> > +		/* Skip if link already exists. */
> > +		if (media_entity_find_link(source_pad, sink_pad))
> > +			continue;
> > +
> > +		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
> > +		if (ret) {
> > +			vin_err(vin, "Error adding link from %s to %s\n",
> > +				source->name, sink->name);
> > +			break;
> > +		}
> > +	}
> > +	mutex_unlock(&vin->group->lock);
> > +}
> > +
> >  static void rvin_csi2_cleanup(struct rvin_dev *vin)
> >  {
> >  	rvin_group_notifier_cleanup(vin);
> > @@ -973,7 +984,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	ret = rvin_group_get(vin);
> > +	ret = rvin_group_get(vin, rvin_csi2_setup_links);
> >  	if (ret)
> >  		goto err_controls;
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> > index 39207aaf39ef9391..f2c32d5ceb7f83d9 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > @@ -269,6 +269,7 @@ struct rvin_dev {
> >   * @count:		number of enabled VIN instances found in DT
> >   * @notifier:		group notifier for CSI-2 async subdevices
> >   * @vin:		VIN instances which are part of the group
> > + * @link_setup:		Callback to create all links for the media graph
> >   * @remotes:		array of pairs of fwnode and subdev pointers
> >   *			to all remote subdevices.
> >   */
> > @@ -282,6 +283,8 @@ struct rvin_group {
> >  	struct v4l2_async_notifier notifier;
> >  	struct rvin_dev *vin[RCAR_VIN_NUM];
> >
> > +	void (*link_setup)(struct rvin_dev *vin);
> > +
> >  	struct {
> >  		struct v4l2_async_subdev *asd;
> >  		struct v4l2_subdev *subdev;
> > --
> > 2.31.1
> >

-- 
Regards,
Niklas Söderlund
