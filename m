Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2306701926
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 May 2023 20:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbjEMS0U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 13 May 2023 14:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbjEMS0U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 May 2023 14:26:20 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC521728
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 May 2023 11:26:18 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so19719501a12.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 May 2023 11:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684002377; x=1686594377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gaPNACU299AcY1RM7TT3EBtSUkruLD2Ow1OdGKZespU=;
        b=fE86aJcNfhD5DZojQRBDRf8MPYAfYPLJQ9TZ7G48rsS1tr8tiG6AFb2K/9H0o+M1Xe
         8c3AcjEfvOMtNqR+qOjLkBfDjojIGfOrUT6KcAqrStNHFU1k7nSD9UGNfyrszMqiT9ys
         Z2VXpEX3l0HLAEZdYec8tfYj3WmiHGJ/BRJEUtBWMckjn6L24xJ6oa4pmz3rSRxjdqIU
         MSjWNhJjETtjIHIvnW+In5EhKDiEHyksfaap+HA4vmdSc5g8D9tb6KAiFagZB7s6fjFS
         JCcp3AfXSlQZZkXzCxdzE6BqJ3Fl2oInYnqrk/nq+8DysXtm6mindRKPVZy4CUtvly2T
         lEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684002377; x=1686594377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gaPNACU299AcY1RM7TT3EBtSUkruLD2Ow1OdGKZespU=;
        b=Jxx7e7w+0GWPzJwinAE+e3VTz0tVCAQK90u35r7Ir6mccV9+zQAkFQp6tgohRnnAC5
         UfRUINqaJkUIQjNxkLYglHsVbWxASEe4JpbY57W3AvElaxNds6DPCm5UzgvINEQ7XquR
         p8DogoQ0kRPxnxFHnDdBy76XalzoPNEdeKhy0h7lcv25sUel/GAxciVvDkH1Ul/qUYUV
         VlwHGC0EQMccjYTRQ9/OPyUbxwlYB8CjqDYa9v/m+NrxNj8y8RZrfIVF3dW9PHqxLTUk
         T9IyghYvqqrpsmNPP9gbHE6dVjzkCZhJOOdtPVC3+29Mh8VddhcLChVdnbWS4L6hqQOh
         BvHg==
X-Gm-Message-State: AC+VfDwpKqlp6Q0CyrDvpR3CVCAwhfv119yHwDO2itZVtlMYrkq2EjBK
        5Hgo/hNsNDEd39fTOD1Pc3UG0Q==
X-Google-Smtp-Source: ACHHUZ4OHuwopzZmevRe4O4G+sx6OWvDsMOHTpJfKi14zgotQ56J9JO0o6cM4wI4WPqWuIsV8eLhrg==
X-Received: by 2002:a17:907:743:b0:94e:c938:1987 with SMTP id xc3-20020a170907074300b0094ec9381987mr26201881ejb.7.1684002376852;
        Sat, 13 May 2023 11:26:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba68:e5c9:694e:c6e4? ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090614cf00b00965ff04f9f6sm7001833ejc.161.2023.05.13.11.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 11:26:16 -0700 (PDT)
Message-ID: <d2c681da-ef15-2bf8-4341-ddbad4ee9957@linaro.org>
Date:   Sat, 13 May 2023 20:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
 <20230513165227.13117-4-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230513165227.13117-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13/05/2023 18:52, Biju Das wrote:
> Document Renesas RAA215300 PMIC bindings.
> 
> The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
> Memory, with Built-In Charger and RTC.
> 
> It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power requirements.
> The internally compensated regulators, built-in Real-Time Clock (RTC),
> 32kHz crystal oscillator, and coin cell battery charger provide a
> highly integrated, small footprint power solution ideal for
> System-On-Module (SOM) applications. A spread spectrum feature
> provides an ease-of-use solution for noise-sensitive audio or RF
> applications.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added more detailed description for renesas,rtc-enabled property.
> RFC->v2:
>  * Updated reg property
>  * Added optional reg-names, interrupts and renesas,rtc-enabled
>    properties.
>  * Fixed the node name in the example
>  * Dropped the cross link property renesas,raa215300-rtc.
>  * Updated the example
> ---
>  .../bindings/mfd/renesas,raa215300.yaml       | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> new file mode 100644
> index 000000000000..04d34e5be23e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/renesas,raa215300.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RAA215300 Power Management Integrated Circuit (PMIC)
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  The RAA215300 is a high-performance, low-cost 9-channel PMIC designed for
> +  32-bit and 64-bit MCU and MPU applications. It supports DDR3, DDR3L, DDR4,
> +  and LPDDR4 memory power requirements. The internally compensated regulators,
> +  built-in Real-Time Clock (RTC), 32kHz crystal oscillator, and coin cell
> +  battery charger provide a highly integrated, small footprint power solution
> +  ideal for System-On-Module (SOM) applications. A spread spectrum feature
> +  provides an ease-of-use solution for noise-sensitive audio or RF applications.
> +
> +  This device exposes two devices via I2C. One for the integrated RTC IP, and
> +  one for everything else.
> +
> +  Link to datasheet:
> +  https://www.renesas.com/in/en/products/power-power-management/multi-channel-power-management-ics-pmics/ssdsoc-power-management-ics-pmic-and-pmus/raa215300-high-performance-9-channel-pmic-supporting-ddr-memory-built-charger-and-rtc
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,raa215300
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: main
> +      - const: rtc

I missed it last time. This does not match your reg. I suggest to drop
minItems from reg, assuming your device always has two address spaces.

> +
> +  interrupts:
> +    maxItems: 1
> +

Best regards,
Krzysztof

