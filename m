Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58D2461240
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 11:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhK2K04 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 05:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbhK2KY4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 05:24:56 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E7DC0613BF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Nov 2021 01:53:34 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id p18so14027862wmq.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Nov 2021 01:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1tIt1usm4A9wPgma7ntzt4rs6Rj3ONNUEdsoTNnKPZs=;
        b=CyYBPySO96oEWEz4VfwZnYwcIC7Q3+71XMxBYDXGVV9MLS0i5XfkmVGyT70BCchp0f
         O1SE5s/ykmf3HNTUVkOg1fzp3qMQZWmeX8IL8WAMgrc30CNBSmp5t0rj12Aec/hYulXe
         7OczQnuqcT6R8fH6k/oDjXFq/X9VbYsMD7cUl8hTRhNbF+AsQ4ijQk4OVAwa7ffgXg3C
         wubZa+KD27YUQji+drWAcLH20Uw5SaFq0LX6+KKawD4f+RXj/ijYEeFNeKfcGFyOMZ2a
         0+TYXth+jsgmn7OKfjebuMqJ5lDzGjP6XYtmR3wr47dNTHvdespu9hLj45SX0484jR1K
         8wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1tIt1usm4A9wPgma7ntzt4rs6Rj3ONNUEdsoTNnKPZs=;
        b=qS6DdC6exY9mEREv21sF9zQQsMtGC5bdh+7ywxI1EJG3czs26h14WQuf0PCDFcxD2V
         bk9MidwI8MCI19RiK21MJP7HFeUc5kcwLZjbs6MSH+i7OlrE87TbAGIH0akgUpCNlO7n
         H3MpbDeqc0L6J8/WH5+rAa5QZ4Xoucg4QodiQGs8q7NZNcFxZ2VyMcmQQikPJGBCpPD2
         hQwBkBzbq4bXhFG87t6qG50eAII2stk6mUiRNAnEF7gBnIXdN2K8ovN4I1weRZa/xtal
         Pw8+yQKa90yWucbrEp6fodPC7CvPgvd3HpkD+8GO2c+o5Z51uIMccDCKvomSXX4Vchxj
         a6Lw==
X-Gm-Message-State: AOAM5327USyKI48IslHlNhlYMIhD0BQ8RaMjHDoxG8PqwKl1Bm4sKOiR
        GLOAq7LhHer5wC/sT4Xu3k3xCc2mYvHBwA==
X-Google-Smtp-Source: ABdhPJyjEclD14Ye/OjLLAW8LWabyzB1tje+1xrK7n66sr0LMika3eVGTyKyeJ55JoT1Nt4GG64A+A==
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr35074559wmj.9.1638179612995;
        Mon, 29 Nov 2021 01:53:32 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:8236:a2e5:8d62:e9cd? ([2a01:e34:ed2f:f020:8236:a2e5:8d62:e9cd])
        by smtp.googlemail.com with ESMTPSA id v15sm13287125wro.35.2021.11.29.01.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 01:53:32 -0800 (PST)
Subject: Re: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
Date:   Mon, 29 Nov 2021 10:53:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/11/2021 19:44, Biju Das wrote:
> RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> deassert the reset line before accessing any registers.
> 
> This patch adds an entry point for RZ/G2L so that we can deassert
> the reset line in probe callback.

What is the connection between adding the reset line control and the
platform driver at the end of the driver ?

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Added reset_control_put() on error path.
>  * enabled suppress_bind_attrs in ostm_device_driver structure
> v1->v2:
>  * Added reset handling inside ostm_init
>  * Used same compatible for builtin driver aswell
> ---
>  drivers/clocksource/renesas-ostm.c | 39 +++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
> index 3d06ba66008c..21d1392637b8 100644
> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -9,6 +9,8 @@
>  #include <linux/clk.h>
>  #include <linux/clockchips.h>
>  #include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/sched_clock.h>
>  #include <linux/slab.h>
>  
> @@ -159,6 +161,7 @@ static int __init ostm_init_clkevt(struct timer_of *to)
>  
>  static int __init ostm_init(struct device_node *np)
>  {
> +	struct reset_control *rstc;
>  	struct timer_of *to;
>  	int ret;
>  
> @@ -166,6 +169,14 @@ static int __init ostm_init(struct device_node *np)
>  	if (!to)
>  		return -ENOMEM;
>  
> +	rstc = of_reset_control_get_optional_exclusive(np, NULL);
> +	if (IS_ERR(rstc)) {
> +		ret = PTR_ERR(rstc);
> +		goto err_free;
> +	}
> +
> +	reset_control_deassert(rstc);
> +
>  	to->flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
>  	if (system_clock) {
>  		/*
> @@ -178,7 +189,7 @@ static int __init ostm_init(struct device_node *np)
>  
>  	ret = timer_of_init(np, to);
>  	if (ret)
> -		goto err_free;
> +		goto err_reset;
>  
>  	/*
>  	 * First probed device will be used as system clocksource. Any
> @@ -203,9 +214,35 @@ static int __init ostm_init(struct device_node *np)
>  
>  err_cleanup:
>  	timer_of_cleanup(to);
> +err_reset:
> +	reset_control_assert(rstc);
> +	reset_control_put(rstc);
>  err_free:
>  	kfree(to);
>  	return ret;
>  }
>  
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> +
> +#ifdef CONFIG_ARCH_R9A07G044
> +static int __init ostm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	return ostm_init(dev->of_node);
> +}
> +
> +static const struct of_device_id ostm_of_table[] = {
> +	{ .compatible = "renesas,ostm", },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver ostm_device_driver = {
> +	.driver = {
> +		.name = "renesas_ostm",
> +		.of_match_table = of_match_ptr(ostm_of_table),
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
> +#endif
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
