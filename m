Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13A144E77E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbhKLNlN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:41:13 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:38822 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbhKLNlM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:41:12 -0500
Received: by mail-ua1-f44.google.com with SMTP id o26so18888903uab.5;
        Fri, 12 Nov 2021 05:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qgN4Ewe4ux/08fFnSKtUfwnjekmyQc2xLMUgYavBhZY=;
        b=UrcHejzFT3TTrN7jyeJHcBjKaWoiI7f1XVS45tiBmVaMLvuRc5i6r/GmetwWtdRR32
         PqV8exnOWUNeqfgo2YQIUOgYULTws+P6hztqxgTdWgfqZd0+lWKQJIoRpiQSESqKy69n
         lXbxryDjGPp37ewGkRSInwizkyCmgY+WmtEi6lMsaeGXmJxgnkz59EkCY+2hsRp3AM61
         zSEyllJqsWMDLO2tAA8dlEqf74IG8k/d1fPTzdFrikWKijAuinb7IJVGRlmNXWOvkdDz
         GAGlaX7C85bFmElLVRCZ9iXrvjtOoO5dGRCQ2jjCZLva4Ux9RZgRCMAxRmwVsiIPz4kb
         E7SA==
X-Gm-Message-State: AOAM532n39Ial1uQYIuXna818xwEfZa7AXWkRfkU8YnyMlzfoj5Ei1jM
        Zm9n/VCSx0rbB9kreCRn/ST1WueoX2tlCQ==
X-Google-Smtp-Source: ABdhPJxRRbM6SpbN9He6oKdJouo0ydcofseuGbic9KuhVbEErsMLOGVjD7XZIir0Hb2+SQurTnb/3A==
X-Received: by 2002:ab0:35e8:: with SMTP id w8mr22329404uau.31.1636724301528;
        Fri, 12 Nov 2021 05:38:21 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id n12sm4523597vsv.32.2021.11.12.05.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:38:20 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id v3so18752986uam.10;
        Fri, 12 Nov 2021 05:38:19 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr10372999vsb.9.1636724299587;
 Fri, 12 Nov 2021 05:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:38:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKjdCFf4hSZHSxWf_uRSU3uUt8i5fZapoTLw-+7nesLA@mail.gmail.com>
Message-ID: <CAMuHMdXKjdCFf4hSZHSxWf_uRSU3uUt8i5fZapoTLw-+7nesLA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/21] clk/mmc: renesas_sdhi: refactor SDnH to be a
 separate clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

CC clk

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Here is the second RFC to refactor SDHI clocks so that SDnH is a
> separate clock. The main advantage is that we can handle per-SoC quirks
> regarding the clocks now in the SDHI driver rather than the clock
> driver. This is where it belongs because only there we know which mode
> needs which tuning. Also, the code is way cleaner and more readable now.
>
> Geert seemed basically okay with this approach, so I continued to work
> on it by addressing his comments and adding DT updates for all other
> involved SoCs. I also excluded V3M now because it has a different SDnH
> handling. It shouldn't be affected by this series. But it may be that we
> need to add V3M SDnH handling later because it may be missing since
> ever. If so, this series will make that additional task a lot easier.

And R-Car V3H_2, which has extra bits in the SD-IFn registers, for
which we're gonna need a soc_device_match() quirk...

> The downside is that patch 4 looks messy. When switching from old to new
> handling in the clock driver, I see no alternative to switch the MMC
> driver in the same patch. clk_set_rate just has to work. However, the
> MMC part is small, so I hope we can deal with it as an exception this
> time. My suggestion is that Geert takes all the patches via his clk and
> renesas-dt trees wich MMC acks from Ulf. Is this okay for you, guys?

I can take them all[*].  Unless I'm mistaken, the mmc changes have
a hard dependency on the clk changes, so they have to go in through
renesas-clk, while the DT changes can go in independently through
renesas-devel?

[*] The DT bindings patch needs a respin, but that can be handled
    separately, and go in through Rob?

