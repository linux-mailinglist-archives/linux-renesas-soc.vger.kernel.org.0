Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9180516332
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 10:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240544AbiEAIzS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 04:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343592AbiEAIzL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 04:55:11 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710E011141
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 May 2022 01:51:46 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id a1so13569455edt.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 May 2022 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CJZNRZ79+9Oe+6cMtcCUByKLeX6eyND50QHtbCM/fno=;
        b=srR4IxVVWOu+WIi+VOm9TX9vriFAk/qoL9BuzocRG4Mk2brHz2P//y7XmhkIy6Mhq8
         OEwyXRIXS4F9HwJFhO4rkiwEkowHZGWwMdUh8j82y9xOEfKmCqwMkc9dogjuEz2HkaUz
         Ott/l0bKD6nqtBJFdJdU/b5IIicsYMV8IBLiNj1boQisudb6hz9cJ71hWQgmXGmkYSl8
         DhPTVNv6QivmLaiOHDdDXPpTnr6AENQu/tiInKwICpRJVMz3O5dkiT3kolZOJ9JMa/kg
         eiUl46SpwFyLsdmvhuTsMYPoTMp0fu3z+GC7pp6IUQyDSaWlAZNImAOkh/QpJVKqA94K
         T+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CJZNRZ79+9Oe+6cMtcCUByKLeX6eyND50QHtbCM/fno=;
        b=l69b/ySPuf9xme/UnuDfy4j4AAHTCx94DFYAis262qq+cVjr0NjGBUJGoSQp4N8svU
         QMIvV09LRVjtooCQ0p/QaD5Q/+dy175zyRDQ+m19sYZnuHilh1lfPWSvxlrjz/Xih/k2
         z5rotNj5vgI7Ks6+H7cAkVfIBzajJ/q1qocKIqPbvhr6LknMzo2kgUYidWWGpPAjVBxn
         mCNBrThNbIFyUJNw0UhIMlNuP3wQg8Yni6m1YuYXXoRvAmCtaSAia2HjPavFX9a8WyRg
         kC0ei61ZxsU8gkv8GlayVAAyY0ZZWQZ+PAwOYiSJb7Rv1LqppZuVFgZhTGLaK0657bU8
         t/CQ==
X-Gm-Message-State: AOAM532ICn3wdHOLIY6PBB77rPBrwOQvfDv++htCasx3R27hTTZnr4MZ
        NXRmcFGq/zBHtAog4O+2wtgaXw==
X-Google-Smtp-Source: ABdhPJwQvpcqzBB3XGa2jHTPTvXDgRv3AJ8mnCXqOERniHYprhzbmWee/RIRxFfcPQyKOUoOlTgSYg==
X-Received: by 2002:aa7:df0a:0:b0:425:d4bf:539 with SMTP id c10-20020aa7df0a000000b00425d4bf0539mr7993297edy.24.1651395105069;
        Sun, 01 May 2022 01:51:45 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ml22-20020a170906cc1600b006f3ef214ddbsm2407098ejb.65.2022.05.01.01.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 May 2022 01:51:44 -0700 (PDT)
Message-ID: <29ba3db6-e5c7-06d3-29d9-918ee5b34555@linaro.org>
Date:   Sun, 1 May 2022 10:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/6] dt-bindings: PCI: renesas,pci-rcar-gen2: Add
 device tree support for r9a06g032
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>
Cc:     Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20220429134143.628428-1-herve.codina@bootlin.com>
 <20220429134143.628428-4-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429134143.628428-4-herve.codina@bootlin.com>
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

On 29/04/2022 15:41, Herve Codina wrote:
> Add internal PCI bridge support for the r9a06g032 SOC. The Renesas
> RZ/N1D (R9A06G032) internal PCI bridge is compatible with the one
> present in the R-Car Gen2 family.
> Compared to the R-Car Gen2 family, it needs three clocks instead of
> one.
> 
> The 'resets' property for the RZ/N1 family is not required since
> there is no reset-controller support yet for the RZ/N1 family.

This should not be a reason why a property is or is not required. Either
this is required for device operation or not. If it is required, should
be in the bindings. Otherwise what are you going to do in the future?
Add a required property breaking the ABI?

> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/pci/renesas,pci-rcar-gen2.yaml   | 46 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
> index 494eb975c146..a9f806794f12 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
> @@ -32,6 +32,10 @@ properties:
>                - renesas,pci-r8a7793      # R-Car M2-N
>                - renesas,pci-r8a7794      # R-Car E2
>            - const: renesas,pci-rcar-gen2 # R-Car Gen2 and RZ/G1
> +      - items:
> +          - enum:
> +              - renesas,pci-r9a06g032     # RZ/N1D
> +          - const: renesas,pci-rzn1       # RZ/N1
>  
>    reg:
>      items:
> @@ -41,13 +45,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  clocks:
> -    items:
> -      - description: Device clock
> +  clocks: true
>  
> -  clock-names:
> -    items:
> -      - const: pclk
> +  clock-names: true
>  
>    resets:
>      maxItems: 1
> @@ -106,13 +106,45 @@ required:
>    - interrupt-map
>    - interrupt-map-mask
>    - clocks
> -  - resets
>    - power-domains
>    - bus-range
>    - "#address-cells"
>    - "#size-cells"
>    - "#interrupt-cells"
>  
> +if:

allOf.

> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - renesas,pci-rzn1
> +
> +then:
> +  properties:
> +    clocks:
> +      items:
> +        - description: Internal bus clock (AHB) for HOST
> +        - description: Internal bus clock (AHB) Power Management
> +        - description: PCI clock for USB subsystem
> +    clock-names:
> +      items:
> +        - const: hclkh
> +        - const: hclkpm
> +        - const: pciclk
> +  required:
> +    - clock-names
> +
> +else:
> +  properties:
> +    clocks:
> +      items:
> +        - description: Device clock
> +    clock-names:
> +      items:
> +        - const: pclk
> +  required:
> +    - resets
> +
>  unevaluatedProperties: false
>  
>  examples:


Best regards,
Krzysztof
