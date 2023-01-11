Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 735C5666050
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jan 2023 17:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbjAKQXm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Jan 2023 11:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234896AbjAKQXS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2023 11:23:18 -0500
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DFC3D1E3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 08:20:25 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 203so15509691yby.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 08:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hi26SCoS0l6bqSsyeS8xP7zv+YeoBCJwesFBDqfoZt8=;
        b=dVKY6C/Dx1e6oPpLiW42uLPtgLemPKMInknUXWN6uDelZqV9t+jlDPYZUQiFhV5RHU
         Nrpm5vXKGFXWtnOI7gy9qQxTTajwZhltMZNUIrP2lHEmojsPwJKg7LjaM8jf+xFKn3Q9
         JZqorhHyMqcDPhIBJFmvo8QFLTR4QcoyG5HQ2umXXsPP+6UC5YgA4jdgonzPLVxPoQiO
         jBAOgAdigNEnDLJWXweZF68/JE0VZP4p0h4YQSei+eMVP4H2bfuA/4Su/apz8+0bvwqq
         BrmMo5OEDXDUBpuI+wcifY8dNc5nGx1uojPfRhxkjElY2QqNYiHekZwXEmcVOzL/OpdE
         hWbA==
X-Gm-Message-State: AFqh2kpdyJl+zYxFJBjW5OwnfhPPXAO3A+00BJF8t9IGU5tIvjS2+Cwq
        hzKqQeQrh7Q+uxvAkHpBo2+DQLoFQuBbfQ==
X-Google-Smtp-Source: AMrXdXsZhl4Ch6IlS4bdyq61JDWeF0oo7uH6ttdquO0yumBwSDUqCkx0jrkKP5F8+Cbgl9lF9PmO7g==
X-Received: by 2002:a5b:87:0:b0:7b4:74e:388 with SMTP id b7-20020a5b0087000000b007b4074e0388mr22295915ybp.10.1673453988971;
        Wed, 11 Jan 2023 08:19:48 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id t11-20020a05620a034b00b006fa31bf2f3dsm9113370qkm.47.2023.01.11.08.19.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 08:19:48 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-4c24993965eso195339487b3.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2023 08:19:48 -0800 (PST)
X-Received: by 2002:a05:690c:c02:b0:48d:1334:6e38 with SMTP id
 cl2-20020a05690c0c0200b0048d13346e38mr5993271ywb.316.1673453988456; Wed, 11
 Jan 2023 08:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20221222093252.3613915-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20221222093252.3613915-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Jan 2023 17:19:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7LT-JNH-iPACLQfdS=oh_g-y2OXW-1R4xM5s+jWnUUQ@mail.gmail.com>
Message-ID: <CAMuHMdW7LT-JNH-iPACLQfdS=oh_g-y2OXW-1R4xM5s+jWnUUQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS device
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Dec 22, 2022 at 10:33 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable UFS device for R-Car S4-8 Spider CPU board.
>
> Note that the conditions of RC21012 on the Spider are:
>  - OUT11 (for UFS30_REFCLK_V) is disabled as default.
>  - OUT11 is controlled by GPIO0 pin.
>  - The GPIO0 pin is inverted sense (low active) and pull-up enabled.

Thanks for your patch!

> To output the clock, pin 4 of TCA9554 on the Spider board needs to
> output low level so that using "gpio-gate-clock" for it.

Does this mean the GPIO setup was the only missing part,
and the i2c commands from [1] were not needed?

I wanted to give this a try, but the remote Spider is offline.

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> index 25b34d66061a..32625afc74bf 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2021 Renesas Electronics Corp.
>   */
>
> +#include <dt-bindings/gpio/gpio.h>
>  #include "r8a779f0.dtsi"
>
>  / {
> @@ -32,6 +33,12 @@ memory@480000000 {
>                 reg = <0x4 0x80000000 0x0 0x80000000>;
>         };
>
> +       rc21012_ufs: clk-rc21012-ufs {
> +               compatible = "fixed-clock";
> +               clock-frequency = <38400000>;
> +               #clock-cells = <0>;
> +       };

So you're modelling the RC21012 output as a fixed clock.
I guess that's acceptable until a proper driver is available.

> +&ufs30_clk {
> +       compatible = "gpio-gate-clock";
> +       clocks = <&rc21012_ufs>;
> +       enable-gpios = <&gpio_exp_20 4 GPIO_ACTIVE_LOW>;

Perhaps the "clock-frequency" property should be removed using
/delete-property/?

> +};

Alternatively, you could have kept ufs30_clk as a fixed-clock, dropped
rc21012_ufs, and added a gpio hog.
But I do like your description, as it clearly shows how the GPIO interacts
with the RC21012.

The i2c part LGTM, and is identical to [2].

[1] "https://lore.kernel.org/all/20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com"
    https://lore.kernel.org/all/20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com
[2] "[PATCH] arm64: dts: renesas: spider-cpu: add i2c0 bus"
    https://lore.kernel.org/all/20221220121959.45779-1-wsa+renesas@sang-engineering.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
