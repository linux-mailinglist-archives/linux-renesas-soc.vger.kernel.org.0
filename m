Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A98704740
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 May 2023 10:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjEPIAk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 May 2023 04:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjEPIAj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2023 04:00:39 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7975219B9;
        Tue, 16 May 2023 01:00:38 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-55a214572e8so202590147b3.0;
        Tue, 16 May 2023 01:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684224037; x=1686816037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0h6qVIfbUBDrUxA2PTLniEHIyTzUxs5niagrHQ6PpI=;
        b=TEGx5VgLbAH3yRjcQM+deGbHuLavr/fHf5asGhwiT1TyDvrmXc/lh3ybhtejGjPa3S
         4lobjLgBbhrSlUtGjfyxuw8gh5+bxa9/OllffOpvonZIN8zpFxTnUhnKqmOZ+p2HLhcD
         WaY4/UMk4qvjcH59sR21aUWPJoL7acJmYkLks4zATp+Rsf5hu+M/KzmDJk2+LCJPZENp
         DjGv0skV5k4oQUhQ6ekpbx6fwDtsfsS8ILVO7iFZ6E6lumxGydQ5BWRgckDX4KS9zQ94
         J4Eldl0gOutZ84RaV/FDC8VAPkUk4jmISm3c39VXxisvWp4N5p0D9AqR+bHYD5fCi3nX
         YCDQ==
X-Gm-Message-State: AC+VfDx/tZPXS+GCXDWqsEyvIGJP30WLWEJUwce6n4Q2E6CpOTGimhuC
        9OamEJkHBsI2KXpuj5qoMhJz7dZ9oTtAnw==
X-Google-Smtp-Source: ACHHUZ7bmEuXo6vdwkvKjwTbNZhWlcKQ3iIasuAbqpk/DcqxkTsXsB2asJ5bOT7808jBtIfkjLVbhQ==
X-Received: by 2002:a81:9486:0:b0:55a:f410:4ffe with SMTP id l128-20020a819486000000b0055af4104ffemr36744305ywg.19.1684224037291;
        Tue, 16 May 2023 01:00:37 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id w191-20020a0dd4c8000000b0054f56baf3f2sm420419ywd.122.2023.05.16.01.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 01:00:36 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ba8253f635cso505097276.0;
        Tue, 16 May 2023 01:00:36 -0700 (PDT)
X-Received: by 2002:a81:4a0a:0:b0:55a:40d3:4d6f with SMTP id
 x10-20020a814a0a000000b0055a40d34d6fmr31853835ywa.26.1684224036141; Tue, 16
 May 2023 01:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com> <20230513165227.13117-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230513165227.13117-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 May 2023 10:00:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpHgU3p1OE5_Vea8feqdyFbiSuyporhw6gEUwn=HX73Q@mail.gmail.com>
Message-ID: <CAMuHMdXpHgU3p1OE5_Vea8feqdyFbiSuyporhw6gEUwn=HX73Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC bindings
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
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sat, May 13, 2023 at 6:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
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

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml

> +  renesas,rtc-enabled:
> +    description:
> +      To indicate RTC is enabled on the PMIC.
> +      Enabling of the RTC is based on system design. System designers may
> +      choose not to populate built-in RTC by grounding XIN and XOUT pins.
> +    type: boolean

Perhaps you should go full DT monty and replace this logic by a clocks
property pointing to the external crystal?

However, as I only have the Short-Form Datasheet, I am wondering what
"Built-in 32kHz crystal oscillator (with bypass)" really means?
Does this mean the RTC can work without an external crystal, using an
on-chip oscillator?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
