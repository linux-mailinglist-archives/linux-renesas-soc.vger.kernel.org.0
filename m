Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 047FD5162D6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 10:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbiEAIk5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 04:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiEAIky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 04:40:54 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C673D4AF
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 May 2022 01:37:29 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id i27so22797770ejd.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 May 2022 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xi4JDnI3Oia0+ZAY1xeQawqSNdK+1IdZ3hRKl3DOJJU=;
        b=wSvtn7nc4rj+j42vuNGMPFpqz1D6YlIF5RZ48j32K5A9SMi695UBJ/nf/5tzGKjkxo
         zDbJ9CbiSwdGjDcttFq94Re5Xmn5mouhxuj3DH98+1br8YPqOZJ93jPY/j3SYxqTcrDa
         Ya8SKrqiiAex8HVMRir1uRmDIbM4EKRUuk/OmQ/t6/YXmE8JIwqHQkFy1LSbkrwbpEDe
         OftXArIoEJKFPquVktcU5OfOI8LUO8xOyGIczWMn4Ow87lGIhH0ll7oN+JmQkSPp/1GK
         0HWy3WJjTv6jCuph5f38bEk9HuCPC0QCI7xT81Oazuo0gYAyBFvRAx7oWyg3yXkR8oB3
         fAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xi4JDnI3Oia0+ZAY1xeQawqSNdK+1IdZ3hRKl3DOJJU=;
        b=bxXJB10zKaF3BRrqdBkb+hlyPEuijI0OXc3FE01TNIBGAwLRb+1FNacDXTXfHF7/aM
         4ktB+mFUFFdxAXK1rMfi/z4xYUtszWovLJNI+QfoC/eP44oEjz+fGxIpINVNgnP8vfyl
         8ESlgW4N39rzF/aQSj6+/g7zIjStS+Rgz9yR1l5LCZQ2RJJIewDxiebM8dg8D6c+h0Fz
         6kvSfC1/T9xubKeLzejqmZR0Ad+wOHIAGTek5o5uCIuigPNTer2IOLBVBo/UCdZNdeD8
         SMV/2u6JQENuB6M3J0pzyL+L9YHCWYVdL5NeJJUfoIbWmRfl65TH1BZD1L3zQWwKqzWw
         Ybkw==
X-Gm-Message-State: AOAM531kQzHqARcPqvB9XKoTKf0tt6mOxHtvZaQrsKsh4FtDrER+cnvw
        kCD2wwvNl0EqhDkzatTI0zsY7w==
X-Google-Smtp-Source: ABdhPJwx/X2LLTjiHUoMLlid3qeovxAnupQavu6WEfBnIPjyO0l2rtQqnrnojxJ/Wd6RGRucm603XA==
X-Received: by 2002:a17:906:c113:b0:6e8:89f7:56da with SMTP id do19-20020a170906c11300b006e889f756damr6701929ejc.174.1651394248260;
        Sun, 01 May 2022 01:37:28 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e4-20020a170906844400b006f3ef214da4sm2423827ejy.10.2022.05.01.01.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 May 2022 01:37:27 -0700 (PDT)
Message-ID: <9ddec6b5-5c64-883e-5894-9a51e82cdc3d@linaro.org>
Date:   Sun, 1 May 2022 10:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: iio: adc: Document Renesas RZ/G2UL ADC
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <20220501081001.21563-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501081001.21563-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/05/2022 10:10, Biju Das wrote:
> Document Renesas RZ/G2UL ADC bindings. RZ/G2UL ADC is identical to
> RZ/G2L ADC but with fewer channels (2 vs 8) compared to RZ/G2L.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/iio/adc/renesas,rzg2l-adc.yaml    | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
> index d66c24cae1e1..767fb734a1b5 100644
> --- a/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
> @@ -17,11 +17,15 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r9a07g044-adc   # RZ/G2L
> -          - renesas,r9a07g054-adc   # RZ/V2L
> -      - const: renesas,rzg2l-adc
> +    oneOf:
> +      - items:
> +          - const: renesas,renesas,r9a07g043-adc   # RZ/G2UL

It's not a list, so no items.

> +
> +      - items:
> +          - enum:
> +              - renesas,r9a07g044-adc   # RZ/G2L
> +              - renesas,r9a07g054-adc   # RZ/V2L
> +          - const: renesas,rzg2l-adc
>  
>    reg:
>      maxItems: 1
> @@ -76,7 +80,9 @@ patternProperties:
>      properties:
>        reg:
>          description: |
> -          The channel number. It can have up to 8 channels numbered from 0 to 7.
> +          The channel number. It can have up to 8 channels numbered from 0 to 7
> +          for RZ/{G2L,V2L} SoCs or 2 channels numbered from 0 to 1 for RZ/G2UL
> +          SoC.
>          items:
>            - minimum: 0
>              maximum: 7

You need allOf:if:then restricting this per variant.


Best regards,
Krzysztof
