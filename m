Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E199A3F9598
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Aug 2021 09:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244528AbhH0Hy3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Aug 2021 03:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244546AbhH0Hy2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Aug 2021 03:54:28 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6741CC0613CF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Aug 2021 00:53:39 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z2so12670966lft.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Aug 2021 00:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FnvhmoF5/z5/Vlkplzor1LntS+hajMMuv6rFjI/7vFw=;
        b=NRx5Wx6kgOUXMrIJ2SbxoHAdocMAaMe+q3x/PbhlpQ753+LbpjsX4my4xo/BNlbDWM
         X+RX+7MeLQZub1WWy3wOwIfyUBCpAbZQvpuhdBUXN9pXxAykoArZndCZm9D8+pWmD6/n
         Os+oiJRMwJNY5v2GRnZBb2+hfMehbUV4ZKEfzyixmfth71yaofaAu6svKhWW16AMrfvD
         530Yg3AkQgpDOGcMdnwMnM1bH4VI87O8WaubWNe0QIZk4pJXXPsEVIF4IyK3PjMH3WeP
         DnthtUJdG/UqBsUTvv6IXRM+UMCy/BpuDqpRpmUddAvf9xzf2KLmfOjj+iR3Pu86IljA
         HebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FnvhmoF5/z5/Vlkplzor1LntS+hajMMuv6rFjI/7vFw=;
        b=p4ygEP/CJvrnLqzxaxdzTd7jRUeooxAQwtV0n8ObZaF4AJn/Zbx2mX44RGRch+sCOE
         S6hBUchryPp5ziOuRHqatwKLlvfhnAUaVTX5P/v3iNGm/9EQFkeGARtZ41k6UVbsSlOh
         vPz6X2yQ+VVUKhFfq02VNxg2S8tf9AHiYAYlm6V6WY78j7EaLrXikVYTFxO7/dA/y44i
         JFG6r4n5wywZQ4EWUgQZ2JtUO3C6FcenNSNRBu8vHeOExUURWCV+H2+uKd0VUTo3Elxh
         8GakKqhOkc8GAuidxqI8CLFxdsRnnPPW7gao2AS1G+BqemTIJYRuhmABtB1m8obnBDM5
         qtww==
X-Gm-Message-State: AOAM532UgSMjrhAaTFWH17q44SNrglJi7Urh/L9P93RYcq55lQ7BSIlh
        lzbI7/N0+ZYuR19qC+L/+bE2Zw==
X-Google-Smtp-Source: ABdhPJwZdfVkvJZoC4n948k+9nQxzZ9D3jLacRPvLtoGWBGZcLZ3Dp0V5XDuyUJdJv98SJ3r3qThog==
X-Received: by 2002:a05:6512:3092:: with SMTP id z18mr5792558lfd.395.1630050817735;
        Fri, 27 Aug 2021 00:53:37 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id l13sm520144lfj.199.2021.08.27.00.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 00:53:37 -0700 (PDT)
Date:   Fri, 27 Aug 2021 09:53:36 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PM: domains: Fix domain attach for CONFIG_PM_OPP=n
Message-ID: <YSiaAM9AbryH+uwB@oden.dyn.berto.se>
References: <4fb42fa1b76b38c6628f056cfd804bb5b4e74d99.1629818532.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fb42fa1b76b38c6628f056cfd804bb5b4e74d99.1629818532.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-08-24 17:23:38 +0200, Geert Uytterhoeven wrote:
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

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

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
>  	/* Set the default performance state */
>  	pstate = of_get_required_opp_performance_state(dev->of_node, index);
> -	if (pstate < 0 && pstate != -ENODEV) {
> +	if (pstate < 0 && pstate != -ENODEV && pstate != -EOPNOTSUPP) {
>  		ret = pstate;
>  		goto err;
>  	} else if (pstate > 0) {
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
