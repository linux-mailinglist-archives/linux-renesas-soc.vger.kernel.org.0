Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBB5429663
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 20:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbhJKSGg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 14:06:36 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:42608 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJKSGf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 14:06:35 -0400
Received: by mail-ua1-f52.google.com with SMTP id j8so5985562uak.9;
        Mon, 11 Oct 2021 11:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QIFs/NecTTO2mL3S2VEXDstfLYGeT5ue3KZfF+I9bNU=;
        b=MpXHho6yL7vkxWCmj7tb85CHI0o1+wp699FXevUOrJ3y0RpHrVXUOcHq6SorP4GTs+
         KWAQ/FzSB+y12dEIIcmMgGiNNFuQhW9uhGSMNCSMUkkNtcmBU40nVNRV+3ZWuuD/E9zL
         4YLxHxjO7eldvyIu2K/BNiAXx+B4qS1bIZTq/XztiM/5JX0muXeW3vqY0EaSqzFIp+Qf
         9ByhhAYq9VyEdF1RBIOJB81YsKfOFDfSYtF0sVVWBjZlMsfQY7699KNFMA4Grs2Kj+M+
         r/Mlvne8fIZlnUwHs8zva+oU5t/vM/X3DSWS/AUDa5q4OJ80Wr/davtSAnNnKg45i/OX
         cLRA==
X-Gm-Message-State: AOAM530SW2ScmzfLaQIVxW3dIDaT/tQO04ipfTsy2PwQNxHumVfV+csS
        4mZrodPTRhsL8OWp8udAaSDe4DrXjvh4vWLoIlk=
X-Google-Smtp-Source: ABdhPJyL0ksysOQgN//p5YiZLYJXlssOrSXPfe4bPoHQ2pICy0nzPniKRzEYHBZ0gmwoBsD+ER1o3AQheTIdhBbno30=
X-Received: by 2002:ab0:58c1:: with SMTP id r1mr16509111uac.89.1633975474695;
 Mon, 11 Oct 2021 11:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com> <20210928200804.50922-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210928200804.50922-9-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 20:04:23 +0200
Message-ID: <CAMuHMdX6G2D9HDe_kcsSeKM7_Zih5bbC9wWWxpiwvUGC982UuQ@mail.gmail.com>
Subject: Re: [RFC PATCH 8/9] arm64: dts: r8a77965: add SDnH clocks
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

arm64: dts: renesas: r8a77965: ...

On Tue, Sep 28, 2021 at 10:08 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2315,7 +2315,8 @@ sdhi0: mmc@ee100000 {
>                                      "renesas,rcar-gen3-sdhi";
>                         reg = <0 0xee100000 0 0x2000>;
>                         interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 314>;
> +                       clocks = <&cpg CPG_MOD 314>, <&cpg CPG_CORE R8A77965_CLK_SD0H>;
> +                       clock-names = "core", "clkh";
>                         max-frequency = <200000000>;
>                         power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
>                         resets = <&cpg 314>;
> @@ -2328,7 +2329,8 @@ sdhi1: mmc@ee120000 {
>                                      "renesas,rcar-gen3-sdhi";
>                         reg = <0 0xee120000 0 0x2000>;
>                         interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 313>;
> +                       clocks = <&cpg CPG_MOD 313>, <&cpg CPG_CORE R8A77965_CLK_SD1H>;
> +                       clock-names = "core", "clkh";
>                         max-frequency = <200000000>;
>                         power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
>                         resets = <&cpg 313>;
> @@ -2341,7 +2343,8 @@ sdhi2: mmc@ee140000 {
>                                      "renesas,rcar-gen3-sdhi";
>                         reg = <0 0xee140000 0 0x2000>;
>                         interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 312>;
> +                       clocks = <&cpg CPG_MOD 312>, <&cpg CPG_CORE R8A77965_CLK_SD2H>;
> +                       clock-names = "core", "clkh";
>                         max-frequency = <200000000>;
>                         power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
>                         resets = <&cpg 312>;
> @@ -2354,7 +2357,8 @@ sdhi3: mmc@ee160000 {
>                                      "renesas,rcar-gen3-sdhi";
>                         reg = <0 0xee160000 0 0x2000>;
>                         interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 311>;
> +                       clocks = <&cpg CPG_MOD 311>, <&cpg CPG_CORE R8A77965_CLK_SD3H>;
> +                       clock-names = "core", "clkh";
>                         max-frequency = <200000000>;
>                         power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
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
