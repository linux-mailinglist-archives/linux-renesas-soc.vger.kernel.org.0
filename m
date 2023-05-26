Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18153712191
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 09:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242476AbjEZHzm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 03:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242147AbjEZHzl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 03:55:41 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EBD125;
        Fri, 26 May 2023 00:55:40 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-561bd0d31c1so5200697b3.0;
        Fri, 26 May 2023 00:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685087739; x=1687679739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5Db8Jd59mFLPRBkBeMn6BXutz9qAM7zTWla/wvQcpY=;
        b=lYpr1bRelIwQDT0yF4k8nPfLl4T1sbLXKwDWA6tY8ydBwDLM1+qpmKfDM9oQYVQAp/
         Xe/Td74bMCM7zxvdujla8Ks3FikfRQOIbhnAHdbChHVzNpEYQSuULC0HTUC6BdB2tNGY
         m8chwoG+RegrP47RMKjW0ok5IZDyxpa2dfh4J2zKMKeWOQe+yBh4QIN1qEX8sDgbqts1
         Tds1YW/GgnTgV2I3sRO/U7jvtduQ9fe9VfLaYDQVeY5oy5NnHX73OadVxhRnk19Cy62+
         osvVRgVYTW+yCmiBc1+zYJDInR8kQ8fFCWqRFYPHznj8cVhOYQOci9yLJnTSVDj8EucP
         iASg==
X-Gm-Message-State: AC+VfDzmsv8ifS4IQUlOPOccr1bIFFswIS9qNHk6nOc6mq0YVIFgUP23
        krvBPT7BmbiutPP+xP1/j1M9p4xUtOo0/g==
X-Google-Smtp-Source: ACHHUZ7pAlDIyLJBf+XvE5tu+1Ch8A04T1lFJq5NB/fARNU+fq95TxJIwrKGNXPKHw7uakrLeooGeQ==
X-Received: by 2002:a0d:d54c:0:b0:565:9fc5:f0a1 with SMTP id x73-20020a0dd54c000000b005659fc5f0a1mr1220915ywd.36.1685087739091;
        Fri, 26 May 2023 00:55:39 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id w131-20020a817b89000000b00565374c5962sm1006063ywc.98.2023.05.26.00.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 00:55:38 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-561bd0d31c1so5200587b3.0;
        Fri, 26 May 2023 00:55:38 -0700 (PDT)
X-Received: by 2002:a81:dd06:0:b0:561:dd6a:b84 with SMTP id
 e6-20020a81dd06000000b00561dd6a0b84mr1149993ywn.26.1685087738002; Fri, 26 May
 2023 00:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com> <20230522101849.297499-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230522101849.297499-12-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 May 2023 09:55:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAkyHYhUfNLB-wkDeqmzAxARCcxqiBVYLdG_Udnj5bvA@mail.gmail.com>
Message-ID: <CAMuHMdWAkyHYhUfNLB-wkDeqmzAxARCcxqiBVYLdG_Udnj5bvA@mail.gmail.com>
Subject: Re: [PATCH v5 11/11] arm64: dts: renesas: rzg2l-smarc-som: Enable
 PMIC and built-in RTC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
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

Thanks for your patch!

On Mon, May 22, 2023 at 12:19 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable PMIC RAA215300 and the built-in RTC on the RZ/{G2L,V2L} SMARC
> EVK.

Looking at the schematics for the RZ/{G2L,G2LC,V2L} SOMs, it seems not
all SOMs have this PMIC? The ones that do have the PMIC are annotated
"PMIC Version" on the title page.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> @@ -73,6 +73,13 @@ vccq_sdhi0: regulator-vccq-sdhi0 {
>                 gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
>                 regulator-always-on;
>         };
> +
> +       /* 32.768kHz crystal */
> +       x2: clock-xtal {

"clock-extal" is a too generic name, and might cause conflicts.
"x2-clk"?

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <32768>;
> +       };
>  };
>
>  &adc {
> @@ -351,3 +358,14 @@ &wdt1 {
>         status = "okay";
>         timeout-sec = <60>;
>  };
> +
> +&i2c3 {

Please obey alphabetical sort order.

> +       raa215300: pmic@12 {
> +               compatible = "renesas,raa215300";
> +               reg = <0x12>, <0x6f>;
> +               reg-names = "main", "rtc";
> +
> +               clocks = <&x2>;
> +               clock-names = "xin";
> +       };
> +};
> --
> 2.25.1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
