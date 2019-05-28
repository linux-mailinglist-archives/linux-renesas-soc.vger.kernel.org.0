Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3BD2C2F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 11:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfE1JTS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 05:19:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34767 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE1JTS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 05:19:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id v18so14002976lfi.1;
        Tue, 28 May 2019 02:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dt6xkTlYLLzspF5sWEy/VH41bbc6zw6jc+Wa8i9f9a4=;
        b=JaHn5ULYYfT8Za5dRYDWXNqjhmoeUxR2S4wNB4JIggoZam3mijAcjcqKPBoFkmBXVM
         01jgpp+sbmzRFLmLm/Mkss71m29AheffTJEHLZ1p62AOy2HFsj3ju4swltIFzqTOx/V+
         CcLQDIHBRcYwZJyA07xR19AJP6pj5N4irv5MPkrioWc/ifYO+7RwiG0IKx4PpShsY6BV
         sRGIRL7uuT2zm+moZFP2diiIAO+la8savTi9eZjoKC83xHM6hq4SdPnt608cg22abRrP
         IkdgeAZj8pW6Xh/iHaCic12COGPzBOaAkL9ti+BP9qPIgaRnk8u6rDdJv5C4WwgQTNfM
         cjlw==
X-Gm-Message-State: APjAAAXnJYdUafOOT/Tq/L3N8l59HlL9aquILCOhUPzZJ3iKua2RHmNW
        2TJspp5+83pe6d8LWKGOzIGSUu/Eq2c/SyvP3VlB42oa
X-Google-Smtp-Source: APXvYqxdS7TZcdfg35HdLOUa9xz527T4tZBXNDpzCsjV01tnhK+R7oNl2pgZnAKQNyFTnkQYZpn9wkC/dbA14taDQss=
X-Received: by 2002:ac2:546a:: with SMTP id e10mr6776442lfn.75.1559035156588;
 Tue, 28 May 2019 02:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
In-Reply-To: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 May 2019 11:19:04 +0200
Message-ID: <CAMuHMdVfDd_1gHnX=WvkHnF33fG2sWy7F5bTh-DghoKSt-vLCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: Add support for TI WL1837
To:     Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Spyridon,

On Thu, Apr 11, 2019 at 2:42 PM Spyridon Papageorgiou
<spapageorgiou@de.adit-jv.com> wrote:
> This patch adds description of TI WL1837 and links interfaces
> to communicate with the IC, namely the SDIO interface to WLAN.
>
> Signed-off-by: Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -38,6 +38,18 @@
>                 regulator-min-microvolt = <5000000>;
>                 regulator-max-microvolt = <5000000>;
>         };
> +
> +       wlan_en: regulator-wlan_en {
> +               compatible = "regulator-fixed";
> +               regulator-name = "wlan-en-regulator";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;

So this is a 3.3V regulator...

> +
> +               gpio = <&gpio_exp_74 4 GPIO_ACTIVE_HIGH>;
> +               startup-delay-us = <70000>;
> +               enable-active-high;
> +       };
>  };
>
>  &can0 {

> @@ -273,6 +298,30 @@
>         status = "okay";
>  };
>
> +&sdhi3 {
> +       pinctrl-0 = <&sdhi3_pins>;
> +       pinctrl-names = "default";
> +
> +       vmmc-supply = <&wlan_en>;
> +       vqmmc-supply = <&wlan_en>;

... used for both card and I/O line power...

> +       bus-width = <4>;
> +       no-1-8-v;

... hence no 1.8V I/O.

However, VIO of WL1837 is provided by W1.8V of regulator U55,
which is 1.8V?

> +       non-removable;
> +       cap-power-off-card;
> +       keep-power-in-suspend;
> +       max-frequency = <26000000>;
> +       status = "okay";
> +
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       wlcore: wlcore@2 {
> +               compatible = "ti,wl1837";
> +               reg = <2>;
> +               interrupt-parent = <&gpio1>;
> +               interrupts = <25 IRQ_TYPE_EDGE_FALLING>;

I'm also a bit puzzled by the interrupt type.
On Cat 874, it's IRQ_TYPE_LEVEL_HIGH, cfr.
https://lore.kernel.org/linux-renesas-soc/1557997166-63351-2-git-send-email-biju.das@bp.renesas.com/

On Kingfisher, the IRQ signal is inverted by U104, so I'd expect
IRQ_TYPE_LEVEL_LOW instead of IRQ_TYPE_EDGE_FALLING?

Apart from the above two comments:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
