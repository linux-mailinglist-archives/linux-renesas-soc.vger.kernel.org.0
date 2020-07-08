Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523CA2192DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2020 23:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgGHVxr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jul 2020 17:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgGHVxr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 17:53:47 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBCAC061A0B;
        Wed,  8 Jul 2020 14:53:47 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id i4so154866iov.11;
        Wed, 08 Jul 2020 14:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+CW7beEWR0Pb7ROLSpU0nhqAUHLthMao4T7CzyDGi7g=;
        b=lghGwHTsCwGCyoPa+9rmEJ3S5GtY7q5i1xeiRM2RR3MBWe64lRkMFY/PrdVKSnX8NZ
         Yzlxl2zY0V/sXdfP8rTjuZn/gW8+31BAB1WQrESefLUjQBkugtdRCwZbmtsgQT6d4x4A
         VbT0EZ+gXCJfssGHq9ekpjg/uBF263tzzy81r4bZWc1vZgyjrL4g69y/vkpkIW5UJekB
         2tMnPIE/Pxvbc00qBMOADrtQJB+5LSmYs1pJnQZ1CU0K2uGyDO1O8mIS+dnyRm36ZYyA
         8Y5NpaBoxG8EHXF08Wezudx9kRvonp1TvhnqRJxlnhAAiyp+VhQwTofhMEVYQhhNqMmN
         2jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+CW7beEWR0Pb7ROLSpU0nhqAUHLthMao4T7CzyDGi7g=;
        b=pwm7Q7ulOyJziDeA9xz15ILrdT2Dduf9BrR+F0aDgsdHZGakjVdko7rhVNqfmVrIBv
         KO9fMDFOXO4l8llMr48/eYap+kBx6JWSy5RTy9hQQLJYzhmhkCTA8DAunYfuRlnSHZYU
         nF2q1VK3j5Xr5izT7RObfn28kwl7OAEn25mFrW1X1f3ECDvXetZkkSdCCjyPlA+HwrCX
         IzG1cQbnwHyNyQkFcQtRCI5NjxLKCSthj50fCNwlJH9dXggGhj5iYIH/mQc3cpCJsC6Y
         KcJj/y2NwmZggDZxMP5dVGBmMyIZXMirpopHLcZJqcmI/IiLFHn7f7IpdiF6bPkrwPq7
         I7sw==
X-Gm-Message-State: AOAM533NmBM8O3uN6k8S3dS/8SA53iEvfoAPvmfuioMXS2r++MFXDUKG
        zhwb+ajQD++jsDVH8GJPwq5xYvr1ghqnfXW3dR0=
X-Google-Smtp-Source: ABdhPJzWDUaz5piMlQV0HXant7ReM+7ufFvRfoIb1d3rlp4myFcLfkmvRPbl31kMpL2rip/q7vj0I3hqA4BnKFICEGU=
X-Received: by 2002:a05:6638:1483:: with SMTP id j3mr69836998jak.65.1594245226337;
 Wed, 08 Jul 2020 14:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200617120510.25071-1-aford173@gmail.com> <CAMuHMdWjpyi6QiGTHkwXcepMzP8hN7MkXSJ=Xnxn40VkRU9OXg@mail.gmail.com>
In-Reply-To: <CAMuHMdWjpyi6QiGTHkwXcepMzP8hN7MkXSJ=Xnxn40VkRU9OXg@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 8 Jul 2020 16:53:35 -0500
Message-ID: <CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 22, 2020 at 8:20 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> Thanks for your patch!

Thanks for the review.  :-)

>
> On Wed, Jun 17, 2020 at 2:05 PM Adam Ford <aford173@gmail.com> wrote:
> > Beacon EmebddedWorks, formerly Logic PD is introducing a new
>
> EmbeddedWorks

(facepalm)  I feel stupid.

>
> > SOM and development kit based on the RZ/G2M SoC from Renesas.
> >
> > The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> > cellular radio.
> >
> > The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> > along with a vareity of push buttons and LED's.
>
> variety
>
> Are schematics for this kit available? That would make it easier to review
> the DTS.

