Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D729D2EA930
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 11:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729241AbhAEKuU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 05:50:20 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:38175 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728963AbhAEKuU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 05:50:20 -0500
Received: by mail-ot1-f46.google.com with SMTP id j20so28869709otq.5;
        Tue, 05 Jan 2021 02:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SqeUeixNpglmgt3OroX1JhZZ5VxeBYCyGaaQNXZKkVQ=;
        b=e1BssBr75hlCK/wiPF1SN0q8VXtcnHNDPg2LDcOFKQ7qZ0AIy8ToN8GaL+gaqolQY9
         xWQDvdDvl9weGXEJWCVOSYVLnpIxEwA+CJeWRuo3IqYtag3+5WHrVe3+JDIJn/vzpgS1
         v5op6N+4iUC1uIrqrRMP3QSTNEHEEU+ljyCT5+P2iowj/aJryZnMfEtiJ6dvr6rG5MZg
         y0YY7ecgVB6uBNEGl/z/nl1sFy/d0pVz6FX/o5abX8+RWL/ApXsG0QNIBjFi7L0gYrcW
         BnuUAqRVqPITwhFpcFSwV8/hvKbc1jiAlvqYM8bpsYnpnwtSs/Ed9RKzXrm5YZWYroF3
         9jZA==
X-Gm-Message-State: AOAM531bdRWveDarr2todvFEhK9RTu54IW1mf0wfZEKGkuMalPAsgD16
        yCW3FqICCQKNiTVLb5OiEW/N5RuiDesg8E3oRN+NQYCx
X-Google-Smtp-Source: ABdhPJylR7rvQc3t1JKfexcHTYn4/6KTSYnE3/Ho9XdIFLF9yhFMffaA0LR49p64O7mwQWT6FsntNkGHO3ePe4DdMl0=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr55697276otc.145.1609843778824;
 Tue, 05 Jan 2021 02:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com> <20201223172505.34736-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201223172505.34736-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 11:49:28 +0100
Message-ID: <CAMuHMdW7dO4W9Kohs7vL2qWFxmWMUcNGt679Z5nkJ1yhtgJrgA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: Add I2C to R8A779A0
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
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

On Wed, Dec 23, 2020 at 6:25 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Add I2C devicetree description to V3U
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: rebased and double checked]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -14,6 +14,16 @@ / {
>         #address-cells = <2>;
>         #size-cells = <2>;
>
> +       aliases {
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +       };

Do we need the i2c aliases? ;-)

> @@ -115,6 +125,118 @@ sysc: system-controller@e6180000 {
>                         #power-domain-cells = <1>;
>                 };
>
> +               i2c0: i2c@e6500000 {
> +                       compatible = "renesas,i2c-r8a779a0",
> +                                    "renesas,rcar-gen3-i2c";
> +                       reg = <0 0xe6500000 0 0x40>;
> +                       interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 518>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 518>;
> +                       dmas = <&dmac1 0x91>, <&dmac1 0x90>;
> +                       dma-names = "tx", "rx";

Might be wise to leave out the DMA properties until we have verified that
DMA works?

> +                       i2c-scl-internal-delay-ns = <110>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
