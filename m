Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE0A38CD8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 20:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbhEUSic (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 14:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235978AbhEUSib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 14:38:31 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8BAC061574;
        Fri, 21 May 2021 11:37:07 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id i4so28790846ybe.2;
        Fri, 21 May 2021 11:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6q0ikK0Mie3JrQ+cMfG9/RKVJO02t8l8yLC5xdmKsBw=;
        b=qve62GhX7V7MgWo9gLUyHND9hmpf6NVdUoWsUKMisatS+WdIRwQP8g34HhH8XDj5Bf
         /ErZWMzTVJp68znHsoxmAxbyO0+fEpOu+nDRqh/DHlx8ToRx3DlcHiW+zVBlJP/kYmK2
         cPlSiWKiYkfOY0C1jxPTsTB0nj/eqKAgLugHE26T1iAl770p8an96tyvB0kMwVhoZeTP
         ZvvMqAxy9sKqqXrapuOdeBr9tpVgnqMxWnocbsafBvYEP3bSY4zjr/s5CvT99Tb7pn8K
         1YHm6jlNvpDw4nkdUta6PqIeJUiu1Cu1n9UiqL7uIuYKWGrN+BACZjuydCBjCzaS7jEM
         5Nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6q0ikK0Mie3JrQ+cMfG9/RKVJO02t8l8yLC5xdmKsBw=;
        b=S+qOb/R4V5zfd1YRN5xPv++aGb0eq8UYKSmnQo9frWLfywwNeVyrIGy/JnZHkw1qOG
         aOAXozE2jhtO33fvV47dDNmOqfJEqJD/zCmeM5B5/mPAWHXYVU9t3MfMIjBjBLHtaM9n
         y2OpEHordIJpjTNNt0Ybg/ewie+h2FNVnaUU02QOBOVIzhyAKRcvlDx0ZgeaUKjbfgAB
         hDSQIYJp0LQj5JFXXUT77EpaLitAMql7ETguHZdtjs9uWX3yCN3B+tg0bVgTggbFhZ+2
         Zzfoa//jyvxlP+kLb1KwLw+wfFFyTR4jHnjDspo53NWV5VRsL04RDHg8NPMCxIL0ikKL
         fwSA==
X-Gm-Message-State: AOAM533riPq3PRgslxBTS65saz3EGhKfUKo2qENmsL7oAkaGPM018QNW
        QRvYqxn1j3ZA9Dp7aEu3zxTI0nD04VnB5+GIw2Q=
X-Google-Smtp-Source: ABdhPJwiafq3UQhuczJqMYIiBK2lR02zSKjM4tO5dDN/6B3ZhjnMtO6d0k+6Mhq2E+1bu18LcAAUo17ZmZbtPBESD6c=
X-Received: by 2002:a25:a26a:: with SMTP id b97mr17025060ybi.62.1621622227144;
 Fri, 21 May 2021 11:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWFbUEPVarqG4B-MUqRNFTS8noXgikMP2UqEwG2qNhsTA@mail.gmail.com>
In-Reply-To: <CAMuHMdWFbUEPVarqG4B-MUqRNFTS8noXgikMP2UqEwG2qNhsTA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 21 May 2021 19:36:41 +0100
Message-ID: <CA+V-a8vWBzEkgt8KOOY-m3xpht5HO6rjkc_rGyY-UmoaeZBsNQ@mail.gmail.com>
Subject: Re: [PATCH 15/16] arm64: dts: renesas: Add initial DTSI for
 RZ/G2{L,LC} SoC's
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
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
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Fri, May 21, 2021 at 4:35 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 14, 2021 at 9:24 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add initial DTSI for RZ/G2{L,LC} SoC's.
> >
> > File structure:
> > r9a07g044.dtsi  => RZ/G2L family SoC common parts
> > r9a07g044l.dtsi => Specific to RZ/G2L (R9A07G044L) SoC
> > r9a07g044l1.dtsi => Specific to RZ/G2L (R9A07G044L single cortex A55) SoC
> > r9a07g044l2.dtsi => Specific to RZ/G2L (R9A07G044L dual cortex A55) SoC
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > index 000000000000..c625d302f889
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > @@ -0,0 +1,70 @@
> > +// SPDX-License-Identifier: GPL-2.0
>
> Do we want to use
>
>     SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>
> for new DTS files?
> This actually also applies to <dt-bindings/...> files.
>
> > +/*
> > + * Device Tree Source for the RZ/G2L and RZ/G2LC common SoC parts
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/r9a07g044l-cpg.h>
> > +
> > +/ {
> > +       compatible = "renesas,r9a07g044";
> > +       #address-cells = <2>;
> > +       #size-cells = <2>;
> > +
> > +       extal_clk: extal {
> > +               compatible = "fixed-clock";
> > +               #clock-cells = <0>;
> > +               /* This value must be overridden by the board */
> > +               clock-frequency = <0>;
> > +       };
> > +
> > +       psci {
> > +               compatible = "arm,psci-1.0", "arm,psci-0.2";
> > +               method = "smc";
> > +       };
> > +
> > +       soc: soc {
> > +               compatible = "simple-bus";
> > +               interrupt-parent = <&gic>;
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +
> > +               scif0: serial@1004b800 {
> > +                       compatible = "renesas,scif-r9a07g044";
> > +                       reg = <0 0x1004b800 0 0x400>;
> > +                       interrupts =
> > +                               <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
> > +                               <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
> > +                               <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> > +                               <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
> > +                               <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
>
> "make dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/serial/renesas,scif.yaml":
>
>     arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dt.yaml:
> serial@1004b800: interrupts: 'oneOf' conditional failed, one must be
> fixed:
>     [[0, 380, 4], [0, 382, 4], [0, 383, 4], [0, 381, 4], [0, 384, 4]]
> is too long
>     Additional items are not allowed ([0, 382, 4], [0, 383, 4], [0,
> 381, 4], [0, 384, 4] were unexpected)
>     Additional items are not allowed ([0, 384, 4] was unexpected)
>     [[0, 380, 4], [0, 382, 4], [0, 383, 4], [0, 381, 4], [0, 384, 4]]
> is too short
>
> One interrupt is missing.  According to the documentation, "tei" and
> "dri" share an interrupt, so they should map to the same interrupt number.
> Please add interrupt-names.
>
Agreed will do.

> > +                       clocks = <&cpg CPG_MOD R9A07G044_CLK_SCIF0>;
> > +                       clock-names = "fck";
> > +                       power-domains = <&cpg>;
> > +                       resets = <&cpg R9A07G044_CLK_SCIF0>;
> > +                       status = "disabled";
> > +               };
> > +
> > +               devid: chipid@11020a04 {
> > +                       compatible = "renesas,devid";
> > +                       reg = <0 0x11020a04 0 4>;
> > +               };
> > +
> > +               gic: interrupt-controller@11900000 {
> > +                       compatible = "arm,gic-v3";
> > +                       #interrupt-cells = <3>;
> > +                       #address-cells = <0>;
> > +                       interrupt-controller;
> > +                       reg = <0x0 0x11900000 0 0x40000>,
> > +                             <0x0 0x11940000 0 0x60000>;
> > +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> > +                       clocks = <&cpg CPG_MOD R9A07G044_CLK_GIC600>;
> > +                       clock-names = "gic6000";
>
> This looks like a weird name ;-)
> In addition, it should be the consumer clock name, not the provider
> clock name.
>
Agreed will rename that.

> > +                       power-domains = <&cpg>;
> > +                       resets = <&cpg R9A07G044_CLK_GIC600>;
>
> "make dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml":
>
>     arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dt.yaml:
> interrupt-controller@11900000: 'clock-names', 'clocks',
> 'power-domains', 'resets' do not match any of the regexes:
> '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$',
> '^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
>
> These properties should be added to the GIC-v3 bindings, cfr. the normal
> GIC bindings.
>
Agreed will do that.

>
> > +               };
> > +       };
> > +};
> > diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l.dtsi
> > new file mode 100644
> > index 000000000000..8d396b9100c1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044l.dtsi
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the RZ/G2L common SoC parts
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +#include "r9a07g044.dtsi"
> > +
> > +&soc {
> > +       cpg: clock-controller@11010000 {
> > +               compatible = "renesas,r9a07g044l-cpg";
> > +               reg = <0 0x11010000 0 0x10000>;
> > +               clocks = <&extal_clk>;
> > +               clock-names = "extal";
> > +               #clock-cells = <2>;
> > +               #reset-cells = <1>;
> > +               #power-domain-cells = <0>;
> > +       };
>
> As I think this is shared by RZ/G2L and RZ/G2LC, it belongs to
> r9a07g044.dtsi.
>
As some of the IP blocks present on RZ/G2L aren't present in RZ/G2LC
the clocks for the IP will be missing hence this is added to SoC
specific dtsi.

> > +};
> > diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> > new file mode 100644
> > index 000000000000..44d4504e44c3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> > @@ -0,0 +1,43 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the RZ/G2L R9A07G044L1 common parts
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +#include "r9a07g044l.dtsi"
> > +
> > +/ {
> > +       compatible = "renesas,r9a07g044l1";
> > +       #address-cells = <2>;
> > +       #size-cells = <2>;
>
> #{address,size}-cells already defined in r9a07g044.dtsi.
>
Will drop that.

> > +
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               a55_0: cpu@0 {
> > +                       compatible = "arm,cortex-a55";
> > +                       reg = <0>;
> > +                       device_type = "cpu";
> > +                       next-level-cache = <&L3_CA55>;
> > +                       enable-method = "psci";
> > +               };
> > +
> > +               L3_CA55: cache-controller-0 {
> > +                       compatible = "cache";
> > +                       cache-unified;
> > +                       cache-size = <0x40000>;
> > +               };
>
> I think the first CPU core should be in the base r9a07g044.dtsi file.
>
OK will move that.

> > +       };
> > +
> > +       timer {
> > +               compatible = "arm,armv8-timer";
> > +               interrupts-extended =
> > +                       <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > +                       <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > +                       <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > +                       <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
>
> Also in the base file, with interrupts-extended overridden where
> needed?
>
OK will  override here with the timer node moved from r9a07g044l2.dtsi
to common SoC file.

> > +       };
> > +};
> > diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi
> > new file mode 100644
> > index 000000000000..33bb35e1c369
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi
> > @@ -0,0 +1,62 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the RZ/G2L R9A07G044L2 common parts
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +#include "r9a07g044l.dtsi"
> > +
> > +/ {
> > +       compatible = "renesas,r9a07g044l2";
> > +       #address-cells = <2>;
> > +       #size-cells = <2>;
> > +
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               cpu-map {
> > +                       cluster0 {
> > +                               core0 {
> > +                                       cpu = <&a55_0>;
> > +                               };
> > +                               core1 {
> > +                                       cpu = <&a55_1>;
> > +                               };
> > +                       };
> > +               };
> > +
> > +               a55_0: cpu@0 {
> > +                       compatible = "arm,cortex-a55";
> > +                       reg = <0>;
> > +                       device_type = "cpu";
> > +                       next-level-cache = <&L3_CA55>;
> > +                       enable-method = "psci";
> > +               };
> > +
> > +               a55_1: cpu@1 {
> > +                       compatible = "arm,cortex-a55";
> > +                       reg = <0x100>;
> > +                       device_type = "cpu";
> > +                       next-level-cache = <&L3_CA55>;
> > +                       enable-method = "psci";
> > +               };
> > +
> > +               L3_CA55: cache-controller-0 {
> > +                       compatible = "cache";
> > +                       cache-unified;
> > +                       cache-size = <0x40000>;
> > +               };
>
> I think (at least) the first CPU core should be in the base
> r9a07g044.dtsi file.
> Probably the second CPU core should be in the base file, too, and
> removed by /delete-node/ in r9a07g044l1.dtsi?
>
Agreed will do that.

> > +       };
> > +
> > +       timer {
> > +               compatible = "arm,armv8-timer";
> > +               interrupts-extended =
> > +                       <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> > +                       <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> > +                       <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> > +                       <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> > +       };
>
> Also in the base file, with interrupts-extended overridden where
> needed?
>
Will move this node to common SoC r9a07g044.dtsi file and override in
r9a07g044l1.dtsi with CPU maks to 1.

Cheers,
Prabhakar

> > +};
> > --
> > 2.17.1
> >
>
>
> --
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
