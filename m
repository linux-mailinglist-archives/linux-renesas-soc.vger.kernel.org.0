Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C6610C50C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2019 09:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbfK1IYZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Nov 2019 03:24:25 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39222 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727227AbfK1IYZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Nov 2019 03:24:25 -0500
Received: by mail-oi1-f196.google.com with SMTP id a67so3835321oib.6;
        Thu, 28 Nov 2019 00:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l5fqMmUNReujsv5mY+kIqlKaupS4t3J/Kc11qOQPdNo=;
        b=nUDlM5iE7TIC85ERqx8yAd+J7Sw8QpbyOpP1+HktUc101TH1IlD4MrT/gRnWIggZ6B
         Cvd5kl0DvR8hkopYOWmL/OTegkyeDh9iX/ipeHP9awN4KP8L0nlh7hkn1yKzfAwPFMUy
         gfKYFQFXLFylzxbKtD4IajQHTT+1wYOjidRhaYeekSH6H0Ak8/CdvqLMnIzLvkEzo/pn
         oT1PK4Uc8OLnToXn76H0s/x7D7/dMpyOOjwt3AIvUvDyP4ilFRwHTUYHRAF8taAei8Wn
         hmDOmSEPFnMTzpsMKDhkj9a7qMiJP10fjgrFdTbCKaA4mtMxZ5wMURAAgZVhqHj5N9bL
         /O3Q==
X-Gm-Message-State: APjAAAVfBEkINf9ypNTtw50gpwKe7YuRew2VQJj7c/HXcmOzvjZhRjAv
        +UaaSaGl4cLNSRdw4WrnFsU4Au6xvRFwPEhW6n0=
X-Google-Smtp-Source: APXvYqycbAMxGlaSD5L5BseNryZGFxDnCXfuKW6pGe7r8T6U4wC0IuGryD5puwgUkJwx/PQ1sBUWALSpdqcqaOAfXSE=
X-Received: by 2002:a05:6808:5d9:: with SMTP id d25mr7669477oij.54.1574929464618;
 Thu, 28 Nov 2019 00:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
 <20191113100556.15616-4-jacopo+renesas@jmondi.org> <CAMuHMdWS2bv=RhQ3y5gNzZFT6CeH-a+h7xc6KYvcv0Anht6zGw@mail.gmail.com>
 <20191128080946.GF4711@pendragon.ideasonboard.com>
In-Reply-To: <20191128080946.GF4711@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Nov 2019 09:24:13 +0100
Message-ID: <CAMuHMdUeeV23qqfi6AH5S_KG2Ly3J1sbEKc0hg0eJcJ91JCtQA@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] drm: rcar-du: Add support for CMM
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Nov 28, 2019 at 9:09 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Nov 28, 2019 at 08:56:14AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Nov 13, 2019 at 11:04 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > Add a driver for the R-Car Display Unit Color Correction Module.
> > > In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> > > to perform image enhancement and color correction.
> > >
> > > Add support for CMM through a driver that supports configuration of
> > > the 1-dimensional LUT table. More advanced CMM features will be
> > > implemented on top of this initial one.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -5,6 +5,7 @@ config DRM_RCAR_DU
> > >         depends on ARM || ARM64
> > >         depends on ARCH_RENESAS || COMPILE_TEST
> > >         imply DRM_RCAR_LVDS
> > > +       imply DRM_RCAR_CMM
> > >         select DRM_KMS_HELPER
> > >         select DRM_KMS_CMA_HELPER
> > >         select DRM_GEM_CMA_HELPER
> > > @@ -13,6 +14,13 @@ config DRM_RCAR_DU
> > >           Choose this option if you have an R-Car chipset.
> > >           If M is selected the module will be called rcar-du-drm.
> > >
> > > +config DRM_RCAR_CMM
> > > +       tristate "R-Car DU Color Management Module (CMM) Support"
> > > +       depends on DRM && OF
> > > +       depends on DRM_RCAR_DU
> >
> > DRM_RCAR_DU already depends on DRM && OF, so the line above
> > can be removed.
>
> I've sent a pull request already. Can we address this on top ? Or is it
> worth a separate patch, should we wait until we have to touch this and
> then fix it in a "while at it" fashion ?

Sure. "while at it" is fine for me.  It's not blocker.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
