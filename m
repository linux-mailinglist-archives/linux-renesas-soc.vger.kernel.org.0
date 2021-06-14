Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD723A6EAF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 21:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbhFNTST (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 15:18:19 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:40947 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbhFNTSS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 15:18:18 -0400
Received: by mail-vs1-f52.google.com with SMTP id b1so8411297vsh.7;
        Mon, 14 Jun 2021 12:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NtIBeKmFFsU8bB0WaD7JrFvVTjZReGZVDuT3YcTY+6o=;
        b=ciivJ4Mkc8r2vaWXQio5sWpr1GPjkA9/ZyKn9I4WMJmCF3g+4ZduyKHlnahznSaCJr
         PabzwpQzqN/YOERiV/LK3zQ7pOO70Qp7OE13gLOInwFdMm5Z+s9II9IbHfcKtzU4oY+3
         D7bdYAZKKSzdnBHfmMzHenlmWnVEyWvpXPg7cPD22vA6U2HwS7WRg4sOwh3AeVxTNA1w
         ttWPekoFI28mhznPop6SCqx8Y65fzE3xSQezQbdhag4xrQSHwwq4iBB/tlXoEdiMWZUN
         SU3lo700/F7j8Md6AP9cMpMaALSGhAEhBDU89ReMmHk/cF8s6awQCoiaIOZIzbFcNAIc
         8S8w==
X-Gm-Message-State: AOAM530h/LIAb9g4ccnmaWOba6tLDSnneOI4pSsKR7EfsHUZ5/f2REOM
        QS1ErYMCfLR7EfAr3YvoHiKPj0Auu36dwyzP4H8=
X-Google-Smtp-Source: ABdhPJzOizLfsLBJbwOzmIjdiZA9+5b753Ws766gAVNs6/PBaCvBI4OMOoqQ7fR1MXtnuG7bJvezTzR5MwPa6JVFJ/I=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr979007vss.18.1623698172415;
 Mon, 14 Jun 2021 12:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623315732.git.geert+renesas@glider.be> <ab1acd836e990c536ff3a8c715ce57363d3ff8cb.1623315732.git.geert+renesas@glider.be>
 <YMeiE0xMW5zpgpRM@pendragon.ideasonboard.com>
In-Reply-To: <YMeiE0xMW5zpgpRM@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 21:16:01 +0200
Message-ID: <CAMuHMdX0j-_Uup63uq-wwKzpmG4FYkma2LqBOpVJ_i7eLNy25g@mail.gmail.com>
Subject: Re: [PATCH 03/14] pinctrl: renesas: Fix pin control matching on R-Car H3e-2G
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Jun 14, 2021 at 8:38 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Jun 10, 2021 at 11:37:16AM +0200, Geert Uytterhoeven wrote:
> > As R-Car H3 ES1.x (R8A77950) and R-Car ES2.0+ (R8A77951) use the same
> > compatible value, the pin control driver relies on soc_device_match()
> > with soc_id = "r8a7795" and the (non)matching of revision = "ES1.*" to
> > match with and distinguish between the two SoC variants.  The
> > corresponding entries in the normal of_match_table are present only to
> > make the optional sanity checks work.
> >
> > The R-Car H3e-2G (R8A779M1) SoC is a different grading of the R-Car H3
> > ES3.0 (R8A77951) SoC.  It uses the same compatible values for individual
> > devices, but has an additional compatible value for the root node.
> > When running on an R-Car H3e-2G SoC, soc_device_match() with soc_id =
> > "r8a7795" does not return a match.  Hence the pin control driver falls
> > back to the normal of_match_table, and, as the R8A77950 entry is listed
> > first, incorrectly uses the sub-driver for R-Car H3 ES1.x.
> >
> > Fix this by moving the entry for R8A77951 before the entry for R8A77950.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> I wonder if this means we could drop the second entry in the quirks
> array, in sh_pfc_quirk_match().

As both R-Car H3 ES1.x and ES2.0+ use the same compatible value,
that function is designed (with the help of the __weak
r8a7795[01]_pinmux_info symbols) to fail, when booting a kernel
that lacks the right pin control driver.  It's less likely to happen
nowadays, since we gained separate Kconfig symbols.

Note that if you enable CONFIG_ARCH_R8A77950 but not
CONFIG_ARCH_R8A77951, you can still trick a kernel running on R-Car
H3e-2G into using the wrong pin control driver, which will usually
cause something to fail during boot.  Perhaps the time is ripe to
drop the safety net; need to thing about that with a fresh mind,
after a morning coffee...

> > --- a/drivers/pinctrl/renesas/core.c
> > +++ b/drivers/pinctrl/renesas/core.c
> > @@ -571,17 +571,21 @@ static const struct of_device_id sh_pfc_of_table[] = {
> >               .data = &r8a7794_pinmux_info,
> >       },
> >  #endif
> > -/* Both r8a7795 entries must be present to make sanity checks work */
> > -#ifdef CONFIG_PINCTRL_PFC_R8A77950
> > +/*
> > + * Both r8a7795 entries must be present to make sanity checks work, but only
> > + * the first entry is actually used, for R-Car H3e.
> > + * R-Car H3 ES1.x and ES2.0+ are matched using soc_device_match() instead.
> > + */
> > +#ifdef CONFIG_PINCTRL_PFC_R8A77951
> >       {
> >               .compatible = "renesas,pfc-r8a7795",
> > -             .data = &r8a77950_pinmux_info,
> > +             .data = &r8a77951_pinmux_info,
> >       },
> >  #endif
> > -#ifdef CONFIG_PINCTRL_PFC_R8A77951
> > +#ifdef CONFIG_PINCTRL_PFC_R8A77950
> >       {
> >               .compatible = "renesas,pfc-r8a7795",
> > -             .data = &r8a77951_pinmux_info,
> > +             .data = &r8a77950_pinmux_info,
> >       },
> >  #endif
> >  #ifdef CONFIG_PINCTRL_PFC_R8A77960

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
