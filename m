Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3FED55FA4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 10:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbiF2IXB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 04:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiF2IXA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 04:23:00 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4323BF89
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 01:22:59 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id mf9so31109911ejb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9FxvTXAyDoEN34ru1FkPgexZCj2uCfwrJpo+6ZTo0A4=;
        b=n/Rw+Jcn+siC9rHD66Q/a/Epxq2eyLv1bnipKrH7St50QwolhBFNC5OvHqYgS08cVM
         44jVB/YmKBprD90NMtCEUcI3r7rxWA9edsn7cMFspPviKzEcXMYUNfdi/qNUdOZGfguQ
         SCw2ywbQ3RxV5BZVkOaUsWzz6KXF3o9zPurPpszTUZR65B0AnCAK5rWjjK+ODozaWxbc
         Ccoxi37IMKLiSWWRIxPQIaYjRRQVuJ2of6MlcCfOkSVFATNWz2OrvQQsaeQwu+3PzSDZ
         quLvYvP9vUPR521I25iXJY6gD6pdt1xUrltn/VOgfcLsxLK0EdY5omSh6/33SezquzAA
         cWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9FxvTXAyDoEN34ru1FkPgexZCj2uCfwrJpo+6ZTo0A4=;
        b=JMr1urI92A/RqcunAvlBCJztbNZrZRyGY7h0WjbeZKi24lLUywo2QpALczXg7dXTsY
         RMnl7a0Jn1ztJi+W4r/8vU3nXGcF2KZqJHWv/ffZbDrzMR2fvqgfr2jdedpop3Z0G/Y1
         VMVYy1eFQxhaCwRGP2ehAsVmMO2LF+FyPvyOGx+CdRxflpxBZJ76EUysu6mrgk/clQjC
         eWb9880bgflBJEs3cKSZEEbF1Yz355DK91jJfgMHpSpwSD0PdusxPBx9AvvmWK8OQvIb
         1b1aAyQtT7OUKwpOc5Pj+qEUzUa3kxdYL10pKl3RYWlxJkvfTwgR7cId0zBtMSLrNZnt
         kpdQ==
X-Gm-Message-State: AJIora/UnxhJZKsehYrqffjAP9XSCHOAnlwKOvxv304R+8butFgOcJjJ
        r/QGc3QAFDruPuwWn9PI2t0qIg==
X-Google-Smtp-Source: AGRyM1vBRN/0zJCCRrvFtMg3YT78GpkmpcLfz7O2iiWHYpoCUJQvH3PfgvAAcwtKOUT0zyul+rUioQ==
X-Received: by 2002:a17:906:9c82:b0:6df:c5f0:d456 with SMTP id fj2-20020a1709069c8200b006dfc5f0d456mr2089497ejc.287.1656490978259;
        Wed, 29 Jun 2022 01:22:58 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ia10-20020a170907a06a00b0070b7875aa6asm7286383ejc.166.2022.06.29.01.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 01:22:57 -0700 (PDT)
Message-ID: <caba6daf-768b-d10a-7b1b-667f793a9f5c@linaro.org>
Date:   Wed, 29 Jun 2022 10:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-2-phil.edworthy@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628194526.111501-2-phil.edworthy@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 28/06/2022 21:45, Phil Edworthy wrote:
> Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  - Use an enum and set the default for clock-frequency
>  - Add resets property
> ---
>  .../bindings/i2c/renesas,rzv2m.yaml           | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> new file mode 100644
> index 000000000000..7f6d2bb4ecb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/renesas,rzv2m.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2M I2C Bus Interface
> +
> +maintainers:
> +  - Phil Edworthy <phil.edworthy@renesas.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,i2c-r9a09g011  # RZ/V2M
> +      - const: renesas,rzv2m-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Data transmission/reception interrupt
> +      - description: Status interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: tia
> +      - const: tis
> +
> +  clock-frequency:
> +    default: 100000
> +    enum: [ 100000, 400000 ]
> +    description:
> +      Desired I2C bus clock frequency in Hz.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - power-domains
> +  - resets
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a09g011-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c0: i2c@a4030000 {
> +            compatible = "renesas,i2c-r9a09g011", "renesas,rzv2m-i2c";

I missed that part in last version - you have some weird indentation
here. Use 4 spaces for DTS example.

Best regards,
Krzysztof
