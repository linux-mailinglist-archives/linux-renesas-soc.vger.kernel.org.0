Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064CF3A6F31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 21:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbhFNTgo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 15:36:44 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:37675 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbhFNTgl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 15:36:41 -0400
Received: by mail-ua1-f54.google.com with SMTP id f34so5848754uae.4;
        Mon, 14 Jun 2021 12:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uq7E6GSXmDmR7Ci2QWGfr1j5wPqeA+nlSHiUUuXZytE=;
        b=Vy+SLtFrM48CadSy/ifa8/arMGdyEzTf2qljHdLbHHUileTwyzU/QJAqdB0iI2AhG+
         Fkuin5UhojE8zNBJqlJgCl/zSnqLAU31atFdE52YlQAW2O/Z2lWv8uLUprQWjwEdoL0V
         uydEjgQKfOPNiktl5qvXKm8a2YGvTAYxVlkNzBfwbeSy/G+PKojGqvtnQep3qibTpuIX
         pmomFFe66MVQ/bXQtna3n7oNlC7RtY1z9ExSkKc8RvG8ZZo5ztZQOcIvPcxtAX1NgZ0E
         /J5ejwVzldXjaCnGjGN0nVvrPPCBkdgW9TsXeGwci9800j4XN1FvTqxyWyhQVzAjQeHb
         58OA==
X-Gm-Message-State: AOAM530MtL2Ru47HJSEthbqOzfZZOnXsZrZDZR5KDfta0nwwSSddyG6B
        7ATa00O9xuwXptXjWSjxE3awIWl1dX0eqabbsxaZlHY+qpJ0HQ==
X-Google-Smtp-Source: ABdhPJydsEaZTh7jIulmyPjF4vQ8RW12D0VF/foTJHeWkbLrkPNkSyJO0chYQ8mQqt45RRbNsNMA9yaRbjfGSbJgMSE=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr14149810uap.106.1623699276761;
 Mon, 14 Jun 2021 12:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623315732.git.geert+renesas@glider.be> <fda1bc3516ac98084089b5565b486a0a41b3a62c.1623315732.git.geert+renesas@glider.be>
 <YMej3BSjxeiRxLWg@pendragon.ideasonboard.com>
In-Reply-To: <YMej3BSjxeiRxLWg@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 21:34:25 +0200
Message-ID: <CAMuHMdU2OvMvwKD+Y=f7iwARBT_YXfG3qBEeuiZhyFsNhS7_KQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] arm64: dts: renesas: Add support for Salvator-XS
 with R-Car H3e-2G
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Jun 14, 2021 at 8:46 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Jun 10, 2021 at 11:37:20AM +0200, Geert Uytterhoeven wrote:
> > Add support for the Renesas Salvator-X 2nd version development
> > board equipped with an R-Car H3e-2G SiP.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -62,3 +62,5 @@ dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
> >  dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
> >
> >  dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
> > +
> > +dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
>
> How about preserving the alphabetical order of the Kconfig symbols ?

At the expense of breaking alphabetical order of the DTB file names?

I agree both make sense. Do we need a vote? ;-)

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
