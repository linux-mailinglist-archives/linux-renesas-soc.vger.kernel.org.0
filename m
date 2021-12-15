Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20C84756DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 11:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbhLOKso (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 05:48:44 -0500
Received: from mail-vk1-f180.google.com ([209.85.221.180]:33544 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhLOKsn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 05:48:43 -0500
Received: by mail-vk1-f180.google.com with SMTP id h1so14369443vkh.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cg7yOGJDlU0Mni4Xc1kCqSOclmAWUL4qQtedj2y8EoU=;
        b=5b/o83qca46AhJ5b3QZ5l12EnJKrOOw/4KTozhWMEQ63OMDL6uuo7ESMzDYlzwTu4H
         KbmnK3IQsfFMW+TB+KYGMuR8uzxQvCDOpEahpY4vsXF0p6RzOM1RyVpfLaexlZrUty4u
         LgqHb+pReyDBs5GuEj3/D5NJYeJU07AhIOaekJBbTOauPTloMc+DMtfW0xRfck7itJt0
         wKQo8OuRQGhYwp0npDowBBPFE1b4HYCeMO9k6bcYbWnsJFICNfLZUQdfR3XPomkLzRBM
         W42cXHKkBxUQ6y+6p9cn0VYbAsPxmWigwByXvCIxHEdV7/vYyQTNRA7NQwPdfD69Rh/8
         T+dA==
X-Gm-Message-State: AOAM532Vlh7Srn9731CzAtCSF0qKoTMOPK9gPYPh0oP2gebgMM2whXY+
        TBFSl1LsDDSScH+iUeBczX41VTm4UBj67A==
X-Google-Smtp-Source: ABdhPJwnTjsqn4Tas4SQ/JR/clg0CTezEpJ56LcPQDCdP8iPzYWS0GgEQXSXmoselLHiE2FuTPrvgA==
X-Received: by 2002:a05:6122:d09:: with SMTP id az9mr2814144vkb.23.1639565322800;
        Wed, 15 Dec 2021 02:48:42 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id i56sm341045vkr.25.2021.12.15.02.48.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 02:48:42 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id t13so40136426uad.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:48:42 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr9023652uai.89.1639565321818;
 Wed, 15 Dec 2021 02:48:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639559338.git.geert+renesas@glider.be> <0cb4593af06b64eb43a316913dc4bf83d46d7d7f.1639559338.git.geert+renesas@glider.be>
 <YbnCXreb5zjqH9r6@pendragon.ideasonboard.com>
In-Reply-To: <YbnCXreb5zjqH9r6@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Dec 2021 11:48:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUo2DNexnyWG-r-=8Pg_4fPjtM14rH1WzuFgQXgYeE0Gw@mail.gmail.com>
Message-ID: <CAMuHMdUo2DNexnyWG-r-=8Pg_4fPjtM14rH1WzuFgQXgYeE0Gw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: rcar-du: DRM_RCAR_DW_HDMI should depend on ARCH_RENESAS
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

On Wed, Dec 15, 2021 at 11:24 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 15, 2021 at 10:27:45AM +0100, Geert Uytterhoeven wrote:
> > The Renesas R-Car Gen3 and RZ/G2 internal HDMI encoder is only present
> > on Renesas R-Car Gen3 and RZ/G2 SoCs.  Hence add a dependency on
> > ARCH_RENESAS, to prevent asking the user about this driver when
> > configuring a kernel without Renesas SoC support.
> >
> > Fixes: 40d0fa7095d06c73 ("drm: rcar-du: Add Gen3 HDMI encoder support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
> >  config DRM_RCAR_DW_HDMI
> >       tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
> >       depends on DRM && OF
> > +     depends on ARCH_RENESAS || COMPILE_TEST
>
> Let's move this entry first to keep alphabetical order.

I tend to keep the "hard" and "soft" dependencies separate, with the
"hard" dependencies listed first.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
