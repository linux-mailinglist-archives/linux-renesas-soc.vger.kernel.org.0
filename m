Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292041F140B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 09:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgFHH6D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 03:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728955AbgFHH6C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 03:58:02 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE2BC08C5C4
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2020 00:58:02 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id v25so5516747uau.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2020 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=usa2O3VnVimdZz2QFTyqirZyCnD9v7o6Y9XSy9l9BZQ=;
        b=jbjzzPoj1LdiFFNG5vJNANcVDGSPSpfEkRZwfsXF2gcUG29xQOQ5oBYLYDNYasI49I
         q12WRMFRu5cwpEFK6YLSextAJTw7PO/wRgSurkZ5iUZzifmeNrzA51kCfdysGz0G7Heb
         6I7agqBH1Om4sLhJZzpWfdS3ceapyJEhD3lNVh/OEO2jo9vN8CkycHhGu8lZYqCcRPSp
         yqVYPRA1T+1bvpK8KnO2w48bz388aSvitb4TdfKav/g+lHY4+PJnrPNBm+LeZOR9UDyr
         MZHh87ce+FVZZ/sF6gQgyZpgEbterGO0d3j5PTKNrwyyTe44yPaLu/h4SwgHuB4EDUW0
         m/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=usa2O3VnVimdZz2QFTyqirZyCnD9v7o6Y9XSy9l9BZQ=;
        b=oTHv0BuaElZZiaPfPpsyv/pWQIa2I0WaiTG1tGh1GTQ+WT7ziSBqsS8SjFyUAeA9Tc
         A8z2Py7JKxqPYzAS3Tl5SdqSeYtbBFFzN6pOF4s4mUwCkMObt/ZbeT3iM1Fev2O8kAau
         1A4OrPJHPkaZGMuIZZ2vTxFCzWRS3g5EjoEClNBP10LXfty0ly+87LaEzo7fbbdSbHiM
         D1UAjSCD6boCOF2VYztrcFoRpkWG0mjyPLtTOB/VVPUubKOu8JysDgHN7Qrgbf81Hd85
         LQnfWOgBJ0aDJh/gqbQQfA6DLnI8W5BNH6DESwgWdUc/3vyCbV2UIw+2rIkyct91bHnO
         D01A==
X-Gm-Message-State: AOAM533s94CShrb9IixNLOCwjeigTbAmZoW7rFkyKJdJzco3vxM3j0nK
        QXtXVTODVatSwjUNsWJcD8tPI3G61MkDqcqno1dxjA==
X-Google-Smtp-Source: ABdhPJzHPVZcT9fOcq/5mnEdYXiSTcCK3xCGQDgTq7ZQjol8t3AS01de6pjkoygr26G7tmIC54OyjHigWPcFrcXu7tU=
X-Received: by 2002:ab0:186d:: with SMTP id j45mr15425936uag.104.1591603081439;
 Mon, 08 Jun 2020 00:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 8 Jun 2020 09:57:24 +0200
Message-ID: <CAPDyKFq5yueXp4NW2fj3tvPRv0S_VDM1khAw51VeEHxG79qp+Q@mail.gmail.com>
Subject: Re: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC Suspend-to-RAM
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 May 2020 at 13:33, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> The commit 432356793415 ("mmc: core: Enable power_off_notify for
> eMMC shutdown sequence") enabled the power off notification
> even if MMC_CAP2_POWEROFF_NOTIFY (MMC_CAP2_FULL_PWR_CYCLE now) is
> not set. However, the mmc core lacks to issue the power off
> notificaiton when Suspend-to-{RAM,Disk} happens on the system.

This isn't an entirely correct description, I think.

If the host supports MMC_CAP2_FULL_PWR_CYCLE (both vmmc and vqmmc can
be powered on/off), we use power-off-notification during system
suspend, in case the eMMC card also supports it. Otherwise we send the
sleep command.

This behaviour was decided on purpose and it's mainly because without
MMC_CAP2_FULL_PWR_CYCLE, we assume that vqmmc remains always-on. In
this case, it simply seemed better to use the sleep command, rather
than the power-off-notification, as we aren't really going to do a
full power off anyway.

Kind regards
Uffe

>
> So, add Suspend-to-RAM support at first because this is easy to
> check by using pm_suspend_target_state condition on _mmc_suspend().
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mmc/core/mmc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 4203303..4a23f83 100644
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
> @@ -2027,6 +2028,12 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
>         int err = 0;
>         unsigned int notify_type = is_suspend ? EXT_CSD_POWER_OFF_SHORT :
>                                         EXT_CSD_POWER_OFF_LONG;
> +       bool s2ram = false;
> +
> +#ifdef CONFIG_PM_SLEEP
> +       if (pm_suspend_target_state == PM_SUSPEND_MEM)
> +               s2ram = true;
> +#endif
>
>         mmc_claim_host(host);
>
> @@ -2038,7 +2045,7 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
>                 goto out;
>
>         if (mmc_can_poweroff_notify(host->card) &&
> -               ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend))
> +           ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend || s2ram))
>                 err = mmc_poweroff_notify(host->card, notify_type);
>         else if (mmc_can_sleep(host->card))
>                 err = mmc_sleep(host);
> --
> 2.7.4
>
