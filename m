Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459E32616A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 19:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731778AbgIHRQD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 13:16:03 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39126 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIHRQA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 13:16:00 -0400
Received: by mail-ot1-f65.google.com with SMTP id u25so15504868otq.6;
        Tue, 08 Sep 2020 10:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VyUaB29YLE2hRzWLNAFVPVwBzdkigLUmsYyS9tgIxFU=;
        b=kv7O7bQUpDlj3ukFdL4UvAFS1QJnHKqNrBA6KAJ3+sIOhUIHeWl1zFEwbWtW0rVdl1
         hpcr4IYAHbKTJtVpwPfgFH59Dfr9Kn2VDR00vfsWBJCWJuiEEwHiF6GMe6aPNtLyoBnf
         RTHNvdA4EaFMIN5d1l94H1/gfOBtYTyyvBI9hcKkQ1b8fIIVWi23oBTfxU3J5ld+NFI3
         6YRxGyzHo8LDBwZCtpTuEFGaiclrxWyBZcH/a7RCM5GEWjzrlZREtlXe2ADHU9huATKg
         fmimXvrLVqqglJYLOoBpC0zSKH1Oas75HcxN/VwJKFAVZr3oYsVtcZFd3OjkjF1uZ1z6
         2cqw==
X-Gm-Message-State: AOAM532CS84eGnXqbZjY9DEKslw1f4S1JByCkYdBE9a/NLOHAzd2Ova1
        grey0gyb7pb1IlPNyVcl7HHZEc5imTYQicYY5A98LYXe
X-Google-Smtp-Source: ABdhPJycHtFHs6e1+Igot3xZzgYBhzw/LJqU+Y/o4zhAgPPaYstOfa8XpTgPN6nDizq0N4qYjU4kqO8uhJvv9eduAGU=
X-Received: by 2002:a9d:162:: with SMTP id 89mr63316otu.250.1599585359954;
 Tue, 08 Sep 2020 10:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-14-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-14-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 19:15:49 +0200
Message-ID: <CAMuHMdXo2sTP7RmMvd0qquD7bmpPEE7suwvOc9QrnpckdYWm=w@mail.gmail.com>
Subject: Re: [PATCH 13/14] arm64: dts: renesas: Add Renesas R8A779A0 SoC support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add initial support for the Renesas R8A77990 (R-Car V3U) support.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi

> +       soc: soc {

> +
> +               sysc: system-controller@e6180000 {
> +                       compatible = "renesas,r8a779a0-sysc";
> +                       reg = <0 0xe6180000 0 0x3078>;

Length 0x4000?

> +                       #power-domain-cells = <1>;
> +               };
> +
> +               scif0: serial@e6e60000 {
> +                       compatible = "renesas,scif-r8a779a0",
> +                                    "renesas,rcar-gen3-scif", "renesas,scif";
> +                       reg = <0 0xe6e60000 0 64>;
> +                       interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 702>,
> +                                <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
> +                                <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;

Missing resets property.

> +                       status = "disabled";
> +               };
> +
> +               gic: interrupt-controller@f1000000 {
> +                       compatible = "arm,gic-v3";
> +                       #interrupt-cells = <3>;
> +                       #address-cells = <0>;
> +                       interrupt-controller;
> +                       reg = <0x0 0xf1000000 0 0x20000>,
> +                             <0x0 0xf1060000 0 0x110000>;
> +                       interrupts = <GIC_PPI 9
> +                                     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;

"GIC_CPU_MASK_SIMPLE(1)", as currently only one CPU core is used.

> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +               };
> +
> +               prr: chipid@fff00044 {
> +                       compatible = "renesas,prr";
> +                       reg = <0 0xfff00044 0 4>;
> +               };
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;

"GIC_CPU_MASK_SIMPLE(1)" for all 4 interrupts (and in the future "8",
not "2").

> +       };
> +};
> --
> 2.7.4
>



--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
