Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615AB45B5FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 08:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240440AbhKXH6L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 02:58:11 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:45687 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240787AbhKXH6K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 02:58:10 -0500
Received: by mail-ua1-f50.google.com with SMTP id ay21so3211352uab.12;
        Tue, 23 Nov 2021 23:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0LH7GHwypdqECJDJt33mxQUYL2fd1nbGQFpgPpXM1f4=;
        b=P9ORsKoJ6H0imFki3EVwOyqwCMERvJ5VnD0C1gYJZ/X19ZS4FU92RcC4B2yMa2iNXf
         vZ78s4HCfYIXfuEnw6LFN9HyiKRXSfcSm0b2vLoEVjjhxOim7xuJEEJOVfvrAmuykqvv
         ipUxVyOhxli/1Y94s9yCT8PQ5UCOriQV6lMcYjV8YFVBI8Y0Agd8o2xbXksPct2ChdH8
         +B3I8mrVukWsWdJXNVPww7FB49oaLrfaoi9PG3FHTaYjRUQrw+ni/eonn7ccc8m4MDZ5
         opXk7fyyaOhreIPAHqyYI8wamW8lrdvD0O/DD975EefVnam0bC2a+7kG66LNccI/GuVl
         Oy2A==
X-Gm-Message-State: AOAM531X2dMNvSe3QMK+s72VBaDQ2nBogxH9PsbNeff8lVe5fd9mQOEO
        Cljreff14atEWUeVmFRfjEuDBepPXIU4Uw==
X-Google-Smtp-Source: ABdhPJzp6ng2HbJ2pGqyhHv31tPcFARkED9Q2uWFL6sWsE2lB+DG+Ao5sofG1K4hejA088BOSgzWmg==
X-Received: by 2002:a67:c304:: with SMTP id r4mr20611969vsj.2.1637740500386;
        Tue, 23 Nov 2021 23:55:00 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id i24sm7592785vkk.5.2021.11.23.23.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 23:54:59 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id p2so3205132uad.11;
        Tue, 23 Nov 2021 23:54:59 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr7144916uai.89.1637740499142;
 Tue, 23 Nov 2021 23:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20211122103032.517923-1-maz@kernel.org> <CAMuHMdX2ZRvDYA3idmw3nBcP6CO=2od6ZU-UeJo9vYsuB=fQNQ@mail.gmail.com>
 <8735no70tt.wl-maz@kernel.org> <CAMuHMdVS67BLP2XEdD6ZvVBVE2x11gKnQa1TqG659HXPM5scqQ@mail.gmail.com>
 <CAMuHMdWJhnXabKGpW7k944dzQHtwQtxw-yb2bRBsoaMw6N6nuA@mail.gmail.com>
 <87tug3clvc.wl-maz@kernel.org> <CAMuHMdWGb2xik+94RVwtq8E6+9eN=HfQLX3a4sTjKQXR96Udkw@mail.gmail.com>
 <87r1b7ck40.wl-maz@kernel.org>
In-Reply-To: <87r1b7ck40.wl-maz@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 08:54:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWd9mJe8hGNdH5VR-qJOxgfT4YtFfOmQA=uV4QPsvpqtA@mail.gmail.com>
Message-ID: <CAMuHMdWd9mJe8hGNdH5VR-qJOxgfT4YtFfOmQA=uV4QPsvpqtA@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Add a quirk for controllers with their own
 definition of interrupt-map
To:     Marc Zyngier <maz@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Rob Herring <robh@kernel.org>, John Crispin <john@phrozen.org>,
        Biwen Li <biwen.li@nxp.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marc,

On Tue, Nov 23, 2021 at 10:11 AM Marc Zyngier <maz@kernel.org> wrote:
> On Tue, 23 Nov 2021 08:44:19 +0000,
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Nov 23, 2021 at 9:33 AM Marc Zyngier <maz@kernel.org> wrote:
> > > On Tue, 23 Nov 2021 07:57:48 +0000,
> > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > Summarized:
> > > >   - Before the bad commit, and after your fix, irqc-rza1 is invoked,
> > > >     and the number of interrupts seen is correct, but input events
> > > >     are doubled.
> > > >   - After the bad commit, irqc-rza1 is not invoked, and there is an
> > > >     interrupt storm, but input events are OK.
> > >
> > > OK, that's reassuring, even if the "twice the events" stuff isn't what
> > > you'd expect. We at least know this is a separate issue, and that this
> > > patch on top of -rc1 brings you back to the 5.15 behaviour.
> > >
> > > I'd expect it to be the case for the other platforms as well.
> >
> > OK.
> >
> > BTW, what would have been the correct way to do this for irqc-rza1?
> > I think we're about to make the same mistake with RZ/G2L IRQC
> > support[1]?
>
> Indeed, and I was about to look into it.
>
> There are multiple ways to skin this cat, including renaming
> 'interrupt-map' to 'my-own-private-interrupt-map'. Or use something
> akin the new 'msi-range' (which we could call interrupt-range), and
> replace:

"interrupt-ranges" (with trailing "S"), cfr. "msi-ranges"?

>   interrupt-map = <0 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>                   <1 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
>                   <2 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
>                   <3 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>                   <4 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>                   <5 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
>                   <6 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
>                   <7 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
>
> with:
>
>   interrupt-range = <&gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0 8>;
>
> which reads as "base interrupt spec", "start pin", "count".  This
> gives you almost the same level of information, and doesn't interfere
> with the rest of the DT properties. Parsing it is also much simpler.

And in the non-consecutive case, you need multiple ranges, right?

> But that's up to you, really.

Chris: do you think we can still do this for RZ/A, or do we have too
many users in the wild using the upstream code?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
