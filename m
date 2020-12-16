Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14EE2DC4F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 18:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgLPREW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 12:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726929AbgLPREW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 12:04:22 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299DFC061794;
        Wed, 16 Dec 2020 09:03:42 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id i18so24642699ioa.1;
        Wed, 16 Dec 2020 09:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=slSGdYmXUgGlq/xnGsALH/7Dx/FOPfEqovdaJQnn86c=;
        b=CQotzpA8rQq41ruL+Y2oUGVXQxlADv/e/Uj1it5NGKowJztw4mOn7zGxnmvKd1KQRZ
         c55Vz9wN/pTcjiZp58vDBo4uEaeZ9Vr6STS8PdB2FK18Z8Oj1BYJXkkf3sDD/R7VR/Mh
         QmSWaanW3lJTP/d4Z+h413XU+s9bEws6bUaz1GXh4wJNtwD3U9ARZMSJVkhR7hxpyhLN
         ELz6fImBF3DNyKZjYCJhjZ30U2Cti2iGcKdJXw4JahbKWMOSN2pyzj/bLNj4Zik87EzI
         1OtjoH9c54ZybuwzpOSfF6Jq6Bhx76+qBuFyivFqrxnaGftZMBSfxEdJsAypOVqNfmOe
         HeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=slSGdYmXUgGlq/xnGsALH/7Dx/FOPfEqovdaJQnn86c=;
        b=ebQV42TZT/Hpd+uEvhPoJXX93O3Ohu/9sPd9Mn4COcQyRMNVdtyUdcstVSrt26o3FP
         uIZgBLd+/pG/mZZqe6BZDOGpcdu3RTKOeE/Rn3UWTzALzj8sqE3C10qrku7ko0T/Fo8R
         phaUtf78OQLGwvfvkhYLn1uCbe6GEFfkdgyPQKrXLI+2avGttl7FPIE+CQ5vWnmMoP7h
         u1HVGbOCV7+1qVj0DWbd31f+ZHdwvDPmR5ZK3yIrB05DwjcgtYo/7ZG/grLKeniiDfjN
         CM5R7KtOGIPB3WlwiRsoVem+UWeDMAzgFkwtdfV1Db5vqItjJXkVM+ou+q5BVuv8uJyJ
         dwyg==
X-Gm-Message-State: AOAM530hed/iDXkgjc7kQeMCRqrMWuOyChkFqL420fWNr6Q6o1rRfBij
        zqt1oXRPKT6HgVlqX+y369GgVOr/NqZwR9SWX1toeN4t4PA=
X-Google-Smtp-Source: ABdhPJxL+pO9xhdy6BhHGPrJffsHm0uIgUX0pyjeeohZSUXkXIADTZI7I8KJ2KprQ70nXRVclRXGFlkQu5ZOqLGg35I=
X-Received: by 2002:a02:caac:: with SMTP id e12mr43571914jap.45.1608138221095;
 Wed, 16 Dec 2020 09:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-2-aford173@gmail.com>
 <CAMuHMdWRieM1H5WLySVDVQds-xKgsqo-OibegJrXgonfqbAL8g@mail.gmail.com>
In-Reply-To: <CAMuHMdWRieM1H5WLySVDVQds-xKgsqo-OibegJrXgonfqbAL8g@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 16 Dec 2020 11:03:29 -0600
Message-ID: <CAHCN7xL3KU4dA=0-S7J5AEPmjAtpz4j-frEUqBD=JU7BV7g1WA@mail.gmail.com>
Subject: Re: [PATCH 01/18] arm64: dts: renesas: beacon kit: Configure
 programmable clocks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Wed, Dec 16, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > When the board was added, clock drivers were being updated done at
> > the same time to allow the versaclock driver to properly configure
> > the modes.  Unforutnately, the updates were not applied to the board
>
> Unfortunately

Sorry, I can fix that.

