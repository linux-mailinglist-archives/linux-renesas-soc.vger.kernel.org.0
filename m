Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21AA4756D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 11:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241755AbhLOKrk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 05:47:40 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:41559 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241756AbhLOKrk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 05:47:40 -0500
Received: by mail-ua1-f46.google.com with SMTP id p37so40141282uae.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8tnK6iZmPqhF99bjgw7sRIlPbHYD4Dtq9IXFbVtwSE8=;
        b=f/0Re02kscYvl9AYm2DrERto2xWeksfVpVokcd4JY/DQw9s1ucOJzUdNpP+Nee3HP3
         tHRPPeYUzoU/PH4zzsz45Nwl6vfpxCq0pS1dNsjZMBHjR//vZ94E1djzxuI7EsZ0lq33
         Z+d0fVu0UvUbaVYc8CHR6X4Clnf+df8wKQsxC2rZjSizmdan1Ec0ssjT/krPIsws2b7q
         dAK9XTR5fMhLlB3i1ob+BBTdwPmQpQId0rnqYcUiPk9qcHPFEm1CGJ2/KJVS/LgN/PKM
         J1g7lgPvnwvVf0iLqZn57VDs5nL5JVIFG62PaattKTNSa3/O49af6/V1oHWy/rg12afG
         l8Yg==
X-Gm-Message-State: AOAM531L42IXtCyf2vxeHbC3HzUldahDvjG2ixeFlIEP19Y9FqLtPn7k
        ulz84x8x51IGwclke/7mpnhAxnGKznMwPg==
X-Google-Smtp-Source: ABdhPJzHsOe6Gxpm9A/TmRVbbZbGjfksJG//3FkpXRSmVph8MqaBN4wUj0x3hhxzXPQB3Afx/By/6g==
X-Received: by 2002:a67:1701:: with SMTP id 1mr2346097vsx.75.1639565259038;
        Wed, 15 Dec 2021 02:47:39 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id t132sm331489vkb.19.2021.12.15.02.47.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 02:47:38 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id o1so40167217uap.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:47:38 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr2308516vsj.77.1639565258205;
 Wed, 15 Dec 2021 02:47:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639559338.git.geert+renesas@glider.be> <b1fa94f611a5c32c5d70516d1a39973f518fb06a.1639559338.git.geert+renesas@glider.be>
 <Ybm/nwT9hx/dapdg@pendragon.ideasonboard.com> <CAMuHMdVZ_qySBbku9P7qPz57gBy_CRMOc23L=M-V40VJeebdgQ@mail.gmail.com>
 <YbnCKpL7m+m2nmrI@pendragon.ideasonboard.com> <YbnD3RwTC9su+8WQ@pendragon.ideasonboard.com>
In-Reply-To: <YbnD3RwTC9su+8WQ@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Dec 2021 11:47:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkoJ=VFqWhN9fyZcSncdaypSOwG1yNSPN=tsuv=WW=vg@mail.gmail.com>
Message-ID: <CAMuHMdWkoJ=VFqWhN9fyZcSncdaypSOwG1yNSPN=tsuv=WW=vg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: rcar-du: DRM_RCAR_USE_LVDS should depend on DRM_RCAR_DU
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Dec 15, 2021 at 11:30 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 15, 2021 at 12:23:39PM +0200, Laurent Pinchart wrote:
> > On Wed, Dec 15, 2021 at 11:17:37AM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Dec 15, 2021 at 11:12 AM Laurent Pinchart wrote:
> > > > On Wed, Dec 15, 2021 at 10:27:46AM +0100, Geert Uytterhoeven wrote:
> > > > > The Renesas R-Car LVDS encoder driver is a subdriver of the R-Car
> > > > > Display Unit driver, and enabling DRM_RCAR_USE_LVDS while DRM_RCAR_DU is
> > > > > disabled doesn't have any impact on the kernel built.  Hence add a
> > > > > dependency on DRM_RCAR_DU, to prevent asking the user about this driver
> > > > > when configuring a kernel without R-Car Display Unit support, like is
> > > > > already done for DRM_RCAR_CMM.
> > > > >
> > > > > Fixes: 42d95d1b3a9c649b ("drm/rcar: stop using 'imply' for dependencies")
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > The problem pre-existed before commit 42d95d1b3a9c649b, as the
> > > > > dependency of DRM_RCAR_LVDS on DRM_RCAR_DU was accidentally removed
> > > > > before.
> > > > > Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> > > > > ---
> > > > >  drivers/gpu/drm/rcar-du/Kconfig | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > > > index 65d72be50f46f19e..a7aa556e301d1087 100644
> > > > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > > > @@ -32,7 +32,7 @@ config DRM_RCAR_DW_HDMI
> > > > >
> > > > >  config DRM_RCAR_USE_LVDS
> > > > >       bool "R-Car DU LVDS Encoder Support"
> > > > > -     depends on DRM_BRIDGE && OF
> > > > > +     depends on DRM_BRIDGE && OF && DRM_RCAR_DU
> > > >
> > > > Shouldn't the same be done for DRM_RCAR_DW_HDMI ? Even better, we could
> > >
> > > DRM_RCAR_DW_HDMI can be enabled and built with CONFIG_COMPILE_TEST=y
> > > and CONFIG_DRM_RCAR_DU=n (yes I've tried on RISC-V ;-)
> >
> > It would seem so indeed, my question is whether that shouldn't be fixed
> > as well.

What is there to fix? You can build the HDMI fine without the DU driver,
when compile-testing.

> > > > wrap all the entries for the subdrivers in a 'if DRM_RCAR_DU'.
> > >
> > > That might work.  It can be tricky with bool/tristate, as sometimes m
> > > is not properly propagated.
> >
> > Would you give it a try for a v2 ?
>
> Another option is to introduce DRM_RCAR_USE_HDMI and DRM_RCAR_USE_DSI.
> I'd like to keep Kconfig consistent, with the same method to handle all
> subdrivers if no specific reason requires doing otherwise.

The HDMI and DSI drivers are separate drivers that can be (test)compiled,
regardless of DRM_RCAR_DU is enabled or not.

The DRM_RCAR_USE_LVDS symbol is different: enabling it does not
have any impact on the kernel build when DRM_RCAR_DU=y.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
