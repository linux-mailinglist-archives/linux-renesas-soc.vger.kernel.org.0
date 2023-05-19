Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA1C7097DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 14:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjESM7a convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 08:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbjESM73 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 08:59:29 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EB6E7F;
        Fri, 19 May 2023 05:58:56 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5648e904593so1640097b3.3;
        Fri, 19 May 2023 05:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684501125; x=1687093125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLPr5UuUBNCVrV62IdjI3b1017A2XQE4lrIxbUuKJas=;
        b=cVqLhOaIWBcrru4yfh/OO5NC3rAYt1LnvYUd6CwsfmnvlStZZDxa9WQSkPUbnbqu97
         bjXSGaVx/u4OXO+GkNuQsH8KavTxqUJMUWZwlLo25ifBqAIJntFdkPx2bPDEkoACxtXd
         LMvFkTakwVldi8Ue5RqpJLleVLzc3t662qXEXmas0oOP7YRHeuwWdkXHy702UWssZXPu
         X2etRgolPZS56jzRO2SPLbB9dQQ5h6ipP4aGsWHxPfaj1qeoD2uwKTOk+6WOBbNjOXqk
         w5Yi4IXK/PY2b4FtK0hkESs0MbIZUx4n5rHIYBAWLy8UoxeL+F/A4IhpEodJQ3rim0SO
         rFcw==
X-Gm-Message-State: AC+VfDwxrwIj9lyfPjztnC8e74qhQ1kYgXLwO2XpANo0X8MTCKFfZYVZ
        CCiMBJrEeXo9o9nZy5b+40gHzjHhiYL5RQ==
X-Google-Smtp-Source: ACHHUZ7mYudGyZxGxAW6PnSAsu18aKfyp3RqqQUd+reRLpKP7KDPMzAWBqr8lXDeoP60j9yMjMMA+A==
X-Received: by 2002:a0d:fe85:0:b0:54f:adff:bd7a with SMTP id o127-20020a0dfe85000000b0054fadffbd7amr2308566ywf.8.1684501124666;
        Fri, 19 May 2023 05:58:44 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id r125-20020a0dcf83000000b0054fa1fbda6fsm1139553ywd.25.2023.05.19.05.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 05:58:43 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-561b65b34c4so44095807b3.1;
        Fri, 19 May 2023 05:58:43 -0700 (PDT)
X-Received: by 2002:a0d:c841:0:b0:559:e954:edf8 with SMTP id
 k62-20020a0dc841000000b00559e954edf8mr1939413ywd.6.1684501123545; Fri, 19 May
 2023 05:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com> <20230518113643.420806-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518113643.420806-10-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 14:58:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsNYhD8VQWpwPqn_AV6cw85m+vg_DMXQP+ggGOz3RF0Q@mail.gmail.com>
Message-ID: <CAMuHMdUsNYhD8VQWpwPqn_AV6cw85m+vg_DMXQP+ggGOz3RF0Q@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, May 18, 2023 at 1:37 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
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
> v3->v4:
>  * Moved bindings from mfd->regulator.
>  * Dropped minItems from reg.
>  * Dropped renesas,rtc-enabled property and instead used clock-names property
>    to find RTC is enabled or not.
>  * Added reg-names in required property.
>  * Updated the example.

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/renesas,raa215300.yaml#
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
> +  clocks:
> +    maxItems: 1

Perhaps add a description to make it clear that not providing clocks
is supported, and means the RTC is disabled?

> +
> +  clock-names:
> +    description: |
> +      Use xin, if connected to an external crystal.
> +      Use clkin, if connected to an external clock signal.
> +    oneOf:
> +      - items:
> +          - const: xin
> +      - items:
> +          - const: clkin

Please replace oneOf+items by enum.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