> These patches have been tested on R-Car H3 ES1.0, H3 ES2.0, M3-W ES1.0,
> M3N, E3, and V3U (remote only). On Gen2 a H2 has been tested. I tested
> SDR104, HS200, HS400, and regular modes. All observed values and
> relations in 'clk_summary' made perfect sense. Actually, this is the
> first time all quirks are correctly handled. HS200 with 4tap was broken
> before which was the initial reason for this patch series.
>
> Detailed changes are in the patch descriptions.
>
> A branch can be found here:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/separate-sdhn-v2
>
> Looking forward to comments and testing.
>
> Thanks and happy hacking,
>
>    Wolfram
>
> Wolfram Sang (21):
> clk: renesas: rcar-gen3: add dummy SDnH clock
> clk: renesas: rcar-gen3: add SDnH clock
> clk: renesas: r8a779a0: add SDnH clock to V3U
> mmc: sdhi: internal_dmac: flag non-standard SDnH handling for V3M
> clk: renesas: rcar-gen3: switch to new SD clock handling
> clk: renesas: rcar-gen3: remove outdated SD_SKIP_FIRST
> dt-bindings: mmc: renesas,sdhi: add optional SDnH clock
> arm64: dts: reneas: r8a774a1: add SDnH clocks
> arm64: dts: reneas: r8a774b1: add SDnH clocks
> arm64: dts: reneas: r8a774c0: add SDnH clocks
> arm64: dts: reneas: r8a774e1: add SDnH clocks
> arm64: dts: reneas: r8a77951: add SDnH clocks
> arm64: dts: reneas: r8a77960: add SDnH clocks
> arm64: dts: reneas: r8a77961: add SDnH clocks
> arm64: dts: reneas: r8a77965: add SDnH clocks
> arm64: dts: reneas: r8a77980: add SDnH clocks
> arm64: dts: reneas: r8a77990: add SDnH clocks
> arm64: dts: reneas: r8a77995: add SDnH clocks
> mmc: sdhi: use dev_err_probe when getting clock fails
> mmc: sdhi: parse DT for SDnH
> arm64: dts: reneas: r8a779a0: add SDnH clocks
>
> .../devicetree/bindings/mmc/renesas,sdhi.yaml |  16 +-
> arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a774c0.dtsi     |   9 +-
> arch/arm64/boot/dts/renesas/r8a774e1.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a77951.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a77960.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a77961.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a77980.dtsi     |   3 +-
> arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   9 +-
> arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   3 +-
> arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |   3 +-
> drivers/clk/renesas/r8a774a1-cpg-mssr.c       |  12 +-
> drivers/clk/renesas/r8a774b1-cpg-mssr.c       |  12 +-
> drivers/clk/renesas/r8a774c0-cpg-mssr.c       |   9 +-
> drivers/clk/renesas/r8a774e1-cpg-mssr.c       |  12 +-
> drivers/clk/renesas/r8a7795-cpg-mssr.c        |  12 +-
> drivers/clk/renesas/r8a7796-cpg-mssr.c        |  12 +-
> drivers/clk/renesas/r8a77965-cpg-mssr.c       |  12 +-
> drivers/clk/renesas/r8a77980-cpg-mssr.c       |   3 +-
> drivers/clk/renesas/r8a77990-cpg-mssr.c       |   9 +-
> drivers/clk/renesas/r8a77995-cpg-mssr.c       |   3 +-
> drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  17 +-
> drivers/clk/renesas/rcar-cpg-lib.c            | 211 +++---------------
> drivers/clk/renesas/rcar-cpg-lib.h            |   7 +-
> drivers/clk/renesas/rcar-gen3-cpg.c           |  24 +-
> drivers/clk/renesas/rcar-gen3-cpg.h           |   4 +
> drivers/mmc/host/renesas_sdhi.h               |   4 +
> drivers/mmc/host/renesas_sdhi_core.c          |  39 +++-
> drivers/mmc/host/renesas_sdhi_internal_dmac.c |  21 ++
> 31 files changed, 261 insertions(+), 289 deletions(-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
