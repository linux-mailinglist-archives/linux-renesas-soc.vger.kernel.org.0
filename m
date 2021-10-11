Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C90429660
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 20:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbhJKSG1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 14:06:27 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:37764 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJKSG0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 14:06:26 -0400
Received: by mail-ua1-f54.google.com with SMTP id f4so8641590uad.4;
        Mon, 11 Oct 2021 11:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s6f9PlOjMZJgMcZljDZiyibV/QeEJzRvaVfOGAyrbo4=;
        b=ucfvZ0DlbQvJ2PWOghx6Kz0p/wXVIJx0bthOlTM4kkgljQj5ReWmM3TD/y8kFr3GTy
         hggi/HlYMuV33sI5wT6BnRNgWxy/SvC7Bcr6alBPpcWNy9ZqKLM1IINKwqS6GDvJ7y/D
         Xe70F931UuCJPqFvLS+pyZ+/MMmVwJlfzHu84DNsl7St1iuo8x9Uf9nAkStv2/bxF6M9
         6t7txexDjeaC3MdguE6yriW1c0QlEAC/VlQ1qGePWGkUYg2srj+HwaOjZq7xDhgS1krI
         Z+jLXEehiwYPJpU49+5+sLD1OvRfSU600eTLTLTnPftK8W9tEnkdropNVTm97DZD4+HA
         SZ8w==
X-Gm-Message-State: AOAM530lzAGhJ7y5xmjLx9sWUUCX9T9pyBJ0uC2C4s34zsn9ycnwAdon
        jyUMDqY5DbLLkHi4+G6REEoCPjmuCYl3T2QB4ym9QMmN
X-Google-Smtp-Source: ABdhPJymozAXiKMwbhRqR/frof3ZG+POnHLErAfD4+B/JboteZxDB5wzHvxK7ZgWcjnvBKJWOLc9eincus5mXx6gpWY=
X-Received: by 2002:ab0:16d4:: with SMTP id g20mr16417621uaf.114.1633975466000;
 Mon, 11 Oct 2021 11:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com> <20210928200804.50922-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210928200804.50922-8-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 20:04:14 +0200
Message-ID: <CAMuHMdWYz8HPhg2SJyRQCt6yBquPGkSWFHtUKAq3Sc0CC9AfTA@mail.gmail.com>
Subject: Re: [RFC PATCH 7/9] arm64: dts: r8a77951: add SDnH clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

arm64: dts: renesas: r8a77951: ...

On Tue, Sep 28, 2021 at 10:08 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> @@ -2668,7 +2668,8 @@ sdhi0: mmc@ee100000 {
>                                      "renesas,rcar-gen3-sdhi";
>                         reg = <0 0xee100000 0 0x2000>;
>                         interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 314>;
> +                       clocks = <&cpg CPG_MOD 314>, <&cpg CPG_CORE R8A7795_CLK_SD0H>;
> +                       clock-names = "core", "clkh";
>                         max-frequency = <200000000>;
>                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>                         resets = <&cpg 314>;
> @@ -2681,7 +2682,8 @@ sdhi1: mmc@ee120000 {
>                                      "renesas,rcar-gen3-sdhi";
>                         reg = <0 0xee120000 0 0x2000>;
>                         interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 313>;
> +                       clocks = <&cpg CPG_MOD 313>, <&cpg CPG_CORE R8A7795_CLK_SD1H>;
> +                       clock-names = "core", "clkh";
>                         max-frequency = <200000000>;
>                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>                         resets = <&cpg 313>;
> @@ -2694,7 +2696,8 @@ sdhi2: mmc@ee140000 {
>                                      "renesas,rcar-gen3-sdhi";
>                         reg = <0 0xee140000 0 0x2000>;
>                         interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 312>;
> +                       clocks = <&cpg CPG_MOD 312>, <&cpg CPG_CORE R8A7795_CLK_SD2H>;
> +                       clock-names = "core", "clkh";
>                         max-frequency = <200000000>;
>                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>                         resets = <&cpg 312>;
> @@ -2707,7 +2710,8 @@ sdhi3: mmc@ee160000 {
>                                      "renesas,rcar-gen3-sdhi";
>                         reg = <0 0xee160000 0 0x2000>;
>                         interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 311>;
> +                       clocks = <&cpg CPG_MOD 311>, <&cpg CPG_CORE R8A7795_CLK_SD3H>;
> +                       clock-names = "core", "clkh";
>                         max-frequency = <200000000>;
>                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>                         resets = <&cpg 311>;

LGTM, but fails dtbs_check, as expected:

    mmc@ee100000: clock-names:1: 'cd' was expected
    ...

As that is a binding issue, and not an issue with this patch:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
