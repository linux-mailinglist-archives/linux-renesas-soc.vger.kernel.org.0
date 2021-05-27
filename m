Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1334392C76
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 13:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhE0LSt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 07:18:49 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:34769 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhE0LSs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 07:18:48 -0400
Received: by mail-vs1-f42.google.com with SMTP id x13so177796vsh.1;
        Thu, 27 May 2021 04:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hN1/8UMtMXWBr9/Apat6KXcCH2jMM7TnJ6pU4YI+Zco=;
        b=cJIBu4m7kmw0I7qNe1JMLX1kguAO7cUH/JkDGSPsJbJLUsNC3N3K1jIqHkLFpwtuAj
         MzF6+Wo2iV40FnLVMN7f6l4z18ZFrbEZR7hDjBXbR9fLFTgTxkP0tjdsL447n0Qgl3Id
         ZJoUOeRWPmRd9qzfTlzeYv6rEwrcKAfCSW0J+mU87bfPm2QVaNdLApYGRE6FdW3PLUVi
         NGp0cttFIm02OOA6veve3LYKWR/TyPWzUHakTUdofJ97h7FLM0492gM1eDUMrtqnTadH
         B9os6zQJPHUR3qyb+msQxWeWgjgXTSgEllyNlM8Cxm/Z6xkTtyz8WeLeIPFbryzeyHOJ
         zJig==
X-Gm-Message-State: AOAM531HYD+TfxuTYcGIyjt6jTur1/YndFZCXU5ruE79ASxGRM8HYG3P
        nCKNfnQamZxnCq13FGzHeS4Oy7e9gfXR7AdfshvutxqRhQE=
X-Google-Smtp-Source: ABdhPJyTxN3vfxK8w0+8Ed879hEUH6Ox8bLKVQrcvJxd3fyFc3G0uk9H3VlenKR5+88csy9ssh/X0w6m4xMO00cQl44=
X-Received: by 2002:a67:fb52:: with SMTP id e18mr1533054vsr.18.1622114234015;
 Thu, 27 May 2021 04:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 13:17:02 +0200
Message-ID: <CAMuHMdUNdZvPfU1Zu_F2CyneX-m3hGwwsp+TrYR3+ZjGfHxP-g@mail.gmail.com>
Subject: Re: [PATCH 15/16] arm64: dts: renesas: Add initial DTSI for
 RZ/G2{L,LC} SoC's
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 14, 2021 at 9:24 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add initial DTSI for RZ/G2{L,LC} SoC's.
>
> File structure:
> r9a07g044.dtsi  => RZ/G2L family SoC common parts
> r9a07g044l.dtsi => Specific to RZ/G2L (R9A07G044L) SoC
> r9a07g044l1.dtsi => Specific to RZ/G2L (R9A07G044L single cortex A55) SoC
> r9a07g044l2.dtsi => Specific to RZ/G2L (R9A07G044L dual cortex A55) SoC
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/G2L and RZ/G2LC common SoC parts
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/r9a07g044l-cpg.h>
> +
> +/ {
> +       compatible = "renesas,r9a07g044";

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/G2L R9A07G044L1 common parts
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r9a07g044l.dtsi"
> +
> +/ {
> +       compatible = "renesas,r9a07g044l1";

This overwrites the main compatible value set by r9a07g044.dtsi before.
As per your bindings, you want both:

    compatible = "renesas,r9a07g044l1", "renesas,r9a07g044".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
