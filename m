Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930131D507D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 16:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgEOOaE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 10:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726233AbgEOOaE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 10:30:04 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605A8C05BD09
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 07:30:03 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id o14so2478212ljp.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 07:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=okKiBGETk3y9fl+HPE2qnZNSxrs43Su2nSzMEQHFKx4=;
        b=B2tBkp+VDDhqvAlK0qTINDRkXY/tWCA4eh1WU5Rl6p5UcN9G8zsiRFZnbRwXZA1RMC
         bz961deR4ePG+cU9BPzNZudy92brj9qCZzp+Z37PIUonlU8bJpFMJQh6Y2jkOxEdQ8dv
         kDqFawSa3pDNJMvmWGjdNGrqSSfil9tn0LNAVQtPox4B/zeeVxBSa4okeaT5s/+jnKJk
         LVIgqQ8WSXbh3awbLtRmD8wnH80GOqpkjjYUpTMnMkgtHpf2G2O/TjJdP8Qxi1upRJj0
         wAGqu5V9AxUSKSoloTgH25FK7b82VlkdwAhRpCwX8PNYk/tkjYCdEj8VnGN1fnqBQsjh
         sAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=okKiBGETk3y9fl+HPE2qnZNSxrs43Su2nSzMEQHFKx4=;
        b=d6DHUfDu556Aj0ELeadl/4uKtKqbW6L20AqxFyw03IVkrBktolpesBVCQ4tIc4A4kE
         4w43TEknpyYRrS/a/1/QHtFFGutZig/XpwtoVPzHkG4q4eDbf+1gXVU7TKaWjPjNjtk1
         L8yACeyUWZ88Lox5Ljwn7tecqn1MN7EOQrA5DYjn625/KZ/+5G0vgGqCDNG3UhszX3LE
         bQpgkpznbI9S8jt0g5rZZGjruUaPJvS8b9rukMa2yNSDNN19dXF8mk/LOxblyKV2X5mv
         BrMgI1/FHpua0Q5dVscDC/aIIVklEdV4XP4nlLpyt7jD39b1MOZZIR8x++MDwHhkvYqw
         6AoA==
X-Gm-Message-State: AOAM5336of+uDnjdEdal318F1iMCH3k/ws0ZndSj7eSbraypifMQpJ1N
        80Hwf7KzT6CarbCwHbYgcAboBA==
X-Google-Smtp-Source: ABdhPJwyP8HWlV6JfW9ElgBPSDFN5rUvr9tJIY6LhOoGJarj93fEvMySkKXB99h0NpvErrrrT6tPFw==
X-Received: by 2002:a2e:361a:: with SMTP id d26mr2435008lja.171.1589553001537;
        Fri, 15 May 2020 07:30:01 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id t19sm1272731ljg.7.2020.05.15.07.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:30:00 -0700 (PDT)
Date:   Fri, 15 May 2020 16:30:00 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: renesas_sdhi: don't lose RPM savings because of
 manual clk handling
Message-ID: <20200515143000.GC3310422@oden.dyn.berto.se>
References: <20200513173131.11200-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFpaaVdpv22VO_OS7a2rw67xmD7qXcxUqD_g5CDdqiZiHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFpaaVdpv22VO_OS7a2rw67xmD7qXcxUqD_g5CDdqiZiHA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram and Ulf,

Thanks for working on this!

On 2020-05-15 11:26:06 +0200, Ulf Hansson wrote:
> + Niklas, Geert, Yamada-san,
> 
> 
> On Wed, 13 May 2020 at 19:31, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > The SDHI driver en-/disabled clocks on its own during probe() and
> > remove(). This basically killed all potential RPM power savings. Now, we
> > just enable the clocks for a short time when we access registers in
> > probe(). We otherwise leave all handling to RPM. That means, we need to
> > shift the RPM enabling code in the TMIO core a bit up, so we can access
> > registers there, too.
> 
> No, this doesn't sound entirely right to me.
> 
> However, I do admit that we may need to move the pm_runtime
> initialization earlier (perhaps even out of tmio_mmc_core), but for
> slightly different reasons. Let me elaborate.
> 
> For uniphier-sd, renesas_sdhi_sys_dmac and renesas_sdhi_internal_dmac
> - they all have assigned the ->clk_enable|disable() ops. Which means
> they have internal clock management (calling clk_prepare|enable()
> etc). For tmio_mmc, that's not the case.
> 
> On top of this, the device may also have a potential PM domain
> attached. If that is the case, the PM domain may or may not have clock
> management implemented through genpd's ->start|stop() callbacks.
> 
> So, in the end we are going to have to rely on clock enable/prepare
> reference counting, as we have to manage the clock(s) at both the
> driver and the PM domain level. Taking into account all various
> combinations (and that CONFIG_PM may not always be set). I have
> started to hack on some patches, but before I share them, let me ask a
> few questions.

