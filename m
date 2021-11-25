Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F5545D670
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Nov 2021 09:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353345AbhKYIul (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Nov 2021 03:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240624AbhKYIsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Nov 2021 03:48:40 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EEFC0613B1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Nov 2021 00:41:37 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id c32so14456657lfv.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Nov 2021 00:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nx9yMihjJrikirX7YSEZYnRgpYjCEvWkb1r0ARpegII=;
        b=xGhEioLOdHXFg9tmf5qJORJtCyUerzIwdqhprNRThmcsfsA2Exo2375kdTL9bvFFSa
         UppGg1ymwKUeC3gGjwbwrNf3nlYsgoMpqDPIsMXsPj2qoynGcBlp0rMJTN4HjIvKfeRu
         CMxb5OoOpfBR9fMzEX0t717Ln+XidnJ5eGsUPPgw1ZZkjVCENkjZ1KxI5Sc+frjLEWLq
         KNLxQuo1R2e0ZqLzKumXx3MZ36omnJMD3m+Sq4WowY8hm9d54u3nMhGLcz4PYDXEvV9g
         exNh0WEP3IvcNWNtGNvqAtOEsa8L7mKHIPdV4uExhCGHRbS3C20KJbD/Q2B/YExQX2it
         hLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nx9yMihjJrikirX7YSEZYnRgpYjCEvWkb1r0ARpegII=;
        b=KnWHNKPkeeFVGGfqytjh/ogV75dkT6Ki9xaS55P8METFDy8zQs+wZo0HNLy+EeWxgc
         xRkbBme6YlWUwThiLtkNpRuF/GAyRD/ngMrLuT3zO1eRoZSIIX1EMOFFWIjfWZwxbS7V
         SPkbrQEvwce6U2bqMFuAlJN2dPNOP52c0yXlAv3u8rVn2qpw/KXRe2u9oWL0Hzkc+3js
         o3H8ysc72f3m0DxMtfiduL0jElKYE2qlXa9s/ZgGYjhSQz1a2cukV1asXDFY3s5d+DJr
         t61plZrveM1rF2F3QQ1MpgBOlp1lfFDCxVQQtEm+VoLhOuogBvjhc/Z+oayK34zBIdM2
         z5xw==
X-Gm-Message-State: AOAM532SFbqm0Nh4cBwrzaqfYqpIrq3IivHQgSDJM9eoG5XYyIzv5Kf+
        KaoYyhxgqbxjhNtko3ZpxLMFOw==
X-Google-Smtp-Source: ABdhPJwu+NLnzXYnIQCTu89xhzRZFCha7V/gCxcDXBhGTqQStg3aZ6VssNX/+/xIhPdatcGpDeWoRg==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr21391766lfm.631.1637829695936;
        Thu, 25 Nov 2021 00:41:35 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id e14sm246249lfs.150.2021.11.25.00.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 00:41:35 -0800 (PST)
Date:   Thu, 25 Nov 2021 09:41:34 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rcar-vin: Add check for completed capture before
 completing buffer
Message-ID: <YZ9MPu1WIJk0MtLr@oden.dyn.berto.se>
References: <20211123155443.3705143-1-niklas.soderlund+renesas@ragnatech.se>
 <163779391741.3153335.8189408341245810954@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <163779391741.3153335.8189408341245810954@Monstersaurus>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thanks for your feedback.

On 2021-11-24 22:45:17 +0000, Kieran Bingham wrote:
> Quoting Niklas Söderlund (2021-11-23 15:54:43)
> > Before reading which slot was captured to by examining the module status
> > (VnMS) register, make sure something was captured at all by examining
> > the interrupt status register (VnINTS).
> > 
> > Failing this a buffer maybe completed before it was captured too.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-dma.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index 25ead9333d0046e7..87ccbdc3d11a0f2d 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -111,6 +111,9 @@
> >  #define VNIE_FIE               (1 << 4)
> >  #define VNIE_EFE               (1 << 1)
> >  
> > +/* Video n Interrupt Status Register bits */
> > +#define VNINTS_FIS             (1 << 4)
> > +
> >  /* Video n Data Mode Register bits */
> >  #define VNDMR_A8BIT(n)         (((n) & 0xff) << 24)
> >  #define VNDMR_A8BIT_MASK       (0xff << 24)
> > @@ -1005,6 +1008,10 @@ static irqreturn_t rvin_irq(int irq, void *data)
> >         rvin_ack_interrupt(vin);
> >         handled = 1;
> >  
> > +       /* Nothing to do if nothing was captured. */
> > +       if (!(int_status & VNINTS_FIS))
> 
> Does this deserve a warning or debug print? It sounds like it may be
> somewhat spurious or unexpected if it occurs?

I don't think so. One can enable more interrupts then the ones we do 
today, for example during debugging capture issues. This check just make 
sure we don't try to process a capture if the interrupt is not related 
to capture ;-)

> 
> --
> Kieran
> 
> 
> > +               goto done;
> > +
> >         /* Nothing to do if capture status is 'STOPPED' */
> >         if (vin->state == STOPPED) {
> >                 vin_dbg(vin, "IRQ while state stopped\n");
> > -- 
> > 2.34.0
> >

-- 
Kind Regards,
Niklas Söderlund
