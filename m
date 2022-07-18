Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0954E57846C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jul 2022 15:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235592AbiGRNzI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jul 2022 09:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235585AbiGRNzH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jul 2022 09:55:07 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF1626105
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jul 2022 06:55:06 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u13so19464744lfn.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jul 2022 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fT/QA3qJ96/hT7NeSsWVhINwMLxP59Qr8cL2A9JBdCU=;
        b=zK9wEnE92x0ddHXk3LsKDzkbWG0cvWhEwSPCqPXk/JL4CFKEb3Ki9sSGpBjUlwx9XR
         0pzUMEbxcBo6BS2Ter6Z6EfWZWFoWcoOQkHe+zjzOveunWfXy3TcHrkNfiUeqRq8WIT4
         h+mEG67igAGdU0B/EoH6WXxQ///VscY7XtnGE779rVt6z8nT3zyf9CJOrL6BjRTioSBr
         e8tBBPcEyQ3lQYI6eYFlGvTZgYHppESSNCv7gHXFdHmGYo5tcbHwR2c4Y9L33fBXZjrC
         Ttm+euI8GQA+7wtwEAf+Jjc/xuaU3/rxn6oQG2QoY+0/Zhg+Ojonw2re0VpsjsgLvQFX
         YQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fT/QA3qJ96/hT7NeSsWVhINwMLxP59Qr8cL2A9JBdCU=;
        b=C3CvUVLzGfJT0rdlJDpbYzvY5M9Upmw4u6UJFMRPYrtPyEU6kcAh80QIZAxR6tC1px
         CLZnef44MAnq0I0YX5VQdexh3/rxG4D3D7HtnjyyCzByzfeaIyZoiQY+6v2kzLi/z7/f
         7N6dSHjsOeMX07P7bEu9UXFbFWkpAIj0y5TIBim8Ns1/z/JEMBxK4GGk9NGMBwIIcQ9Y
         Bf7H48MrGYXtv0ADy/xtlwOtTI1e/AFZ5U6qZfsyLzoiTr79MJ3FOecuHy/12HLPbtkI
         KOKP8Ff+d0sE6VRkK5sJ5cU79INKj2hVaYHwi69rysRGqUQRpa4hzQQwK6vu1dPzZVgi
         iGRw==
X-Gm-Message-State: AJIora+DvkqM0nyiMHlSpZa/UCVsajeXD2ylVD5yoCXaEsNbmS37hZZb
        Y8ydgtYQQoKNidMFrYIZB3k16Q==
X-Google-Smtp-Source: AGRyM1uOzsAoBCxC/M1hXO53IeNkutayehcP14EoJ/bF+Bq4znHEWDYqXLS9WnDyqaXGcCAWqQ3E7A==
X-Received: by 2002:a05:6512:3988:b0:48a:1624:742b with SMTP id j8-20020a056512398800b0048a1624742bmr11741401lfu.174.1658152504634;
        Mon, 18 Jul 2022 06:55:04 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id u1-20020ac258c1000000b0047f943112e3sm2616805lfo.285.2022.07.18.06.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 06:55:04 -0700 (PDT)
Message-ID: <40224cd7-0e71-7f5a-47c8-142539312f21@linaro.org>
Date:   Mon, 18 Jul 2022 15:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas, usb3-peri: Document RZ/V2M
 r9a09g011 support
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-2-phil.edworthy@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220718134458.19137-2-phil.edworthy@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 18/07/2022 15:44, Phil Edworthy wrote:
> Document the RZ/V2M SoC bindings.
> The RZ/V2M SoC is a little different to the R-Car implementations.
> A few DRD related registers and bits have moved, there is a separate
> interrupt for DRD, an additional clock for register access and reset
> lines for DRD and USBP.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/usb/renesas,usb3-peri.yaml       | 81 +++++++++++++++----
>  1 file changed, 66 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> index 9fcf54b10b07..28f785dd2012 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> @@ -11,27 +11,49 @@ maintainers:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r8a774a1-usb3-peri # RZ/G2M
> -          - renesas,r8a774b1-usb3-peri # RZ/G2N
> -          - renesas,r8a774c0-usb3-peri # RZ/G2E
> -          - renesas,r8a774e1-usb3-peri # RZ/G2H
> -          - renesas,r8a7795-usb3-peri  # R-Car H3
> -          - renesas,r8a7796-usb3-peri  # R-Car M3-W
> -          - renesas,r8a77961-usb3-peri # R-Car M3-W+
> -          - renesas,r8a77965-usb3-peri # R-Car M3-N
> -          - renesas,r8a77990-usb3-peri # R-Car E3
> -      - const: renesas,rcar-gen3-usb3-peri
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r8a774a1-usb3-peri # RZ/G2M
> +              - renesas,r8a774b1-usb3-peri # RZ/G2N
> +              - renesas,r8a774c0-usb3-peri # RZ/G2E
> +              - renesas,r8a774e1-usb3-peri # RZ/G2H
> +              - renesas,r8a7795-usb3-peri  # R-Car H3
> +              - renesas,r8a7796-usb3-peri  # R-Car M3-W
> +              - renesas,r8a77961-usb3-peri # R-Car M3-W+
> +              - renesas,r8a77965-usb3-peri # R-Car M3-N
> +              - renesas,r8a77990-usb3-peri # R-Car E3
> +          - const: renesas,rcar-gen3-usb3-peri
> +
> +      - items:
> +          - enum:
> +              - renesas,r9a09g011-usb3-peri # RZ/V2M
> +          - const: renesas,rzv2m-usb3-peri
>  
>    reg:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Combined interrupt for DMA, SYS and ERR
> +      - description: Dual Role Device (DRD)
> +
> +  interrupt-names:

minItems:1

> +    items:
> +      - const: all_p
> +      - const: drd
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Main clock
> +      - description: Register access clock
> +
> +  clock-names:

minItems:1


> +    items:
> +      - const: aclk
> +      - const: reg
>  
>    phys:
>      maxItems: 1
> @@ -43,7 +65,15 @@ properties:
>      maxItems: 1
>  
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Peripheral reset
> +      - description: DRD reset
> +
> +  reset-names:
> +    items:
> +      - const: aresetn_p
> +      - const: drd_reset
>  
>    usb-role-switch:
>      $ref: /schemas/types.yaml#/definitions/flag
> @@ -78,6 +108,27 @@ required:
>    - interrupts
>    - clocks
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rzv2m-usb3-peri
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        interrupts:
> +          minItems: 2
> +        resets:
> +          minItems: 2
> +      required:
> +        - clock-names
> +        - interrupt-names
> +        - resets
> +        - reset-names

else:
narrow the number of items


Best regards,
Krzysztof
