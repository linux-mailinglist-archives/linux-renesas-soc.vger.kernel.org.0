Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4C84759BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 14:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242914AbhLONe3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 08:34:29 -0500
Received: from mail-qv1-f52.google.com ([209.85.219.52]:44619 "EHLO
        mail-qv1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242909AbhLONe2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 08:34:28 -0500
Received: by mail-qv1-f52.google.com with SMTP id i12so20235028qvh.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 05:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LtAomZPWa7c6I0JN7yFUBxLxS2z6oCLLsCAZvWcAfYk=;
        b=s7eKfo5SfZyHH4DIGfZx20Y2VnAhSeTEM8zRdTd7G+Wgh/C9S2QOur5577DrxCWAG4
         6MxDORVvRzMQ1/dIeempu0RNUV2EC4D07nkDIk2Df5w6KlSMg7JdXD0BubMkMc+oEc6i
         /z0UGrm3CbVd0CN4clodKS47pQIlCNGHXoRZt8yLzDq20+HkyARMz+5/pnFOJu8TEQOS
         V2uUhiV4Vxm+bCwn1mCeTAGLdJvrZVBkLpcth4O2NytWf1HbD927R4zIc5z2NaEKQb8P
         AuZxWPHwl905GDRUmGPCm7pf43gmpxyuMoip48lkZWhsTgO+TEJB5CFW8AQ7iPRHx7lZ
         QX6w==
X-Gm-Message-State: AOAM5303UPf0yEk1NP+ntwhqCcZ+rlpGnCU8rOXw0+r/PlnhzOfPR3kf
        TFL5JdE3qx2HoW7lOoQPb+vJvV73KtK5bA==
X-Google-Smtp-Source: ABdhPJw0kYtsdPTr46MC+JkDu0c8TrXraLFt++Z79a7JFp6oXi5FrmKdSvuOPtdnpz0BdykOPWpW4w==
X-Received: by 2002:a05:6214:411e:: with SMTP id kc30mr10976602qvb.38.1639575267792;
        Wed, 15 Dec 2021 05:34:27 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id w8sm1475502qtc.36.2021.12.15.05.34.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 05:34:27 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id q74so55131428ybq.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 05:34:26 -0800 (PST)
X-Received: by 2002:a25:8111:: with SMTP id o17mr6759340ybk.651.1639575266591;
 Wed, 15 Dec 2021 05:34:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639559338.git.geert+renesas@glider.be> <b1fa94f611a5c32c5d70516d1a39973f518fb06a.1639559338.git.geert+renesas@glider.be>
 <Ybm/nwT9hx/dapdg@pendragon.ideasonboard.com> <CAMuHMdVZ_qySBbku9P7qPz57gBy_CRMOc23L=M-V40VJeebdgQ@mail.gmail.com>
 <YbnCKpL7m+m2nmrI@pendragon.ideasonboard.com> <YbnD3RwTC9su+8WQ@pendragon.ideasonboard.com>
 <CAMuHMdWkoJ=VFqWhN9fyZcSncdaypSOwG1yNSPN=tsuv=WW=vg@mail.gmail.com> <YbnLTWKbzwAALz1A@pendragon.ideasonboard.com>
In-Reply-To: <YbnLTWKbzwAALz1A@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Dec 2021 14:34:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWszqX1q2hN9ud+Snyy+8SybE1fdDJ4+cQ6OjBGBuihA@mail.gmail.com>
Message-ID: <CAMuHMdVWszqX1q2hN9ud+Snyy+8SybE1fdDJ4+cQ6OjBGBuihA@mail.gmail.com>
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

On Wed, Dec 15, 2021 at 12:02 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 15, 2021 at 11:47:27AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Dec 15, 2021 at 11:30 AM Laurent Pinchart wrote:
> > > On Wed, Dec 15, 2021 at 12:23:39PM +0200, Laurent Pinchart wrote:
> > > > On Wed, Dec 15, 2021 at 11:17:37AM +0100, Geert Uytterhoeven wrote:
> > > > > On Wed, Dec 15, 2021 at 11:12 AM Laurent Pinchart wrote:
> > > > > > On Wed, Dec 15, 2021 at 10:27:46AM +0100, Geert Uytterhoeven wrote:
> > > > > > > The Renesas R-Car LVDS encoder driver is a subdriver of the R-Car
> > > > > > > Display Unit driver, and enabling DRM_RCAR_USE_LVDS while DRM_RCAR_DU is
> > > > > > > disabled doesn't have any impact on the kernel built.  Hence add a
> > > > > > > dependency on DRM_RCAR_DU, to prevent asking the user about this driver
> > > > > > > when configuring a kernel without R-Car Display Unit support, like is
> > > > > > > already done for DRM_RCAR_CMM.
> > > > > > >
> > > > > > > Fixes: 42d95d1b3a9c649b ("drm/rcar: stop using 'imply' for dependencies")
> > > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > ---
> > > > > > > The problem pre-existed before commit 42d95d1b3a9c649b, as the
> > > > > > > dependency of DRM_RCAR_LVDS on DRM_RCAR_DU was accidentally removed
> > > > > > > before.
> > > > > > > Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/rcar-du/Kconfig | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > > > > > index 65d72be50f46f19e..a7aa556e301d1087 100644
> > > > > > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > > > > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > > > > > @@ -32,7 +32,7 @@ config DRM_RCAR_DW_HDMI
> > > > > > >
> > > > > > >  config DRM_RCAR_USE_LVDS
> > > > > > >       bool "R-Car DU LVDS Encoder Support"
> > > > > > > -     depends on DRM_BRIDGE && OF
> > > > > > > +     depends on DRM_BRIDGE && OF && DRM_RCAR_DU
> > > > > >
> > > > > > Shouldn't the same be done for DRM_RCAR_DW_HDMI ? Even better, we could
> > > > >
> > > > > DRM_RCAR_DW_HDMI can be enabled and built with CONFIG_COMPILE_TEST=y
> > > > > and CONFIG_DRM_RCAR_DU=n (yes I've tried on RISC-V ;-)
> > > >
> > > > It would seem so indeed, my question is whether that shouldn't be fixed
> > > > as well.
> >
> > What is there to fix? You can build the HDMI fine without the DU driver,
> > when compile-testing.
>
> But it polutes the kernel config by asking a question that is irrelevant
> to users who don't have DRM_RCAR_DU enabled. Other patches in this
> series address this relevance issue with a dependency on ARCH_RENESAS,
> while for CMM and LVDS the dependency is on DRM_RCAR_DU.
>
> > > > > > wrap all the entries for the subdrivers in a 'if DRM_RCAR_DU'.
> > > > >
> > > > > That might work.  It can be tricky with bool/tristate, as sometimes m
> > > > > is not properly propagated.
> > > >
> > > > Would you give it a try for a v2 ?
> > >
> > > Another option is to introduce DRM_RCAR_USE_HDMI and DRM_RCAR_USE_DSI.
> > > I'd like to keep Kconfig consistent, with the same method to handle all
> > > subdrivers if no specific reason requires doing otherwise.
> >
> > The HDMI and DSI drivers are separate drivers that can be (test)compiled,
> > regardless of DRM_RCAR_DU is enabled or not.
> >
> > The DRM_RCAR_USE_LVDS symbol is different: enabling it does not
> > have any impact on the kernel build when DRM_RCAR_DU=y.
>
> That's only caused by how Kconfig is structured, the LVDS encoder is
> also a separate kernel module, like the HDMI and DSI encoders. The
> difference is caused by the fact that the DU driver needs to call
> functions exported by the LVDS driver, which caused requires preventing
> a configuration where DRM_RCAR_DU would be built-in and DRM_RCAR_LVDS
> would be built as a module.
>
> Patches 1/3 and 3/3 in this series address the fact that the user
> shouldn't be asked about the DSI and HDMI encoders if ARCH_RENESAS isn't
> set, as those options are meaningless in that case (except when
> compile-testing, which is enabled through COMPILE_TEST). The same
> happens with this patch due to the dependency on DRM_RCAR_DU, which
> itself depends on ARCH_RENESAS. I don't like how we end up doing similar
> things in different ways, that makes Kconfig harder to understand and
> maintain. I'd like to see all this fixed in a cleaner way, and I think a
> 'if DRM_RCAR_DU' would address the config "polution" issue in one go for
> all subdrivers.

If you prefer the big "if", fine for me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
