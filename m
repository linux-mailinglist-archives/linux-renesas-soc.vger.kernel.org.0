Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36A04F5DA4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Apr 2022 14:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiDFMLa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Apr 2022 08:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiDFMLM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Apr 2022 08:11:12 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4243751FD5C
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Apr 2022 01:03:11 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n63-20020a1c2742000000b0038d0c31db6eso1097462wmn.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Apr 2022 01:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AsNQPl7XwXuX2WAvg4rLC1LCZqhZGP7Ik6P3va1VwEg=;
        b=K3EdZM8mcFbYT7dtM+CtBrf3JsqmnVU8klaSh8QuC87mQ6I2UZBbBWDVsLyDXivLin
         +jsd4iv86dMV/fc20qaYKCgbYC4D3b82pRJUIRZg+fnLTxPsbS2fM3vi3r2RX3avdCOg
         RSZzsX884aDRmw+Kcw7u7J5IUlp1d90ao9b/1/wmYiRWgrMYW8LIBS2mdrtILsaCCH7F
         QiWAEtxRv1+LQFpBTGK8MW89ti5EE4bAKjuH2OdImw/z+o3RsxKAS/8v9kXsKXUN4LKn
         Mj3X0fshu+zxYBctBjVgmHfyuzKnK7YXxI2/wYgHMkxxRQvOQefR3wV1Y1+lCRgEeZUX
         rX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AsNQPl7XwXuX2WAvg4rLC1LCZqhZGP7Ik6P3va1VwEg=;
        b=fSWZqXcjpIeSgkKiSluDO4WAoTSsiMK0r9MO+1E9XKpSRaJola8OcODK7KJRPN/Nc6
         vWXgjpy75OI9U8WQ3lhR+WQoxkM7nrxAcIqtLoOeucpczHbKYLqdr6or3XUkHDtXVqL0
         PW52zaXI/1VuhHhmLBnqh3woXPvrt4kfqSMEqbeXyKhZLSFHWjbXrxkMZhKeJaWR1WQS
         MQUnhXbTr95TMch+MKRQ9AMnzvAlbZWi4PhiO0h9e1fP1OzlI3eAnj0oEOVfzHDrWR69
         iCD9akqlk3/4dotu0cqLLHw8nOpwAygk4jyXSCcMgzThcDU6B82uQxL3gj1mdrTNj2pN
         ytzA==
X-Gm-Message-State: AOAM530J1BENlQgtjc4xwhJnxh0dCQYOt85ghR8ySDtYg/+60yTy30cq
        /KFOyATsuIcOVXK6yAkNnsknqw==
X-Google-Smtp-Source: ABdhPJyEGfgOxaVvfj11uScInCMKRFZYCH/NJehxzp/gPbS+4SSjoS2Lxm7d1aUTKXwLeNu/zYb4ng==
X-Received: by 2002:a7b:c922:0:b0:383:e7e2:4a1a with SMTP id h2-20020a7bc922000000b00383e7e24a1amr6487169wml.51.1649232188901;
        Wed, 06 Apr 2022 01:03:08 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ed2f:f020:261f:c14c:d23b:d177? ([2a01:e34:ed2f:f020:261f:c14c:d23b:d177])
        by smtp.googlemail.com with ESMTPSA id e9-20020a5d5009000000b002060f7faa02sm8276556wrt.116.2022.04.06.01.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 01:03:08 -0700 (PDT)
Message-ID: <6419fd7b-8213-3a51-268b-a9602c770991@linaro.org>
Date:   Wed, 6 Apr 2022 10:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] clocksource/drivers/renesas-ostm: Add support for RZ/V2L
 SoC
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220406072417.14185-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220406072417.14185-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 06/04/2022 09:24, Lad Prabhakar wrote:
> The OSTM block is identical on Renesas RZ/G2L and RZ/V2L SoC's, so instead
> of adding dependency for each SoC's add dependency on ARCH_RZG2L. The
> ARCH_RZG2L config option is already selected by ARCH_R9A07G044 and
> ARCH_R9A07G054.
> 
> With the above change OSTM will be enabled on RZ/V2L SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>   drivers/clocksource/renesas-ostm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
> index 21d1392637b8..8da972dc1713 100644
> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -224,7 +224,7 @@ static int __init ostm_init(struct device_node *np)
>   
>   TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
>   
> -#ifdef CONFIG_ARCH_R9A07G044
> +#ifdef CONFIG_ARCH_RZG2L

I'm not finding this option anywhere


>   static int __init ostm_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