As of right now, we don't have them available publicly.  If you're
willing to sign an NDA, I might be able get you access to them.

>
> Please add the DTB to arch/arm64/boot/dts/renesas/Makefile, else it
> won't be built :-)

oops.

>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > @@ -0,0 +1,733 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2020, Compass Electronics Group, LLC
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/clk/versaclock.h>
>
> This depends on "[PATCH V3 2/3] dt: Add additional option bindings for
> IDT VersaClock", which hasn't been accepted yet, AFAIK.
>
> > +
> > +/ {
> > +       aliases {
> > +               serial0 = &scif2;
> > +               serial1 = &hscif0;
> > +               serial2 = &hscif1;
> > +               serial3 = &scif0;
> > +               serial4 = &hscif2;
> > +               serial5 = &scif5;
> > +               spi0 = &msiof0;
> > +               spi1 = &msiof1;
> > +               spi2 = &msiof2;
> > +               spi3 = &msiof3;
>
> Please drop the spiX aliases, as they are not needed.

OK.
>
> > +               ethernet0 = &avb;
> > +       };
>
> > +       leds {
> > +               compatible = "gpio-leds";
> > +               pinctrl-0 = <&led_pins>;
> > +               pinctrl-names = "default";
> > +
> > +               led0 {
> > +                       gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
> > +                       label = "LED0";
> > +                       linux,default-trigger = "heartbeat";
> > +               };
> > +               led1 {
> > +                       gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
> > +                       label = "LED1";
> > +                       linux,default-trigger = "heartbeat";
> > +               };
> > +               led2 {
> > +                       gpios = <&gpio7 1 GPIO_ACTIVE_HIGH>;
> > +                       label = "LED2";
> > +                       linux,default-trigger = "heartbeat";
> > +               };
> > +               led3 {
> > +                       gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>;
> > +                       label = "LED3";
> > +                       linux,default-trigger = "heartbeat";
>
> Lots of heartbeats ;-)

Yeah, I cut than down to one.  We don't have a dedicated plan for what
they need to do yet.  :-)

>
> > +               };
> > +       };
>
> > +&ehci0 {
> > +       dr_mode = "otg";
> > +       status = "okay";
> > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>, <&versaclock6_bb 4>;
>
> What's the purpose of the 3rd and 4th clock?

We added a versaclock to drive something else, but that other thing
didn't request the clocks, so they didn't ever turn on.  This was bad
hack to get something to turn them on.  We've revised the hardware and
device tree to eliminate this.

>
> > +};
> > +
> > +&ehci1 {
> > +       status = "okay";
> > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 4>;
>
> What's the purpose of the 3rd clock?

Same as above, and it'll be gone in V2 as well.
>
> > +};
>
> > +       msiof1_pins: msiof1 {
> > +               groups = "msiof1_clk_g", "msiof1_rxd_g", "msiof1_txd_g";
> > +               function = "msiof1";
> > +       };
>
> What is msiof1 connected to?

There is a GPIO header on the main board with a SPI connector, but
nothing actually on the SPI bus.  We can remove this.

>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
>
> > +       eeprom@50 {
> > +               compatible = "microchip, at24c64", "atmel,24c64";
>
> Bogus space after the first comma.

Noted.

>
> > +               pagesize = <32>;
> > +               read-only;      /* Manufacturing EEPROM programmed at factory */
> > +               reg = <0x50>;
> > +       };
>
> > new file mode 100644
> > index 000000000000..e7ed5d480618
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
> > @@ -0,0 +1,15 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2020, Compass Electronics Group, LLC
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "r8a774a1.dtsi"
> > +#include "beacon-renesom-som.dtsi"
> > +#include "beacon-renesom-baseboard.dtsi"
> > +
> > +/ {
> > +       model = "Beacon Embedded Works RZ/G2M Development Kit";
> > +       compatible =    "beacon,beacon-rzg2m", "renesas,r8a774a1";
> > +};
>
> Please include a patch to add "beacon,beacon-rzg2m" to
> Documentation/devicetree/bindings/arm/renesas.yaml.

OK.

adam
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
