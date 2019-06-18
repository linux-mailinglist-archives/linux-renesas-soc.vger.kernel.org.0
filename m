Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25C674A4D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 17:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbfFRPKe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 11:10:34 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46267 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbfFRPKe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 11:10:34 -0400
Received: by mail-lj1-f195.google.com with SMTP id v24so13487389ljg.13;
        Tue, 18 Jun 2019 08:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dqHa7v+zRz/0tP12kNuD3++mOq4qacpMRNqcsvo74fg=;
        b=Pr/F3sRzK/jhhCm7XPrSEuuKZHKSIKPQmPRDk6F/8LA+Z/e4vyZ2bH2SJyuYxMFJ1E
         R81HjPo8ZgjI+DYmVpDgEM2VBEoZWys2yIcP7Y08jCWzS7gaAZ2W6floTPZVdcSWXVyV
         GnzDETA1vgE7HQEqb8m8Wcf0zU5XHoBDZulaNZi7XauD+zCOCRsYdUmhER/rLeM3ZvZy
         nfQXct45IbJ7AX5qnS5+VC3iM7EnVgtNXh/eXI+o3FIp8LCEiCtIOh1MdEzzq6u4wtm/
         tuuJYd/IuJOdcIAy8zHa0+xUC0rnbRpSeMiT/ga4aqNArON9MBXSCLUgujIiEAI0birG
         BzKA==
X-Gm-Message-State: APjAAAWIKSbYDC6D6klWGRbXZpjYksv2lkllj+IAuFxsTkycwAShmhMd
        VycTBzWY53W2QSCQAHC5Ae8aJXXqEJ8HoKVt4/A=
X-Google-Smtp-Source: APXvYqw1fdB/y1vZFxbdUmlNShYTaVT+8vEn2zAimF9nYv/bG9SWMVnXfSvmGlQtqPX6Gn/G2Rj4SW8LQvkAUlL1OZk=
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr14854442lji.133.1560870632312;
 Tue, 18 Jun 2019 08:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 17:10:19 +0200
Message-ID: <CAMuHMdU8oag+1oNa_jS=v99W05=8SRLhdoZdCusmeVf1VZbarQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Fri, Jun 14, 2019 at 3:17 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds LEDs support to the HiHope RZ/G2[MN] Main Board
> common device tree.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -17,6 +17,30 @@
>                 stdout-path = "serial0:115200n8";
>         };
>
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led0 {
> +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> +                       label = "LED0";

There's no need for a label property, if it matches the node name
(applies to all four LEDs).

Note that this GPIO is shared with a switch, like on Salvator-X(S) and
ULCB.  As currently Linux cannot handle both, describing the LED
precludes adding the switch later.
(applies to the first 3 LEDs).

> +               led3 {
> +                       gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
> +                       label = "LED3";
> +               };

I cannot find LED3. According to the schematics GP0_0 == CS0n is used
as the chipselect for the LVDS switch?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
