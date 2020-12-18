Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A442DE32F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 14:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgLRNRM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 08:17:12 -0500
Received: from mail-oo1-f54.google.com ([209.85.161.54]:38074 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgLRNRM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 08:17:12 -0500
Received: by mail-oo1-f54.google.com with SMTP id i18so533965ooh.5;
        Fri, 18 Dec 2020 05:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FNSt8Fkjm6JuWT/uYBPaEJmzaxfUJT+yoJMWo0n8xuk=;
        b=jg48tbhvWvCY3Ec+7IB2xcoThg3US7qvCM6WsE7+/5/hpqjWfJUXglu8TYAsJvrnx8
         KLDhSseTi10Fr8ousSGGMfEUjUQwBDsf2sGnjAcNZv60HvUm9QuXFbP9pNR74wtZflfX
         iNngNl0/VRYsm70JIJX3jMGNkSlC9TzJ99i05GAT4QlH5k1s2VyHgCQAyKbrczXN3WrD
         EuRE+JllxQlOr9trCF2iqJFwDBOA29rwcPT6DOt8AnbUt+hDwa/Exm8hjuzcOckAv7Bq
         ps/IslM1GJH/3MYdI9Jj6FzprQp1HKVXV9t5ldW4PcgVm8yAEwV0OqUGloXCkSdM5vWW
         5/IA==
X-Gm-Message-State: AOAM533Ij2UTt6LPUR17PYm+0+MOOpYOdPTAr/IMG5JIqQL3o5+s1Hsw
        xTRyfvKpvSErWJPFNHpbpKHQzV4D3uqIFEtd9pY=
X-Google-Smtp-Source: ABdhPJxEZefF4VB9P0I0+F1xIwaiYLGwj0pj3vSAi5MF2r0YsXu9tkwT3qasn4rjm+dLOPWSAhjuSa2ZKWizo46ZrRk=
X-Received: by 2002:a4a:dc1:: with SMTP id 184mr2726085oob.40.1608297390778;
 Fri, 18 Dec 2020 05:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-2-aford173@gmail.com>
 <CAMuHMdWRieM1H5WLySVDVQds-xKgsqo-OibegJrXgonfqbAL8g@mail.gmail.com>
 <CAHCN7xL3KU4dA=0-S7J5AEPmjAtpz4j-frEUqBD=JU7BV7g1WA@mail.gmail.com>
 <CAMuHMdWc=qD=Oqa-7o9K1bd_OM0L7Br8BVAbDvYNraO0wAX2jw@mail.gmail.com> <CAHCN7xKsSgM+=MFOKpNZTsJJiNyx6_mqZL2g_PKhN5fWyE6y7Q@mail.gmail.com>
In-Reply-To: <CAHCN7xKsSgM+=MFOKpNZTsJJiNyx6_mqZL2g_PKhN5fWyE6y7Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Dec 2020 14:16:19 +0100
Message-ID: <CAMuHMdVxzcyVuK06BqE4GQPLE8J7V5Jc-W_RSENNxEQG68krCw@mail.gmail.com>
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
        Luca Ceresoli <luca@lucaceresoli.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

CC Shimoda-san

On Thu, Dec 17, 2020 at 12:52 PM Adam Ford <aford173@gmail.com> wrote:
> On Thu, Dec 17, 2020 at 2:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Dec 16, 2020 at 6:03 PM Adam Ford <aford173@gmail.com> wrote:
> > > On Wed, Dec 16, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > When the board was added, clock drivers were being updated done at
> > > > > the same time to allow the versaclock driver to properly configure
> > > > > the modes.  Unforutnately, the updates were not applied to the board
> >
> > > > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > > @@ -5,6 +5,7 @@
> > > > >
> > > > >  #include <dt-bindings/gpio/gpio.h>
> > > > >  #include <dt-bindings/input/input.h>
> > > > > +#include <dt-bindings/clk/versaclock.h>
> > > > >
> > > > >  / {
> > > > >         backlight_lvds: backlight-lvds {
> > > > > @@ -294,12 +295,12 @@ &du_out_rgb {
> > > > >  &ehci0 {
> > > > >         dr_mode = "otg";
> > > > >         status = "okay";
> > > > > -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> > > > > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
> > > >
> > > > Why this change? You said before you don't need this
> > > > https://lore.kernel.org/linux-renesas-soc/CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com/
> > > >
> > >
> > > I had talked with the hardware guys about buy pre-programmed
> > > versaclock chips which would have been pre-configured and pre-enabled.
> > > I thought it was going to happen, but it didn't, so we need the
> > > versaclock driver to enable the reference clock for the USB
> > > controllers, ethernet controller and audio clocks.  Previously we were
> > > manually configuring it or it was coincidentally working. Ideally,
> > > we'd have the clock system intentionally enable/disable the clocks
> > > when drivers are loaded/unloaded for for power management reasons.
> >
> > Can you tell me how exactly the Versaclock outputs are wired?
>
> The SoC is expecting a fixed external 50 MHz clock connected to
> USB_EXTAL.  Instead of a fixed clock, we're using the Versaclock.
> We're also using the Versaclock to drive the AVB TXCRefClk,
> du_dotclkiun0 and du_dotclkin2 (also also called du_dotclkin3 on
> RZ/G2N) instead of fixed clocks.
>
> > E.g. for USB, the bindings don't say anything about a third clock input,
> > so I'd like to know where that clock is fed into USB.
>
> The way the driver is crafted, it can take in multiple clocks and it
> goes through a list to enable them all, so I added the versaclock to
> the array.  Without the versaclock reference, the clock doesn't get
> turned on and the USB fails to operate.

According to the Hardware User's Manual, USBL_EXTAL is used for USB3.0,
while you added the clock references to the EHCI nodes.
Are you sure EHCI is failing without this?

Still, it means we need to extend the bindings/driver for
renesas,rcar-gen3-xhci to handle USB_EXTAL.

> The DU clocks are also expecting an array, so I added the versaclock
> to that array as well.

For DU, the clock inputs are clearly defined in the bindings.

> It's similar to the rationale that I'm trying to add the option clock
> for the AVB TXC_Ref clock on the other path.  We're using the
> versaclock there as well.  The difference is that in the case of the
> AVB_TXCRefClk, the driver isn't expecting an array of clocks, it's
> only expecting a single clock.  In order to enable the additional
> clock,  I started the patch to accept the optional clock for the
> TXCRefClk in order to get the clock system to enable the clock.

Sure.

> Because the Versaclock isn't programmed to automatically start, they
> need the consumers of the clock to request and enable them.
>
> I admit that I'll probably need to update the bindings to add the
> extra clocks as optional, so if you want, I can submit additional
> patches to add these optional clocks to their respective bindings.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
