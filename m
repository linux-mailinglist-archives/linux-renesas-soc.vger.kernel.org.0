Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515FA2EB213
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 19:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbhAESHY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 13:07:24 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:42907 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728270AbhAESHX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 13:07:23 -0500
Received: by mail-oi1-f179.google.com with SMTP id l200so453219oig.9;
        Tue, 05 Jan 2021 10:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uV3cY6orUOKq13k6DZQxEpP20IRcD2ELoOkWrCUxDjM=;
        b=oqBZZLY7OS2B2wMPKKno/4IUY6J+UpxpOIPSpIRfSSlhkpK6qQF7IVGoAD4LvjimFF
         M59aEcVOOBZCE3u93wDJ06F5nTsbMdLRwGbOhWUXdmbr4Nd6PnY53VycoQnOyQqv6aCa
         Xo87v/IuXHZ60fp/N4H/sk+gkeLaE8Pqq4kZIaDRNX2tAodiepdL/e9+i+zySZPGF8Dh
         3TwlpKLKRVcBMfBZGiYUNpjAYqK0ntatO3kB5ozRxnoTmM+wZK+vmQSs6nsTetHwjNyE
         SDaXMocQjuRIT/qBAXrXth0yWJCPvjLInnvc9sTBiqg0B860bAm9WtPCHM8JRLjFrgll
         QeZw==
X-Gm-Message-State: AOAM530SsVtI/5glgWGuJcM31Ur30hilNfaklTo5XuzisoWirCE0/PDK
        GtrWoVspxZKEXcsMICuA93nGXcSXq/6Mrz7rMDDTT6FxzkY=
X-Google-Smtp-Source: ABdhPJy2zpG8SIiURNK9Aoh4UpPdWao0WM1Fv7teqBaGZJ/TjVZagvCbYyzLCCjn0O8qlMlAgCwiOmv908sKKJXk9HQ=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr591383oia.54.1609870002674;
 Tue, 05 Jan 2021 10:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com> <20201228112715.14947-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201228112715.14947-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 19:06:31 +0100
Message-ID: <CAMuHMdUDPaaaHsDP11qZJzWzd+tss97iZXXATCHdVQZE1vLHSg@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r8a779a0: add & update SCIF nodes
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linh Phung <linh.phung.jy@renesas.com>,
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

On Mon, Dec 28, 2020 at 12:27 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

Missing "From: Linh Phung <linh.phung.jy@renesas.com>"?

> This is the result of multiple patches taken from the BSP, combined,
> rebased, and properly sorted. SCIF0 gets DMA properties, other SCIFs are
> entirely new.
>
> Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -656,11 +656,61 @@ scif0: serial@e6e60000 {
>                                  <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
>                                  <&scif_clk>;
>                         clock-names = "fck", "brg_int", "scif_clk";
> +                       dmas = <&dmac1 0x51>, <&dmac1 0x50>;
> +                       dma-names = "tx", "rx";

It may be prudent to leave out the DMA properties until we can
validate DMA operation.

>                         power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
>                         resets = <&cpg 702>;
>                         status = "disabled";
>                 };
>
> +               scif1: serial@e6e68000 {
> +                       compatible = "renesas,scif-r8a779a0",
> +                                    "renesas,rcar-gen3-scif", "renesas,scif";
> +                       reg = <0 0xe6e68000 0 64>;
> +                       interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 703>,
> +                                <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
> +                                <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       dmas = <&dmac1 0x53>, <&dmac1 0x52>;
> +                       dma-names = "tx", "rx";
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 703>;
> +                       status = "disabled";
> +               };
> +
> +               scif4: serial@e6c40000 {
> +                       compatible = "renesas,scif-r8a779a0",
> +                                    "renesas,rcar-gen3-scif", "renesas,scif";
> +                       reg = <0 0xe6c40000 0 64>;
> +                       interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 705>,
> +                                <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
> +                                <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       dmas = <&dmac1 0x59>, <&dmac1 0x58>;
> +                       dma-names = "tx", "rx";
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 705>;
> +                       status = "disabled";
> +               };
> +
> +               scif3: serial@e6c50000 {

Please move scif3 before scif4.

> +                       compatible = "renesas,scif-r8a779a0",
> +                                    "renesas,rcar-gen3-scif", "renesas,scif";
> +                       reg = <0 0xe6c50000 0 64>;
> +                       interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 704>,
> +                                <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
> +                                <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       dmas = <&dmac1 0x57>, <&dmac1 0x56>;
> +                       dma-names = "tx", "rx";
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 704>;
> +                       status = "disabled";
> +               };
> +

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
