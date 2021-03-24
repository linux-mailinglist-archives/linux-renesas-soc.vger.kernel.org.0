Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36DD3479FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 14:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235810AbhCXNze (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 09:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbhCXNzB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 09:55:01 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38076C0613DE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 06:55:01 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o10so32115484lfb.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 06:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PgS7FYres3Xdyh8t09n3C+beyG2Bh2b8GepXqA+1xpY=;
        b=lCBHY8BB8T063LXXZ9vRbvvMUhIK0JGAWl71h3B+u9/v5t8MsH4ySiXzlx2ofgl0g+
         /iDVrelvuS64bRKRLFCEwyrpPVCz3hWAdSHkT5f2vDrr9tL3DtcDh1a4EkSGGkVXgwNX
         FG6trWltSICW9BD5xmZwY7QcDXxDVImMEJoVN1ifXJPWbCnBM+xRj2mv5UXr4lR+mlY9
         au+cEqrdEHjf/aypETGW6PIJxUiwstzzZRq5tRn0CsDqvBHNwXKyDdlSxwjY2JuZkXVE
         2SZYBE4LfVnWHjsS/vrDyk6TJ5fqYezlQvk+zRbcThlXzxpdmvWWf4+EBAHsFjqVTgNk
         r0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PgS7FYres3Xdyh8t09n3C+beyG2Bh2b8GepXqA+1xpY=;
        b=Mrp4AH89b/8de8AyNw/yzJT8ny25FpqxqsWDFz5PaWyPxBBFKna7zy67qGbAyzXCxr
         7waLleFqXUPdB00oKA7enDl5vES9/VHBxK787Wh+GC67AWFoucXXWe313RDtX6ujxXk3
         oVplgigeGeTqPFoQ9a4ksVobLgNMK+nXsm/vZ0XLqB8BzV7AKXhZUiEj3PUpp+xtTKa8
         93OVWNkhPNyOmF8pX6vTS89WeJSqHomDobAMytDLMhdtqsA+vcRPAhMpUzan9B0C1tu1
         zvtfgVc3MXVT/SEk/qAY4SFabWUb8WLpq2WpDWi0oHWMbZVpby5UM/R+sJsLHHk4U2Pk
         bfuQ==
X-Gm-Message-State: AOAM530TTOB4mYfZ+RIXst3D+veKwHyR1zLDxy4kj7/gHQzSqd+r2xnd
        QR04x/bv2MTGeP1uduS6VMrDPw==
X-Google-Smtp-Source: ABdhPJyGomK7csxLo/rj12Rh8zselonGvFz3iTpxlOJdH6lROKzCr+X4NiCtWKdchY7aEEo3BfUkBQ==
X-Received: by 2002:a05:6512:1044:: with SMTP id c4mr2054177lfb.198.1616594099652;
        Wed, 24 Mar 2021 06:54:59 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id f13sm319571ljm.25.2021.03.24.06.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 06:54:55 -0700 (PDT)
Date:   Wed, 24 Mar 2021 14:54:55 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] media: rcar-csi2: Enable support for r8a77961
Message-ID: <YFtEr9imzsbImk2y@oden.dyn.berto.se>
References: <20210312132459.1754782-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXbhzzYUwiXg8h2KPdTb-c5peogDK_saGvDir36zNAq4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXbhzzYUwiXg8h2KPdTb-c5peogDK_saGvDir36zNAq4w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2021-03-23 15:53:27 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Fri, Mar 12, 2021 at 2:26 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Enable support for M3-W+ (r8a77961).
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -1164,6 +1164,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
> >                 .compatible = "renesas,r8a7796-csi2",
> >                 .data = &rcar_csi2_info_r8a7796,
> >         },
> > +       {
> > +               .compatible = "renesas,r8a77961-csi2",
> > +               .data = &rcar_csi2_info_r8a7796,
> 
> Hence CSI2 on R-Car M3-W+ is handled the same way as R-Car M3-W.
> I don't know what this means for the driver, but according to Technical
> Update TN-RCT-S0359A/E, R-Car M3-W+ supports lane settings 4/2/1 on
> CSI40/41 (like most other R-Car Gen3 SoCs), while R-Car M3-W supports
> only lane setting 4 on CSI40/41.

This is a great find.

The table TN-RCT-S0359A/E correct was not present in datasheets before 
v0.80 so it have completely been missed. The trouble is that the current 
driver does the wrong thing for M3-W (and allows 4/2/1 lanes) and this 
this patch would be correct for M3-W+ while still leaving M3-W 
incorrect.

I will resping this series to first correct the M3-W behavior and then 
add M3-W on-top.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
