Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C5A3A6F14
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 21:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbhFNTea (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 15:34:30 -0400
Received: from mail-vk1-f171.google.com ([209.85.221.171]:45638 "EHLO
        mail-vk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbhFNTe3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 15:34:29 -0400
Received: by mail-vk1-f171.google.com with SMTP id az3so4411635vkb.12;
        Mon, 14 Jun 2021 12:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=neEoJqVtr0vDl5UB61l+8ggKAKTZTHMcnPwVoveG8Uo=;
        b=OKtm9gW3LF7MusFc5+KKfbCDO/Xxi3uI0QIOB/te2NHB3H2tlIwd9jKROaT3en/Ev8
         e7Z1KCDn2po7mJ/9rDqdEkzWPmoUmRpCGXhKNrvQR2upL4Rhdew+zfrN9APqdI+TTcn1
         Kd0S1qOYzZxcayDql5f9FLijr5X2gkvT3QXzHd7eTPDJPo3uSG4rasStLJK27DhqDk/P
         sLR7R/M4Ix1tZbQM2Y9mfIBe2lihBWZvN7YJMWRHBOTkwMRj8CMy3R6MRfargQaq5Fqo
         epGwGyC+vKpZJZcQAR3tr8pB2jlxWKjZBjILZR6vHLo6uCxKH/Ar+VVKR8fXenQYedAk
         7YFQ==
X-Gm-Message-State: AOAM533v7BgwYdsu8Ap8R5RPPvueAJzyIK+RhudcZoGUfg9rclim+i1a
        B+aBdnh943SHQ9OwuvQZyK/8RpYSyY+NCn4aMGw=
X-Google-Smtp-Source: ABdhPJy0cN5AiEDpiiYn3LtzL91J3/gGwoSB/xDTgWOmak8Q0W7xPu0uuPUmePXQfBZ8MV4rtHrfhbsMkr9U/6cfrPk=
X-Received: by 2002:a1f:1a41:: with SMTP id a62mr322990vka.5.1623699137970;
 Mon, 14 Jun 2021 12:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623315732.git.geert+renesas@glider.be> <22b4c393bf5074b53791d2797d8fe74deb8ea9a7.1623315732.git.geert+renesas@glider.be>
 <YMei/rKwEyicfx+H@pendragon.ideasonboard.com>
In-Reply-To: <YMei/rKwEyicfx+H@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 21:32:07 +0200
Message-ID: <CAMuHMdUJQCv7Qe01Km=6F=yUjcNoo_OvOBrYpPcC3SbhX0Ru5Q@mail.gmail.com>
Subject: Re: [PATCH 04/14] mmc: renesas_sdhi: Add support for R-Car H3e-2G and M3e-2G
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

On Mon, Jun 14, 2021 at 8:42 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Jun 10, 2021 at 11:37:17AM +0200, Geert Uytterhoeven wrote:
> > Add support for the R-Car H3e-2G (R8A779M1) and M3e-2G (R8A779M3) SoCs.
> > These are different gradings of the R-Car H3 ES3.0 (R8A77951) and M3-W+
> > (R8A77961) SoCs, and thus subject to the same quirks.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -943,6 +943,8 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
> >       { .soc_id = "r8a77965", .data = &sdhi_quirks_r8a77965 },
> >       { .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
> >       { .soc_id = "r8a77990", .data = &sdhi_quirks_r8a77990 },
> > +     { .soc_id = "r8a779m1", .data = &sdhi_quirks_bad_taps2367 },
> > +     { .soc_id = "r8a779m3", .data = &sdhi_quirks_bad_taps1357 },
>
> Could we reuse the entries for H3 and M3 instead, by dropping the
> "ES3.*" revision ?

We cannot reuse the H3 ES3.0 entry, as soc_device_match()
works differently than of_machine_is_compatible(): the former doesn't
consider "r8a779m1" and "r8a7795" equivalent, the latter does.
Same for M3-W+ (no explicit ES3.0 there) and M3e-2G.

It's a pity we still don't have a "quirk-free" SDHI version on H3
and M3-W class SoCs (waiting for ES4.0?), as that would allow us to
just match on "renesas,sdhi-r8a7795" resp. "renesas,sdhi-r8a77961"
through the driver's .of_match_table[] instead, which would work for
H3e-2G and M3e-2G, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
