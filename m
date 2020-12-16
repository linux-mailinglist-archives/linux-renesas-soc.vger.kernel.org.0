Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577D92DC28C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 15:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbgLPO4N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 09:56:13 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:40311 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgLPO4N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 09:56:13 -0500
Received: by mail-oi1-f180.google.com with SMTP id p126so27736046oif.7;
        Wed, 16 Dec 2020 06:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NuuUILIjqf4jXXDvuraBvyzbhvdHEw0NL80ZDXkR7Pw=;
        b=ninp0vum0kB/q+MJNd++B2uvp/fQYKaIrSuSx+/CrgB9nisWfbGCVtHIASGG+zsqrG
         +xd0KPbHqCZRtmpQqdaJAC7s7dTNHLa3/8PSQY4HVgORtZ39BbAr1gGavFvpIezCh/KE
         Qjo8/gkkKfSqqdeEqu+hk0gOxoNQvbtdSk5ad9ulWH8m2GcGgN+lAO8aw5/dJcH25WHe
         DmOmplPzO4D5NGBs8Zrpekz/PBuetlVpKnphdgXRTy36riJ3rzlfaFNdzUG4ZERMfkBN
         nNToqbiDD0GmQMNOeJ5XrgM39VuSms7UYHTT6iVCYEvaHbnQ126eHdrQQ4gHN62omA0l
         AbUw==
X-Gm-Message-State: AOAM531UacRbonoDeULa7QTqXsL12bAuikuncULhzFyhgzW2rRlJBJyC
        byJVw0hmskoz16NuUO7QjfMnwm09TDxxk7fE2pwOh0rrGZY=
X-Google-Smtp-Source: ABdhPJzQxcr5S7g7YISnHBy+Q+paemHV5EnttosXC/8Oi+Zp/Fki3TATE302aVDEznsN1lI64i9rFIwmHNIXNwJ9OIA=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr2131977oih.153.1608130531691;
 Wed, 16 Dec 2020 06:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-2-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-2-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Dec 2020 15:55:20 +0100
Message-ID: <CAMuHMdWRieM1H5WLySVDVQds-xKgsqo-OibegJrXgonfqbAL8g@mail.gmail.com>
Subject: Re: [PATCH 01/18] arm64: dts: renesas: beacon kit: Configure
 programmable clocks
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> When the board was added, clock drivers were being updated done at
> the same time to allow the versaclock driver to properly configure
> the modes.  Unforutnately, the updates were not applied to the board

Unfortunately

> files at the time they should have been, so do it now.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -5,6 +5,7 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/clk/versaclock.h>
>
>  / {
>         backlight_lvds: backlight-lvds {
> @@ -294,12 +295,12 @@ &du_out_rgb {
>  &ehci0 {
>         dr_mode = "otg";
>         status = "okay";
> -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;

Why this change? You said before you don't need this
https://lore.kernel.org/linux-renesas-soc/CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com/

BTW, something I missed in the earlier review: is there an override
needed at all?

>  };
>
>  &ehci1 {
>         status = "okay";
> -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;

Same here.

BTW, something I missed in the earlier review: why did you override

    clocks = <&cpg CPG_MOD 702>;

by

    clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;

?

>  };
>
>  &hdmi0 {
> @@ -373,12 +374,40 @@ versaclock6_bb: clock-controller@6a {
>                 #clock-cells = <1>;
>                 clocks = <&x304_clk>;
>                 clock-names = "xin";
> -               /* CSI0_MCLK, CSI1_MCLK, AUDIO_CLKIN, USB_HUB_MCLK_BB */
> +               clock-output-names = "versaclock6_bb.out0_sel_i2cb",
> +                                     "versaclock6_bb.out1",
> +                                     "versaclock6_bb.out2",
> +                                     "versaclock6_bb.out3",
> +                                     "versaclock6_bb.out4";

Why? IIUIC, the driver doesn't parse clock-output-names
(and it shouldn't).

>                 assigned-clocks = <&versaclock6_bb 1>,
>                                    <&versaclock6_bb 2>,
>                                    <&versaclock6_bb 3>,
>                                    <&versaclock6_bb 4>;
>                 assigned-clock-rates =  <24000000>, <24000000>, <24000000>, <24576000>;
> +
> +               OUT1 {
> +                       idt,mode = <VC5_CMOS>;
> +                       idt,voltage-microvolts = <1800000>;

Oops. The DT bindings say "idt,voltage-microvolt", the example in the DT
bindings says "idt,voltage-microvolts", and the driver parses
"idt,voltage-microvolts".

According to Documentation/devicetree/bindings/property-units.txt, the
property name should end in "microvolt".

Patch sent.
https://lore.kernel.org/linux-clk/20201216145231.1344317-1-geert+renesas@glider.be/

> +                       idt,slew-percent = <100>;
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
