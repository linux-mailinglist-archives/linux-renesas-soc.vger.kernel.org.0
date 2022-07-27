Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1DBD58227E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jul 2022 10:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiG0IxS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jul 2022 04:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiG0IxR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 04:53:17 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21C246D83
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2022 01:53:15 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id w18so8007146lje.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2022 01:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WT6Bf9Wd4u+/b76NZ7GFsefZqgMs6EzwTFrQjSlCe3w=;
        b=P2Xf23tKUaRyXof5W984HGD9Q13GEbmMRWtao19Yy6tXQymySJSoLwBl8IJu5ivoeW
         ZHAWQdljf+z/vec6k1AUBOC+6cCSWgo2AxWN6rzMP45tV3++m0ABQlibobCzXP5egc19
         sliU3eo/trQLpCikT4ArHN6v4p+iHZXjlB0VswATrBYX63mTGndF63tmFxasgkbJ6mlV
         nJIxVVo0e2MFB2uA1q32lpdasb/ZVBNcg9HU/25HKqdnn/iAmmygOJPjmaAx3rPcGoWX
         3wWFZmFVDT9icClBwCfQ7ChFFzGpYPE3rIu2GAQnYG0eM0kUdRwAfzemPWbWDNhl+Min
         1ZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WT6Bf9Wd4u+/b76NZ7GFsefZqgMs6EzwTFrQjSlCe3w=;
        b=K/sUi/s1HDknRjq7olj21Q9sX17AtKxnpBtYyB/WROFvuqoIBrl6cSNa9fc4onCpeJ
         QAnZYkeBpEXSPkwABZePTUiQ4YJlREtZShY8wzOP3r8JXkaBt5+6gp9+mhLSrTpaTs+W
         1VjyUyJtiD1wvj2Omo+UlWkTvVVDEoXzDiOsvZY7g7ziIeJJkTm3h8TPlwmNgs++qb9Z
         h8DULLFps0+4BHwgGbpLRqAv5whno3tKK4ooO6MrwSOHbNP8P63qgo3+Z220qSWV9WdU
         9tha7j7VUXjtdXUXD2pfypPQDXVkXywVgJGap8uMwbGmy7YOwUFympC9v+aqocoKNrrF
         si+A==
X-Gm-Message-State: AJIora/yeGLl8DtwK89xaG0DL2SWb3BT1AU1XiE2TO/cyx4V9w5NYpZs
        x7aOG0zDjD+KA2EUZhRiuDhH6g==
X-Google-Smtp-Source: AGRyM1sGsKeiDwI8gtL3TJYG4H41ewonY4JOKjtqR9UyMESCXxgq6JLJOzIk0g47YQaVf+2cD3uWPA==
X-Received: by 2002:a2e:700d:0:b0:25d:d6fc:277f with SMTP id l13-20020a2e700d000000b0025dd6fc277fmr7357817ljc.52.1658911994144;
        Wed, 27 Jul 2022 01:53:14 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id f16-20020a05651c03d000b0025d67053f0dsm1789534ljp.135.2022.07.27.01.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 01:53:13 -0700 (PDT)
Message-ID: <952a85ec-d1e9-7c14-6404-bc087723252f@linaro.org>
Date:   Wed, 27 Jul 2022 10:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Ignore the schema for
 RISC-V arch
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>
Cc:     Anup Patel <anup@brainfault.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 26/07/2022 20:06, Lad Prabhakar wrote:
> Ignore the ARM renesas.yaml schema if the board is RZ/Five SMARC EVK
> (RISC-V arch).
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index ff80152f092f..f646df1a23af 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -9,6 +9,15 @@ title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
>  maintainers:
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>  
> +# We want to ignore this schema if the board is of RISC-V arch
> +select:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          items:
> +            - const: renesas,r9a07g043f01

Second issue - why not renesas,r9a07g043?


Best regards,
Krzysztof
