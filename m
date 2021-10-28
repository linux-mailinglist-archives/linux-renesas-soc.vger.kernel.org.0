Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699D643F18C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Oct 2021 23:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbhJ1VY1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Oct 2021 17:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbhJ1VY1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 17:24:27 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF7AC061745
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Oct 2021 14:21:59 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l2so13010881lji.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Oct 2021 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/pA7yi/3lIK3ukD2TvOeRH5iB5l4NA2U0LMCXAcXsfQ=;
        b=ch7NEQ3fbZV69Oxf4AJM9RuoLQBovOZ63p6NdkSGynz6G3GJSC2IXiR3SYWnWJE4hJ
         Q/2Az/Ig+7xwC4oNPNLaSGmJ6RZfJcQjrhmUTe0szv10uSl4R/E4COdir6jwCWLI9XWU
         RQ69r9235BXcn/63n6pGzn7aN/7s0CTR69DKX6GJ2ngOGhY8AL/KcuILHxxKA7q3yCuE
         oSE9xjNE5Ys2I70NQOWxBlUVVj3TyuaIQZVfmMGEIiMWSmEURLtyoUpWwfxnJyosMnEl
         PZLk17xQf2Vo+Ku/LoKD65ApPI52xkgwRSswX9v/kspuafDalQ99NkVOAqORaV6JvXkt
         eXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/pA7yi/3lIK3ukD2TvOeRH5iB5l4NA2U0LMCXAcXsfQ=;
        b=K41BqOL9+xgpXNXupqj8Wb0hiferkedxQO5ovSSZOQKDK3/eI7F36RHFmPtI1F8CMK
         hX6yxXEb4y+wWmlrQqU6kks28NXTMl0/JOaXNBEdBaoSDvhWUtuYjS9ueJeOHt4fLlHn
         d6EqrN+fM3yU2LqO22o1eLBDtwDmOxbvvAcQbTfSxP8Yb+cIbo7ULyMS6S4vMNdxbQNu
         6GLGy3/wzOAsgIbBeBm9iOQH5pq4zROLhq9K996zcT0XqRVIwMICJje3l2xJoknpB0Sx
         gGn6brCTfk7IXkx4eOxiZ78pR3FvlDDPBUSoow/hlwZRqVnYn/qSq/1LE6iokyLOVAZv
         Bb5A==
X-Gm-Message-State: AOAM5337oz+hLEfpgYo55TH45OHcLJM8sx/JjxnEkQO3CQtVSDxKzqbH
        95S9trfMRmPgXPv9Og4cFcztdB/jlm0VAQBc70v8Hw==
X-Google-Smtp-Source: ABdhPJzPnUd/FFDhC481+FpAxJaqLFchVwbZ4f6v20WtJ45oqrfimP6Yy0uyBNSdYxjTDOFt5nxMle6XwdKvNgbxJSs=
X-Received: by 2002:a2e:a5c8:: with SMTP id n8mr7456473ljp.367.1635456117760;
 Thu, 28 Oct 2021 14:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211028195149.8003-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211028195149.8003-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 28 Oct 2021 23:21:20 +0200
Message-ID: <CAPDyKFoFuM8mmyE0M+D=KvXiRkaX6xMiTag9qKd9Yb1q+OeM6g@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: reenable card irqs after the reset callback
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 28 Oct 2021 at 21:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The reset callback may clear the internal card detect interrupts, so
> make sure to reenable them if needed.
>
> Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/tmio_mmc_core.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 7dfc26f48c18..e2affa52ef46 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -195,6 +195,10 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
>         sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_all);
>         host->sdcard_irq_mask = host->sdcard_irq_mask_all;
>
> +       if (host->native_hotplug)
> +               tmio_mmc_enable_mmc_irqs(host,
> +                               TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
> +
>         tmio_mmc_set_bus_width(host, host->mmc->ios.bus_width);
>
>         if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
> @@ -956,8 +960,15 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>         case MMC_POWER_OFF:
>                 tmio_mmc_power_off(host);
>                 /* For R-Car Gen2+, we need to reset SDHI specific SCC */
> -               if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
> +               if (host->pdata->flags & TMIO_MMC_MIN_RCAR2) {
>                         host->reset(host);
> +
> +                       if (host->native_hotplug)
> +                               tmio_mmc_enable_mmc_irqs(host,
> +                                               TMIO_STAT_CARD_REMOVE |
> +                                               TMIO_STAT_CARD_INSERT);
> +               }
> +
>                 host->set_clock(host, 0);
>                 break;
>         case MMC_POWER_UP:
> @@ -1185,10 +1196,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>         _host->set_clock(_host, 0);
>         tmio_mmc_reset(_host);
>
> -       if (_host->native_hotplug)
> -               tmio_mmc_enable_mmc_irqs(_host,
> -                               TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
> -
>         spin_lock_init(&_host->lock);
>         mutex_init(&_host->ios_lock);
>
> --
> 2.30.2
>