>
> > files at the time they should have been, so do it now.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > @@ -5,6 +5,7 @@
> >
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/clk/versaclock.h>
> >
> >  / {
> >         backlight_lvds: backlight-lvds {
> > @@ -294,12 +295,12 @@ &du_out_rgb {
> >  &ehci0 {
> >         dr_mode = "otg";
> >         status = "okay";
> > -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
>
> Why this change? You said before you don't need this
> https://lore.kernel.org/linux-renesas-soc/CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com/
>

I had talked with the hardware guys about buy pre-programmed
versaclock chips which would have been pre-configured and pre-enabled.
I thought it was going to happen, but it didn't, so we need the
versaclock driver to enable the reference clock for the USB
controllers, ethernet controller and audio clocks.  Previously we were
manually configuring it or it was coincidentally working. Ideally,
we'd have the clock system intentionally enable/disable the clocks
when drivers are loaded/unloaded for for power management reasons.

> BTW, something I missed in the earlier review: is there an override
> needed at all?

We need the versaclock for sure.  I'll do some more testing and try to
clean this up in the next revision.

>
> >  };
> >
> >  &ehci1 {
> >         status = "okay";
> > -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
>
> Same here.
>
> BTW, something I missed in the earlier review: why did you override
>
>     clocks = <&cpg CPG_MOD 702>;
>
> by
>
>     clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;

Might be an accidental copy-paste error.  I need to review all three
SoC's and adjust the device trees accordingly.

>
> ?
>
> >  };
> >
> >  &hdmi0 {
> > @@ -373,12 +374,40 @@ versaclock6_bb: clock-controller@6a {
> >                 #clock-cells = <1>;
> >                 clocks = <&x304_clk>;
> >                 clock-names = "xin";
> > -               /* CSI0_MCLK, CSI1_MCLK, AUDIO_CLKIN, USB_HUB_MCLK_BB */
> > +               clock-output-names = "versaclock6_bb.out0_sel_i2cb",
> > +                                     "versaclock6_bb.out1",
> > +                                     "versaclock6_bb.out2",
> > +                                     "versaclock6_bb.out3",
> > +                                     "versaclock6_bb.out4";
>
> Why? IIUIC, the driver doesn't parse clock-output-names
> (and it shouldn't).

This was probably copy-paste from an internal repo we have using an
older, customized kernel due to clashing of names with more than one
versaclock was available.  I'll remove it during the next revision.

>
> >                 assigned-clocks = <&versaclock6_bb 1>,
> >                                    <&versaclock6_bb 2>,
> >                                    <&versaclock6_bb 3>,
> >                                    <&versaclock6_bb 4>;
> >                 assigned-clock-rates =  <24000000>, <24000000>, <24000000>, <24576000>;
> > +
> > +               OUT1 {
> > +                       idt,mode = <VC5_CMOS>;
> > +                       idt,voltage-microvolts = <1800000>;
>
> Oops. The DT bindings say "idt,voltage-microvolt", the example in the DT
> bindings says "idt,voltage-microvolts", and the driver parses
> "idt,voltage-microvolts".
>
> According to Documentation/devicetree/bindings/property-units.txt, the
> property name should end in "microvolt".
>
> Patch sent.
> https://lore.kernel.org/linux-clk/20201216145231.1344317-1-geert+renesas@glider.be/
>

Thanks for that.  I'll submit an update based on the patch you sent.

adam
> > +                       idt,slew-percent = <100>;
> > +               };
>

Thank you for the review.  Is that the only patch in the series with
concerns?  I probably won't get to V2 until this weekend.

adam
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

>
> > files at the time they should have been, so do it now.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > @@ -5,6 +5,7 @@
> >
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/clk/versaclock.h>
> >
> >  / {
> >         backlight_lvds: backlight-lvds {
> > @@ -294,12 +295,12 @@ &du_out_rgb {
> >  &ehci0 {
> >         dr_mode = "otg";
> >         status = "okay";
> > -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
>
> Why this change? You said before you don't need this
> https://lore.kernel.org/linux-renesas-soc/CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com/
>
> BTW, something I missed in the earlier review: is there an override
> needed at all?
>
> >  };
> >
> >  &ehci1 {
> >         status = "okay";
> > -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
>
> Same here.
>
> BTW, something I missed in the earlier review: why did you override
>
>     clocks = <&cpg CPG_MOD 702>;
>
> by
>
>     clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
>
> ?
>
> >  };
> >
> >  &hdmi0 {
> > @@ -373,12 +374,40 @@ versaclock6_bb: clock-controller@6a {
> >                 #clock-cells = <1>;
> >                 clocks = <&x304_clk>;
> >                 clock-names = "xin";
> > -               /* CSI0_MCLK, CSI1_MCLK, AUDIO_CLKIN, USB_HUB_MCLK_BB */
> > +               clock-output-names = "versaclock6_bb.out0_sel_i2cb",
> > +                                     "versaclock6_bb.out1",
> > +                                     "versaclock6_bb.out2",
> > +                                     "versaclock6_bb.out3",
> > +                                     "versaclock6_bb.out4";
>
> Why? IIUIC, the driver doesn't parse clock-output-names
> (and it shouldn't).
>
> >                 assigned-clocks = <&versaclock6_bb 1>,
> >                                    <&versaclock6_bb 2>,
> >                                    <&versaclock6_bb 3>,
> >                                    <&versaclock6_bb 4>;
> >                 assigned-clock-rates =  <24000000>, <24000000>, <24000000>, <24576000>;
> > +
> > +               OUT1 {
> > +                       idt,mode = <VC5_CMOS>;
> > +                       idt,voltage-microvolts = <1800000>;
>
> Oops. The DT bindings say "idt,voltage-microvolt", the example in the DT
> bindings says "idt,voltage-microvolts", and the driver parses
> "idt,voltage-microvolts".
>
> According to Documentation/devicetree/bindings/property-units.txt, the
> property name should end in "microvolt".
>
> Patch sent.
> https://lore.kernel.org/linux-clk/20201216145231.1344317-1-geert+renesas@glider.be/
>
> > +                       idt,slew-percent = <100>;
> > +               };
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
