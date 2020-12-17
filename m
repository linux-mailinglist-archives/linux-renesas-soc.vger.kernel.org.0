Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644C02DD0C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgLQLuC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:50:02 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:45150 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgLQLuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:50:02 -0500
Received: by mail-oi1-f181.google.com with SMTP id f132so31836894oib.12;
        Thu, 17 Dec 2020 03:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l8JW8fiOIIf0+PG8nrLxsGuyo8UitcCktb2T6/+Am1I=;
        b=TG9Y1M9pzhH4Igg0E3+Syh2flac2irs5YEdcPu5MEJ8OfSm7ZFub88KWyLe5O0DUHE
         Efo7FWZ4VIC9Wi1/GqSkjSV7V0cBJhp/QvsKjzohSZ5bYlrasPm9NCWuyXMUaNdocmvj
         uSb1NwIhKxrjjO/91HUcD5K1gfspXyLZJWM94liSADk+u1t3yKQaz7SNvt9YznQZKm8N
         hBlk+WzeLYcZhZfUAr67L+59GQZVrCaXVGUntTDzA8le9R76abdzeD7zbTC7qhoW9kz5
         s6Q/HmrCHICrgbDCBQxGb4fTk8VDKr5v5EJUoRTuuq8XMdP/7bOtZ9b9lmyyrvNkVCIh
         jFOQ==
X-Gm-Message-State: AOAM532gqqmo15xCZ5zwVJA+4a9bZ2NnhmMAv8z7TfO+8Uf/RC6LRHN7
        6/Xg9NZat52zaAe360fEDQ2/FOz6+M15oS9AXZE=
X-Google-Smtp-Source: ABdhPJx077k4AAu7l8FZFAc4mKEKrAsPKDZfrRg5r0uT9QzIYr8sfLF0vwVjsFpIDCzBtvHW5LXxVA7cl13gAUvX2Ok=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr4523763oia.148.1608205761601;
 Thu, 17 Dec 2020 03:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-18-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-18-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:49:10 +0100
Message-ID: <CAMuHMdWN91xmx5bVb2ww67iHm+b8umeB3WgBQdnR5M3_WcK=7Q@mail.gmail.com>
Subject: Re: [PATCH 17/18] arm64: dts: renesas: Introduce r8a774b1-beacon-rzg2n-kit
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> Beacon EmebeddedWorks is introducing a new kit based on the
> RZ/G2N SoC from Renesas.
>
> The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> cellular radio.
>
> The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> along with a variety of push buttons and LED's, and support for
> a parallel RGB and an LVDS display.  It uses the same baseboard
> and SOM as the RZ/G2M.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2020, Compass Electronics Group, LLC
> + */
> +
> +/dts-v1/;
> +
> +#include "r8a774b1.dtsi"
> +#include "beacon-renesom-som.dtsi"
> +#include "beacon-renesom-baseboard.dtsi"
> +
> +/ {
> +       model = "Beacon Embedded Works RZ/G2N Development Kit";
> +       compatible =    "beacon,beacon-rzg2n", "renesas,r8a774b1";
> +
> +       aliases {
> +               serial0 = &scif2;
> +               serial1 = &hscif0;
> +               serial2 = &hscif1;
> +               serial3 = &scif0;
> +               serial4 = &hscif2;
> +               serial5 = &scif5;
> +               serial6 = &scif4;
> +               ethernet0 = &avb;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };

No memory nodes? Are you relying on U-Boot to fill them in?
If yes, why do you have them in the other board DTS files?

> +};
> +
> +&du {
> +       status = "okay";

Missing pinctrl properties?

> +
> +       clocks = <&cpg CPG_MOD 724>,
> +               <&cpg CPG_MOD 723>,
> +               <&cpg CPG_MOD 721>,
> +               <&versaclock5 1>,
> +               <&x302_clk>,
> +               <&versaclock5 2>;
> +       clock-names = "du.0", "du.1", "du.3",
> +               "dclkin.0", "dclkin.1", "dclkin.3";
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
