Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDDEB520F98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 10:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237926AbiEJIXA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 May 2022 04:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233162AbiEJIW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 May 2022 04:22:57 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9620F28E4F5;
        Tue, 10 May 2022 01:18:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id j4so27925554lfh.8;
        Tue, 10 May 2022 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zFoEdoFuJSa5hWnPVwjN4WENmSdRezh+7EGbd50bWPY=;
        b=ByDIBtjITN9LTf9LqaM9ih5Dqro8l8KYkJFbn5VbIzHCZuEQr5MUp7sbfXkI4IEVK8
         SlhEDKE76Idoaw+zBTjwh+Ix+vtqpsvgzDbJgPAM6bdWjav1pIzKWFc4xOMjj8x8ofCX
         ha+4S52RSMb+RJ688uQCMTfbvLn+NCiEyPo+2Jb05IFeDOiGSqR1Xx12z1yt5N82gzdA
         gN+Y0XB4FRQETlSjWFcBurnpjhvvAiSaomzmbNGHcjJTbFJMC5XKa4VOLRXmYeVRVgzc
         aUDAw8Oi5fnahq3wdX8rkYBEz+OsBeJim4n/QO/UlhqOb6nT2ro9bPJsXnFRqfvGW3PU
         b/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zFoEdoFuJSa5hWnPVwjN4WENmSdRezh+7EGbd50bWPY=;
        b=4aqA1vONHCbWATTwLeHDZexeW288X2nNicsdLdl/Kv3K1dL3cDowGsPYFxsGR+AYWi
         wFrH4hB+cjw5UY8rpBxTvRe38FnMt6FsngvQ96wUGXBe6wSyyfAT+fHvu1dBfaoEeODh
         6nCagdVym+FhqHOXvRQybxFps/4cqq+h4KXxjE/DR2/z3x5FBYIK6Fre+1NEgly5pwCz
         qtxjX1eUqLLefLP8b6dVPrI8KYGbMgt4OH+BfIVuicnhOOKngntABdWcVtxUWA6pCemB
         ttGHe7d+8ys+dGV8A8F99vSkFk27CoWAIlXYBGeeFC4lY2xS6yOdtTQjZGtnWZcFk3rz
         w7ww==
X-Gm-Message-State: AOAM530YbfiRTW5+35Rf0T9d0V9BGy7fhulGBthfLjRMuEkcDe7oNN/I
        Sm0qBeDTHMIiehMpmGZzjxU=
X-Google-Smtp-Source: ABdhPJyl21luSl8NtR6D8wZ8v7EZAcgeENFFdEsNpydqHlGOdy9mOcyo+pqBieoYwbu1g27ofQwLGg==
X-Received: by 2002:a05:6512:114c:b0:473:b2a7:65e1 with SMTP id m12-20020a056512114c00b00473b2a765e1mr15631157lfg.480.1652170735947;
        Tue, 10 May 2022 01:18:55 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.87.32])
        by smtp.gmail.com with ESMTPSA id x21-20020a2e7c15000000b0024f3d1daebbsm2016703ljc.67.2022.05.10.01.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 01:18:55 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220505184353.512133-1-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b89be37d-ec17-8b6f-561b-63781352e774@gmail.com>
Date:   Tue, 10 May 2022 11:18:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220505184353.512133-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 5/5/22 9:43 PM, Biju Das wrote:

> Add ADC node to R9A07G043 (RZ/G2UL) SoC DTSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> index b31fb713ae4d..40201a16d653 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> @@ -483,8 +483,27 @@ i2c3: i2c@10058c00 {
>  		};
>  
>  		adc: adc@10059000 {
> +			compatible = "renesas,r9a07g043-adc", "renesas,rzg2l-adc";
>  			reg = <0 0x10059000 0 0x400>;
> -			/* place holder */
> +			interrupts = <GIC_SPI 347 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&cpg CPG_MOD R9A07G043_ADC_ADCLK>,
> +				 <&cpg CPG_MOD R9A07G043_ADC_PCLK>;
> +			clock-names = "adclk", "pclk";
> +			resets = <&cpg R9A07G043_ADC_PRESETN>,
> +				 <&cpg R9A07G043_ADC_ADRST_N>;
> +			reset-names = "presetn", "adrst-n";

   Not "adrst_n"?

[...]

MBR, Sergey
