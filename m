Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFCD59ACAC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Aug 2022 10:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbiHTIjW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 20 Aug 2022 04:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344620AbiHTIjV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Aug 2022 04:39:21 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58322F650
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Aug 2022 01:39:20 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id b2so4898154qvp.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Aug 2022 01:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Em/8U14yewOtWdVf93bhYeZ8AsFfPI4L4riw1zzHsG4=;
        b=XxJYn/1PK+YJTUmj0djqZS7EsTL8FRh5OS8zY73NIb/kKgVxhv3t8GGo6kPKFfSwth
         IqK/2PIXe0dQiCG1dkb3XxEXg6pFmWHBqOGnZEJyWscCrQ1QhOuShjplLSRe7hkhgFjE
         uWiVjbQEBpZInGfI8kzgv3+YzwgG12TAIysYTBWxL9R+hDFqBQicjuBraEzAstRE4sZ5
         qyIpGUNLkXBX0nqJbzGCTv0+TraRe9zCtGeWgc9Bpnarfpwh13VI3LA8Yd2sYwqKqnue
         DBdA8U/WdPxMjO7E5/yTNfUscJQ/TgxVSEoWpkZf5n9eReEfMlChldzw/795OXtfcAH3
         UsWA==
X-Gm-Message-State: ACgBeo1s9qcxq6b4rTWcQLM1wRkmi6w/wdkxxl1OjwDlEZv+9cv9hXbv
        8PFU/ApL65d/C1Sn71EZ9LfGw7k3D8MqJg==
X-Google-Smtp-Source: AA6agR4OLLBLUv0roNhNE+KP1YnQXDgPrFuKzzOMSXFvyakt5sMFR8rYhHkCThfp1CNAH0T9x3oFkw==
X-Received: by 2002:ad4:5be5:0:b0:47b:310:92e9 with SMTP id k5-20020ad45be5000000b0047b031092e9mr8955573qvc.78.1660984759634;
        Sat, 20 Aug 2022 01:39:19 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id y7-20020a05620a09c700b006b93b61bc74sm5304293qky.9.2022.08.20.01.39.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Aug 2022 01:39:19 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-334dc616f86so175828237b3.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Aug 2022 01:39:19 -0700 (PDT)
X-Received: by 2002:a0d:eb45:0:b0:333:f813:6c79 with SMTP id
 u66-20020a0deb45000000b00333f8136c79mr11269543ywe.384.1660984758964; Sat, 20
 Aug 2022 01:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220726210110.1444-1-wsa+renesas@sang-engineering.com> <20220726210110.1444-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220726210110.1444-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 20 Aug 2022 10:39:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBiM_=V0XueJGcc4fVf1EkOjLVNqyhHZv0XXe0ox-Ekg@mail.gmail.com>
Message-ID: <CAMuHMdXBiM_=V0XueJGcc4fVf1EkOjLVNqyhHZv0XXe0ox-Ekg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a779f0: Add TMU nodes
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Tue, Jul 26, 2022 at 11:03 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -334,6 +334,71 @@ tsc: thermal@e6198000 {
>                         #thermal-sensor-cells = <1>;
>                 };
>
> +               tmu0: timer@e61e0000 {
> +                       compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
> +                       reg = <0 0xe61e0000 0 0x30>;
> +                       interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 713>;
> +                       clock-names = "fck";
> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 713>;
> +                       status = "disabled";
> +               };
> +
> +               tmu1: timer@e6fc0000 {
> +                       compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
> +                       reg = <0 0xe6fc0000 0 0x30>;
> +                       interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>;

We really should update the DT bindings so we can describe the fourth
interrupt on TMU instances that support input capture.
I don't think we need a new compatible value, as we can just look at
the presence of the fourth (actually renesas-channels + 1) interrupt
to enable the feature (if the driver ever gains support).

> +                       clocks = <&cpg CPG_MOD 714>;
> +                       clock-names = "fck";
> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 714>;
> +                       status = "disabled";
> +               };

As the above matches how TMU is handled on other SoCs:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
