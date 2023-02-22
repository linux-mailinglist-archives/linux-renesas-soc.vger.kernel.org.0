Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CAB69F1F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Feb 2023 10:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbjBVJja (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 04:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbjBVJjI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 04:39:08 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98FE3B3E8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 01:36:06 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id l1so6777946wry.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 01:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYSBNjZMUqqg3o3xKcoCzAQfKFWE704AcgxDUXOHQ9Y=;
        b=lQ5ofJgulmki2D9dnrA9jEH4OTkQLUfJCFm3Jtj9oGwkFgOqzEKaQidbQSjDy/gywt
         18NNq6yXLW0EvwBwQDf2A42UW7TjNh0T57dl4c3aAHMSjzYyMLCg4Z+KF5pB6f2xDAVz
         NDWmmfHkialfRI2CZb1vYGx5q8F8GR80bAzu5iI3va3oiecWe3kFVmSgZRYBqH3VqnRq
         gp0E4XGhuR3Tu20Gb3mRfb6ZxzAGHBQjyM4SqIQriMDnRHcxE8OPaV4WwlJJSFXzfyfm
         jhmkTcghutcNWHPwn1xwXkVbjEX/vD1g5ByC3xJzbmnBnufEW6DrNVwhZCuZvf92WBJ5
         HSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYSBNjZMUqqg3o3xKcoCzAQfKFWE704AcgxDUXOHQ9Y=;
        b=g5dvlCprvVVTxUQOrFfv1lifWyX2nJgCkHNkpE7QevwNWkBIzWf7UL/5nskkLJQQKR
         6sZhQ+PwWqT8HFqAkWs0eppbJqsqVDtTM/oxhMzF6ZpfwK1uEbBO/Hqo7dP6FuoJg1Kv
         SalDXaIuHVPJQono+OC7vGjSJzW0rAfkl9C6W/rBdyliPzATtPjAZjTBsMkp1BcjG+TF
         7HaGRkwyGISLJnqUJ25wdQFXLA93xYJ17Ghepcxh4MYwjS9bkxp+rdm+uzHWXmDe6vaI
         auTf77rtPNQb3OythXtTzo2kDFJ3Kk6BWpYgGFTB3b4wXhp8zSsQvyiGlZ1/Eg9O1dSl
         g6bQ==
X-Gm-Message-State: AO0yUKU1s0C6lGhW/IPRvwN6Bw+rSDGrYavX4+vO8BKkRI2egCl8Rf80
        pAH8B0ZW6jO7gQFE5zdMMiSSgg==
X-Google-Smtp-Source: AK7set/E4R6V6MKYdreloJzvGIbISJCF04gsNrCaalEmNNxojDMfP5ElNc2fg0ejzT6oCgNmOoEFcw==
X-Received: by 2002:adf:ea92:0:b0:2c7:b51:65ce with SMTP id s18-20020adfea92000000b002c70b5165cemr1448134wrm.12.1677058511923;
        Wed, 22 Feb 2023 01:35:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e6-20020a5d5006000000b002c57384dfe0sm9006229wrt.113.2023.02.22.01.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 01:34:10 -0800 (PST)
Message-ID: <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
Date:   Wed, 22 Feb 2023 10:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/02/2023 14:13, Biju Das wrote:
> Document Renesas versa3 clock generator(5P35023) bindings.
> 
> The 5P35023 is a VersaClock programmable clock generator and
> is designed for low-power, consumer, and high-performance PCI
> Express applications. The 5P35023 device is a three PLL
> architecture design, and each PLL is individually programmable
> and allowing for up to 6 unique frequency outputs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,versaclock3.yaml   | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml b/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml
> new file mode 100644
> index 000000000000..f45b8da73ec3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml

Filename usually is based on the compatible. Why these two are so different?


> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,versaclock3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas VersaClock 3 programmable I2C clock generators
> +
> +description: |
> +  The 5P35023 is a VersaClock programmable clock generator and
> +  is designed for low-power, consumer, and high-performance PCI
> +  express applications. The 5P35023 device is a three PLL
> +  architecture design, and each PLL is individually programmable
> +  and allowing for up to 6 unique frequency outputs.
> +
> +  An internal OTP memory allows the user to store the configuration
> +  in the device. After power up, the user can change the device register
> +  settings through the I2C interface when I2C mode is selected.
> +
> +  The driver can read a full register map from the DT, and will use that
> +  register map to initialize the attached part (via I2C) when the system
> +  boots. Any configuration not supported by the common clock framework
> +  must be done via the full register map, including optimized settings.
> +
> +  Link to datasheet: https://www.renesas.com/us/en/products/clocks-timing/
> +                     clock-generation/programmable-clocks/
> +                     5p35023-versaclock-3s-programmable-clock-generator

I think link should not be wrapped. Start in next line and just make it
long.

While touching this, please keep the same order of entries as in
example-schema, so maintainers go after title.

> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,5p35023
> +
> +  reg:
> +    description: I2C device address

Drop description, it's obvious.

> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: x1
> +      - items:
> +          - const: clkin

This should be specific, not one or another. Why do you have two
entirely different clock inputs?

(and if this stays, then just items: - enum: [])


> +
> +  clocks:
> +    maxItems: 1
> +
> +  renesas,settings:
> +    description: Optional, complete register map of the device.
> +      Optimized settings for the device must be provided in full
> +      and are written during initialization.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 37

maxItems instead... but I am not sure that we allow register settings in
DT in general.

> +
> +  assigned-clocks:
> +    minItems: 6

Drop.

> +
> +  assigned-clock-rates:
> +    minItems: 6

Drop.

> +
> +  renesas,clock-divider-read-only:
> +    description: Flag for setting divider in read only mode.

Flag? Then type: boolean.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 5

This is broken...

> +
> +  renesas,clock-flags:
> +    description: Flags used in common clock frame work for configuring
> +      clk outputs. See include/linux/clk-provider.h

These are not bindings, so why do you non-bindings constants as
bindings? They can change anytime. Choose one:
1. Drop entire property,
2. Make it a proper binding property, so an ABI and explain why this is
DT specific. None of clock providers have to do it, so you need here
good explanation.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 6

maxItems instead

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* 24MHz crystal */
> +    x1_x2: xtal {
> +      compatible = "fixed-clock";
> +      #clock-cells = <0>;
> +      clock-frequency = <24000000>;
> +    };

Drop this part, obvious.

> +
> +    i2c@0 {
> +        reg = <0x0 0x100>;

Just i2c { and drop reg

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        versa3: clock-generator@68 {
> +            compatible = "renesas,5p35023";
> +            reg = <0x68>;
> +            #clock-cells = <1>;
> +
> +            clocks = <&x1_x2>;
> +            clock-names = "x1";
> +
> +            renesas,settings = [
> +                80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
> +                00 14 7a e1 00 00 00 00 01 55 59 bb 3f 30 90 b6
> +                80 b0 45 c4 95
> +            ];
> +
> +            assigned-clocks = <&versa3 0>,
> +                              <&versa3 1>,
> +                              <&versa3 2>,
> +                              <&versa3 3>,
> +                              <&versa3 4>,
> +                              <&versa3 5>;
> +            assigned-clock-rates = <12288000>, <25000000>,
> +                                   <12000000>, <11289600>,
> +                                   <11289600>, <24000000>;
> +            renesas,clock-divider-read-only = <1>, <1>, <1>, <1>, <1>;
> +            renesas,clock-flags = <2176>, <2176>, <2176>, <2052>,
> +                                  <2176>, <2048>;
> +        };
> +    };
> +
> +    /* Consumer referencing the versa 3 */
> +    consumer {
> +        /* ... */
> +        clocks = <&versa3 3>;
> +        /* ... */

Drop consumer. Do you see it anywhere else?

Best regards,
Krzysztof

