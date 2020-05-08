Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA5C1CB423
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2020 17:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgEHP4f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 May 2020 11:56:35 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35339 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgEHP4f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 May 2020 11:56:35 -0400
Received: by mail-oi1-f193.google.com with SMTP id o7so8832879oif.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2020 08:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+GKUewSWahMzbTGK4Irc6ZImh8HZvmgtHXE2/q/YsbY=;
        b=BrIEgznMJBVItIDyGFYjWKmYsoVDlfsC3bXSUiiwQf+npH/SL5l9S0nYnpbu2zCwdI
         RPL6BoFWche9L96AusBOG7BCue5gXE42Q8r1tg1yXf/LkEL/XspbuYM+519Umm2jJk4u
         Z/Vs2fCoNTnKDvXeCMQe8CUtemcS6B46EaAJx6dCGPMTGwQGfDoTDZLLe8s887jUz1f5
         jxE4lH9H3Ni9+y6aap6sfYDJx3wN1E35yK8XodB2ny/zlSTwzXn54Ij41/pOdMM3Ii/R
         L8Lf8642L6QgmztwcNor6sY7+WUxX9vKiK/fgM7K9OhsjuNguipz+dMyJ+88r6/PmEUw
         jEFA==
X-Gm-Message-State: AGi0PuYXOOC0CKXFp2ggT/1g4nNHG/t0behYEIHYUDnRjsBtqg4acPRs
        AsUrt/1WveJOkHKf22NF70j2qr/Wyyx1WMUfoZY=
X-Google-Smtp-Source: APiQypKL9fUgGlobVYbD8ZVeb4rJeP/CAXgTk+gBY4MoyW9NLz3SmymX2vn2ZDSavA3bXeL5QEMTJIiKqTMwdSwmAOw=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr10967981oig.54.1588953394204;
 Fri, 08 May 2020 08:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200507080528.547-1-geert+renesas@glider.be> <nycvar.YSQ.7.77.849.2005071056450.5637@knanqh.ubzr>
 <CAMuHMdXgpR6HDQs_NS4W2C8NxqJp3g1DjR2VneUF5Rvun-L4jQ@mail.gmail.com>
 <nycvar.YSQ.7.77.849.2005071303480.5637@knanqh.ubzr> <CAMuHMdW0=KWk2pC2tRUajvZQsoObBEFz7WoJ+uJbHbX27f7b2g@mail.gmail.com>
 <OSAPR01MB2114FB6F10EC904F19363F9D8AA20@OSAPR01MB2114.jpnprd01.prod.outlook.com>
 <nycvar.YSQ.7.77.849.2005081023180.5637@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.77.849.2005081023180.5637@knanqh.ubzr>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 May 2020 17:56:22 +0200
Message-ID: <CAMuHMdX11aLVE8tNNzuawKZqg21mOEnmTv=RkdOPZmMjMzWRMw@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Chris Brandt <Chris.Brandt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Nicolas,

On Fri, May 8, 2020 at 4:41 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> On Fri, 8 May 2020, Chris Brandt wrote:
> > The big argument was always that "XIP cannot be multi-platform by
> > definition because RAM/ROM always resides at different addresses in different
> > devices". And as you know, the physical address for RAM and ROM have to
> > be hard coded in the kernel binary.
>
> Exact.  So what is the problem?

Ah, you've fallen for the "multi-platform" fallacy! I have no desire to
enable support for multiple platforms in a single kernel that supports
XIP on all platforms.
I merely want it to be possible to build a XIP kernel for one platform.
As ARM v7m systems must be part of the ARCH_MULTI_V7 gang, they cannot
enable the XIP_KERNEL config symbol.

[PATCH] [RFC] arm: Replace "multiple platforms" by "common platform"
http://lore.kernel.org/r/20180621155906.12821-1-geert+renesas@glider.be

> > At an ELC a while back, I talked to Arnd and his suggestion was to put
> > the base addresses for RAM and ROM at a fixed location in the kernel
> > binary. Then for each SoC, you manually modify those values in the each
> > binary to match your board. This means there is 'technically' a single build
> > that will support all boards.

Interesting. I didn't know that suggestion.
Sounds doable (but see below).

> The very reason for using XIP in the first place is to maximize resource
> savings on constrained platforms. Any notion of a multi-platform kernel
> is completely contrary to this goal. This is even more true for no-MMU
> platforms where you can't abstract physical address differences behind a
> page table.
>
> Multi-platform kernel supporting all boards make sense for generic
> distros and/or build coverage tests. But a multi-platform XIP kernel is
> a nonsense. Trying to make XIP multi-platform might be a nice
> intellectual challenge but that has zero value for actual deployment and
> usage.

Agreed.

> Given that there isn't a lot of such platforms anyway, it should be
> possible to carry a few kconfig entries outside of the multi-platform
> menu for XIP targets and live with possible kconfig duplicates. That
> shouldn't be such a maintenance burden.

Still, it's duplication, which could be avoided using a single "know
what you're doing" Kconfig option.
And it will grow, as XIP could be used on lots of platforms.

I believe this is exactly what Chris' last attempt did?


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
