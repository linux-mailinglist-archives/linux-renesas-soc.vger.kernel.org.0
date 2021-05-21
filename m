Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50EA938CA42
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 17:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbhEUPhH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 11:37:07 -0400
Received: from mail-vk1-f182.google.com ([209.85.221.182]:45832 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbhEUPhG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 11:37:06 -0400
Received: by mail-vk1-f182.google.com with SMTP id f10so3429461vkm.12;
        Fri, 21 May 2021 08:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a3WVdvldRywgecvzsbgbHt5g1WrBfUZ0zSYIUyDk8ng=;
        b=GCMtNRykY+3RfOHmbVCNED/tFlLjCM/5kWaOY3kXJxLPFuX+lZ1vloVIwLSQ/drAbc
         J5gnaqjy/1ra8GH07bLI4mCyg3iAJ06drYfPWCYIGiPOp0ko6L/Jo8z7WgA36mlf4aXf
         HTwYBO8P2BEKunaWBIKsh1hKIxLnTDzL9fu8puq4tt0EIF7MUVpY0DNFGCImHuROgQpW
         5GW2SzDlNNsDlNhVJ+lFnIJz/kIH0T2BaWzPxZAemQXavHiCnHf7hXxs1EQ4BGNcPz91
         YWQbi0n2QdGajUhY/DZT4f+ZAMVGJnVSYWj41y8khRQaekLiA1ovLYfdIb9inARbt/fP
         Bs/w==
X-Gm-Message-State: AOAM533AFra5rOKQlkoc7OfO2Fq9IQD+ZJGtBofAlmmCOchXDgZCjd34
        8Pbl9dc9iD8gN6a9no4dG4dVjgLUZ2W1sw+es08=
X-Google-Smtp-Source: ABdhPJwWlya8K30F3V2qs/Hq9G7Rv1FQkoCyVcDS+n3dbvZKSL0wbmn/3qX7y9Z9CB+YT4ljmhlQDQUhiVwfuwqNMto=
X-Received: by 2002:a1f:eac1:: with SMTP id i184mr10996902vkh.2.1621611340515;
 Fri, 21 May 2021 08:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 17:35:28 +0200
Message-ID: <CAMuHMdWFbUEPVarqG4B-MUqRNFTS8noXgikMP2UqEwG2qNhsTA@mail.gmail.com>
Subject: Re: [PATCH 15/16] arm64: dts: renesas: Add initial DTSI for
 RZ/G2{L,LC} SoC's
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 14, 2021 at 9:24 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add initial DTSI for RZ/G2{L,LC} SoC's.
>
> File structure:
> r9a07g044.dtsi  => RZ/G2L family SoC common parts
> r9a07g044l.dtsi => Specific to RZ/G2L (R9A07G044L) SoC
> r9a07g044l1.dtsi => Specific to RZ/G2L (R9A07G044L single cortex A55) SoC
> r9a07g044l2.dtsi => Specific to RZ/G2L (R9A07G044L dual cortex A55) SoC
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> index 000000000000..c625d302f889
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0

Do we want to use

    SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

for new DTS files?
This actually also applies to <dt-bindings/...> files.

> +/*
> + * Device Tree Source for the RZ/G2L and RZ/G2LC common SoC parts
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/r9a07g044l-cpg.h>
> +
> +/ {
> +       compatible = "renesas,r9a07g044";
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       extal_clk: extal {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       psci {
> +               compatible = "arm,psci-1.0", "arm,psci-0.2";
> +               method = "smc";
> +       };
> +
> +       soc: soc {
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               scif0: serial@1004b800 {
> +                       compatible = "renesas,scif-r9a07g044";
> +                       reg = <0 0x1004b800 0 0x400>;
> +                       interrupts =
> +                               <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;

"make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/serial/renesas,scif.yaml":

    arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dt.yaml:
serial@1004b800: interrupts: 'oneOf' conditional failed, one must be
fixed:
    [[0, 380, 4], [0, 382, 4], [0, 383, 4], [0, 381, 4], [0, 384, 4]]
is too long
    Additional items are not allowed ([0, 382, 4], [0, 383, 4], [0,
381, 4], [0, 384, 4] were unexpected)
    Additional items are not allowed ([0, 384, 4] was unexpected)
    [[0, 380, 4], [0, 382, 4], [0, 383, 4], [0, 381, 4], [0, 384, 4]]
is too short

One interrupt is missing.  According to the documentation, "tei" and
"dri" share an interrupt, so they should map to the same interrupt number.
Please add interrupt-names.

> +                       clocks = <&cpg CPG_MOD R9A07G044_CLK_SCIF0>;
> +                       clock-names = "fck";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg R9A07G044_CLK_SCIF0>;
> +                       status = "disabled";
> +               };
> +
> +               devid: chipid@11020a04 {
> +                       compatible = "renesas,devid";
> +                       reg = <0 0x11020a04 0 4>;
> +               };
> +
> +               gic: interrupt-controller@11900000 {
> +                       compatible = "arm,gic-v3";
> +                       #interrupt-cells = <3>;
> +                       #address-cells = <0>;
> +                       interrupt-controller;
> +                       reg = <0x0 0x11900000 0 0x40000>,
> +                             <0x0 0x11940000 0 0x60000>;
> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +                       clocks = <&cpg CPG_MOD R9A07G044_CLK_GIC600>;
> +                       clock-names = "gic6000";

This looks like a weird name ;-)
In addition, it should be the consumer clock name, not the provider
clock name.

> +                       power-domains = <&cpg>;
> +                       resets = <&cpg R9A07G044_CLK_GIC600>;

"make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml":

    arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dt.yaml:
interrupt-controller@11900000: 'clock-names', 'clocks',
'power-domains', 'resets' do not match any of the regexes:
'^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$',
'^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'

These properties should be added to the GIC-v3 bindings, cfr. the normal
GIC bindings.


> +               };
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l.dtsi
> new file mode 100644
> index 000000000000..8d396b9100c1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/G2L common SoC parts
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r9a07g044.dtsi"
> +
> +&soc {
> +       cpg: clock-controller@11010000 {
> +               compatible = "renesas,r9a07g044l-cpg";
> +               reg = <0 0x11010000 0 0x10000>;
> +               clocks = <&extal_clk>;
> +               clock-names = "extal";
> +               #clock-cells = <2>;
> +               #reset-cells = <1>;
> +               #power-domain-cells = <0>;
> +       };

As I think this is shared by RZ/G2L and RZ/G2LC, it belongs to
r9a07g044.dtsi.

> +};
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> new file mode 100644
> index 000000000000..44d4504e44c3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/G2L R9A07G044L1 common parts
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r9a07g044l.dtsi"
> +
> +/ {
> +       compatible = "renesas,r9a07g044l1";
> +       #address-cells = <2>;
> +       #size-cells = <2>;

#{address,size}-cells already defined in r9a07g044.dtsi.

> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               a55_0: cpu@0 {
> +                       compatible = "arm,cortex-a55";
> +                       reg = <0>;
> +                       device_type = "cpu";
> +                       next-level-cache = <&L3_CA55>;
> +                       enable-method = "psci";
> +               };
> +
> +               L3_CA55: cache-controller-0 {
> +                       compatible = "cache";
> +                       cache-unified;
> +                       cache-size = <0x40000>;
> +               };

I think the first CPU core should be in the base r9a07g044.dtsi file.

> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupts-extended =
> +                       <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;

Also in the base file, with interrupts-extended overridden where
needed?

> +       };
> +};
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi
> new file mode 100644
> index 000000000000..33bb35e1c369
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/G2L R9A07G044L2 common parts
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r9a07g044l.dtsi"
> +
> +/ {
> +       compatible = "renesas,r9a07g044l2";
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&a55_0>;
> +                               };
> +                               core1 {
> +                                       cpu = <&a55_1>;
> +                               };
> +                       };
> +               };
> +
> +               a55_0: cpu@0 {
> +                       compatible = "arm,cortex-a55";
> +                       reg = <0>;
> +                       device_type = "cpu";
> +                       next-level-cache = <&L3_CA55>;
> +                       enable-method = "psci";
> +               };
> +
> +               a55_1: cpu@1 {
> +                       compatible = "arm,cortex-a55";
> +                       reg = <0x100>;
> +                       device_type = "cpu";
> +                       next-level-cache = <&L3_CA55>;
> +                       enable-method = "psci";
> +               };
> +
> +               L3_CA55: cache-controller-0 {
> +                       compatible = "cache";
> +                       cache-unified;
> +                       cache-size = <0x40000>;
> +               };

I think (at least) the first CPU core should be in the base
r9a07g044.dtsi file.
Probably the second CPU core should be in the base file, too, and
removed by /delete-node/ in r9a07g044l1.dtsi?

> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupts-extended =
> +                       <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +       };

Also in the base file, with interrupts-extended overridden where
needed?

> +};
> --
> 2.17.1
>


--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
