Return-Path: <linux-renesas-soc+bounces-11168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A249EB596
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF5F5165E30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A441AAA0E;
	Tue, 10 Dec 2024 16:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HW04Sc4m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B384619D8BB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733846624; cv=none; b=TQlBhBixWdeD8NcPnvdiLGNxpTgo3eNAh8m+cz957TyVkvY5lVA9/Jx2HgqU7Xzvx1QFs4Irn2zF5zIIytfWx71oYYw6skbHR9+MF79VphOwhgAmoHNILawnt82b4+QTsU7puFLEaQkM3EVNAOqefn4SvSDaB5iST41H8NbnICY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733846624; c=relaxed/simple;
	bh=UOTPAtKWyD7gFMhOOKr+A6e81aV6rc5w+D5LzlJd6u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrC7cvt6eDb+PJmzp91UQ70Vs1h48aMD5d1BB9hyv8hyXguhMoEgg2YnhreTmUgoubIdk9QZ9qAMjewzvbnSMtnE4K/WeGU6WHcWpI9b3NX79wAhDAzFkRnBVRiv7TVpeh9Gf3ek3C1raE6p7TV/6qi0/Dh6tNiQV7I+GiueXk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HW04Sc4m; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ef66a7ac14so59985237b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 08:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733846622; x=1734451422; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LhEIDAnEZpONosohSVWoCUepf7Cunl5z9Kx9mK0Glaw=;
        b=HW04Sc4mP3QZvt7x3l8m3J5mc1ZSUU16tK9oSjOkRlz7jv0TKNnxELcU+p8Ry3MLn0
         yhnNMWtj+Xsu1T3Rllz5jiAbpC9albbwTI8g+qge5TSuiAIhvO9+2SCX+fS34JYrfh/l
         5Htngnk0zvZFfzkJssoV1GTm138v4gby8qn4NpX12VXhRHMjcgSevykMawM7+Ctxcg6n
         6eJkagewtlEYEdWgQVDadiBEEArojgHccaFyoTnpoVLDr9Js5+uaLnCxVpozdny4W4it
         ZHWq64gzqeV9pno+hgTpWIy+qbDXnBrYxJnZhoTOAM5FcppRLb++mMlCPK3TKy9Qw/GS
         dIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733846622; x=1734451422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhEIDAnEZpONosohSVWoCUepf7Cunl5z9Kx9mK0Glaw=;
        b=iKSa+sGkSb0Dmll1SMIrqgRSak3sjNP9rjVy5SZfCooFnMRXti59xkhgWsRU6210kL
         87KQ459L/V6zJmDNfyjciYAk1jh6e89PiICwfUUaOUCq9Jct/xmmx0HKD+xwqt+EuwbA
         uVWHMgrs4CiUaJl50VUzHfWcYhIKKb6bfoyXbBSE2/KwTbiWdtdplSoSZBsIhZkeWgLb
         eLRws1hlkF2KdN+MsKnTRyLM5MWxkSpj7PTRZ2ctU8j/or8HS5pDv5uU9v8iuCP9JvGG
         pHuGGsjHM56eJzh5jViz65D7PfXuNhUYAjoE32HPy59VjHWiz37vjcqBTYhcuz3FG8Dx
         P0Zw==
X-Gm-Message-State: AOJu0Yz6JYa0dH3/0yyOHi2R3Dc+bDVNbn+9JgxCMQbnJzE5Ph6UEQfN
	LjLUaWT5AbXspH1rhPAimNPNZjYpPdu8FLeQAQwdLjeE28EANPIFT0Tfjj/Z/vY5ucXAhhkdcc1
	O8xIajZNUl4gujaJsl8fNqFO1DNADALleWvDyow==
X-Gm-Gg: ASbGnctMM1JmWKkAsVNWL/dh+8vG+wLsYyIdk9t8hq65GbjoSZhjogn/uvDBIzcRHuY
	NxC1pUMPmXqn+cqp0LUDlY2N78TnMZzS1Bipc
X-Google-Smtp-Source: AGHT+IFWCNMrvau0H2Y5yrb8L3K2B120WvyiZ9O/dPYrX3BoboBKK5fohFRU1Id7Eja/aLuzEyj2jnn+VF3IWa1S1nY=
X-Received: by 2002:a25:7145:0:b0:e38:81cc:f95 with SMTP id
 3f1490d57ef6-e3a5dcefa67mr3836041276.10.1733846621324; Tue, 10 Dec 2024
 08:03:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104092215.20946-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241104092215.20946-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2024 17:03:05 +0100
Message-ID: <CAPDyKFrOx3CiVjiWTPwqMC8XONwQ2C=NHFGw_h_XqA1yoZni8g@mail.gmail.com>
Subject: Re: [RFC PATCH v2] mmc: suspend MMC also when unbinding
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Nov 2024 at 10:22, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> When unbinding a MMC host, the card should be suspended. Otherwise,
> problems may arise. E.g. the card still expects power-off notifications
> but there is no host to send them anymore. Shimoda-san tried disabling
> notifications only, but there were issues with his approaches [1] [2].
>
> Here is my take on it, based on the review comments:
>
> a) 'In principle we would like to run the similar operations at "remove"
>     as during "system suspend"' [1]
> b) 'We want to support a graceful power off sequence or the card...' [2]
>
> So, first, mmc_remove_card() gets improved to mark the card as "not
> present" and to call the bus specific suspend() handler.
>
> Then, _mmc_suspend gets extended to recognize another reason of being
> called, namely when a card removal happens. Building upon the now
> updated mmc_remove_card(), this is the case when the card is flagged as
> "not present".
>
> The logic of either sending a notification or sending the card to sleep
> gets updated to handle this new reason. Controllers able to do full
> power cycles will still do a full power cycle. Controllers which can
> only do power cycles in suspend, will send the card to sleep.
>
> All this is for MMC. SD/SDIO are unaffected because they are not using
> the 'card present' flag.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/1602581312-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
> [2] https://patchwork.kernel.org/project/linux-mmc/patch/1605005330-7178-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
> ---
>
> Lightly tested with a Renesas R-Car S4 Spider board. It bascially works
> as expected. Serious testing postponed until the generic direction of
> this is approved :)
>
>  drivers/mmc/core/bus.c |  3 +++
>  drivers/mmc/core/mmc.c | 29 +++++++++++++++++++++--------
>  2 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/core/bus.c b/drivers/mmc/core/bus.c
> index 0ddaee0eae54..52704d39c6d5 100644
> --- a/drivers/mmc/core/bus.c
> +++ b/drivers/mmc/core/bus.c
> @@ -403,5 +403,8 @@ void mmc_remove_card(struct mmc_card *card)
>                 host->cqe_enabled = false;
>         }
>
> +       card->state &= ~MMC_STATE_PRESENT; // TBD: mmc_card_clear_present()

