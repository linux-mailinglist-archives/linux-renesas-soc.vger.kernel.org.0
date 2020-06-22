Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251682037C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 15:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbgFVNUy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 09:20:54 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44856 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728110AbgFVNUy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 09:20:54 -0400
Received: by mail-ot1-f66.google.com with SMTP id e5so12975300ote.11;
        Mon, 22 Jun 2020 06:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNbCZePewB/NCeRQ/HjjQVdjTqtr6FT4ufoTE5WeBks=;
        b=Um0I1bp8pKmyNz+iK348XCgJAHLh8LQwaElwCNvzehEj2YXdRUkjJd0ONF9q3ewi6X
         QjI9W2mpMvis+EIhu41ooY4furMT+eg9aaUF3u/LpD+PSBgU+kBtpnnJmFoVVIh0bfCm
         c3dL4J7gvlfaE591dXAgMk1NW80g+2HcHGP0mMMSGWgyfeeo1slLRVR8Ax9RZL8p/rT1
         WZ8iSpk1pbF851rP8JNWts3BICrIAMBPDTfkbSO9hBmZ1IGxk8hSznp3c8G2XaClKq7F
         JjSICYn6nA6V/ku5yaB9raRrGhXRdp/CtGkv4Nii+2cGVolmDPkDvy7ZUojNbGb+NNpN
         701Q==
X-Gm-Message-State: AOAM533ey/GD7wP9XjmIteEBOJv4kfeYfWoJd0uLfx3wtWDF1UNEkIJx
        t2neTnKCAyiErjQfN9zTgWsdgTUFJnvH2o61qDW2y83K
X-Google-Smtp-Source: ABdhPJwy+Yi8KHmAGOzBAm8bJ3ozF1WWqSPJIfnMPauTIGbQnsCX1P57DWNx9KdRsKPFlAHhNl56piop7ircPAUa4XU=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr13077246otr.107.1592832050916;
 Mon, 22 Jun 2020 06:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200617120510.25071-1-aford173@gmail.com>
In-Reply-To: <20200617120510.25071-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Jun 2020 15:20:39 +0200
Message-ID: <CAMuHMdWjpyi6QiGTHkwXcepMzP8hN7MkXSJ=Xnxn40VkRU9OXg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        aford@beaconembedded.com, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

Thanks for your patch!

On Wed, Jun 17, 2020 at 2:05 PM Adam Ford <aford173@gmail.com> wrote:
> Beacon EmebddedWorks, formerly Logic PD is introducing a new

EmbeddedWorks

> SOM and development kit based on the RZ/G2M SoC from Renesas.
>
> The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> cellular radio.
>
> The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> along with a vareity of push buttons and LED's.

variety

Are schematics for this kit available? That would make it easier to review
the DTS.

Please add the DTB to arch/arm64/boot/dts/renesas/Makefile, else it
won't be built :-)

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -0,0 +1,733 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2020, Compass Electronics Group, LLC
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/clk/versaclock.h>

This depends on "[PATCH V3 2/3] dt: Add additional option bindings for
IDT VersaClock", which hasn't been accepted yet, AFAIK.

> +
> +/ {
> +       aliases {
> +               serial0 = &scif2;
> +               serial1 = &hscif0;
> +               serial2 = &hscif1;
> +               serial3 = &scif0;
> +               serial4 = &hscif2;
> +               serial5 = &scif5;
> +               spi0 = &msiof0;
> +               spi1 = &msiof1;
> +               spi2 = &msiof2;
> +               spi3 = &msiof3;

Please drop the spiX aliases, as they are not needed.

> +               ethernet0 = &avb;
> +       };

> +       leds {
> +               compatible = "gpio-leds";
> +               pinctrl-0 = <&led_pins>;
> +               pinctrl-names = "default";
> +
> +               led0 {
> +                       gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +                       label = "LED0";
> +                       linux,default-trigger = "heartbeat";
> +               };
> +               led1 {
> +                       gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
> +                       label = "LED1";
> +                       linux,default-trigger = "heartbeat";
> +               };
> +               led2 {
> +                       gpios = <&gpio7 1 GPIO_ACTIVE_HIGH>;
> +                       label = "LED2";
> +                       linux,default-trigger = "heartbeat";
> +               };
> +               led3 {
> +                       gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>;
> +                       label = "LED3";
> +                       linux,default-trigger = "heartbeat";

Lots of heartbeats ;-)

> +               };
> +       };

> +&ehci0 {
> +       dr_mode = "otg";
> +       status = "okay";
> +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>, <&versaclock6_bb 4>;

What's the purpose of the 3rd and 4th clock?

> +};
> +
> +&ehci1 {
> +       status = "okay";
> +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 4>;

What's the purpose of the 3rd clock?

> +};

> +       msiof1_pins: msiof1 {
> +               groups = "msiof1_clk_g", "msiof1_rxd_g", "msiof1_txd_g";
> +               function = "msiof1";
> +       };

What is msiof1 connected to?

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi

> +       eeprom@50 {
> +               compatible = "microchip, at24c64", "atmel,24c64";

Bogus space after the first comma.

> +               pagesize = <32>;
> +               read-only;      /* Manufacturing EEPROM programmed at factory */
> +               reg = <0x50>;
> +       };

> new file mode 100644
> index 000000000000..e7ed5d480618
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2020, Compass Electronics Group, LLC
> + */
> +
> +/dts-v1/;
> +
> +#include "r8a774a1.dtsi"
> +#include "beacon-renesom-som.dtsi"
> +#include "beacon-renesom-baseboard.dtsi"
> +
> +/ {
> +       model = "Beacon Embedded Works RZ/G2M Development Kit";
> +       compatible =    "beacon,beacon-rzg2m", "renesas,r8a774a1";
> +};

Please include a patch to add "beacon,beacon-rzg2m" to
Documentation/devicetree/bindings/arm/renesas.yaml.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
