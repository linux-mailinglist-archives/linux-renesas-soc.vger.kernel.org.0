Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1383F9A03
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Aug 2021 15:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245436AbhH0NYi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Aug 2021 09:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245305AbhH0NYh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:37 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A390C061796
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Aug 2021 06:23:48 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m28so14339269lfj.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Aug 2021 06:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vVEdAtwasWkrT0f0vOq5zJOkTWOPwPdpExa1I7BhZtc=;
        b=lFI32R63zrucrYnkIqq6iE3qq5EeU910b9somn/1eHEmLa7lyPBVXEXSvUVfHZXljx
         TN6C7dFaRvGcV7OMzmM2Z702UqA21+p6LGiil3JBftn6N+xI5cU3ZZKXnuDMakUW+3aS
         2JJPsdBHzh/GUX+dBrwrAKurlt2KMRM3E29qSJusmZRW6Gkawk70f92avYnixl5DMoY0
         iRfhpFxvyjlDDWVaZC/SZpaBr+oTpnlorA3vhS0oFOUOseXOqeLPa/ulN1BaOmExMsz4
         lKUa8NlGjOIXU4SMK755TODSTf/PrplBh65Z7qev6Iz8YtvnlSlcHUfQ1X8DX7x1gssR
         KGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vVEdAtwasWkrT0f0vOq5zJOkTWOPwPdpExa1I7BhZtc=;
        b=Vk9hjkUEmyGDOzuta4kiFr+kRR1KhlOcIC/S4szRwzp9JfAKfGku3JSDfmZgAzlU+2
         5ghK+LXxpcN1UYjRVX/Pt8sTeQ3aC7F2m2+/A7O7wuYbZoWdBDT7PPAXgEFNCo15D3OS
         Wq7MaEYEs9t7oS6KiG6S3FLD1Ag2mDqwjbEsFUAJ5NJBjWATRMuu2IcbhQgtTuAf1c3b
         cDwgHtqtiYDE/eykgPRgU6J3Xnoj5dlj/yz/tjb3LtpW/fiq97yoWVGGO2A4WvYvfRNd
         jrkAYXm2UhbhNCIx0xz+yABezXrf/pAJQgdOkhtrg9DVFYr/ClpZyzWWakH4yearLhuP
         iRjg==
X-Gm-Message-State: AOAM5302+I0pB4esTbXfk3WhgaOVWkxB4DJH+bBcHeF86VlQj8XSniCe
        xzQXEYnLEujQ0GGzQI7oBOfWcQoeQ/z7nRYe6BXTFQ==
X-Google-Smtp-Source: ABdhPJz8jK79D3e6Kay83LX5n+kuJqijB53HmFK7YA4ArgShByf4lqcNzK3GCZnShdgQPw2M6e8FYqwcpSmFFVEggjE=
X-Received: by 2002:a19:655e:: with SMTP id c30mr6648013lfj.142.1630070626804;
 Fri, 27 Aug 2021 06:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <4fb42fa1b76b38c6628f056cfd804bb5b4e74d99.1629818532.git.geert+renesas@glider.be>
In-Reply-To: <4fb42fa1b76b38c6628f056cfd804bb5b4e74d99.1629818532.git.geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 27 Aug 2021 15:23:10 +0200
Message-ID: <CAPDyKFrwxCH-AEDNnhwmoZ9aHZVzKw-=foo7F0mhMNLTCZxpYQ@mail.gmail.com>
Subject: Re: [PATCH] PM: domains: Fix domain attach for CONFIG_PM_OPP=n
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 24 Aug 2021 at 17:23, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> If CONFIG_PM_OPP=n, of_get_required_opp_performance_state() always
> returns -EOPNOTSUPP, and all drivers for devices that are part of a PM
> Domain fail to probe with:
>
>     failed to set required performance state for power-domain foo: -95
>     probe of bar failed with error -95
>
> Fix this by treating -EOPNOTSUPP the same as -ENODEV.
>
> Fixes: c016baf7dc58e77a ("PM: domains: Add support for 'required-opps' to set default perf state")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/base/power/domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index a10d740c4f2a1c28..7b197690e6442911 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -2760,7 +2760,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>
>         /* Set the default performance state */
>         pstate = of_get_required_opp_performance_state(dev->of_node, index);
> -       if (pstate < 0 && pstate != -ENODEV) {
> +       if (pstate < 0 && pstate != -ENODEV && pstate != -EOPNOTSUPP) {
>                 ret = pstate;
>                 goto err;
>         } else if (pstate > 0) {
> --
> 2.25.1
>
