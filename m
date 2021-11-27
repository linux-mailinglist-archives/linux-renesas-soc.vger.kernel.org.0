Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A1445FFEA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Nov 2021 16:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347977AbhK0PpT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 27 Nov 2021 10:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbhK0PnT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 27 Nov 2021 10:43:19 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96CC2C06173E
        for <linux-renesas-soc@vger.kernel.org>; Sat, 27 Nov 2021 07:40:04 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l16so25574542wrp.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 27 Nov 2021 07:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eEr+k35IXuOeFS4Xu5O2eFdhiC9YcG76i0QP14/XlvQ=;
        b=RtbqM0MqNtABcVnS216m6VrtPFk7hZg0XfZUvWh4vsZGtfJxydsP5dMqVxtJV8hc+w
         8ieYrQ1qzf4qnyqlZNAz00IxvwXCXtbMDlb1vX6rFvfjpNXkLsfKPFa2yaYVaFPJoVeP
         3MYHDbGbl9S9HwaMlShKwVtndVeWVUUePByoYrAJ0si7BgTIQRtMfjOaVTdHzyn6wsux
         n2oHqOSuGQ9XbSIyq7tZz5knI5MaEQd390VTptMyVfn9pjMmJHHWlx+hjCNzuL0uHioW
         TmUxXjG5RUEMLvwu8a0JxZD2J2pOsxnGGLOaijMNP9oLLBTCYl+fSuT3UadzmVpo9bvm
         Xqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eEr+k35IXuOeFS4Xu5O2eFdhiC9YcG76i0QP14/XlvQ=;
        b=nuIFbsIpFOM1ZzuvnnNFQD7Y4ce7gyDNnHLrOesOm61zh/iYjunLw22quA/4JT9Zrn
         zzq3MZ3xNahb+wK2tiazrzUsdy2kbiRLq09fu386apdTrVani0tG1x/WtBrK6g5A2OvS
         wk1z0t+xRvwT3aFqX21Yjrgsf2etBhlFYnftG782/NTmJqG3irP6WTim7252csjqiaob
         7116yK1vkWH/L+4ojQIRWjl4vuRE3XX0L+KmnHTpQ4oBv7/f5sVLYwSWb4+HlhIMz7LH
         TS0o2YsTZI0PAtKILSJ91ppBwDZE9rFKjJ09J6Lx4qnoSkwqrAWH/wmNptK1Qz3jfcdK
         MHDw==
X-Gm-Message-State: AOAM5311FPw1x+Y2pfnrAaC9M+x0bAOnEYURMvW4VKSJs+RDK3p7i+Hk
        37dX6wVntVNMief9U7kZi6xT7d4XGLhJZTfv
X-Google-Smtp-Source: ABdhPJzPNQ82vA4A9M8lGr3eBa/7aFbJEbUG+Xj1s8N5Za+bFJmzySAJwZUFEmX1cZxruv2CGRugRA==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr20646329wrt.327.1638027602993;
        Sat, 27 Nov 2021 07:40:02 -0800 (PST)
