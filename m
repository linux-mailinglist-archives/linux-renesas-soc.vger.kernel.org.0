Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3C66F8863
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 May 2023 20:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjEESIL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 May 2023 14:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbjEESIK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 May 2023 14:08:10 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35F3160B1
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 May 2023 11:08:08 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bc2feb320so3323710a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 May 2023 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683310087; x=1685902087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=liqV6NqUdeMiUfLaQ9XT4OjLy4lag2MJKfmHrTaiAXA=;
        b=tHVhUwKAcKu9p76BGLqvnCJr9lQrO9DJLkeKWZHYcLI6aZKekinU9Qkwj8dGGaXIZT
         cAjyiCuIw1fUAZL84iC39VGfbLIAUgBZ4J6D68Pyjgky/0WMU9DbXww/6eTgHsZSAAb/
         RiOY7bg8HybrQJgCIFYn2TAfpxuvXHCJncIxZbWG8pcRe7on99qg21RQrMaJYDTZO4lv
         axbr2n+6cKuGGKH/VmdePxmnKCSU1zRq1XmKDjLUp4yKmdy9Y/2zrf0XaIcQjG4g5Wr5
         SwSi0+NSj0AYEmzV6yLCELjNDWow0KNFkbfayQx6Rz1WCIfteG6IIbT28ZYPDuXmoFjK
         cedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683310087; x=1685902087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=liqV6NqUdeMiUfLaQ9XT4OjLy4lag2MJKfmHrTaiAXA=;
        b=AT+eE+usK3wF0o+JNwmnpJJFHxnycSH+QyO8FGysWCa5A/XC0GJt8PqZT41X9tJbe3
         hh0kiyWvByNXZ63wEb7kM2NlobG6alTBRFMb77xFnuNxkg/YTzMwuY+fu4gIMjlmcRLk
         m5oPbzhUyJNKSHW0I1gEawvIO06fOddufYe2Z2Hp/c54Zo4iwOFpPBvTEzkWnzy2nt3B
         oM5AlTO9DWUB/Ee2i4+JYPdFrrVDEx/Frm4cZYPOKWhW8Vxi4WxnCxi5ilxNpTuAZUI1
         UXT0RIdNw5oyW0/YLxg85lL53Rq5SHt+0J1+jVy10qLm2yPHJjYH6yRC9e7bKdzRj6zk
         gz4Q==
X-Gm-Message-State: AC+VfDxcEyj0eamXEfruKakY9TWewkhcmzftPhlnekt9BfRGsJsNUAMj
        WFVz39LXJD/ht8rsn7ncHdfCAg==
X-Google-Smtp-Source: ACHHUZ70HceySeIRZzJuDfcNllYZ1FTV3pLwKfPt4aGBnGT5bBOo35PmHVWf8gRmXI3gwn1A+aBYOA==
X-Received: by 2002:a05:6402:14e:b0:50b:ff3c:d497 with SMTP id s14-20020a056402014e00b0050bff3cd497mr2078703edu.23.1683310087306;
        Fri, 05 May 2023 11:08:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id v18-20020aa7dbd2000000b0050bd85ab1cfsm3181803edt.48.2023.05.05.11.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 11:08:06 -0700 (PDT)
Message-ID: <e2393abc-53a2-4216-cd85-1033560421ee@linaro.org>
Date:   Fri, 5 May 2023 20:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
 <20230505172530.357455-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505172530.357455-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/05/2023 19:25, Biju Das wrote:
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
> RFC->v2:
>  * Updated reg property
>  * Added optional reg-names, interrupts and renesas,rtc-enabled
>    properties.
>  * Fixed the node name in the example
>  * Dropped the cross link property renesas,raa215300-rtc.
>  * Updated the example
> ---
>  .../bindings/mfd/renesas,raa215300.yaml       | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> new file mode 100644
> index 000000000000..85cb4f0b5711
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> @@ -0,0 +1,68 @@
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
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  renesas,rtc-enabled:
> +    description:
> +      To indicate RTC is enabled on the PMIC.

"Enabled" by who or what? This looks like some policy, so Devicetree is
not a place for it.

> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg


Best regards,
Krzysztof

