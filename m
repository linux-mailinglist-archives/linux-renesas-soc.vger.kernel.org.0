Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A932620374B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 14:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgFVMwx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 08:52:53 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37919 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgFVMww (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 08:52:52 -0400
Received: by mail-ot1-f67.google.com with SMTP id 64so2007180oti.5;
        Mon, 22 Jun 2020 05:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eXtALeQSZVzT8ar6Nttvio1riD8sgbp/rfeNlsATY/U=;
        b=pAah0ayt1yWQU2ZH/mZBgdu6eL7y6EzEW27m5qCL9ls4sadNmNe7AHXIcs6TWYL56e
         OfytdtYsQUREFD9/AZdtGS6Zcyw2dHZBm2Hsq+pGA4yyXdURwPcU2nsbT12YOmwnXl0H
         7p3bN+ms5BE1MVSoPt2lu0imT5X1ARq8IceAb+F6f4ghl4pe2Lyo1Q00GRIMvR4fxmR5
         oKyGIF3xb0kpCPnTIfPBwEjdMz1EQmrLsVGVM0UAxoALxFWKEVfyhv1dumnIJrS0FXbX
         aavyjmd8NYdFCO7F1NmU4J9ObPEL0Be4+O7Bd7+mFoPhu31iRruk2lIMhzjhqB9c2oyg
         94Zg==
X-Gm-Message-State: AOAM5332K6aEJQ/GMBu4cdSXmd2gbhg2YN+xQa5pWdKhmv6ddOalZyz/
        cGGhN/ZxAtPJEuiMXkVarJ0Yu5GsCP/2QWWA0jo=
X-Google-Smtp-Source: ABdhPJxj/or8zvH8sSYItM06qJFXJPup1ynX94XPc+2nF4X93akc2uJdYV527pMtoNu8D2xuWSct5lNPi/LXvAhQ0uw=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr12960878otr.107.1592830371936;
 Mon, 22 Jun 2020 05:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-10-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1591555267-21822-10-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Jun 2020 14:52:40 +0200
Message-ID: <CAMuHMdWzhfiGqfdvtbJYghHiXAcrL2uUTyJpmincU1Vr4=kTqg@mail.gmail.com>
Subject: Re: [PATCH 10/11] arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0
 sub board support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Sun, Jun 7, 2020 at 8:42 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The HiHope RZ/G2N sub board sits below the HiHope RZ/G2N Rev.3.0/4.0 main
> board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

One minor comment below.
Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the HiHope RZ/G2N Rev.3.0/4.0 connected to
> + * sub board
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +#include "r8a774b1-hihope-rzg2n.dts"
> +#include "hihope-rzg2-ex.dtsi"
> +
> +/ {
> +       model = "HopeRun HiHope RZ/G2N with sub board";
> +       compatible = "hoperun,hihope-rzg2-ex", "hoperun,hihope-rzg2n",
> +                    "renesas,r8a774b1";
> +};
> +

"git am" tells me the there's a superfluous blank line at the end of the file.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
