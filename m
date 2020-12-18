Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65432DE304
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 14:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgLRNBA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 08:01:00 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:46776 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgLRNBA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 08:01:00 -0500
Received: by mail-ot1-f44.google.com with SMTP id w3so1755941otp.13;
        Fri, 18 Dec 2020 05:00:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0S3AKoHHsENQymbZkyA0JK9GKORXuuB7J/baVL2Nerk=;
        b=U7n4XSK6C2u0tQ5i+SdKuCLwUATr7Ajlld6RHiQ/SUeL16DpzIWgcMPqWDzkasfLjS
         4v3aS15FQoC4gC1NZEfuECNjKZUNqpTir9yoOiF2JlJTJtifI9469IiyM5pEmCCzDYi/
         0SolVBfu43yM2kALp2GVXDzn1VVa+xn2palBycY1votr9lbol90lSPffB6tcihVot3/J
         O71CzqKNHHFP8d4YOrH5S8dRpXBMwLSCHQDp7DvKhGUXNV1uhOuvvbisoprzUX7MNRUG
         XSpYKIrUbHHn3hnAeNk8iGQvIUNyBPWPxTjwQBOgJslVD06QJkMc9OQ2jhdB3WnkU9aR
         HM+g==
X-Gm-Message-State: AOAM532y3ovXwppJMUVAHeJII1PU772wcxuLjkWAAAjLzQnxlLUHaYdA
        97HlBvoXdFBAsoalY1KRPNjvEytDesABslNJOOA=
X-Google-Smtp-Source: ABdhPJx6pYx98TTZUrwhjmwJ/OIIyn5LP5Ueli0+x4PXbeXFFhUZIqTm8WyxJU2N1PD57Frkq2Vbw+x6tTpX4RtPhuM=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr2671058oth.250.1608296419470;
 Fri, 18 Dec 2020 05:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-3-aford173@gmail.com>
 <CAMuHMdW8w-J445DRNH8Ykx7Sp2KGCCVibE5uvccmoD=iZSM-zQ@mail.gmail.com> <CAHCN7xJCxXVUJoEu4h=vBc3v=VpvXd9WnOEM5GNoCrBDeUp6aA@mail.gmail.com>
In-Reply-To: <CAHCN7xJCxXVUJoEu4h=vBc3v=VpvXd9WnOEM5GNoCrBDeUp6aA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Dec 2020 14:00:08 +0100
Message-ID: <CAMuHMdVqSExMAJfkRu-DuStrRa+x5ij7S48DpCtHyX=b4-Jdwg@mail.gmail.com>
Subject: Re: [PATCH 02/18] arm64: dts: renesas: beacon kit: Fix choppy
 Bluetooth Audio
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Thu, Dec 17, 2020 at 1:16 PM Adam Ford <aford173@gmail.com> wrote:
> On Thu, Dec 17, 2020 at 4:41 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > The Bluetooth chip is capable of operating at 4Mbps, but the
> > > max-speed setting was on the UART node instead of the Bluetooth
> > > node, so the chip didn't operate at the correct speed resulting
> > > in choppy audio.  Fix this by setting the max-speed in the proper
> > > node.
> > >
> > > Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v5.12.
>
> Since various other patches in the series need a V2, should this be
> included in the V2 as no-change, or should I skip this and others that
> have been queued?  If/when they appear in your branch, I can rebase
> the series against that branch and just submit V2's on what's missing.
>
> I want to do whatever creates less work for you.

I think it's best to postpone v2 until I have queued up the accepted patches
in renesas-devel.  Probably that will happen on Monday.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
