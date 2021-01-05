Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9452F2EAE6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 16:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbhAEPcS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 10:32:18 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:37948 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbhAEPcS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 10:32:18 -0500
Received: by mail-oi1-f180.google.com with SMTP id x13so36390406oic.5;
        Tue, 05 Jan 2021 07:32:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3XCzLc+JrlP85UEWmLYLA8pxjzVQAO+Bfus2Uo0z0ls=;
        b=PDHZb07NgaYldsX+grGGK8IRRtV9oTg+NjzrBZ0fJCwiTfieRhsv/1zX2ijcJ4XKBv
         lkHxr8JhI2VJM8GMo9F5vhjK9X97gv2oXVeQxIcF/VjuoUi2t8PXJkxcaToSaTwIjgz2
         N8QjOJHkpLqwJBd5PDZuoNR0xFxM9Rlqp9qLJsgM13wqRBW2mIu/Z4YeMLYsqJqA4Jsa
         qqoQK6Ea0ef4BVmPzTXzOtWE3aS/vcCoRaLPbDZX4tzxYy0KKtdOt02882gQVeoCtk9W
         TEx1RDDUBhDc4h7LH5Dn0oYFJcROt6UPPdflDHZf96ykulUQ4bMeVFgiMdnBG8agkX14
         SyUw==
X-Gm-Message-State: AOAM532EeInivWO/DjrhDOeVoOsZoCvAHy8d0EAJSWX6OQ2ut/v8WuJo
        eDaCufRDu6QH888ssVdWJlq3ma2e9hfxvQoEY7I=
X-Google-Smtp-Source: ABdhPJxRQ0Rbqs3/fLnMK6omXZo62gnSTOQvDNxnAOkouFndOM1RUVX0vszyuqSY7ykF/J2RX++cKEywBU5I6nUriOo=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr72159oia.54.1609860697036;
 Tue, 05 Jan 2021 07:31:37 -0800 (PST)
MIME-Version: 1.0
References: <20201227130407.10991-1-wsa+renesas@sang-engineering.com> <20201227130407.10991-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227130407.10991-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 16:31:26 +0100
Message-ID: <CAMuHMdWqA8Kv_5Ob4ZycM9H-EaHNydMWCX+6HSECRRK3Z7oHkA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tho Vu <tho.vu.wh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Sun, Dec 27, 2020 at 2:04 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Tho Vu <tho.vu.wh@renesas.com>
>
> Define the generic parts of Ethernet-AVB device nodes. Only AVB0 was
> tested because it was the only port with a PHY on current hardware.
>
> Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
> [wsa: double checked & rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -377,6 +377,276 @@ i2c6: i2c@e66e8000 {
>                         status = "disabled";
>                 };
>
> +               avb0: ethernet@e6800000 {
> +                       compatible = "renesas,etheravb-r8a779a0",
> +                                    "renesas,etheravb-rcar-gen3";
> +                       reg = <0 0xe6800000 0 0x800>;
> +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "ch0", "ch1", "ch2", "ch3",
> +                                         "ch4", "ch5", "ch6", "ch7",
> +                                         "ch8", "ch9", "ch10", "ch11",
> +                                         "ch12", "ch13", "ch14", "ch15",
> +                                         "ch16", "ch17", "ch18", "ch19",
> +                                         "ch20", "ch21", "ch22", "ch23",
> +                                         "ch24";
> +                       clocks = <&cpg CPG_MOD 211>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 211>;
> +                       phy-mode = "rgmii";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";

$ make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/renesas,etheravb.yaml
arch/arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml:
ethernet@e6800000: 'rx-internal-delay-ps' is a required property

Similarly, "tx-internal-delay-ps" should be added to all instances, too.

The rest looks good to me, so with the above fixed:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
