Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5EFB2E0B3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 14:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgLVN70 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 08:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgLVN7Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 08:59:25 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9ED7C0613D3;
        Tue, 22 Dec 2020 05:58:44 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id r17so12018666ilo.11;
        Tue, 22 Dec 2020 05:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6i7NrwLKDslBTejJUhiHwrawTUVbXT/BNONd/vz+wMw=;
        b=dFQocZHAgVe5+oSTsSRYS7k1Y+hX5WOWcDN65k0FcxGHpDCpafbKBpUuS+KLs3cTgO
         CGPNptel+VHIL89ETlx2VzXLKn0j2tlSlEc7Mfodz6Nmn0NCszG3lYl79dnPBeYuubXm
         sjdHKDAl4BPcpgNWlfRmFZq9M/BGSLdX3myijNGMAaIr3+CTySruzftKB+OIsVPE6U/J
         FOspbDbnu/ZgmuDS66F7SHSQtt1AbOaM4/Ium6OWL/ZOXzLMvwqDJw1NQJE5y/HQXCuj
         4iY0IhlXiapV4pwL7RLRv1v2vokTu5Iuvtw13t1Z3S1smQf1P5ytRuY2vlbXXTn+4Tvd
         lYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6i7NrwLKDslBTejJUhiHwrawTUVbXT/BNONd/vz+wMw=;
        b=tj3yV0W50gneSlG2JA+AlATuugLLe9Vo9WpAgsaciQOpJf4qkMxh0F3Po5J2iuekey
         IDTrwQFzK/BTu4bz2zX558GXIXocTLtEZh+er1vgeJnk5wll38y8MxjwVfdtDR6jelrR
         DLl0nZmIZ2TQDO3ZODF4GxiWoXx0KNmA8uLVrUQnoF6vyrshhDr93LOAw+l544kdZ+J7
         RY65aqA9I0bcQDHnCgHjhZo69FHxw2dB+agf7bkNb5PnhpCOUGndI+6pbzTWDt6Tgao2
         /QAZLQEJQb1gF5U1M84h/+r6JqskDM3HO6G9p0/aarImO6r1d+p24Fs5u5sJN8AEOPOn
         dRoA==
X-Gm-Message-State: AOAM531nqBDmI/VIBAL5yuzsPoU7YOOJzeDn3/2ANyLkWkAPq2eDECup
        1FzY4BAF801EAZ9QSFnR3fBHuX8I2bjNZpFDLXSn5fwoaaY=
X-Google-Smtp-Source: ABdhPJwYgwMXbi+Yk/cnr6cxtkRgpZGKk8ZSMGaQNUwYvN0cvcQaUj1UmhlHT9IRV1ry42oBJU9jIhZIMNHiS1hDRTQ=
X-Received: by 2002:a92:d2cf:: with SMTP id w15mr21342632ilg.214.1608645524117;
 Tue, 22 Dec 2020 05:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-18-aford173@gmail.com>
 <CAMuHMdWN91xmx5bVb2ww67iHm+b8umeB3WgBQdnR5M3_WcK=7Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWN91xmx5bVb2ww67iHm+b8umeB3WgBQdnR5M3_WcK=7Q@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 22 Dec 2020 07:58:33 -0600
Message-ID: <CAHCN7xKEBUjkgksdqP2V+P9wwC9ZH=EZg7kK=txxTWp8A8=rWA@mail.gmail.com>
Subject: Re: [PATCH 17/18] arm64: dts: renesas: Introduce r8a774b1-beacon-rzg2n-kit
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, Dec 17, 2020 at 5:49 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > Beacon EmebeddedWorks is introducing a new kit based on the
> > RZ/G2N SoC from Renesas.
> >
> > The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> > cellular radio.
> >
> > The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> > along with a variety of push buttons and LED's, and support for
> > a parallel RGB and an LVDS display.  It uses the same baseboard
> > and SOM as the RZ/G2M.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Thanks for your patch!

Thank you for the review!

>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
> > @@ -0,0 +1,43 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2020, Compass Electronics Group, LLC
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "r8a774b1.dtsi"
> > +#include "beacon-renesom-som.dtsi"
> > +#include "beacon-renesom-baseboard.dtsi"
> > +
> > +/ {
> > +       model = "Beacon Embedded Works RZ/G2N Development Kit";
> > +       compatible =    "beacon,beacon-rzg2n", "renesas,r8a774b1";
> > +
> > +       aliases {
> > +               serial0 = &scif2;
> > +               serial1 = &hscif0;
> > +               serial2 = &hscif1;
> > +               serial3 = &scif0;
> > +               serial4 = &hscif2;
> > +               serial5 = &scif5;
> > +               serial6 = &scif4;
> > +               ethernet0 = &avb;
> > +       };
> > +
> > +       chosen {
> > +               stdout-path = "serial0:115200n8";
> > +       };
>
> No memory nodes? Are you relying on U-Boot to fill them in?
> If yes, why do you have them in the other board DTS files?

There is already a memory node included in the beacon-renesom.dtsi
file which is defining memory@48000000 node which is common to the M,
N and H.   If I understand it correctly, the extra memory nodes
defined in the higher-level dts for M and H variation are not
applicable on the N.

>
> > +};
> > +
> > +&du {
> > +       status = "okay";
>
> Missing pinctrl properties?
>
oops.  I'll fix.
> > +
> > +       clocks = <&cpg CPG_MOD 724>,
> > +               <&cpg CPG_MOD 723>,
> > +               <&cpg CPG_MOD 721>,
> > +               <&versaclock5 1>,
> > +               <&x302_clk>,
> > +               <&versaclock5 2>;
> > +       clock-names = "du.0", "du.1", "du.3",
> > +               "dclkin.0", "dclkin.1", "dclkin.3";
> > +};
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
