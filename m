Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3322EFEC7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Jan 2021 10:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbhAIJbr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 9 Jan 2021 04:31:47 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:41582 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbhAIJbo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Jan 2021 04:31:44 -0500
Received: by mail-ot1-f41.google.com with SMTP id x13so12209544oto.8;
        Sat, 09 Jan 2021 01:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l9wA+u75jNmhZ8Fs8U5vaLvombreF+5bTtz+sh9jqKs=;
        b=mvf4ScK35g3ir67QOcIiORun/xAz9TODdH3V1G5JodA9e6J9F3lT8wz4+g0EMLPyI0
         LmIqOADTOXdcOisZMRNxnvZZ/LRmngB8yHljhA51kBhKtNNu2TrC1pCXTjU9viaL24Ho
         SryLRI23HZu7F52NnFXAVF9aTwd2cdA4yDuwJ8RwcthQAGb4uU5BJpxzmj2t5liHgi0Z
         KvBdEHS5mRc3Zj8UdTxvPpWpAO/hz14zHSIeeowcD7E2pEsf0wwfhsGwjzSLP6biV3ti
         Em40jS+9TGmokHSIW/dnK2qZOaljlP31iYD4w6uWZgyiDyCawJJs1fQ6XhdnutXCufsC
         MQRQ==
X-Gm-Message-State: AOAM531IEzYSTLLkZVR23QiWGBfilGvTzStf8NdVBX7mLigyqDz5S26I
        gfIeq/CFyU3T+A0ZjMMHV87c/IVaB4F7ASvWwH8=
X-Google-Smtp-Source: ABdhPJwwQmJE6ksxj3H2WRrBV7bac5sDKcbCbvEtw2ci3bkjtMlTI7ZkbyEYqIjEDZK0INaGkRbiLsCMMwP9DSkRtF0=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr5369916otc.145.1610184663581;
 Sat, 09 Jan 2021 01:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20201228202221.2327468-1-aford173@gmail.com> <20201228202221.2327468-2-aford173@gmail.com>
 <CAMuHMdUz_Vi7AoM-3co3BvYW6ojEx5=1vg4X-=JGMpHkDFzocg@mail.gmail.com> <CAMuHMdWYcSBDTvW-Pm=0V9Q9JsbPLOXtbYKL-whaAHKwUPuT3A@mail.gmail.com>
In-Reply-To: <CAMuHMdWYcSBDTvW-Pm=0V9Q9JsbPLOXtbYKL-whaAHKwUPuT3A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 9 Jan 2021 10:30:52 +0100
Message-ID: <CAMuHMdV+=WYfx2jQ-TVJqNW7csPf3Wi=pfs-Tt7JjrRCSHPFHg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Add usb2_clksel to RZ/G2 M/N/H
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 9, 2021 at 10:29 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Jan 8, 2021 at 3:10 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Dec 28, 2020 at 9:22 PM Adam Ford <aford173@gmail.com> wrote:
> > > Per the reference manal for the RZ/G Series, 2nd Generation,
> >
> > manual
> >
> > > the RZ/G2M, RZ/G2N, and RZ/G2H have a bit that can be set to
> > > choose between a crystal oscillator and an external oscillator.
> > >
> > > Because only boards that need this should enable it, it's marked
> > > as disabled by default for backwards compatibility with existing
> > > boards.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v5.12 (with the typo fixed).
>
> (and the unneeded 'status = "disabled"' dropped).

Please disregard that. Lazy Saturday morning...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
