Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8A43A6653
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 14:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233234AbhFNMSC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 08:18:02 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:34602 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232559AbhFNMSC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 08:18:02 -0400
Received: by mail-ua1-f50.google.com with SMTP id c17so5363413uao.1;
        Mon, 14 Jun 2021 05:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=loqqI6RxxyMEMBLFi5At6xP/oGgu8uAPBdsEXUU+FCw=;
        b=XcTSHhpn0/7Q3803MnHsTknRq+UAYQCSqQlhDGix8O3UVpjb6Rvs69pJzaAUAStqht
         UmwBaolqLEuBQbBKfOrYLZH51oaOUJlCoI50m/gt6HPHJUQ8rjfDBKlfkGBccJOzwFde
         J1Eww0MxoeHZQ7o68zCHKN8jfATD00GUHphxS/YnH3fNlX2jxP+NJUKNMQuj9Pkl+Bix
         ViufEANQ+JcSHF+ess3tETGsBf625TBkdtPGLDt+VpBmzqU5C+x60t0n0N1e83zZTDOx
         o16TO4myxtjXDvoLFITvRROXdh9usikYEnSioXhmw7fJIhM2akfIxVa0xGTP0mt8WE12
         fpKg==
X-Gm-Message-State: AOAM5301RRbnKN5efWewhI68StAdd7R4KbgvcFMmEBmoxwR8lqgPn3ln
        gVm6NzTP0vM5n3RR+VVg11MqsTGad6YLj1Flz9A=
X-Google-Smtp-Source: ABdhPJwIbzJ/kYYtMGKzZWhsOZ8o/6gE82MHfNvTdOC/XoMENQNFPIi3fHjUmE5A3meYX9g7DIHb62RwkYlpvw0YItE=
X-Received: by 2002:ab0:b09:: with SMTP id b9mr11062690uak.58.1623672958927;
 Mon, 14 Jun 2021 05:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210611113642.18457-1-biju.das.jz@bp.renesas.com> <20210611113642.18457-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210611113642.18457-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 14:15:47 +0200
Message-ID: <CAMuHMdUthmAbwNrBKeEBzqBUN6HYR=Fuz5ALpK+iGY_kUQpV1A@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a07g044: Add DMAC support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jun 11, 2021 at 1:36 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add DMAC support to RZ/G2L SoC DT.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -8,6 +8,10 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/r9a07g044-cpg.h>
>
> +#define CH_CFG(reqd, loen, hien, lvl, am, sds, dds, tm) \
> +       ((((tm) << 22) | ((dds) << 16) | ((sds) << 12) | ((am) << 8) | \
> +       ((lvl) << 6) | ((hien) << 5) | ((loen) << 4) | ((reqd) << 3)) & 0x004FF778)
> +

I assume the above will be removed?

>  / {
>         compatible = "renesas,r9a07g044";
>         #address-cells = <2>;
> @@ -111,6 +115,40 @@
>                         status = "disabled";
>                 };
>
> +               dmac: dma-controller@11820000 {
> +                       compatible = "renesas,dmac-r9a07g044",
> +                                    "renesas,rz-dmac";
> +                       reg = <0 0x11820000 0 0x10000>,
> +                             <0 0x11830000 0 0x10000>;
> +                       interrupts = <GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 135 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 137 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "ch0", "ch1", "ch2", "ch3",
> +                                         "ch4", "ch5", "ch6", "ch7",
> +                                         "ch8", "ch9", "ch10", "ch11",
> +                                         "ch12", "ch13", "ch14", "ch15",
> +                                         "error";
> +                       clocks = <&cpg CPG_MOD R9A07G044_CLK_DMAC>;
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg R9A07G044_CLK_DMAC>;
> +                       #dma-cells = <1>;
> +                       dma-channels = <16>;
> +               };
> +
>                 gic: interrupt-controller@11900000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;

The rest looks good to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
