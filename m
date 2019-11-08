Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4410BF4248
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2019 09:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfKHIjF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Nov 2019 03:39:05 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46481 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfKHIjF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Nov 2019 03:39:05 -0500
Received: by mail-oi1-f193.google.com with SMTP id n14so4534097oie.13;
        Fri, 08 Nov 2019 00:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ab7roXemwsexQ4pZVt0+wLuisyumzWp4nsGXFOH95TE=;
        b=Eqv88tFAnDf7OjG5p/uw/sEZviLHfwankmexg+/wDAWQSjEuFSJjk2O66zp0JhUi1g
         +9hSoPgn4dF0pilhjrtb/c/NkYar+r9TeVi4UUQo6O1nh/fRlqhdCYHJg4D0ozjPA98P
         oso903MiEbNqsgKGI3DbF8FRodR57WqR4PqYCPPWkXxKAEDaWwSljhb3tHikD37ParXv
         kmlMuuaIIgW1/OS8f2gel98mRClFM6472cEzMkWcabqdUkB8PeRUY+D9y5jNc+LAycCT
         bgFVU5y0w/RkYCGuSMJZmjOsrJS7BgVItRazJMpaytFMhy6cfT8fCu5LOPxe525B3Vs5
         r/wA==
X-Gm-Message-State: APjAAAWV+hVKJagIcpRUIi1DJ2xFjjVI0VsAkQ6wIxyPo/DrmzgflOcQ
        vc8JKEkT9f2Dapq/WsCB2f6J6EWMEfxKF0lEOes=
X-Google-Smtp-Source: APXvYqx1pYglmvIlKKi2hmb01xlG+jxOqv5ULo4mbjRsK0Uyjgk44sHfMZS77WJg/zzTBmxr52XsKToqRgTubSJYBag=
X-Received: by 2002:a05:6808:b17:: with SMTP id s23mr8565059oij.102.1573202344561;
 Fri, 08 Nov 2019 00:39:04 -0800 (PST)
MIME-Version: 1.0
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-8-git-send-email-fabrizio.castro@bp.renesas.com> <20191107205618.GS24983@pendragon.ideasonboard.com>
In-Reply-To: <20191107205618.GS24983@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Nov 2019 09:38:53 +0100
Message-ID: <CAMuHMdXePqHtaBqocXLPd0WPsNK_CyQMwGnGL=oUVPx=HM-8wQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: shmobile_defconfig: Enable support for panels
 from EDT
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Nov 7, 2019 at 9:56 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Nov 07, 2019 at 08:11:03PM +0000, Fabrizio Castro wrote:
> > The iwg20d comes with an LCD panel from Emerging Display
> > Technologies Corporation (EDT), therefore enable what's
> > required to support it.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > ---
> > v2->v3:
> > * No change
> > v1->v2:
> > * No change
> > ---
> >  arch/arm/configs/shmobile_defconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> > index c6c7035..ab416a5 100644
> > --- a/arch/arm/configs/shmobile_defconfig
> > +++ b/arch/arm/configs/shmobile_defconfig
> > @@ -66,6 +66,7 @@ CONFIG_INPUT_EVDEV=y
> >  CONFIG_KEYBOARD_GPIO=y
> >  # CONFIG_INPUT_MOUSE is not set
> >  CONFIG_INPUT_TOUCHSCREEN=y
> > +CONFIG_TOUCHSCREEN_EDT_FT5X06=y
>
> Do these options need to be built-in, or could modules work too ?

All Renesas-specific config options in shmobile_defconfig are builtin,
unlike in multi_v7_defconfig and arm64_defconfig.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
