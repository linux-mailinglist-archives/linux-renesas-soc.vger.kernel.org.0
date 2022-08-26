Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2865A2A05
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 16:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiHZOwC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 10:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiHZOwC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 10:52:02 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6225ED8B2B;
        Fri, 26 Aug 2022 07:52:00 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id n21so1279696qkk.3;
        Fri, 26 Aug 2022 07:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/EULlMcFWN8bwYrlTfSgo209cnQT1LoK3WzcPgYa3PQ=;
        b=j5UtwCowN1LIkX3IiKEDZjfADh9CUcV0XFi8rZZalq5ONVdZlFqUm08MSwFUvgiGAl
         JpKbsky36rxQ4tCab//QGYeVo/9UW1Jhlx3OvMXMOm3w4vd9lLQR/gw6yK41fH1dxOup
         t3/uGvmyDTToRhdrCxdp1GFSlcaHO2qAb3mUfYe4odAhP41EWywAHnt0Grt1Gc6AWrBS
         E9eQd84025M9Ryf6hywHoPUCzpNJHTZyK88JsfQPOtzu2eo0LZ3QSiheAsZ5G2VSGiRC
         RYGevveaIwFr5pg10UbB5uAULZKDKgppIDICltYKqsxVpeQzG0ZuVUY7kovTvcYSTh1S
         cjKQ==
X-Gm-Message-State: ACgBeo3TAxmgHrBYNz0MJvlZ1xG7csylRLeha3g5xwE0ltQPLptkpES+
        jPvXDHw4J63MBcSiIM6t0v59o/A8edJyiw==
X-Google-Smtp-Source: AA6agR5EHTedsIAM0Shy/gvM7B0EYSAV5c1Ulh6lshLcTzS/XqzSKANDn3JCgT5RBWE53x8M1pE+fA==
X-Received: by 2002:a05:620a:2584:b0:6ab:91fd:15dd with SMTP id x4-20020a05620a258400b006ab91fd15ddmr15115qko.287.1661525519372;
        Fri, 26 Aug 2022 07:51:59 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id b23-20020ac86bd7000000b00342fb07944fsm1329501qtt.82.2022.08.26.07.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 07:51:59 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3321c2a8d4cso41964177b3.5;
        Fri, 26 Aug 2022 07:51:59 -0700 (PDT)
X-Received: by 2002:a25:d80b:0:b0:696:6d79:4891 with SMTP id
 p11-20020a25d80b000000b006966d794891mr12980ybg.89.1661525518754; Fri, 26 Aug
 2022 07:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220825071022.7864-1-wsa+renesas@sang-engineering.com> <20220825071022.7864-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220825071022.7864-7-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 16:51:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMZf80hVE6YbsVxxByJQ3onJKk5KwVvB=+PaQkahRAVQ@mail.gmail.com>
Message-ID: <CAMuHMdVMZf80hVE6YbsVxxByJQ3onJKk5KwVvB=+PaQkahRAVQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a774a1: put I2C aliases to
 board files
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Aug 25, 2022 at 9:11 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> I2C aliases are not a property of a SoC. They belong to board files
> where they are named accordingly in the schematics.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -10,6 +10,14 @@
>
>  / {
>         aliases {
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +               i2c7 = &iic_pmic;
>                 serial0 = &scif2;
>                 serial1 = &hscif0;
>                 mmc0 = &sdhi3;

Oops:

    arch/arm64/boot/dts/renesas/hihope-common.dtsi:12.10-26.4: ERROR
(path_references): /aliases: Reference to non-existent node or label
"iic_pmic"

I've sent a fix: "[PATCH] arm64: dts: renesas: r8a774e1: Rename i2c_dvfs
to iic_pmic"
https://lore.kernel.org/r/7d60653d4d63904dc025a133297a53eb885fa064.1661525361.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
