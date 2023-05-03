Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAF346F54E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 May 2023 11:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjECJiU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 May 2023 05:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjECJiR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 May 2023 05:38:17 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173F84C30;
        Wed,  3 May 2023 02:38:15 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-b9d881ad689so7178702276.2;
        Wed, 03 May 2023 02:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683106694; x=1685698694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eW0wVbbFVwT7CJWHMvXuGero0OkZGhjRfMobpeD3hIU=;
        b=B5jM8GnsdtBDdfqPHiLcoVqvrTnptL5VWgcGpdyysHdkh6jRf9a6W3r4wg9w7tGKWg
         C4qicxRUiJ/GMO0BE44x9l9S9x61IIWwny3w66wn2ctL36Z8MB+PfRAc8bCnie0geVU+
         hZ6PB637+hUvWxEqso9ycN+qDhkdOJwuZnDYSLkdOb+pV9Qs4yqz78g+G5SQ48z8le9p
         /IsA6GQlYynWeoGAGZ9jsZRHzMTHng8AGPFkze3ZJS2gSuf6JqiRHY2gbcjctccrhHCC
         NfUkuErB4iu+a/kX+R6Jnx8b8C7zfPrvPtN1iYieS0XftUZlUckew0RecvyNJnBB95qI
         92lQ==
X-Gm-Message-State: AC+VfDyE5PLbj//MSHtRabTFoNCwhSIYcVr8xg2nbavvX8g0dvekUWLH
        W+WNv2eCKdjPxX3+qKWbL0dzrofDh6Kq8Q==
X-Google-Smtp-Source: ACHHUZ7bYv4gtZfhB8ybXZ5ALpV6U8ayipHocjEy2CT7X631wR62ILKXzSL1B9i6Aa6NgnBOOprDTg==
X-Received: by 2002:a25:e74f:0:b0:b99:9335:87f6 with SMTP id e76-20020a25e74f000000b00b99933587f6mr19790344ybh.27.1683106694062;
        Wed, 03 May 2023 02:38:14 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id b205-20020a2534d6000000b00b8bfb4c4f1esm1692229yba.62.2023.05.03.02.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:38:13 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-b9d8e8898eeso7058475276.1;
        Wed, 03 May 2023 02:38:13 -0700 (PDT)
X-Received: by 2002:a25:a263:0:b0:b9e:889:420f with SMTP id
 b90-20020a25a263000000b00b9e0889420fmr12655820ybi.12.1683106693325; Wed, 03
 May 2023 02:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com> <20230503084608.14008-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230503084608.14008-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 May 2023 11:38:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQa3-Qnyru_3=hccWjEZwZxriUHc8-5PrpwzQaxsy5Hw@mail.gmail.com>
Message-ID: <CAMuHMdXQa3-Qnyru_3=hccWjEZwZxriUHc8-5PrpwzQaxsy5Hw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, May 3, 2023 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
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

Thanks for your patch!

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

renesas,raa215300-pmic?

> +
> +  reg:
> +    maxItems: 1
> +
> +  renesas,raa215300-rtc:

renesas,rtc?


> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the built-in RTC device.
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
> +            compatible = "renesas,raa215300";
> +            reg = <0x12>;
> +
> +            renesas,raa215300-rtc = <&rtc_raa215300>;
> +        };
> +    };
> --
> 2.25.1
>


--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
