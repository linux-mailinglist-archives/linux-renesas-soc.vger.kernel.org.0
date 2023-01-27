Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8E3F67ECC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 18:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235238AbjA0Ryk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Jan 2023 12:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbjA0Ryg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 12:54:36 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185A67FA21
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 09:54:32 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id h12so5659663wrv.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 09:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NO2TJchJQkSUciVJ048CE5JVvfXlkyX1sBqCZRqoaSk=;
        b=d3BWJCYH0b5IKv1JZZCJT1WrBic1Hn/DUD8yAaADqDVK4xe7jE1+Qs6hsXNtktNmfM
         o3OpnqRqMjbOLCAktPlKFjv1IE7fFQa8OORaUEPJCo2m5CiMnEhlrbGbf0BldZ1/K8wN
         704jeS51gnUFju6MvSL6UX1BVitO3Clp277zaMJOqr3u/xsRbkqSLUSDQeZjsn4rHFHg
         YLo8jg3He2haNBImc93dd4zV7r5G5hj/RBduy7v7w24gOZbugnmMPyMEuOh/dvtr7Pg0
         JmdtAYc4i86a//O3JRKbB1yyM2+Xw41vQMR8lVvFgsBbvvOHwmd0m3w1K7Agw2Yj+8o0
         qEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NO2TJchJQkSUciVJ048CE5JVvfXlkyX1sBqCZRqoaSk=;
        b=NiIhYk6/l/mcvdNxwR+kKQEaogEFMcQ2ufyNUm9RA3Yia3SH/WizO/NhejL5hNSjzA
         aEdpw7cJY5ctOO3nLjiVIaMcCRaq5orTgp49/P9Z7Ak+66RBYAcn+DB3fOfrPgE0na3+
         aHlkppNquWOsdcjtBPMNpLsaX59OhMvuYMFgxtv0PxzMGlDnFcRt2DvPzLVFWRDzcGA6
         uujskFXJxrObnqFJA8hkahh2RIQXowoL+toyf5ms3WtnDEsRhUqxw58lX2AqcBG1zz8h
         M3UWND556s3lIww69YwUJRx49nVe3egxan/PzF8zfnOoPTEXfUn4voYfjB4eRjxo3Koc
         M8jA==
X-Gm-Message-State: AFqh2kob1QA3geBsjgUuTZnSu+cWPwhgv04920XY8WxBYdGt+4IBDIly
        sz9HVDF2sd1wuPC1MH5h/M+9Sg==
X-Google-Smtp-Source: AMrXdXuMIheyW2A0xsXwX4QkA5JjZP96JxaosIP01ENH8v917KfNPZCCiX4azuz3fG61XaD7SQP7sQ==
X-Received: by 2002:a05:6000:1b8c:b0:2be:c5d:adc4 with SMTP id r12-20020a0560001b8c00b002be0c5dadc4mr36149238wru.13.1674842070705;
        Fri, 27 Jan 2023 09:54:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j5-20020adff005000000b002bddd75a83fsm4555217wro.8.2023.01.27.09.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 09:54:30 -0800 (PST)
Message-ID: <739543e2-bf2d-b76a-172f-a8fbe5f26495@linaro.org>
Date:   Fri, 27 Jan 2023 18:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g043u: Add Cortex-A55 PMU node
Content-Language: en-US
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230127174040.251642-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127174040.251642-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/01/2023 18:40, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Enable the performance monitor unit for the Cortex-A55 core on the
> RZ/G2UL (r9a07g043u) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> index 9d854706ada5..33e562390646 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> @@ -35,6 +35,11 @@ L3_CA55: cache-controller-0 {
>  		};
>  	};
>  
> +	pmu_a55 {

Same comments.

Best regards,
Krzysztof

