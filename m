Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2C82EF2A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 13:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbhAHMsc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 07:48:32 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:40734 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbhAHMsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 07:48:32 -0500
Received: by mail-ot1-f43.google.com with SMTP id j12so9505421ota.7;
        Fri, 08 Jan 2021 04:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X1+MciefbFYchiFVRX8BkaWe9O4pIYQazrMh5q9VfEQ=;
        b=km/inHl3mXa2SHdJAcdslkH6kh+ioyVZuNdxXYZ+Y25QiwCDJuDIqN9Pl2VYB/MRpi
         Jg/z9WWFS/XsqRLZMEtb6sHc+HJevp4q1wgkezIp+6R4PMlZKUJVjHVz/oxs79lJI9gz
         +tGg15fcv6IEB7AhLYNDRLA0nLYlRTaTRfV7L/jk5vIo8+aaCsDQn/rqWTJ+BzRlrVMR
         7ChW6AzkkhfJmK5U9dervrumLK5R9jCb4nWNq/C/An2X/BkiqeUYAwxitoZi+BjZ2UDU
         yiL22ZPQly5/QSvwir1+FzMvwGWy+cS/sLuL48pfXxa/oWIKy9DRhhG/czRBThZRb89V
         IVDg==
X-Gm-Message-State: AOAM532AuzOGu2iDn+z0XF7SgIxr3u6jUeIQutM9xzpt4Sz8wcnWfF0J
        ZA6x6aE8wSqnl7y/OKEJ/pgURNaqq58q7Uk46pg=
X-Google-Smtp-Source: ABdhPJy84uDYp1M3oPhW4hWuXypttMIU3cvbZFCKQX9IeU4EMR0zmIXnG0Whg5oAqRyF4bXOZzof7q1874d0uQX4RPE=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr2392614otr.107.1610110071606;
 Fri, 08 Jan 2021 04:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com> <20201227174202.40834-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227174202.40834-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 13:47:40 +0100
Message-ID: <CAMuHMdUDm72KH+Bwub1VWoq_F2MwG2uzE7=rwg2yN_z9d=Nx7A@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a779a0: Add MMC node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
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

On Sun, Dec 27, 2020 at 6:42 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> Add a device node for MMC.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: double checked & rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -667,6 +667,18 @@ dmac1: dma-controller@e7350000 {
>                         /* placeholder */
>                 };
>
> +               mmc0: mmc@ee140000 {

Hmm, seems we use the mmc0 label on all V3[HMU] SoCs, but sdhiX on all
other R-Car Gen3 SoCs...

> +                       compatible = "renesas,sdhi-r8a779a0",
> +                                    "renesas,rcar-gen3-sdhi";
> +                       reg = <0 0xee140000 0 0x2000>;
> +                       interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 706>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 706>;
> +                       max-frequency = <200000000>;
> +                       status = "disabled";
> +               };
> +

Anyway:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
