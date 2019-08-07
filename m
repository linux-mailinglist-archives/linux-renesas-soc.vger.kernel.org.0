Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF6C852BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2019 20:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389176AbfHGSNf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Aug 2019 14:13:35 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54971 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389120AbfHGSNc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 14:13:32 -0400
Received: by mail-wm1-f67.google.com with SMTP id p74so946550wme.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Aug 2019 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OJX33C7cxGh8AJgsVZ3DfPY+Fby01Pfcxu1XgJm+zLA=;
        b=ZkJ9j0TBz3BgWJzAD+BaU2jcU3TFyFpvx3rvm/ELebAxbeQIhtnePYtkUoiIdgB6yg
         ieNFtOVjGlwVSHl+Oyp7w2SJMysqRqw2eupqMCeov2HxsbIB8zGPM4ABpuE+LLJFP4TS
         0u/1ozPUqHZnRqqAQZztvhSKuzEb9auJaLWSFefnNMfx8KkwmopkvSO8DYQCUEZQZP1j
         PbCMc8KPiCsH3XFxhj/JiVkjsIyVbbB6yS5quCiw8bVJ890Q/MoS65p3eiUpDt6w1tN9
         QmdquScZnFDpjVw66o5xzV87Lu8n5nE+bPIclxu1aVEiFN+vbCDjFskESDqwYQYawkpi
         KZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OJX33C7cxGh8AJgsVZ3DfPY+Fby01Pfcxu1XgJm+zLA=;
        b=pB7W6Hai10B6IThFlwbl45mp0UBdpioheYwnHLcUzZPsT1T6oHIds0aCq/x6q3Kte8
         qif7hbmEor+RlQXVIE6l0MXC++wvA6AYDSHBd969c2DvHdaei4xfAoqCe5I2mdzl0Cq6
         C2doxwY2TijfSgQaRjF7FRYp+vysFAZJgQSoCRVS8kWMN1zevFgZ5wi4NRz++AyacoNA
         8CzDWwdHVVEOl0nfnzjvcjxCaa+caV48fj6lZplcftfpFj7r4Sni8lAC3fjOgLOCYlqC
         4i7HtvJQ3AVBc8RRKQlZ6uaW/VVEFvTlQkgEzswOQGfixrOhKXQK+hPRijQe40LIjXaJ
         u92w==
X-Gm-Message-State: APjAAAVhs4HuYesROkXFG8DKC6jow3BQE16snpTZ8nbJYljIBdi70s4e
        v/G8A41VHmvu1zWF0hCHyUBRuob9rIs=
X-Google-Smtp-Source: APXvYqyUviOaJLN1mLh2CTphmD0/VjeEhXON6+81TVvN8FyzDclb/2JyP40w2XNJudqNsGRf0AFf6g==
X-Received: by 2002:a1c:107:: with SMTP id 7mr1135181wmb.84.1565201608822;
        Wed, 07 Aug 2019 11:13:28 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:90cb:64c9:c238:a704? ([2a01:e34:ed2f:f020:90cb:64c9:c238:a704])
        by smtp.googlemail.com with ESMTPSA id 4sm212835271wro.78.2019.08.07.11.13.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 11:13:27 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] clocksource/drivers/renesas-ostm: Fix probe error
 path
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190807084635.24173-1-geert+renesas@glider.be>
 <20190807084635.24173-3-geert+renesas@glider.be>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <db9961d5-e075-5dca-3417-023b7b8ba4c1@linaro.org>
Date:   Wed, 7 Aug 2019 20:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807084635.24173-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07/08/2019 10:46, Geert Uytterhoeven wrote:
> Fix various issues in the error path of ostm_init():
>   1. Drop error message printing on of_iomap() failure, as the memory
>      allocation core already takes of that,
>   2. Handle irq_of_parse_and_map() failures correctly: it returns
>      unsigned int, hence make irq unsigned int, and zero is an error,
>   3. Propagate/return appropriate error codes instead of -EFAULT.
>   4. Add a missing clk_put(),
>   5. Split the single cleanup block in separate phases, to avoid
>      clk_put() calling WARN() when passed an error pointer.

