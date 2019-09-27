Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3859EC00DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 10:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfI0IOL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 04:14:11 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34734 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfI0IOL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 04:14:11 -0400
Received: by mail-ot1-f67.google.com with SMTP id m19so1548219otp.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2019 01:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JisTnFEYUhOBuamLXMJShnRl6DQw+XpCsAWXR3/L05M=;
        b=nEseDu20gIikfo5f83F+NERWIPlL3nE054nFRa/xhUkXPMVV9i/2MEETqbyg12V80f
         Fmtitywldt3tFCqBP8h4KZuTrVIvJlOrcD1+fY1ZyVJBNFyt/ZmAqEvuRMMSo97Ol82B
         ocEzRofK2jnfNq6nmY6xF907yvv70fYIHXHlAOh6IyTK31Yvc5yjaRrl58CApHbjtqX2
         0TSO+7sVMIA6EFyjH8LL93hY7zjH0UXK+6w9QSL1sK2SbsOq4gI2Q45z34HWc3KE0Byk
         3rtxXd0Igy/pZOWMm/Nvvt4EaMtvUBZBk1sEwonF31LoSlOVVWuZ05qqFJKo8SjjdccY
         Tg/w==
X-Gm-Message-State: APjAAAVV5IwL0Ae5yD2vxL87toGtS6qsSNSQv6nlmEZuBTJd3v66vKb0
        WweRSYQvf7nsMTysasUVmx2lJCkAsCrhoH0UCaA=
X-Google-Smtp-Source: APXvYqychCKyJRBIjiMrO/bfdT5NU+jocbw0w0DzaIQuWksmdTubddxsW+8KqRzDt8+e1y1uX4srhXSyT7WUBPxy87M=
X-Received: by 2002:a9d:193:: with SMTP id e19mr2107210ote.107.1569572048455;
 Fri, 27 Sep 2019 01:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190821124441.22319-1-erosca@de.adit-jv.com> <CAMuHMdWdObHAesUvF1BLwnEFJ6dsdpwM2yPRdUFW4D1Rp6d-tQ@mail.gmail.com>
 <20190828170949.GA30469@vmlxhi-102.adit-jv.com>
In-Reply-To: <20190828170949.GA30469@vmlxhi-102.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 10:13:57 +0200
Message-ID: <CAMuHMdVP=jPo3vhPhv+NVNENswty=uh5cFkqJZmH-gcX_T1X1A@mail.gmail.com>
Subject: Re: [RFC DO-NOT-MERGE PATCH] arm64: dts: renesas: R8A77961: Add
 Renesas M3-W+ (M3 ES3.0) SoC support
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Michael Dege <michael.dege@renesas.com>,
        Andrew_Gabbasov@mentor.com,
        "George G. Davis" <george_davis@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Wed, Aug 28, 2019 at 7:10 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Fri, Aug 23, 2019 at 04:18:09PM +0200, Geert Uytterhoeven wrote:
> [..]
> > Actually R-Car H3 ES2.0 is r8a77951, while ES1.x is r8a77950.
>
> That's a great detail which I missed. I confirm below:
>  - SoC HW manual "Rev.1.00 Apr 2018" maps R8A77951 to H3 ver2.0
>  - SoC HW manuals "Rev.1.50 Nov 2018" and "Rev.2.00 Jul 2019" map
>    R8A77951 to H3 ver3.0
>  - Older Renesas docs refer to the earlier H3 ES1.x SoC as R8A77950
>
> So, on the one hand, there _is_ a 'part number' update from H3 ver1 to
> rev2 and, on the other hand, there is no part number update from ver2 to
> ver3. My understanding of the latter (as a side note) is that there are
> no added/dropped HW features in ver3, hence the same 'part number'.

Perhaps. Note that part numbers are controlled by marketing, so there
may or may not be technical reasons...

