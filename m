Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5541C1A9B29
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 12:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896528AbgDOKn6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 06:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2896475AbgDOKXh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 06:23:37 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DFFC03C1A8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 03:22:34 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id 184so1890173vsu.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 03:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lx1VtRilkF7eVbuL1lMqV+lLLP1ngAUmM+HAJ1wt5Ac=;
        b=tW7oCY6NwuTzovEpooLhKVX7j8WKfh5I1vB6sw1WLBd9zIz77/iJkudKEhHSGTJNxL
         OjE580GfYKLnOJQcweMM1PZ2y+AT+yRvwIKeG9+lvZbhR7JApqPAMv+HvyObHNAgkx6E
         K/FbxLIBh7urxHYuTqpAeIqugWaEqA42RGhIQFCiv0jhj9PkEJvHO8GViTOzI56sUqv4
         qZQgMlO/qrAyuRZfqSp2x/oKDru01OSr/iSju8lUPTUrvDOPSIi3jW7x5ZtHVeLwaQtP
         9Iwc8rdE2Mc6njZh4BuQ6/PlfcvlDBhU/186nOUNq5XucCrLHVm1Tr3LtLusVO0TMk/L
         z95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lx1VtRilkF7eVbuL1lMqV+lLLP1ngAUmM+HAJ1wt5Ac=;
        b=YtjgyoQTMPRFzezPIcAjqnyATh1K/lchdCwpTW9e9gIG1p0GoP6Oc/DpVvjkBS10m7
         AWY82mSUdA2Qo7tInpuivLtBMJGR+Y21Mtic7MAD6CfOj8H8U/Mc6J4GCkHFV69kEd6F
         mM8pgmNfALIlJ24ue22iXSvLt2pF+o0nq/itTh1KlWWmxan2yUm/wTKvPjlZIhkgcAYg
         KsjZitF8Zpd9IawcKPYkGk5ZbPFtOZrprVhdmK9IxhhNuc47UuwWmt86TgL3IHpHofOF
         ZxMPfldIC7pBJmZ7BcVjhFNICMZ/YbBhdc5IQHjuLroUc3+sD8MqpUKn/CtnZBy5IWH2
         SQ/Q==
X-Gm-Message-State: AGi0Pubhi8Z1ZUXrEcPPDZn/mFQXRE9GDouW1OIGJ96fJJeIv+4HrKhf
        kIIlfXokpntadul3on4FYy+XUO2178xNc00A0GesQA==
X-Google-Smtp-Source: APiQypIbijlX9DyYWKgWSpyuEFwcw+h84LGo/fGmFldPGwraTKeTj6jXND30tteV2M70rzj9h1IaZ6kAqvQBbyL8Vj8=
X-Received: by 2002:a67:f24b:: with SMTP id y11mr3768618vsm.165.1586946153713;
 Wed, 15 Apr 2020 03:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200408142252.21958-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200408142252.21958-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 15 Apr 2020 12:21:57 +0200
Message-ID: <CAPDyKFork=TB3GEfLhfdhGzneJ75p2fiQp3Qv4TAOPrpScVE4A@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: simplify summary output
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 8 Apr 2020 at 16:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> No need to call platform_get_resource twice when we still have the
> pointer from before. Also, use '%pa' for a resource_size_t pointer.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index c002e9fb67fb..de7f4fc9bc21 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -933,10 +933,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                         goto eirq;
>         }
>
> -       dev_info(&pdev->dev, "%s base at 0x%08lx max clock rate %u MHz\n",
> -                mmc_hostname(host->mmc), (unsigned long)
> -                (platform_get_resource(pdev, IORESOURCE_MEM, 0)->start),
> -                host->mmc->f_max / 1000000);
> +       dev_info(&pdev->dev, "%s base at %pa, max clock rate %u MHz\n",
> +                mmc_hostname(host->mmc), &res->start, host->mmc->f_max / 1000000);
>
>         return ret;
>
> --
> 2.20.1
>
