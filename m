Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0282421D5D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 14:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729730AbgGMMY5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 08:24:57 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40792 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728714AbgGMMY4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 08:24:56 -0400
Received: by mail-ot1-f66.google.com with SMTP id c25so9343712otf.7;
        Mon, 13 Jul 2020 05:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NKzDJKlpDpfQR0XqsgcICeQR3a964ULdFkGju83hPh4=;
        b=PZ8YhE6GE31idexlhmfb3Jirg1fmIzWelFz3bJoSnqo+EVZ4vFFRokFm0JrlHU+Wjt
         8qYOpYcBQUmBcVX0OUjBRQkoBWsjFeCRcJbcXh8eDr7pEzceDVZB5EIZvviFDvUnaZ8x
         uljKNjdd66Zog078sR8ZVwZsMp9ZKUAApgab5j0b11Zc2PNDmQStQJzTp3cxWTcd/e9O
         Lbm/sK+7BLfprg7I1F6n1rLcPnhCqP7HeRblQ4MNtq9JdVXNSQZD/RWpRa9BvsTHvFGv
         D5v7NmezD//lb4mE/NwB/84RY9jCWGE0vK7uOYm9nLO/N5m6KKkON4NwebacF8WQ8ozX
         Qtog==
X-Gm-Message-State: AOAM530+jeSYYKO7B1XtwgyItnWIIqrhIk0rckd9yaUI4yVg/Hu/M8ka
        dH4zr6CDpZg/PtRo7TCQyrFQXkQoI+Qjn3B3lIw=
X-Google-Smtp-Source: ABdhPJxFpWOlCjGDSPwtxen5jRbE20ZbTRROeQPrTNlSL/t1mKoQeo8W3SZGj1ef99nPDdRUJYfaYSbuaSZRFBz1XuE=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr57240483otp.250.1594643094760;
 Mon, 13 Jul 2020 05:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jul 2020 14:24:43 +0200
Message-ID: <CAMuHMdWBLrPQJJzs=K7fHzu4UJsKyj29Yu9KZK4vf9QQNLQF+Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: Initial r8a774e1 SoC device tree
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Jul 8, 2020 at 7:49 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Basic support for the RZ/G2H SoC.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi

> +               avb: ethernet@e6800000 {
> +                       reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;

According to Rev. 1.00 of the Hardware User's Manual, RZ/G2H does not
have the Stream Buffer for EtherAVB-IF, so the second register block
should be dropped.

> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };

> +               gic: interrupt-controller@f1010000 {
> +                       compatible = "arm,gic-400";
> +                       #interrupt-cells = <3>;
> +                       #address-cells = <0>;
> +                       interrupt-controller;
> +                       reg = <0x0 0xf1010000 0 0x1000>,
> +                             <0x0 0xf1020000 0 0x20000>,
> +                             <0x0 0xf1040000 0 0x20000>,
> +                             <0x0 0xf1060000 0 0x20000>;
> +                       interrupts = <GIC_PPI 9
> +                                       (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;

Like Marc already pointed out, GIC_CPU_MASK_SIMPLE(8).

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Will queue in renesas-devel for v5.9, after fixing the above.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