Received: from localhost (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.gmail.com with ESMTPSA id q26sm8927456wrc.39.2021.11.27.07.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 07:40:02 -0800 (PST)
Date:   Sat, 27 Nov 2021 16:40:01 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rcar-vin: Refactor link notify
Message-ID: <YaJRURNvCmyiWMoW@bismarck.dyn.berto.se>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
 <20211020200225.1956048-2-niklas.soderlund+renesas@ragnatech.se>
 <20211104163654.fjjcpmj2gnt5aaul@uno.localdomain>
 <YYwF1dg1/2b68rgH@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYwF1dg1/2b68rgH@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo and Laurent,

Thanks for your feedback!

On 2021-11-10 19:48:05 +0200, Laurent Pinchart wrote:
> On Thu, Nov 04, 2021 at 05:36:54PM +0100, Jacopo Mondi wrote:
> > On Wed, Oct 20, 2021 at 10:02:23PM +0200, Niklas Söderlund wrote:
> > > The code have grown organically and a lot of checks are preformed for
> > 
> > code -> has
> > preformed -> performed
> > 
> > > the CSI-2 use-case even if the link notify is for a subdevice connected
> > > to the parallel interface.
> > >
> > > Before reworking the CSI-2 routing logic split the CSI-2 and parallel
> > > link notify code in two separate blocks to make it clearer. There is no
> > > functional change.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-core.c | 87 +++++++++++----------
> > >  1 file changed, 45 insertions(+), 42 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > > index 1d92cc8ede8f8a3e..bd960c348ba5228c 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > @@ -795,12 +795,10 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
> > >  {
> > >  	struct rvin_group *group = container_of(link->graph_obj.mdev,
> > >  						struct rvin_group, mdev);
> > > -	unsigned int master_id, channel, mask_new, i;
> > > -	unsigned int mask = ~0;
> > >  	struct media_entity *entity;
> > >  	struct video_device *vdev;
> > > -	struct media_pad *csi_pad;
> > > -	struct rvin_dev *vin = NULL;
> > > +	struct rvin_dev *vin;
> > > +	unsigned int i;
> > >  	int csi_id, ret;
> > >
> > >  	ret = v4l2_pipeline_link_notify(link, flags, notification);
> > > @@ -826,33 +824,9 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
> > >  	/* Find the master VIN that controls the routes. */
> > >  	vdev = media_entity_to_video_device(link->sink->entity);
> > >  	vin = container_of(vdev, struct rvin_dev, vdev);
> > > -	master_id = rvin_group_id_to_master(vin->id);
> > >
> > > -	if (WARN_ON(!group->vin[master_id])) {
> > > -		ret = -ENODEV;
> > > -		goto out;
> > > -	}
> > >
> > > -	/* Build a mask for already enabled links. */
> > > -	for (i = master_id; i < master_id + 4; i++) {
> > > -		if (!group->vin[i])
> > > -			continue;
> > > -
> > > -		/* Get remote CSI-2, if any. */
> > > -		csi_pad = media_entity_remote_pad(
> > > -				&group->vin[i]->vdev.entity.pads[0]);
> > > -		if (!csi_pad)
> > > -			continue;
> > > -
> > > -		csi_id = rvin_group_entity_to_remote_id(group, csi_pad->entity);
> > > -		channel = rvin_group_csi_pad_to_channel(csi_pad->index);
> > > -
> > > -		mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
> > > -	}
> > > -
> > 
> > There are now two empty lines here
> > 
> > > -	/* Add the new link to the existing mask and check if it works. */
> > >  	csi_id = rvin_group_entity_to_remote_id(group, link->source->entity);
> > > -
> > >  	if (csi_id == -ENODEV) {
> > >  		struct v4l2_subdev *sd;
> > >
> > > @@ -877,25 +851,54 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
> > >  		vin_err(vin, "Subdevice %s not registered to any VIN\n",
> > >  			link->source->entity->name);
> > >  		ret = -ENODEV;
> > > -		goto out;
> > > -	}
> > > +	} else {
> > 
> > I wonder if the group mutex should be locked in the else branch only
> > and simplify the whole thing as:
> 
> Isn't the lock required to call rvin_group_entity_to_remote_id() ? I
> think the two lines before:
> 
> 	vdev = media_entity_to_video_device(link->sink->entity);
> 	vin = container_of(vdev, struct rvin_dev, vdev);
> 
> could however be moved before mutex_lock().
> 
> >         if (csi_id == -ENODEV) {
> >                 /* subdev is parallel. */
> >                 for () {
> 
> Unless I'm mistaken, this needs locking in order to access group->vin[]
> safely.

As Laurent points out it is needed to hold the lock both to call 
rvin_group_entity_to_remote_id() and to access group->vin[i].

I have taken the suggestion to move the lookup of vdev and vin outside 
the mutex.

> 
> >                         return 0;
> >                 }
> > 
> >                 return -ENODEV;
> >         }
> > 
> >         /* subdev is CSI-2 */
> >         mutex_lock(group->mutex);
> > 
> >         ...
> > 
> >         mutex_unlock(group->mutex);
> > 
> > Even if I see above:
> > 
> > 	/*
> > 	 * Don't allow link changes if any stream in the graph is active as
> > 	 * modifying the CHSEL register fields can disrupt running streams.
> > 	 */
> > 	media_device_for_each_entity(entity, &group->mdev) {
> > 		struct media_pad *iter;
> > 
> > 		media_entity_for_each_pad(entity, iter) {
> > 			if (iter->stream_count)
> > 				return -EBUSY;
> > 		}
> > 	}
> > 
> > Being run out of the critical session, but that was already the case.
> > 
> > 
> > 
> > > +		unsigned int master_id, channel, mask_new;
> > > +		unsigned int mask = ~0;
> > > +		struct media_pad *csi_pad;
> > >
> > > -	channel = rvin_group_csi_pad_to_channel(link->source->index);
> > > -	mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
> > > -	vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask, mask_new);
> > > +		master_id = rvin_group_id_to_master(vin->id);
> > >
> > > -	if (!mask_new) {
> > > -		ret = -EMLINK;
> > > -		goto out;
> > > -	}
> > > +		if (WARN_ON(!group->vin[master_id])) {
> > > +			ret = -ENODEV;
> > > +			goto out;
> > > +		}
> > > +
> > > +		/* Build a mask for already enabled links. */
> > > +		for (i = master_id; i < master_id + 4; i++) {
> > > +			if (!group->vin[i])
> > > +				continue;
> > > +
> > > +			/* Get remote CSI-2, if any. */
> > > +			csi_pad = media_entity_remote_pad(
> > > +					&group->vin[i]->vdev.entity.pads[0]);
> > > +			if (!csi_pad)
> > > +				continue;
> > >
> > > -	/* New valid CHSEL found, set the new value. */
> > > -	ret = rvin_set_channel_routing(group->vin[master_id], __ffs(mask_new));
> > > -	if (ret)
> > > -		goto out;
> > > +			csi_id = rvin_group_entity_to_remote_id(group,
> > > +								csi_pad->entity);
> > > +			channel = rvin_group_csi_pad_to_channel(csi_pad->index);
> > >
> > > -	vin->is_csi = true;
> > > +			mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
> > > +		}
> > >
> > > +		channel = rvin_group_csi_pad_to_channel(link->source->index);
> > > +		mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
> > > +		vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask,
> > > +			mask_new);
> > > +
> > > +		if (!mask_new) {
> > > +			ret = -EMLINK;
> > > +			goto out;
> > > +		}
> > > +
> > > +		/* New valid CHSEL found, set the new value. */
> > > +		ret = rvin_set_channel_routing(group->vin[master_id],
> > > +					       __ffs(mask_new));
> > > +		if (ret)
> > > +			goto out;
> > > +
> > > +		vin->is_csi = true;
> 
> I'm tempted to factor code out to two functions for the parallel and
> CSI-2 case, but it could be done later too.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > > +	}
> > >  out:
> > >  	mutex_unlock(&group->lock);
> > >
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund
