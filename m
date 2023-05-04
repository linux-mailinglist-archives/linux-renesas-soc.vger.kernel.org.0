Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B71E6F6577
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 May 2023 09:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjEDHIB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 May 2023 03:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjEDHIA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 May 2023 03:08:00 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085F92D4A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 May 2023 00:07:57 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50be0d835aaso120652a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 May 2023 00:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683184075; x=1685776075;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hagsjxW1RXKTpuhpjZ0qKSSJO/9B6kHq77YKThRdORc=;
        b=yYMPTIxz/q3OC+OdrWN+xTVV0WM79R2RwTSyCSgKE9lZ7Ct1wZLYaXW1noKnnR0pYM
         +BXfKMW1GFTuwLwcFQLNaiABzJOHw7MzZl61tjnoNRAABxDxHedW2n1/5fRJoKWzrSaV
         8iBDODS8pc5IX39kbAfXmZmDc9b6yVCq7Alw3hi3Yl5Wnok8QKg64vdNg9xegdqHY7w4
         oegDXzmhI0mbEQblMkOc9IrBNMrpcXxCi+KyYaCI6+Pu7QkgQKvh9QzI94x3TasvUyMS
         e7sSW0iaWdqHP5mhmjhDv2yh2+CouRIhyOhi94YqC0pImWwIfB/UgZaFqNbjhoQYJa+Q
         MaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683184075; x=1685776075;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hagsjxW1RXKTpuhpjZ0qKSSJO/9B6kHq77YKThRdORc=;
        b=Z+amRgRN8521FYj/62g4Gg53uNO68MPas4aJa+8Z7U37s5sZl9UB4ecpEATej82Suw
         RSkF3ySNLxKGSUxAHh/OGTfZHWLUqpJvn+fc5dPakvfk90tqoj5cCZOzt4aDOrOp6UKz
         24MIuphwlMSaN3J+mMx6vkIO0SzDRXwiMO82a/cg+6rrPav6WEhGB1+y+pVZvZGVz68f
         aep6uWu/EWtH3pGRajE5ZpHGtpECVTWiXvY5PiN/WXXkIyNI7UD/KXwzUe13llO3sa1l
         rs5yLs6ZE9pEEzK4e/qhpL8YPdb/a8TmOcjifFYqiPc8IxHEzoyVjVYJEaOdJ4i6Nqii
         OrGA==
X-Gm-Message-State: AC+VfDwgOC4i47tXeCy4DmarsT5J+1Lall+4Hu3PIPcDIelz3NI+HP3Y
        j+CjxSBakZJ4AMSkXo8sImPPdA==
X-Google-Smtp-Source: ACHHUZ6JOFwUuzuwyX58pyTxqp3cgHpBCGsfPSSzxp/nqWJK6zG7InFAYtW7A90KFazeVpTJapGudQ==
X-Received: by 2002:a05:6402:1aca:b0:50b:fbb5:f934 with SMTP id ba10-20020a0564021aca00b0050bfbb5f934mr590048edb.3.1683184075525;
        Thu, 04 May 2023 00:07:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7de09000000b0050bc13e5aa9sm1522531edv.63.2023.05.04.00.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:07:55 -0700 (PDT)
Message-ID: <ca926221-ffc2-8572-39ab-0f849ac91b5f@linaro.org>
Date:   Thu, 4 May 2023 09:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230503084608.14008-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 03/05/2023 10:46, Biju Das wrote:
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
>  .../bindings/mfd/renesas,raa215300.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> new file mode 100644
> index 000000000000..1e65f7618333
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> @@ -0,0 +1,57 @@
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
> +    maxItems: 1
> +
> +  renesas,raa215300-rtc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the built-in RTC device.

Why do you need phandle to anything else? This looks like wrong
relationship described. If these are siblings, why do you need
cross-linking via phandles?

Most of PMICs are described with one node, even though RTC is on
separate address.


> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic: raa215300@12 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "renesas,raa215300";
> +            reg = <0x12>;
> +
> +            renesas,raa215300-rtc = <&rtc_raa215300>;
> +        };
> +    };

Best regards,
Krzysztof

