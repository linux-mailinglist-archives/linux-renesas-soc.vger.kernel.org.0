Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 037E821443
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 09:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfEQHaF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 May 2019 03:30:05 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46790 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbfEQHaF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 03:30:05 -0400
Received: by mail-vs1-f66.google.com with SMTP id x8so86531vsx.13;
        Fri, 17 May 2019 00:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uqYvT0fX5boAJ2BWwVHLad1jFrLXQXEWx3E0EMxp+QY=;
        b=cfysPMiCD+VZlQ0yPMaiZg4J5sMpS4KQgnZmXpMH9QpsE+j+m3DSYqmzdTa2aX5Mnk
         SOXjcmtYkqeLmZ1ccmeuK8J1MvLU3oEiKA7oEtytqMqxb09E9va1L8mOvQ4rS0sNYVdO
         scZE/asxYU0bM600bJPFelOOZFj8y7fcx2XJhZldaK3V4CRDyy8VAubR+3nhDRSsiO1W
         4ls4wV8ZXNgXC6LRtWnAy/qgj2lj/HzKcifykUBTxN+2dATEcdEhqSIMpvF5uu0iiU/F
         MaahFJcdpLh046dbgCPOQZ7RwWfJJg2Rj1hyM9ExEFRkCfWWDa0JSh0UdWSQVm44CovZ
         HrAg==
X-Gm-Message-State: APjAAAXhf38ngkG+efOkJZKIM4Nhd7IhV60BzWMn1BQUnxYSDpPQBwW3
        rV4F5qoNozAFhI4iiY9v4ClFxE0CrO64d7hvPy9SUg==
X-Google-Smtp-Source: APXvYqzAZXgg2bBzc3RAHqjDwfK9RVE3SmKCLCgjgG7qHky2owvqD36+vj7X7In6eQeVo5Vpzjd5h700/y59el1clQ8=
X-Received: by 2002:a67:770f:: with SMTP id s15mr17610411vsc.11.1558078203564;
 Fri, 17 May 2019 00:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190410222240.5800-1-niklas.soderlund+renesas@ragnatech.se>
 <20190415111003.6rryld6rfounopho@ninjato> <CAMuHMdVx_b8M2Gc_vn2_FS8xwf0ux=qYkH1ZfbWnTO0kBoLuPA@mail.gmail.com>
 <20190516230258.GG31788@bigcity.dyn.berto.se>
In-Reply-To: <20190516230258.GG31788@bigcity.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 May 2019 09:29:51 +0200
Message-ID: <CAMuHMdV8OFkYxzE-cre4q45t8PRLO6Lm49EFGKp36xJvhQKq0A@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: tmio: move runtime PM enablement to the driver implementations
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Fri, May 17, 2019 at 1:03 AM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2019-05-08 11:03:05 +0200, Geert Uytterhoeven wrote:
> > On Mon, Apr 15, 2019 at 1:10 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > On Thu, Apr 11, 2019 at 12:22:40AM +0200, Niklas Söderlund wrote:
> > > > Both the Renesas and Uniphier implementations perform actions which
> > > > affect runtime PM before calling into the core tmio_mmc_host_probe()

> > > > which enabled runtime PM. Move pm_runtime_enable() from the core and
> > > > tmio_mmc_host_probe() into each drivers probe() so it can be called
> > > > before any clocks or other resources are switched on.
> > > >
> > > > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > >
> > > Thanks for keeping at this. Setting up the APE6 board for further tests
> > > was painful, I understood that.
> > >
> > > Since you lost the cover-letter from the last series, I think it should
> > > be mentioned that this fixes a clock imbalance problem (at least on
> > > Gen3).
> > >
> > > For the APE6 tests, we need to wait until Geert comes back. I surely
> > > would like his input. And Yamada-san's, too, to make sure his platform
> > > also benefits.
> >
> > Thanks, but I still see a clock imbalances in /sys/kernel/debug/clk/clk_summary
> > when comparing before/after s2ram.
> >
> > On ape6evm:
> >
> > -   mmcif0   2   2   0   100000000   0     0  50000
> > +   mmcif0   1   1   0   100000000   0     0  50000
>
> This is unrelated to this patch, this clock is handled by the sh_mmcif
> driver. I get the same diff of the mmcif0 clock with a suspend cycle
> even if i do not include the renesas_sdhi_* drivers in the system.

OK.

> I had a quick look at the issue and it's related to that the MCC core do
> not call MMC_POWER_UP after suspend while it do call it during boot. Why
> it does so I'm not sure. Also if I mock convert sh_mmcif to require PM
> the imbalance is gone which perplexes me a bit and wonder if I converted
> it wrong somehow.

Weird... To be investigated further?

> > On r8a77965/salvator-xs:
> >
> > -   s0d3   1   2   0   266240000   0     0  50000
> > +   s0d3   2   2   0   266240000   0     0  50000
> >
> > -   sys-dmac0   0   1   0   266240000   0     0  50000
> > +   sys-dmac0   1   1   0   266240000   0     0  50000
>
> Even these are unrelated to this patch. If I test without renesas_sdhi_*
> driver in the system I get the same clock differences, in fact I get one
> more for sys-dmac1 (both with and without the shdi drivers).
>
> -    s0d3                  2        6        0   266240000          0     0  50000
> +    s0d3                  4        6        0   266240000          0     0  50000
>
> -       sys-dmac0          0        1        0   266240000          0     0  50000
> +       sys-dmac0          1        1        0   266240000          0     0  50000
>
> -       sys-dmac1          0        1        0   266240000          0     0  50000
> +       sys-dmac1          1        1        0   266240000          0     0  50000

Please ignore. I must have misread "s0d3" as "sd3" ;-)

> I have not investigate this further as I wish to make sens of this patch
> first ;-) Would you agree that with this information we should move
> forward with this patch as it solves the issue for the sdhi clocks on
> all effected SoCs ?

Yes please, and thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
