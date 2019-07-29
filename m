Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42346787AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2019 10:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbfG2Io0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jul 2019 04:44:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35959 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbfG2Io0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jul 2019 04:44:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so60929581wrs.3;
        Mon, 29 Jul 2019 01:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x2maF5b/Q0XETfWQ2b8Dczqa2bqSUFTU4fvTgWxwyHU=;
        b=LjQarevaQ+6KPJui1dlvWs1t1btwNHVaK/QFtmrT4NUepLAu6b6pZgwHsOeJ4MRuT6
         Gdm3vGsDGWlonTE0/oGy1a3eUWoHM/WhP9oMtSVJfPu5DNizlZoGA32Fyn56lIbhHVQR
         tkyWXrhiY7yFKn2+Aw2A+e9UwBiAgm+VP571DUsSN8XV45ddrCxg3KG091h7C7nJ4AIy
         PhEZc5z/9QD2qVDVHC5is4mgcLInBZNGTj3APVsS2uqfvJ6Y578/gvIQmnMO1MmBgTbx
         j13H3jt3Vy9EDgBrWZBJvGDsqFYYW6qD8xmv2tURBJhjd1ZQ1ZUIvUtblMFE06WKec7k
         QhQQ==
X-Gm-Message-State: APjAAAWX9w0wwTJev+zlLEULh9bYDHK334pGTs0PRwAcA/UJ2svdROEY
        EDr15skwtk5HXrp2fgeDQiwRYT1ugjgEtxOLBWAP+hPk
X-Google-Smtp-Source: APXvYqztnQYPQSrLWkBaWWL1Szt6yV8HmhZmSDSfuIvT/KLKay9keV8JeEjMoSmHMKOH/JdjWhzc7L9LYHBAiTmN5ps=
X-Received: by 2002:adf:ab51:: with SMTP id r17mr92675742wrc.95.1564389863738;
 Mon, 29 Jul 2019 01:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <1563289264-26432-1-git-send-email-uli+renesas@fpond.eu>
 <1563289264-26432-2-git-send-email-uli+renesas@fpond.eu> <CAPDyKFq2i0pRKGtMA6YESpKOAAzK-enhW7fkT6=63Ad2mQGmJQ@mail.gmail.com>
In-Reply-To: <CAPDyKFq2i0pRKGtMA6YESpKOAAzK-enhW7fkT6=63Ad2mQGmJQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jul 2019 10:44:11 +0200
Message-ID: <CAMuHMdU8dBF0X05=c-hNeHSPps8Q9YpBbr4Cf4WqSBjv-Q-zSw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: tmio: leave clock handling to PM if enabled
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulf,

On Thu, Jul 25, 2019 at 3:44 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Tue, 16 Jul 2019 at 17:01, Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> > This fixes a clock imbalance that occurs because the SD clock is handled
> > by both PM and the hardware driver.
> > See https://www.spinics.net/lists/linux-mmc/msg44431.html for details.
>
> This is a generic problem, when a device are being attached to a genpd
> and when the genpd has got the ->stop|start() callbacks assigned, as
> to manage device clocks.
>
> Can you try to describe this problem a little bit more in detail, as I
> think that's important to carry in the change log.
>
> >
> > This patch removes the clock handling from the driver's PM callbacks and
>
> runtime PM callbacks and/or system PM callbacks?
>
> > turns the clock off after probing.
> >
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > ---
> >  drivers/mmc/host/tmio_mmc_core.c | 24 ++++++------------------
> >  1 file changed, 6 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> > index 31ffcc3..26dcbba 100644
> > --- a/drivers/mmc/host/tmio_mmc_core.c
> > +++ b/drivers/mmc/host/tmio_mmc_core.c
> > @@ -1260,9 +1260,14 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
> >         /* See if we also get DMA */
> >         tmio_mmc_request_dma(_host, pdata);
> >
> > -       pm_runtime_set_active(&pdev->dev);
> > +#ifdef CONFIG_PM
> > +       /* PM handles the clock; disable it so it won't be enabled twice. */
> > +       if (_host->clk_disable)
> > +               _host->clk_disable(_host);
>
> The clock managed here, is that the same clock as being managed by
> genpd's ->stop|start() callbacks?
>
> > +       pm_runtime_get_sync(&pdev->dev);
> >         pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
> >         pm_runtime_use_autosuspend(&pdev->dev);
> > +#endif
>
> So what happens if you have CONFIG_PM set, but the device doesn't have
> a genpd attached?

That's OK for all SoCs served by renesas_sdhi_internal_dmac.c and
renesas_sdhi_sys_dmac.c, as they all have their clock domain described
in DT...

> I am guessing the driver should handle the clock in such scenario, right?

... but it's not for (non-Renesas) systems served by tmio_mmc.c.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