I had a go at this once but gave up as I only have knowledge about one 
implementation and !CONFIG_PM made it messy for me. I will see if I can 
digout the patches and see if I can recall exactly what it was. I'm sure 
it was my lack of understanding and not something technical.

> 
> 1. tmio_mmc: - is that used solely with clock management through
> genpd? Or has no clock management at all?
> 2. uniphier-sd: Don't have runtime PM callbacks assigned. It looks
> like it doesn't care about runtime PM, but maybe it does through a PM
> domain? Can we skip to enable runtime PM for uniphier-sd, no?
> 
> Kind regards
> Uffe
> 
> >
> > clk_summary before:
> > sd0                   1        1        0    12480000          0     0  50000
> >    sdif0              2        2        0    12480000          0     0  50000
> >
> > clk_summary after:
> > sd0                   1        1        0    12480000          0     0  50000
> >    sdif0              1        1        0    12480000          0     0  50000
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Tested on a Salvator-XS board with R-Car M3-N.
> >
> >  drivers/mmc/host/renesas_sdhi_core.c |  7 +++----
> >  drivers/mmc/host/tmio_mmc_core.c     | 14 +++++++-------
> >  2 files changed, 10 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> > index ff72b381a6b3..d581142634f8 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -910,6 +910,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
> >                 goto efree;
> >
> >         ver = sd_ctrl_read16(host, CTL_VERSION);
> > +       renesas_sdhi_clk_disable(host);
> > +
> >         /* GEN2_SDR104 is first known SDHI to use 32bit block count */
> >         if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
> >                 mmc_data->max_blk_count = U16_MAX;
> > @@ -920,7 +922,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
> >
> >         ret = tmio_mmc_host_probe(host);
> >         if (ret < 0)
> > -               goto edisclk;
> > +               goto efree;
> >
> >         /* Enable tuning iff we have an SCC and a supported mode */
> >         if (of_data && of_data->scc_offset &&
> > @@ -985,8 +987,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
> >
> >  eirq:
> >         tmio_mmc_host_remove(host);
> > -edisclk:
> > -       renesas_sdhi_clk_disable(host);
> >  efree:
> >         tmio_mmc_host_free(host);
> >
> > @@ -999,7 +999,6 @@ int renesas_sdhi_remove(struct platform_device *pdev)
> >         struct tmio_mmc_host *host = platform_get_drvdata(pdev);
> >
> >         tmio_mmc_host_remove(host);
> > -       renesas_sdhi_clk_disable(host);
> >
> >         return 0;
> >  }
> > diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> > index 9a4ae954553b..6968177dd1cd 100644
> > --- a/drivers/mmc/host/tmio_mmc_core.c
> > +++ b/drivers/mmc/host/tmio_mmc_core.c
> > @@ -1116,6 +1116,13 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
> >
> >         _host->set_pwr = pdata->set_pwr;
> >
> > +       dev_pm_domain_start(&pdev->dev);
> > +       pm_runtime_get_noresume(&pdev->dev);
> > +       pm_runtime_set_active(&pdev->dev);
> > +       pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
> > +       pm_runtime_use_autosuspend(&pdev->dev);
> > +       pm_runtime_enable(&pdev->dev);
> > +
> >         ret = tmio_mmc_init_ocr(_host);
> >         if (ret < 0)
> >                 return ret;
> > @@ -1192,13 +1199,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
> >         /* See if we also get DMA */
> >         tmio_mmc_request_dma(_host, pdata);
> >
> > -       dev_pm_domain_start(&pdev->dev);
> > -       pm_runtime_get_noresume(&pdev->dev);
> > -       pm_runtime_set_active(&pdev->dev);
> > -       pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
> > -       pm_runtime_use_autosuspend(&pdev->dev);
> > -       pm_runtime_enable(&pdev->dev);
> > -
> >         ret = mmc_add_host(mmc);
> >         if (ret)
> >                 goto remove_host;
> > --
> > 2.20.1
> >

-- 
Regards,
Niklas Söderlund
