Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A28C72051C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2020 14:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732539AbgFWMGy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jun 2020 08:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732333AbgFWMGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jun 2020 08:06:53 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BB9C061755
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2020 05:06:53 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id m23so4763516vko.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2020 05:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MvMXHhq+2NXSlQ0VxA/FKQ9PJItTwUoUNVjQj2ToK20=;
        b=IgZ2WLFPg8aUvzMOKHeBblyB/RLQhvJCgzxaUbdaIrmAPo5rkvLoMLUdEUU2LltL0w
         tOUsjceIQIUr+vDaR3cXgWKu3ucGNYAKWBoFskye6TwAg4BZ7E7uBGKMKDaFkerBPKTA
         qosnNK1QD0sZRhCvkzad0OjRyqWzzA/thpJIta3zstAT05Z61+uhW8S1VWVo4dqZwErH
         cndTRjhZ5sHbTPkGGiK3C09LQ0/aeoObjDjM9l09bU66tovrxuupS1pg0wL0yrXJMT5X
         JB6/Z7GK+whBsUzWXr3n5UJkA9nl1oLRk0Wrn1Tbwkt8ymG6CiLAcJTHmDZe0co7QXfO
         ctag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MvMXHhq+2NXSlQ0VxA/FKQ9PJItTwUoUNVjQj2ToK20=;
        b=jwZhxwl19C+yYq/1bGJGr35+kmKNOfvayXmKveF3INRRZNDeG1L8sOMry6h+UG7A+O
         m0mQzqwAyrBimIswV7dT/DLR5xMCxzWWqBjXgLwkk1dQ6QUi+6Tm+JTTygCvMxodG8vI
         a14VzXxMPV6EW30N+TTbqzScOHY49Ut7Gbzw0wNdluMmZPL883mOEv1rAsbOcm1qj2KS
         U1d5DWYby4k3QXuX8ANLgO+NmeajpF2Nt7I12SjAjI6kiDP1B/HwD0Hnl/B3k1ebR711
         kx2s8XwBz+wyLaU7uaabcKY/tZCPCO285srj9yoiBhNa4hqPqQEJ4q7Fg6otJnSccf4L
         i8Lg==
X-Gm-Message-State: AOAM531LH813MjZQzJVwzhHp6e4SIadtQXJCxc0clod6d/+WBWKnyR2L
        9VWSqVP4VxPYy0nW4Z+GfFxZwz7T7LmZ0oqHJERBoA==
X-Google-Smtp-Source: ABdhPJxDSHXtW5m1dVDzqMXNbJ15G50w48MEPPMvuHd0IZtHCeCnuTvqKdT/kQKwxcrQAWPPa6fdLlL7KvI+lwbBCs4=
X-Received: by 2002:a1f:b202:: with SMTP id b2mr19506666vkf.86.1592914012493;
 Tue, 23 Jun 2020 05:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <1591703110-14869-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1591703110-14869-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 23 Jun 2020 17:36:41 +0530
Message-ID: <CAHLCerOxKuqhzfNSEMk6dB7B8Y_nvhQ0F0yO+BGrUE-P4SKBEA@mail.gmail.com>
Subject: Re: [PATCH v2] thermal: rcar_gen3_thermal: Fix undefined temperature
 if negative
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        niklas.soderlund+renesas@ragnatech.se, van.do.xw@renesas.com,
        dien.pham.ry@renesas.com, Linux PM list <linux-pm@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Tue, Jun 9, 2020 at 5:15 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> From: Dien Pham <dien.pham.ry@renesas.com>
>
> As description for DIV_ROUND_CLOSEST in file include/linux/kernel.h.
>   "Result is undefined for negative divisors if the dividend variable
>    type is unsigned and for negative dividends if the divisor variable
>    type is unsigned."
>
> In current code, the FIXPT_DIV uses DIV_ROUND_CLOSEST but has not
> checked sign of divisor before using. It makes undefined temperature
> value in case the value is negative.
>
> This patch fixes to satisfy DIV_ROUND_CLOSEST description
> and fix bug too. Note that the name "reg" is not good because it should
> be the same type as rcar_gen3_thermal_read(). So, rename it with "ctemp".
>
> Signed-off-by: Van Do <van.do.xw@renesas.com>
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> [shimoda: minor fixes, add Fixes tag]
> Fixes: 564e73d283af ("thermal: rcar_gen3_thermal: Add R-Car Gen3 thermal driver")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>  - Use int instead of long.
>  - Rename "reg" with "ctemp".
>  https://patchwork.kernel.org/patch/11593051/
>
>  drivers/thermal/rcar_gen3_thermal.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 58fe7c1..49ea330 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -167,16 +167,16 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
>  {
>         struct rcar_gen3_thermal_tsc *tsc = devdata;
>         int mcelsius, val;
> -       u32 reg;
> +       int ctemp;

Wouldn't it be better to change the variable type to fix the bug in
this patch and make a separate one for the variable rename?

Regards,
Amit

>         /* Read register and convert to mili Celsius */
> -       reg = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;
> +       ctemp = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;
>
> -       if (reg <= thcode[tsc->id][1])
> -               val = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b1,
> +       if (ctemp <= thcode[tsc->id][1])
> +               val = FIXPT_DIV(FIXPT_INT(ctemp) - tsc->coef.b1,
>                                 tsc->coef.a1);
>         else
> -               val = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b2,
> +               val = FIXPT_DIV(FIXPT_INT(ctemp) - tsc->coef.b2,
>                                 tsc->coef.a2);
>         mcelsius = FIXPT_TO_MCELSIUS(val);
>
> --
> 2.7.4
>
