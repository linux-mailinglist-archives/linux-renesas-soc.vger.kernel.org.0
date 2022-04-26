Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D78510664
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 20:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347111AbiDZSQ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 14:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350445AbiDZSQ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 14:16:26 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7D06C95A;
        Tue, 26 Apr 2022 11:13:15 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id kd11so4961991qvb.2;
        Tue, 26 Apr 2022 11:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Z+w7B8sAOrz1vDB1XKSvUbP0zPb0x1k/hl4g/KXEpo=;
        b=gXZD1EdEFJnIxBBqiGIrb1VIoXYcquA3FWXivbMJLew4zj0NHmQflGudN5Yy3ZrbKe
         7cgSGzKNfbRFmmwIi2yxfXQskn3qxVbZibY3TxagsWeT2z0JvjwAPF4XYxZH6ZNVsI5k
         UIJ+O6kY2RzQscbNSuMviLxTdiqBOJ111uOtQpzfFEjAixxh+sLiVAd+srvFPZ0Vx+gl
         dqKapMyOZt/gRk9VPyozVWoC3hieYcOEl09vCFvvuOiEolFs9BkZHR5nfqEwHh30mMgx
         i6t8SS6UY4IkDRr7oZ/s4zh2yIz2TOJ3RNjMN4tkDyT6OY52CWnJwkLcsCsXbf+2ssxX
         /+Fw==
X-Gm-Message-State: AOAM5331EchdH+UfcVWMsEE/39Qy1+oNftqhE8tUJIqPDU1aGFACc+tT
        sjPsk0NK3hhfAKIeR+UPYFfe1hL5WF6SQA==
X-Google-Smtp-Source: ABdhPJyZc5lyfYRdyuK24YRwS4/6dn0gRxMYP8kaKIJ6B9nXHHDV1u07GfM2bSENNk1oS4x0EzZK7A==
X-Received: by 2002:a05:6214:2aab:b0:446:4053:7a2b with SMTP id js11-20020a0562142aab00b0044640537a2bmr17167844qvb.127.1650996794683;
        Tue, 26 Apr 2022 11:13:14 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 191-20020a3705c8000000b0069f1a425707sm6573540qkf.11.2022.04.26.11.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 11:13:14 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id w187so25055925ybe.2;
        Tue, 26 Apr 2022 11:13:13 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr22830325ybq.393.1650996793190; Tue, 26
 Apr 2022 11:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-13-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-13-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 20:13:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVtJ-_KHUKCsuahhqP1YUwJGLDeVJmvBA0zuA28nwinQ@mail.gmail.com>
Message-ID: <CAMuHMdWVtJ-_KHUKCsuahhqP1YUwJGLDeVJmvBA0zuA28nwinQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] arm64: dts: renesas: Add initial DTSI for RZ/V2M SoC
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Wed, Mar 30, 2022 at 5:42 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Details of the SoC can be found here:
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-cortex-a-mpus/rzv2m-dual-cortex-a53-lpddr4x32bit-ai-accelerator-isp-4k-video-codec-4k-camera-input-fhd-display-output
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/V2M SoC
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/r9a09g011-cpg.h>
> +
> +/ {
> +       compatible = "renesas,r9a09g011";
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       /* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
> +       extal_clk: extal {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&cpu0>;
> +                               };
> +                       };
> +               };
> +
> +               cpu0: cpu@0 {
> +                       compatible = "arm,cortex-a53";
> +                       reg = <0>;
> +                       device_type = "cpu";
> +                       clocks = <&cpg CPG_CORE R9A09G011_CA53_CLK>;

CPG_MOD?

> +               };
> +       };
> +
> +       soc: soc {
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               gic: interrupt-controller@82000000 {
> +                       compatible = "arm,gic-400";
> +                       #interrupt-cells = <3>;
> +                       #address-cells = <0>;
> +                       interrupt-controller;
> +                       reg = <0x0 0x82010000 0 0x1000>,
> +                             <0x0 0x82020000 0 0x20000>,
> +                             <0x0 0x82040000 0 0x20000>,
> +                             <0x0 0x82060000 0 0x20000>;
> +                       interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;

clocks = <&cpg CPG_MOD R9A09G011_GIC_CLK>;
clock-names = "clk";

> +               };
> +
> +               cpg: clock-controller@a3500000 {
> +                       compatible = "renesas,r9a09g011-cpg";
> +                       reg = <0 0xa3500000 0 0x10000>;

Size should be 0x1000, according to the address map.

> +                       clocks = <&extal_clk>;
> +                       clock-names = "extal";
> +                       #clock-cells = <2>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <0>;
> +               };
> +
> +               sys: system-configuration@a3f03000 {
> +                       compatible = "renesas,r9a09g011-sys";

system-controller@a3f03000?

Pending acceptance of the DT bindings.

> +                       reg = <0 0xa3f03000 0 0x400>;
> +                       status = "disabled";

I think there is no need to keep this disabled.

> +               };
> +
> +               uart0: serial@a4040000 {
> +                       compatible = "renesas,r9a09g011-uart", "renesas,em-uart";
> +                       reg = <0 0xa4040000 0 0x38>;

Register offsets are documented until and including 0x7c,
so size should be 0x80 (which matches the address map).

> +                       interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A09G011_URT0_CLK>;
> +                       clock-names = "sclk";
> +                       status = "disabled";
> +               };
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> +               clocks = <&cpg CPG_MOD R9A09G011_SYC_CNT_CLK>;
> +               clock-names = "clk";
> +               resets = <&cpg R9A09G011_SYC_RST_N>;

The three properties above are not document, causing the following
"make dtbs_check" error message:

arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: timer:
'clock-names', 'clocks', 'resets' do not match any of the regexes:
'pinctrl-[0-9]+'
        From schema: Documentation/devicetree/bindings/timer/arm,arch_timer.yaml

> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
