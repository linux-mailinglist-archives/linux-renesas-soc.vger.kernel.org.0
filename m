Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F68E2F6F5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 01:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731219AbhAOASY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 19:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731215AbhAOASX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 19:18:23 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE89C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 16:17:42 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id u21so8559243lja.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 16:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zNdVcJbI3nrainJFJjKo/yaSKIhwyi9P0RDcbwv1LE4=;
        b=n1Ju8+dUeF0gCezXRo2f7sNgL0uiXqtXtFLDS7M2qq8QYfPDtdIB8+65orYU+AEPPb
         jw20dDC8l1PIEUSHVDNQFEKaZ9xsC4sgGp93JqYJ4JnJBXdLflA/2MJmU4RiXsBAhyXC
         pX0My7lH8j8brD9IyFImSJaHGym8MhfEfDp1BvXT6Myf590Rt+1juuMMgLQjzQBnoukL
         sDoLCoaSUglN7Eot5WNvcK/fv/tE+33ccvMcaKyIz1hmo0btyDNDJIhezauRBy792qPL
         P0AIduTpVk1XCxKJ8w0r2lhLmfTTYo+1KOYJhSIxFh/aT92qEHVKv/yknZQzDzfP2Mi5
         fINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zNdVcJbI3nrainJFJjKo/yaSKIhwyi9P0RDcbwv1LE4=;
        b=nXXPaj/DzUgSpzGzYNTnh2c8MPsYAXlrqRoipAoZ5kGyJF3imSnAfxzPnofG39a8CA
         MDozZ8PzhUNGxRq38YGoUXI5USljBSp14CUDvDMb3zye/mag8v3H5ONNMt17SFMuBPFV
         HrxMVewzglkZKFwXv/xzFbKofKPcorWE36MyCGWH6VKPP46RbqhioeYl8MZNAGUTVX3C
         qxuGDVUBRdIZ4nLm0mh56FUQYJwRztczCMdyK+4j/okRZlEIzVdK+v2pj3NB+FSWP+UU
         iUrA5sYdHCkMdRlPuooGpg14/7LnWAt2/wtROeeSqIAoAViq5OxF+jUDsHG9qRW5aveV
         4iOA==
X-Gm-Message-State: AOAM533Z2oSIH/Bar6vO4UOOqQ6dzxbdcgbszzRunRzgk/WJqr1z2jfK
        JcR5SK6o+wMDXq0fvOn3IDJy5w==
X-Google-Smtp-Source: ABdhPJzcBijF9H92I4Y8piBd/MZlN5nuqyjfsIrkZUAbUWoqExWt8llqOni4iSTVIkD9lGjlZa1uBw==
X-Received: by 2002:a05:651c:283:: with SMTP id b3mr4241624ljo.345.1610669860865;
        Thu, 14 Jan 2021 16:17:40 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id n15sm618032ljm.59.2021.01.14.16.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 16:17:40 -0800 (PST)
Date:   Fri, 15 Jan 2021 01:17:39 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal EOS
Message-ID: <YADfI6uJBmPiEiAr@oden.dyn.berto.se>
References: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
 <20201112225147.1672622-4-niklas.soderlund+renesas@ragnatech.se>
 <20201116165814.keyj2gydiodphiss@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201116165814.keyj2gydiodphiss@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your comments.

On 2020-11-16 17:58:14 +0100, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Thu, Nov 12, 2020 at 11:51:46PM +0100, Niklas Söderlund wrote:
> > When a subdevice signals end of stream stop the VIN in addition to
> > informing user-space of the event.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > index dca3ab1656a66cef..fcaf68c3428b80fd 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -969,9 +969,23 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
> >  static void rvin_notify_video_device(struct rvin_dev *vin,
> >  				     unsigned int notification, void *arg)
> >  {
> > +	const struct v4l2_event *event;
> > +
> 
> Can this go inside the switch ?

It could but I dislike creating 'case FOO: { }' blocks as I think they 
are hard to read and un C like ;-P

> 
> >  	switch (notification) {
> >  	case V4L2_DEVICE_NOTIFY_EVENT:
> > -		v4l2_event_queue(&vin->vdev, arg);
> > +		event = arg;
> > +
> > +		switch (event->type) {
> > +		case V4L2_EVENT_EOS:
> 
> As there's only a case where this happen, this could be an if, but I
> see a switch is consistent with the existing one. Up to you.

I been bitten by this in the past so now days I go straight for the 
switch() construct :-)

> 
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks!

> 
> Thanks
>    j
> 
> > +			rvin_stop_streaming(vin);
> > +			v4l2_info(&vin->v4l2_dev,
> > +				  "Subdevice signaled end of stream, stopping.\n");
> > +			break;
> > +		default:
> > +			break;
> > +		}
> > +
> > +		v4l2_event_queue(&vin->vdev, event);
> >  		break;
> >  	default:
> >  		break;
> > --
> > 2.29.2
> >

-- 
Regards,
Niklas Söderlund