Does it make sense to convert to timer-of API?

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - New.
> ---
>  drivers/clocksource/renesas-ostm.c | 54 ++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
> index 37c39b901bb12b38..1e22e54d7b0df40d 100644
> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -155,7 +155,7 @@ static irqreturn_t ostm_timer_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static int __init ostm_init_clkevt(struct ostm_device *ostm, int irq,
> +static int __init ostm_init_clkevt(struct ostm_device *ostm, unsigned int irq,
>  			unsigned long rate)
>  {
>  	struct clock_event_device *ced = &ostm->ced;
> @@ -185,11 +185,11 @@ static int __init ostm_init_clkevt(struct ostm_device *ostm, int irq,
>  
>  static int __init ostm_init(struct device_node *np)
>  {
> -	struct ostm_device *ostm;
> -	int ret = -EFAULT;
>  	struct clk *ostm_clk = NULL;
> -	int irq;
> +	struct ostm_device *ostm;
>  	unsigned long rate;
> +	unsigned int irq;
> +	int ret;
>  
>  	ostm = kzalloc(sizeof(*ostm), GFP_KERNEL);
>  	if (!ostm)
> @@ -197,27 +197,29 @@ static int __init ostm_init(struct device_node *np)
>  
>  	ostm->base = of_iomap(np, 0);
>  	if (!ostm->base) {
> -		pr_err("ostm: failed to remap I/O memory\n");
> -		goto err;
> +		ret = -ENOMEM;
> +		goto err_free;
>  	}
>  
>  	irq = irq_of_parse_and_map(np, 0);
> -	if (irq < 0) {
> +	if (!irq) {
>  		pr_err("ostm: Failed to get irq\n");
> -		goto err;
> +		ret = -EINVAL;
> +		goto err_unmap;
>  	}
>  
>  	ostm_clk = of_clk_get(np, 0);
>  	if (IS_ERR(ostm_clk)) {
>  		pr_err("ostm: Failed to get clock\n");
>  		ostm_clk = NULL;
> -		goto err;
> +		ret = PTR_ERR(ostm_clk);
> +		goto err_unmap;
>  	}
>  
>  	ret = clk_prepare_enable(ostm_clk);
>  	if (ret) {
>  		pr_err("ostm: Failed to enable clock\n");
> -		goto err;
> +		goto err_clk_put;
>  	}
>  
>  	rate = clk_get_rate(ostm_clk);
> @@ -229,28 +231,30 @@ static int __init ostm_init(struct device_node *np)
>  	 */
>  	if (!system_clock) {
>  		ret = ostm_init_clksrc(ostm, rate);
> +		if (ret)
> +			goto err_clk_disable;
>  
> -		if (!ret) {
> -			ostm_init_sched_clock(ostm, rate);
> -			pr_info("ostm: used for clocksource\n");
> -		}
> -
> +		ostm_init_sched_clock(ostm, rate);
> +		pr_info("ostm: used for clocksource\n");
>  	} else {
>  		ret = ostm_init_clkevt(ostm, irq, rate);
> +		if (ret)
> +			goto err_clk_disable;
>  
> -		if (!ret)
> -			pr_info("ostm: used for clock events\n");
> -	}
> -
> -err:
> -	if (ret) {
> -		clk_disable_unprepare(ostm_clk);
> -		iounmap(ostm->base);
> -		kfree(ostm);
> -		return ret;
> +		pr_info("ostm: used for clock events\n");
>  	}
>  
>  	return 0;
> +
> +err_clk_disable:
> +	clk_disable_unprepare(ostm_clk);
> +err_clk_put:
> +	clk_put(ostm_clk);
> +err_unmap:
> +	iounmap(ostm->base);
> +err_free:
> +	kfree(ostm);
> +	return ret;
>  }
>  
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

