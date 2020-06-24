Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCBD2070BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 12:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388513AbgFXKF5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 06:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390245AbgFXKF4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 06:05:56 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2421BC061573
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 03:05:56 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id v1so1043914vsb.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10KdVrvRcqcU7BAE9TE3rWn/5fxZBGSrASHyDmRJtXM=;
        b=dx2qo7WE83Hc5fRf4iumkEKEpKOq8/xSgb5zhW2ExsfKhdE2hhj19phuN/etY0MyMZ
         4lIHVUN2jFzc8B2MN079tBp/6k2vvA1c8COxB0LetkkpK0jTkwCRu0++JI07SEO7Fzoy
         974PO1agQ630b9J0NOguL1XFsDgoM8KNntlrWZizU4hI00bbwNc8ZOsLMkqErBXrRnGp
         yDt94s1FdVErOE6UalakZBBPEFM9hyn459DAfN00h9z/o12fsgWcHVN35UZq/PnVx5l4
         q/TNn9HbPoYR5eclibtgTwiP7ZCWIolYWU5hlG23EROBGHKJNRjCh6HyBGs/XyIHX5bz
         3f3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10KdVrvRcqcU7BAE9TE3rWn/5fxZBGSrASHyDmRJtXM=;
        b=Yckw2raG2FLHLx/scs6loTM6RWFl3xpYIp3R0GfCz8JdtsaiOiLwkO3Us5S+H/Q7tw
         NfiUFfJ/jxGof9yOxIHByF+sHA3QY0+ZODz/THIg26CNUK2Hc4IwlSoZr0SNrWHfMbx7
         ql2bLcmKyISdoXq1nyARPAs8Bn9YytnHbaObvz/jURos+KkNMLXuEn2MJmmWffwSm1ZZ
         bgkDk4xzKi7jNKjVqeO2wdqze1MlYHAqmAyW7oZ6rd2gzBYjFHzISsywN0DxlBFvagZP
         RmXcRZMxBp+cNb/WaHEIwPXyf1IgdYjndQ7XD13lqadTeDLw90wphJQq4+omqgih4ES3
         zi7w==
X-Gm-Message-State: AOAM531Fv0WDA8vA0lGQlf2t/hHNhvDGflBIl6Y/njSXSYxyNhPubd/X
        fRmxqpg8hivkDAb7lmCpAMuAsQTtdCrhIL9u+0216g==
X-Google-Smtp-Source: ABdhPJwU9xUrMe4zJBCOJoN8W/NRi9A8JAfucdFiFbrAY/XpcJZHaywqdviLlWaKsFRFqUsj8K9k1y62gKLkYSZAPPE=
X-Received: by 2002:a05:6102:18e:: with SMTP id r14mr23533192vsq.200.1592993155375;
 Wed, 24 Jun 2020 03:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592792699-24638-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1592792699-24638-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 24 Jun 2020 12:05:19 +0200
Message-ID: <CAPDyKFq-dEPaU094hrk2xg18VpJAsbnf8enieFmcMhKiB1bW1A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: core: Call mmc_poweroff_nofity() if pm_suspend_via_firmware()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 22 Jun 2020 at 04:25, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> If pm_suspend_via_firmware() returns true, the system will be able
> to cut both vcc and vccq in the suspend. So, call
> mmc_poweroff_nofity() if pm_suspend_via_firmware() returns true.
>
> Note that we should not update the MMC_CAP2_FULL_PWR_CYCLE caps
> because the mmc_select_voltage() checks the caps when attaches
> a mmc/sd.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mmc/core/mmc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 4203303..81941fd 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/slab.h>
>  #include <linux/stat.h>
> +#include <linux/suspend.h>
>  #include <linux/pm_runtime.h>
>
>  #include <linux/mmc/host.h>
> @@ -2038,7 +2039,8 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
>                 goto out;
>
>         if (mmc_can_poweroff_notify(host->card) &&
> -               ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend))
> +           ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
> +            pm_suspend_via_firmware()))

Sorry, but this doesn't work.

Even if PSCI is a generic FW interface, it doesn't mean that all PSCI
implementations will cut the vcc and vccq for the MMC card at system
suspend.

Instead, you need to decide this based on some specific DT property.
Perhaps in conjunction with using pm_suspend_via_firmware().

>                 err = mmc_poweroff_notify(host->card, notify_type);
>         else if (mmc_can_sleep(host->card))
>                 err = mmc_sleep(host);
> --
> 2.7.4
>

Kind regards
Uffe
