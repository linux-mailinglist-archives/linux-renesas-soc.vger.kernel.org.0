Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAF147560E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 11:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241576AbhLOKRu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 05:17:50 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:37455 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbhLOKRu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 05:17:50 -0500
Received: by mail-ua1-f52.google.com with SMTP id o1so40047129uap.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0tGUfGLJsnkYbNayGgM3Mm1XQontxpSVASOu9gzNQ7w=;
        b=L5+Z0bgYtCd/o90ZdDUOoyAxzV+2wOqtNq9EYS56LwQlE38QBtnlgwKNzkUPc7FHp2
         6C/gS1NnoDpxEn+yzw5/x0BVSqwKxBiv1z2ufjE/9vK4aCGm2cyFI4y4986U0TT33+KB
         K1IzTxXmQHE0pV+e13MGZ8L2IlKF1+63xZhMEzr0pOiIou4PSNEHd0FF6tNfLgZxFNrh
         OYIASiWD1SUoIi7oqmhdnktBXVFjdepzGNBgmoBraBSpScZC+ukvirAEr27D5XP23hFl
         GSvOCGNC3tfxaWmfxe4xChppzKji+i851xDcr5ECc/n1ICvuromybwJKMMoAFpgE4yAD
         xigw==
X-Gm-Message-State: AOAM532YSLKGVdscv4ikzDd4vMCZinjtR2ma++zash4ZX+KAOT+LFUbY
        pRy/dmLAG+qgk+fI1OAGnhxvV+zQxyOLMA==
X-Google-Smtp-Source: ABdhPJzA6b0dytL0BctpuZFa3jYbGpW6BRQMfl5JPLxtrUx88inW82V8Gp0yywGNgNtVzfHwvTzWMA==
X-Received: by 2002:a67:2dd7:: with SMTP id t206mr2484881vst.62.1639563469128;
        Wed, 15 Dec 2021 02:17:49 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id s2sm378117uap.7.2021.12.15.02.17.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 02:17:48 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id r15so40083298uao.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:17:48 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr2278231vsj.77.1639563468070;
 Wed, 15 Dec 2021 02:17:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639559338.git.geert+renesas@glider.be> <b1fa94f611a5c32c5d70516d1a39973f518fb06a.1639559338.git.geert+renesas@glider.be>
 <Ybm/nwT9hx/dapdg@pendragon.ideasonboard.com>
In-Reply-To: <Ybm/nwT9hx/dapdg@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Dec 2021 11:17:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZ_qySBbku9P7qPz57gBy_CRMOc23L=M-V40VJeebdgQ@mail.gmail.com>
Message-ID: <CAMuHMdVZ_qySBbku9P7qPz57gBy_CRMOc23L=M-V40VJeebdgQ@mail.gmail.com>
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

On Wed, Dec 15, 2021 at 11:12 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 15, 2021 at 10:27:46AM +0100, Geert Uytterhoeven wrote:
> > The Renesas R-Car LVDS encoder driver is a subdriver of the R-Car
> > Display Unit driver, and enabling DRM_RCAR_USE_LVDS while DRM_RCAR_DU is
> > disabled doesn't have any impact on the kernel built.  Hence add a
> > dependency on DRM_RCAR_DU, to prevent asking the user about this driver
> > when configuring a kernel without R-Car Display Unit support, like is
> > already done for DRM_RCAR_CMM.
> >
> > Fixes: 42d95d1b3a9c649b ("drm/rcar: stop using 'imply' for dependencies")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > The problem pre-existed before commit 42d95d1b3a9c649b, as the
> > dependency of DRM_RCAR_LVDS on DRM_RCAR_DU was accidentally removed
> > before.
> > Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index 65d72be50f46f19e..a7aa556e301d1087 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -32,7 +32,7 @@ config DRM_RCAR_DW_HDMI
> >
> >  config DRM_RCAR_USE_LVDS
> >       bool "R-Car DU LVDS Encoder Support"
> > -     depends on DRM_BRIDGE && OF
> > +     depends on DRM_BRIDGE && OF && DRM_RCAR_DU
>
> Shouldn't the same be done for DRM_RCAR_DW_HDMI ? Even better, we could

DRM_RCAR_DW_HDMI can be enabled and built with CONFIG_COMPILE_TEST=y
and CONFIG_DRM_RCAR_DU=n (yes I've tried on RISC-V ;-)

> wrap all the entries for the subdrivers in a 'if DRM_RCAR_DU'.

That might work.  It can be tricky with bool/tristate, as sometimes m
is not properly propagated.

> >       default DRM_RCAR_DU
> >       help
> >         Enable support for the R-Car Display Unit embedded LVDS encoders.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
