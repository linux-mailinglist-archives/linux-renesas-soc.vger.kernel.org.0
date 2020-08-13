Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A485D243749
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 11:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgHMJJC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 05:09:02 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37096 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgHMJJC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 05:09:02 -0400
Received: by mail-oi1-f193.google.com with SMTP id e6so4436440oii.4;
        Thu, 13 Aug 2020 02:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0K15ceWt7+lSEkvA7d3theI6XPwiCybuf39fCiNOnRI=;
        b=MC78CMuFrDvyzZ+oKmNpfHSxUwX7ivxLI9J7WxuSi/jc8GWLaIFqpwJuep4r0Gkmqs
         U9FnbmmZ3lfP0AU5TTYhd0ZFf4f0U5CC75a/zXJYsgEZYgRpjhkdQgjwshG+vjB8SHF2
         njFreV6eLiqHcUwkrykqsurVA4u6mabJwWUXwVxgwxwdW6moM4wXA1JAHwEBuy2BLBg8
         eZiMb1FVZYa/dGdQnXefD3gB/y/Py+QwOwvT33azn51KdyIBnBHOPDp1VAWsqnSq9oO9
         AJwGKuS1O9oYxggUwp14wnYZ6mIXUt2GLhVPAa3ZG77j3GkHBmnUTneGebFhSPpWl7ll
         lruQ==
X-Gm-Message-State: AOAM530saWnm35cow3FDfDaxcn8dF3J/uSs081EK4jzin+Et3T237ULC
        S9bcjff14+tqK9gIRwXtjkJ73t1LYUICA3/ae8w=
X-Google-Smtp-Source: ABdhPJzB4wNONrk31bsEMlFj7xQbcN5C5YD4hPJ1l4PHkQ8t4JH4EYjL3qUZVIwmP93aJw0pGYQeN5yq+3aKSoGMjuI=
X-Received: by 2002:aca:4b54:: with SMTP id y81mr2563000oia.54.1597309740957;
 Thu, 13 Aug 2020 02:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200812140217.24251-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Aug 2020 11:08:49 +0200
Message-ID: <CAMuHMdVVL=ZWGmsZSBhxTNsnkJDzDrCQMXVpVPB74udOqAbvUg@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: renesas: r8a774e1: Populate DU device node
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 12, 2020 at 4:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Populate the DU device node properties in R8A774E1 SoC dtsi.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -2623,22 +2623,39 @@
>                 };
>
>                 du: display@feb00000 {
> +                       compatible = "renesas,du-r8a774e1";
>                         reg = <0 0xfeb00000 0 0x80000>;
> +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 724>,
> +                                <&cpg CPG_MOD 723>,
> +                                <&cpg CPG_MOD 721>;
> +                       clock-names = "du.0", "du.1", "du.3";
> +                       resets = <&cpg 724>, <&cpg 722>;
> +                       reset-names = "du.0", "du.3";
>                         status = "disabled";
>
> -                       /* placeholder */
> +                       renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
> +
>                         ports {
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>
>                                 port@0 {
>                                         reg = <0>;
> +                                       du_out_rgb: endpoint {
> +                                       };
>                                 };
>                                 port@1 {
>                                         reg = <1>;
> +                                       du_out_hdmi0: endpoint {
> +                                       };
>                                 };
>                                 port@2 {
>                                         reg = <2>;
> +                                       du_out_lvds0: endpoint {
> +                                       };

Waiting for the port number discussion to settle before queuein in
renesas-devel for v5.10.

>                                 };
>                         };
>                 };
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
