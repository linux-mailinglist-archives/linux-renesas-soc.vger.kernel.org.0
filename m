Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12D12871B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Oct 2020 11:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgJHJjP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Oct 2020 05:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgJHJjP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Oct 2020 05:39:15 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D189DC0613D2
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2020 02:39:14 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id u74so2701573vsc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2020 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mm/dnK6nyjUE++/nfQRum9Y7O3yymi4HN5zd5EnYbEA=;
        b=TaaG64FItcVw1JWXnfkJKiZg07MxfH+VZsmHm6nEX/4haHLWJrVaPW1DmoeMX4Zk8a
         zqZXbBIHdSvVVX2w/bq0ubgr0TLeczFx29J3RD5Vt/S9CkTz+o2cVULJbsAmUgwO+9be
         Gs1xg1KGGIHRZwH+g9+A5Af44lHdJ5tirUHCOW03srBv0qu6KGhzAmn+LEKKQ395JsBR
         C8SxELa7C/uOPS3mt9k4rI6/k+w4wUbvOD81NY3AV+L8C43eLQ+yoY38q9nTBPPLGsfF
         kkndyyKWagpKWKiUKnVxIqa8rEwulIY/03k1F/qH6EdTF3Zprx1KkKdgIeEXsRQmRV66
         ozzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mm/dnK6nyjUE++/nfQRum9Y7O3yymi4HN5zd5EnYbEA=;
        b=htxcQ5/oRMVKERtfsyy8yTCnEaiWZNNG2CTfdIjZilkQ8UeeDilz8bQGqngJf3CQiU
         X44kZT1ap7+E3yHNqPeIiM3d603BeL86S6V0gD0RyKsMTygWyekU+EHjj7yUx/vCgzNh
         xbw4XEAfTndgG0Mbj/2P5kYvlF/MzRozccFpO1h14lg9R86OTBtfAce4LF9WiHIHN4/J
         JChV8U2bDrVfho2yIlid5vTdRtQHbbZ/T00vS6Oa/r3opOsInuEMNuJes/wbIMLdjzBh
         4CJMVqyVxBuGFxw5PjmhP6joUDCtnQIRstSl3xBMJLWaeAkfSAhIg3UedQ9MSTwel7Ke
         nlUw==
X-Gm-Message-State: AOAM533wrY+aTF8/vRvrxR5ra1QxSlj/O/YJMRL/uW/mvQbWwANQHGi7
        SDvlPlQnuoHbSKia6FFZU8ZmZnk9y7s+ayGM5MtzSA==
X-Google-Smtp-Source: ABdhPJz6awDRktXAdMWIlebTSGncSvSVq2A3pc+3fysf4d3OIZZ/TY1OgHQn0LOhz8U8CEPWkdrB96+AAeFi5BXW0HE=
X-Received: by 2002:a67:6b07:: with SMTP id g7mr4372068vsc.48.1602149954039;
 Thu, 08 Oct 2020 02:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201008092533.76588-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201008092533.76588-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 8 Oct 2020 11:38:38 +0200
Message-ID: <CAPDyKFqybhP1gXEzexdk9tOUkZdaApa-zYnny3RdN4Dk10ei=Q@mail.gmail.com>
Subject: Re: [PATCH] mmc renesas_sdhi: workaround a regression when
 reinserting SD cards
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 8 Oct 2020 at 11:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> After the conversions of the reset routines, re-inserting SD cards
> didn't work anymore. Apply this temporary workaround to have working SD
> cards during the merge window. The issue will be fixed properly until
> the final release.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

> ---
>
> Hi Ulf, this regression only shows up in mmc/next, so this is *not* for
> the current release. Anyhow, I'll be away for two weeks, and can't work
> on it. So, I hope we can have this patch for a while to have a working
> state.

Okay. I am a little worried that the below could cause other issues
though, but let's look at this when you are back.

>
>  drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 20e5eb63caf8..414314151d0a 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -572,6 +572,17 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
>                                              TMIO_MASK_INIT_RCAR2);
>  }
>
> +/*
> + * This is a temporary workaround! This driver used 'hw_reset' wrongly and the
> + * fix for that showed a regression. So, we mimic the old behaviour until the
> + * proper solution is found.
> + */
> +static void renesas_sdhi_hw_reset(struct mmc_host *mmc)
> +{
> +       struct tmio_mmc_host *host = mmc_priv(mmc);
> +       renesas_sdhi_reset(host);

I wonder why you aren't using the ->set_ios() callback to do this instead?

In principle you should be able to look at host->ios.power_mode and
check if it's MMC_POWER_UP|OFF|ON to understand when a reset of the
host controller is needed. No?

> +}
> +
>  #define SH_MOBILE_SDHI_MIN_TAP_ROW 3
>
>  static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
> @@ -1009,6 +1020,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 if (of_data && of_data->scc_offset) {
>                         priv->scc_ctl = host->ctl + of_data->scc_offset;
>                         host->reset = renesas_sdhi_reset;
> +                       host->ops.hw_reset = renesas_sdhi_hw_reset;
> +                       host->mmc->caps |= MMC_CAP_HW_RESET;
>                 }
>         }
>
> --
> 2.28.0
>

Kind regards
Uffe
