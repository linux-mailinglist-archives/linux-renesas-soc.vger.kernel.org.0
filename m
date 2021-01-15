Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E37EE2F6F62
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 01:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731258AbhAOAUS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 19:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731256AbhAOAUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 19:20:17 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646F8C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 16:19:37 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id f11so8518864ljm.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 16:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zrF58adz2xKOow5baiwXMoKau+n/FBCQQvuBpOp/T+E=;
        b=aPnoYdTyATGKdwhbxjfvXg+iG3uhRrtazE4OTGscigclPJDxlaaTokUezi0NBrHrtQ
         Gs7KKBFhJLq+TBhQdC0pvKqFlq1cqC3v0jAlIKS2/5TgJt6tmhlQT5b/PzDi2EagsGur
         HotigELBiOsbmONdksjTLi4VYlc6S1B7x8Xj8uJ2gmbdMakFmAdjk1mtjo/CNEbV653A
         Lpmxa+tHnFgbNt7QaNoSiZY68OJfcxQQKJMeq1JHLxw7qOz7TbSgQm5rfv0I/ai3+Yn7
         cevxme8897mXaLI1VPyEvrsszO/BaNm+LDsH9x2bcWh0XVCKamlo8ST9L1sktoWvVNCM
         xh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zrF58adz2xKOow5baiwXMoKau+n/FBCQQvuBpOp/T+E=;
        b=JBc5yI/jqUcZluxJmPU/fC9ugOuNpfjTsSmZTQsnxeq8olEpamt0GjdAWY0QlPV5dF
         HHWdCMcLR2E44xwMjjyM80V8TY0c8htAWouIek/J+FB6pE2E2vJga6FKdNov7ujN/5zd
         ffnMsbRfp1VT/SmsKDee3OtoDq9Tz5rGRpn1qcF5KLju06GbUvN+oOh2Af88E65dQQzg
         R2q7W29q9WArx1IGO64FPA8fREDSTFOlLx2N9xOiDNSpe9c9UgBeI2e6lte29Eso8KG6
         7v29yHyDsIfReDpO1ocxUgVYsLYZ/HEnN4TUj3IHTr/az73AYOZvLtJWyySUvl7z+63B
         Hz/w==
X-Gm-Message-State: AOAM532IeUCmXRYz7l8PBXAKtPR0r9TBOVkLK7TLcGKsYKN7ehCRqRU3
        HbTv1xweaVfv3IoxOI3+eHeK5WkaL+U1u/9Y
X-Google-Smtp-Source: ABdhPJyOwYSPb0bJZ+xfKTlv+z+A9VcI1xzKUdJIozEJGzQX6y7WSqM0ex0qXi2ktULhVmYaccXMXA==
X-Received: by 2002:a2e:9b4e:: with SMTP id o14mr4207311ljj.309.1610669975960;
        Thu, 14 Jan 2021 16:19:35 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id k18sm618221ljb.80.2021.01.14.16.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 16:19:35 -0800 (PST)
Date:   Fri, 15 Jan 2021 01:19:34 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] rcar-csi2: Do not try to recover after transfer error
Message-ID: <YADfljak6lom+80m@oden.dyn.berto.se>
References: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
 <20201112225147.1672622-5-niklas.soderlund+renesas@ragnatech.se>
 <20201116170932.2qlkrxu76smncyt7@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201116170932.2qlkrxu76smncyt7@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your feedback.

On 2020-11-16 18:09:32 +0100, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Thu, Nov 12, 2020 at 11:51:47PM +0100, Niklas S�derlund wrote:
> > Instead of restarting the R-Car CSI-2 receiver if a transmission error
> > is detected inform the R-Car VIN driver of the error so it can stop the
> > whole pipeline and inform user-space. This is done to reflect a updated
> > usage recommendation in later versions of the datasheet.
> >
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index 945d2eb8723367f0..a7212ecc46572a3b 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -773,21 +773,19 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
> >
> >  	rcsi2_write(priv, INTERRSTATE_REG, err_status);
> >
> > -	dev_info(priv->dev, "Transfer error, restarting CSI-2 receiver\n");
> > -
> >  	return IRQ_WAKE_THREAD;
> >  }
> >
> >  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
> >  {
> >  	struct rcar_csi2 *priv = data;
> > +	struct v4l2_event event = {
> > +		.type = V4L2_EVENT_EOS,
> > +	};
> >
> > -	mutex_lock(&priv->lock);
> > -	rcsi2_stop(priv);
> > -	usleep_range(1000, 2000);
> > -	if (rcsi2_start(priv))
> > -		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
> > -	mutex_unlock(&priv->lock);
> > +	dev_err(priv->dev, "Transfer error detected.\n");
> > +
> > +	v4l2_subdev_notify_event(&priv->subdev, &event);
> 
> Is event handling synchronous with the notification ? I mean, now that
> the sleep has gone, is this worth a threaded irq ?

I had the same line of thought, as far as I can tell the "remote side" 
event handling is done in the callers context. So I definitely think a 
threaded irq model is needed here as we have no idea what the "remote 
side" in a different driver will do :-)

> 
> Thanks
>   j
> 
> >
> >  	return IRQ_HANDLED;
> >  }
> > --
> > 2.29.2
> >

-- 
Regards,
Niklas S�derlund