This is nice from a consistency point of view. Although, I don't want
us to use this bit as an indication to inform the bus_ops->suspend()
callback what to do. It seems prone to problems.

> +       host->bus_ops->suspend(host);

I think this is a step in the right direction. Somehow we need to be
able to call the bus_ops->suspend() before we call put_device() and
before we clear the host->card pointer.

However, we don't want to call bus_ops->suspend() in all cases from
mmc_remove_card(), but *only* when it gets called from
mmc_remove_host()->mmc_stop_host(), via the
"host->bus_ops->remove(host)" callback.

I am wondering whether we should just re-work/split-up the code a bit
to make this work. In principle, when mmc_remove_card() is called from
the path above, we should not let it call put_device(), but leave that
part to the caller (mmc_stop_host()) instead. Or something along those
lines.

Would that work?

> +
>         put_device(&card->dev);
>  }
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 6a23be214543..2bcf9ee0caa8 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -32,6 +32,12 @@
>  #define MIN_CACHE_EN_TIMEOUT_MS 1600
>  #define CACHE_FLUSH_TIMEOUT_MS 30000 /* 30s */
>
> +enum mmc_pm_reason {
> +       MMC_PM_REASON_SHUTDOWN,
> +       MMC_PM_REASON_SUSPEND,
> +       MMC_PM_REASON_REMOVAL,
> +};
> +
>  static const unsigned int tran_exp[] = {
>         10000,          100000,         1000000,        10000000,
>         0,              0,              0,              0
> @@ -2104,11 +2110,16 @@ static int _mmc_flush_cache(struct mmc_host *host)
>         return err;
>  }
>
> -static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
> +static int _mmc_suspend(struct mmc_host *host, enum mmc_pm_reason reason)
>  {
>         int err = 0;
> -       unsigned int notify_type = is_suspend ? EXT_CSD_POWER_OFF_SHORT :
> -                                       EXT_CSD_POWER_OFF_LONG;
> +       unsigned int notify_type = reason == MMC_PM_REASON_SUSPEND ?
> +                                  EXT_CSD_POWER_OFF_SHORT : EXT_CSD_POWER_OFF_LONG;
> +       bool can_pwr_cycle_now = (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) ||
> +                                 ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND) &&
> +                                   reason == MMC_PM_REASON_SUSPEND);
> +
> +       pr_info("%s: suspend reason %d, can pwr cycle %d\n", mmc_hostname(host), reason, can_pwr_cycle_now);
>
>         mmc_claim_host(host);
>
> @@ -2119,9 +2130,9 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
>         if (err)
>                 goto out;
>
> +       /* Notify if pwr_cycle is possible or power gets cut because of shutdown */
>         if (mmc_can_poweroff_notify(host->card) &&
> -           ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
> -            (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND)))
> +           (can_pwr_cycle_now || reason == MMC_PM_REASON_SHUTDOWN))
>                 err = mmc_poweroff_notify(host->card, notify_type);
>         else if (mmc_can_sleep(host->card))
>                 err = mmc_sleep(host);
> @@ -2142,9 +2153,11 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
>   */
>  static int mmc_suspend(struct mmc_host *host)
>  {
> +       enum mmc_pm_reason reason = mmc_card_present(host->card) ?
> +                                   MMC_PM_REASON_SUSPEND : MMC_PM_REASON_REMOVAL;

I don't think it makes sense to differentiate between a regular
"suspend" and a "host-removal". The point is, we don't know what will
happen beyond the host-removal. The platform may shutdown or the host
driver probes again.

Let's just use the same commands as we use for suspend.

>         int err;
>
> -       err = _mmc_suspend(host, true);
> +       err = _mmc_suspend(host, reason);
>         if (!err) {
>                 pm_runtime_disable(&host->card->dev);
>                 pm_runtime_set_suspended(&host->card->dev);
> @@ -2191,7 +2204,7 @@ static int mmc_shutdown(struct mmc_host *host)
>                 err = _mmc_resume(host);
>
>         if (!err)
> -               err = _mmc_suspend(host, false);
> +               err = _mmc_suspend(host, MMC_PM_REASON_SHUTDOWN);
>
>         return err;
>  }
> @@ -2215,7 +2228,7 @@ static int mmc_runtime_suspend(struct mmc_host *host)
>         if (!(host->caps & MMC_CAP_AGGRESSIVE_PM))
>                 return 0;
>
> -       err = _mmc_suspend(host, true);
> +       err = _mmc_suspend(host, MMC_PM_REASON_SUSPEND);
>         if (err)
>                 pr_err("%s: error %d doing aggressive suspend\n",
>                         mmc_hostname(host), err);
> --
> 2.45.2
>

Kind regards
Uffe

