Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1892404AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 12:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgHJK3Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 06:29:24 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35508 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgHJK3W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 06:29:22 -0400
Received: by mail-ot1-f67.google.com with SMTP id 93so6883412otx.2;
        Mon, 10 Aug 2020 03:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Go317pGo6+E74z4fYb+Icks9NWzJHn8WmbX/udh4wXw=;
        b=ulkvPKVUcNvoxLX278BlbPYK0Ym+KUX0S0PxgBP2tdDQgL5RcHFxAcmeGGPCGrb9/t
         NYQqR5aDVky7agx/CMzxKFyJj7rEsaad3fHYtbX30SVbgfjKOm6SphjtbWRG+tKnR4e9
         fWzSNUnpFkYjJJ8/ouOt06nTUKNzIvmY2WNZz06qqlgd9BeyGbFDq/Ln4qVXIOIAiqfb
         2JyPfGENJHNxBw0WUBC4F24UPUOSwkoxwY42ZjsGVAjJ1e+KxEJZViEH6ouQRrVP6/xV
         lAJze02KP7PYly/0FBtQQXfUXfhjSoNibP9UsPjUXeKZUHtqnamZydBwkgMnL/SS120j
         RVEw==
X-Gm-Message-State: AOAM532pXMoj8FVPFXaBc6gtYkjvYh1NLaxNwqK2LWpr7YjJGQKxQoq5
        y0W7rViwmL42t39XuSQzTkL4zyh9f61A13iz3EU=
X-Google-Smtp-Source: ABdhPJzpOW36/c8DwbhaGYb1uYsh2blnD0gOlHMHWEA9HBLomN2/1TYMyLhrGR3babIZrsC/Suo0JpZr7dg5cUiaF0I=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr178716otl.145.1597055361766;
 Mon, 10 Aug 2020 03:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200810092208.27320-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200810092208.27320-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200810092208.27320-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Aug 2020 12:29:10 +0200
Message-ID: <CAMuHMdUiRHEYnL-7mbYKVDESBcDbEeCzNYGeamEAie+bYh_Fug@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774e1: Add VSP instances
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, Aug 10, 2020 at 11:22 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> The RZ/G2H (R8A774E1) has 6 VSP instances.
>
> Based on the work done for r8a7795 SoC.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -2374,6 +2374,72 @@
>                         status = "disabled";
>                 };
>
> +               vspbc: vsp@fe920000 {
> +                       compatible = "renesas,vsp2";
> +                       reg = <0 0xfe920000 0 0x8000>;
> +                       interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 624>;
> +                       power-domains = <&sysc R8A774E1_PD_A3VP>;
> +                       resets = <&cpg 624>;
> +
> +                       renesas,fcp = <&fcpvb1>;
> +               };
> +
> +               vspbd: vsp@fe960000 {
> +                       compatible = "renesas,vsp2";
> +                       reg = <0 0xfe960000 0 0x8000>;
> +                       interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 626>;
> +                       power-domains = <&sysc R8A774E1_PD_A3VP>;
> +                       resets = <&cpg 626>;
> +
> +                       renesas,fcp = <&fcpvb1>;

According to "FCPVB0 (for VSPBD): H' FE96_F000", this should be

    renesas,fcp = <&fcpvb0>;

? If you agree, I can fix that while applying.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
