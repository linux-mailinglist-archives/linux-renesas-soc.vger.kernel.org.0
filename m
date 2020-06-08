Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B11C1F1B44
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 16:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbgFHOrR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 10:47:17 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39789 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729958AbgFHOrQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 10:47:16 -0400
Received: by mail-ot1-f67.google.com with SMTP id g5so13825243otg.6;
        Mon, 08 Jun 2020 07:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZNiDF0QbRkAC5PAOtg/PZzyEBv0aXwpLIdiYmMTWuTc=;
        b=b+hF0HVggEGlmJeLVLQUigCTohD01p4PxOaneGxkPxViDAr3uzMNjwRcEoOkSd1WRt
         UY5KU2J7WgcWTQqZCzFa20V2iUnspwT3vAlkcBIskKrJtszfAawtnSRJ1rq1A/S33x5B
         MRUkC3NDA1h4QV7ZPyw0lCouQL0AUrBpaagNOagaB/IipBw+e8HNOHIYnQW+B19Uiuvf
         ceIGbLU2cdjbFwo1puzAj4n4k6IwTJf1CLX3B8L6PgrPG8xI5aIuWstSzb0KrH4y4vQQ
         iAYhnMXcYnFA2Mc/E5AjdO+t6K/pefcT+fSVtgxkX9Z+7GG/Lrf31Erp3mp4TgeIGJ+W
         urww==
X-Gm-Message-State: AOAM532emiWgISRNWtfzfyrWZ430nLUItyyvNBYtZNw/0ASwxKLX8+Zg
        TRAB3EyEUhdw8qznc4wY3yz59W17t7gUha8WnZ8CfQ==
X-Google-Smtp-Source: ABdhPJwFXW1J7g59xQQtXSD0pqJ6GWtqJJB8QVdlpiTxNufVuBC9KwHKN3UJS4dx7m96rMgujU5VUpDYNuVG2Kl16iU=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr17492225otk.145.1591627635517;
 Mon, 08 Jun 2020 07:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1591555267-21822-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jun 2020 16:47:03 +0200
Message-ID: <CAMuHMdWKhq63yT9XbbV4Nmr0EJZcGQ396pVCqkrzMTmgunznaQ@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: renesas: hihope-common: Separate out
 Rev.2.0 specific into hihope-common-rev2.dtsi file
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

On Sun, Jun 7, 2020 at 8:41 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Separate out Rev.2.0 specific hardware changes into
> hihope-common-rev2.dtsi file so that hihope-common.dtsi can be used
> by all the variants for RZ/G2M[N] boards.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi

Perhaps just hihope-rev2.dtsi, i.e. without the "common-"?

> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the HiHope RZ/G2[MN] main board Rev.2.0 common
> + * parts
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               bt_active_led {
> +                       label = "blue:bt";
> +                       gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "hci0-power";
> +                       default-state = "off";
> +               };
> +
> +               led0 {
> +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               led1 {
> +                       gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               led2 {
> +                       gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               led3 {
> +                       gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
> +               };

led1, led2, and led3 are present on both, so I'd keep them in
hihope-common.dtsi.

> +
> +               wlan_active_led {
> +                       label = "yellow:wlan";
> +                       gpios = <&gpio7  1 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "phy0tx";
> +                       default-state = "off";
> +               };
> +       };
> +
> +       wlan_en_reg: regulator-wlan_en {
> +               compatible = "regulator-fixed";
> +               regulator-name = "wlan-en-regulator";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               startup-delay-us = <70000>;
> +
> +               gpio = <&gpio_expander 1 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };

Same for the WLAN regulator, especially as it is referenced from
hihope-common.dtsi.
As the GPIO  line differs between the two variants, you just need
to add the gpio property in the revision-specific file.

> +};
> +
> +&hscif0 {
> +       bluetooth {
> +               compatible = "ti,wl1837-st";
> +               enable-gpios = <&gpio_expander 2 GPIO_ACTIVE_HIGH>;
> +       };
> +};

As node is small, and the GPIO line differs from the two variants,
I think duplicating it in both revision-specific files is fine, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