> > When we started work on H3 ES2.0, it was considered an evolutionary step
> > from ES1.x, not a different SoC.  We also were used to 4-digit IDs in
> > compatible values, as before the 5th digit was typically used to
> > indicate a minor difference, like a different package, or a different
> > ROM option.  Hence we ignored the 5th digit, reused the compatible
> > values for H3 ES1.x, and went with soc_device_match() to differentiate,
> > where needed.
>
> Honestly, this still sounds sensible and intuitive, assuming the delta
> between the SoC models (differing in the 5th digit) is relatively low
> (not sure how to quantify it though and where the threshold is).
>
> One of the concerns related to soc_device_match() is that it sometimes
> doesn't play nicely with spinlocks, generating lockdep splats [1].

soc_device_match() is not intended to be called all over the place in a
driver.  Just call it once from the driver's .probe() method, and make use
of the soc_device_attribute.data field to store SoC-specific features.

> > However, it turned out H3 ES2.0 was more like a different SoC in the
> > same family: it has more similarities with R-Car M3-W ES1.0 than with
> > R-Car H3 ES1.x.
> >
> > In the mean time, with the advent of R-Car D3 and M3-N,
> > we also got used to 5 digits.  Hence in hindsight, it might have been
> > better if we had considered H3 ES1.x and ES2.0 to be two different
> > SoCs.
>
> Thinking of the way H3-ES1.x support was added, now that H3-ES1.x is
> declared obsolete, we could probably reduce the image size by
> some tens of KiB (more?) by simply disabling CONFIG_ARCH_R8A77950 if
> its support was implemented as standalone CONFIG_ARCH? We now have to
> compile and link the H3-ES1.x functionality even if nobody needs it,
> which is a bit unfortunate.

We could make separate Kconfig symbols for r8a77950 and r8a77951.
The biggest win would be the PFC driver.
For now, I think there are still several ES1.x SoCs in use.

> > Given R-Car M3-W and M3-W+ may co-exist as separate SoCs, I think
> > approach B is the best approach, using separate DTS, compatible values,
> > Kconfig, and drivers, like we did for e.g. R-Car M3-N.
> >
> > What do you think?
>
> I still think B is the best option in terms of transparency (clear
> mapping between documentation and code), but I try to reconcile below
> recent concerns (any support appreciated):
>
>  - After reviewing the "Engineering Change Notice for R8A77961", it
>    seems to me that the number of differences between R8A77960 and
>    R8A77961 is really low (much much lower than in the case of
>    R8A77950->R8A77951 transition). Most (if not all) of the IP blocks
>    present in R8A77960 and removed in R8A77961 [2] (i.e. fcpci0, fcpcs,
>    ivdp1c, vdpb) are not even supported in vanilla.

Well, DT is about describing hardware, not about describing (current)
Linux functionality ;-)

>  - I guess with this low amount of differences, R8A77961 will be an
>    almost perfect twin of R8A77960. If so, then is the additional
>    maintenance effort (resulting after bring-up) still justified?

I think so.  We may discover more subtle differences later.

>  - Duplicating 'drivers/pinctrl/sh-pfc/pfc-r8a7796.c' (as it was done
>    for M3-N, with 99% similarity in the contents) will increase the
>    image size by roughly 50KiB [3]. Additional (albeit less significant)
>    size increase is expected from the addition of other SoC-specific
>    drivers.

As e.g. FCPs do not use external pins, we may be able to reuse pfc-r8a7796.c
for M3-W+.  I'll need to have a closer look...

>  - [Minor] According to your feedback and to the best of our knowledge,
>    both M3-W and M3-W+ are expected to reach the end user, which might
>    create less motivation to really separate the two SoCs via CONFIG.

We do have separate Kconfig options for other SoCs that are considered
separate parts.

Please remember DT has the stable ABI, so the DT bindings is what we
need to get right in the first place.  It's much easier to change our
mind later within the kernel (driver and Kconfig organization; although
Kconfig changes may cause you some troubles).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
