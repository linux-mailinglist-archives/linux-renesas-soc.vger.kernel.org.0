Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928A72F6F58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 01:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731202AbhAOAPp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 19:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731165AbhAOAPo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 19:15:44 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792C6C061757
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 16:15:04 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id u25so10684816lfc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 16:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mdsFIq2D73zGIah6I3SrS/jyNjPgsLZQ5ZmI9l2orJQ=;
        b=G+hcKYBg5O8dL+nv8dmkA/Hvqh2wexj0/DPvs26YZmOR5nMk7eoXaKCDhmXFRlmpCS
         mUQRC0G5rG0ySupUx0wGYtZ2tUVigdTLPPkFVu8ixqd9VkTalQwp8sn7OgGQ19qdsoX1
         yiO79ECk2Kvp0spfCYH8r6t5v/FNQ3l5XuvHMXmHDIQjbZ1qEZ+1a3EdwZFKO2TrpB8K
         49/4LTHPzKwpxV6z6Hk9wia8Z76bKjT1n2GLwDrs8RagSZ0ZyaIbSCXfdkH+/g01NKDA
         e7GJDhFXHkyJv3U3laf8Fy9DKRRi6Ju/2fghqfXkOUXLFzcitcGUgTq8RD0DiFN2iZC/
         hP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mdsFIq2D73zGIah6I3SrS/jyNjPgsLZQ5ZmI9l2orJQ=;
        b=gRtLFShbGgaeE/wZQyfetisb7xOFLe98CP/zRE4jCYHx3aDFeucYAVHO50BBm068gt
         d+bA1ZOwai/lVQ6ZvZXeP93ZMl+675cw4YBlrQd4FyMrSW3ucxG1x9A9aUYgNKKni913
         dIyAtyxWDf2iQnhwBq5RMs6o/gdMM/RSQtxHFvwh+FLhEawSgLgIcqzmcxD0sbDzxGoM
         +gCvpcC1BdjB9IXDzeKL3NCF9HgucdrNqNArnQiiMNMUj3fVLT6nWUn9lcAAAuRYlKgQ
         w0a7fZ4jfCCDugTCIQPpAbP9gIgdGRVEHn+p5HntIxMbkP7zAj2eqzBEU8VyQQtuuywp
         Joqw==
X-Gm-Message-State: AOAM533L7tNVuLdehPTRdxqEue5itOPrQhK+znEgftVvtc9R7T4RoItH
        Jnbyd27c6lmU7SIj7/Z5GCiGgQ==
X-Google-Smtp-Source: ABdhPJyyKDsI4zY9nNgr8OWNfiWmfwdvVnHP8NP8/xQCPi10ioiAYfOuROMylugOFmPStFfeN55R8Q==
X-Received: by 2002:a05:6512:3305:: with SMTP id k5mr4266273lfe.35.1610669702895;
        Thu, 14 Jan 2021 16:15:02 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id w25sm702177lfk.237.2021.01.14.16.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 16:15:02 -0800 (PST)
Date:   Fri, 15 Jan 2021 01:15:01 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] rcar-vin: Do not try to stop stream if not running
Message-ID: <YADehaOvwN0dCrtR@oden.dyn.berto.se>
References: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
 <20201112225147.1672622-2-niklas.soderlund+renesas@ragnatech.se>
 <20201116162838.opj7nfpvmfvup6cq@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201116162838.opj7nfpvmfvup6cq@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your feedback.

On 2020-11-16 17:28:38 +0100, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Thu, Nov 12, 2020 at 11:51:44PM +0100, Niklas Söderlund wrote:
> > Do not attempt to stop the streaming if the stream is not running.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-dma.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index 5a5f0e5007478c8d..eae25972ed7df2b6 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -1302,6 +1302,11 @@ void rvin_stop_streaming(struct rvin_dev *vin)
> >
> >  	spin_lock_irqsave(&vin->qlock, flags);
> >
> > +	if (vin->state == STOPPED) {
> > +		spin_unlock_irqrestore(&vin->qlock, flags);
> > +		return;
> 
> Do I read it right that, in case a double stop is attempted, returning
> here is not enough as the caller:
> 
> {
> 	rvin_stop_streaming(vin);
> 
> 	/* Free scratch buffer. */
> 	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
> 			  vin->scratch_phys);
> 
> 	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
> }
> 
> Are the potential double call to dma_free_coherent and the buffer
> return procedure harmless ?

Yes.

> 
> Thanks
>    j
> 
> > +	}
> > +
> >  	vin->state = STOPPING;
> >
> >  	/* Wait until only scratch buffer is used, max 3 interrupts. */
> > --
> > 2.29.2
> >

-- 
Regards,
Niklas Söderlund
