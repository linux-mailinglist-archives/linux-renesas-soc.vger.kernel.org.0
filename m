Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C0517479
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 11:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfEHJDS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 05:03:18 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41161 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfEHJDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 05:03:17 -0400
Received: by mail-vs1-f67.google.com with SMTP id g187so12185432vsc.8;
        Wed, 08 May 2019 02:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CCVFYNIwO/r5Z4qjXrWitD8NE6BnjMH4QPoXGihWqy4=;
        b=AHVBOHXC7l/4xxV5devc9rfyUmfb5oPBkkB9wirs+mplmXeOpnjkRcTHk7DtXsTYem
         5vrM3smLEUvusGyFM6iAriX3KmBMXQEQGl0EQU8U+BIH7SmcbcTx4kMaxT7liuZepRA7
         oCPONq2YowGyBrJQqORJiEBGVoSm1Na9++J2i1m5D0QRt9/QwoKsoDMZvVkMjQTEFubO
         edhgGkYlQlm+VlEwQZKBGAujs8dX0WgOoZW1y3LJYifD4FB3HimWRYXsy/QEBJWK6Ypy
         shlNR9waRrJo9cTdAwVMHicorilIQS/oVHxIVG2Nd474ze/HRog/08TuIc1cLVQy4NdK
         /47w==
X-Gm-Message-State: APjAAAVRXT+Cqdid2u4rT17l3R7vJwSQ2bqMiuGJDWZPHnRl305pcWQr
        mmqnjnBEXgIYz6PpBdQyGE9bUxuMyX/ZhXUBsfM=
X-Google-Smtp-Source: APXvYqx7SkbBWH0+tNRYQhvm1vM6Zh+W2cJEo4Rs04GU5m/VqYC/EOmWbQ1bw0KUDVKMtcqrCFLSKeTXhKpTa5mVGl4=
X-Received: by 2002:a67:8e03:: with SMTP id q3mr19525968vsd.152.1557306196739;
 Wed, 08 May 2019 02:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190410222240.5800-1-niklas.soderlund+renesas@ragnatech.se> <20190415111003.6rryld6rfounopho@ninjato>
In-Reply-To: <20190415111003.6rryld6rfounopho@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 May 2019 11:03:05 +0200
Message-ID: <CAMuHMdVx_b8M2Gc_vn2_FS8xwf0ux=qYkH1ZfbWnTO0kBoLuPA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: tmio: move runtime PM enablement to the driver implementations
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
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

On Mon, Apr 15, 2019 at 1:10 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Thu, Apr 11, 2019 at 12:22:40AM +0200, Niklas Söderlund wrote:
> > Both the Renesas and Uniphier implementations perform actions which
> > affect runtime PM before calling into the core tmio_mmc_host_probe()

Do you know which pm_runtime_*() calls were done too early?
I guess they returned an error, which is not checked?

I checked the various pm_runtime_get*() calls, but none of them failed,
while they typically return -EACCES when called too early.

> > which enabled runtime PM. Move pm_runtime_enable() from the core and
> > tmio_mmc_host_probe() into each drivers probe() so it can be called
> > before any clocks or other resources are switched on.
> >
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
>
> Thanks for keeping at this. Setting up the APE6 board for further tests
> was painful, I understood that.
>
> Since you lost the cover-letter from the last series, I think it should
> be mentioned that this fixes a clock imbalance problem (at least on
> Gen3).
>
> For the APE6 tests, we need to wait until Geert comes back. I surely
> would like his input. And Yamada-san's, too, to make sure his platform
> also benefits.

Thanks, but I still see a clock imbalances in /sys/kernel/debug/clk/clk_summary
when comparing before/after s2ram.

On ape6evm:

-   mmcif0   2   2   0   100000000   0     0  50000
+   mmcif0   1   1   0   100000000   0     0  50000

On r8a77965/salvator-xs:

-   s0d3   1   2   0   266240000   0     0  50000
+   s0d3   2   2   0   266240000   0     0  50000

-   sys-dmac0   0   1   0   266240000   0     0  50000
+   sys-dmac0   1   1   0   266240000   0     0  50000

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
