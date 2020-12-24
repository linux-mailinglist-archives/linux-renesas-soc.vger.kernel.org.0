Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7B12E2778
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 14:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgLXNxn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 08:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbgLXNxm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 08:53:42 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B059C061794;
        Thu, 24 Dec 2020 05:53:02 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id 2so2044766ilg.9;
        Thu, 24 Dec 2020 05:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lWTbHY81KjIshjNuJb4wW01azEJV2L6TrRBUVbFz5yM=;
        b=MPyPErXN2l5kMYOUI66Phr3Fn8TyGh3fRQtreXjMN6KwViRYHIqK42dD83r2vA5ME0
         z7kb5+IanYvH+sVbpC32Yv0e4p5nsRPcOunMNxeywG1I5OolmyDiDAMZsA56sS0E8tTJ
         wNzXEB9iICcw/8gQ503nHDSJ6tisz5VX/xEuRWzrhF6SQCEREhcya2kyXQ5c9tQuepFs
         AExoFA9UgnTVe+h8qjS3sTTBByzRu06eLIwfeD9hL6XhVtp5zLcODxsOM8lhbK4jcbQw
         lfqy671lb6u7fS14IL9zKZdTBT/3wx281S4hEBg08ci3S5BBJYvFmWin2cQiyepixtxE
         MoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lWTbHY81KjIshjNuJb4wW01azEJV2L6TrRBUVbFz5yM=;
        b=pSHtleMD+yGTNIfRjInQD1wDYaWMpIVQ/gJ7bexhd3Y8p4qGm2gvrQW/zNpxvevKVy
         L8Wof4tLAsIQ8pJbokwvGxTnqErW8KU+PyM7ZHViyLtX9luoU5r1qQ7z4VZpT6HBbhdN
         o9cyG8v7zU/0U5LNzD3mRgLhUCprm8wZ8zUJ7BId2hZ8rYub+2LqG4SmIN9XIsoLm/iI
         sAS4k/2AwdSfFrMB517CqEUUHQVTZi6iLEaj/SVgZmnMvZsf/GHnQJuoNQFhtj4/V+4i
         QuKpc5QIUVWkzAxnWdqFuYCiRh797vXE5cazyKwqDQCyZy2gw/QJd5QUOiP35R1X+tuk
         wv6w==
X-Gm-Message-State: AOAM530zEVUq6jxTvfj3ruUJLn8LQA+Ys29QZmQjMUjn/AQOPmAPqJRM
        UZfxoCwyXjA95WH4CFvK0B6QlY5TInVe69wrWU+5+He4a+Y=
X-Google-Smtp-Source: ABdhPJxE2icD5c/lgVivHCxytuGP4CovPpSoWzWPs6lMhNw6hkvSkH/JHwdVakD+Sg8/evHADGgwMq5vXjO4YxP8R/A=
X-Received: by 2002:a92:7d14:: with SMTP id y20mr28873902ilc.196.1608817981468;
 Thu, 24 Dec 2020 05:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-2-aford173@gmail.com>
 <CAMuHMdWRieM1H5WLySVDVQds-xKgsqo-OibegJrXgonfqbAL8g@mail.gmail.com>
 <CAHCN7xL3KU4dA=0-S7J5AEPmjAtpz4j-frEUqBD=JU7BV7g1WA@mail.gmail.com>
 <CAMuHMdWc=qD=Oqa-7o9K1bd_OM0L7Br8BVAbDvYNraO0wAX2jw@mail.gmail.com>
 <CAHCN7xKsSgM+=MFOKpNZTsJJiNyx6_mqZL2g_PKhN5fWyE6y7Q@mail.gmail.com>
 <CAMuHMdVxzcyVuK06BqE4GQPLE8J7V5Jc-W_RSENNxEQG68krCw@mail.gmail.com>
 <CAHCN7xJVn7gbCX8ibSFbyjA4HqyxPR9_vXvJQQSbJRKoaF_51Q@mail.gmail.com> <CAMuHMdV0djkKTSHbCuv0d2sh+rGs1=WNNEcCNXE3daM8uAcRxw@mail.gmail.com>
In-Reply-To: <CAMuHMdV0djkKTSHbCuv0d2sh+rGs1=WNNEcCNXE3daM8uAcRxw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 24 Dec 2020 07:52:50 -0600
Message-ID: <CAHCN7x+re5Qswbw=n8Gq0newXW0WoO7=ZseD3YZWMvD_nmBq3w@mail.gmail.com>
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
        Luca Ceresoli <luca@lucaceresoli.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 22, 2020 at 2:03 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> On Tue, Dec 22, 2020 at 2:39 AM Adam Ford <aford173@gmail.com> wrote:
> > On Fri, Dec 18, 2020 at 7:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Dec 17, 2020 at 12:52 PM Adam Ford <aford173@gmail.com> wrote:
> > > > On Thu, Dec 17, 2020 at 2:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Wed, Dec 16, 2020 at 6:03 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > > On Wed, Dec 16, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > > > > When the board was added, clock drivers were being updated done at
> > > > > > > > the same time to allow the versaclock driver to properly configure
> > > > > > > > the modes.  Unforutnately, the updates were not applied to the board
> > > > >
> > > > > > > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > > > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > > > > > @@ -5,6 +5,7 @@
> > > > > > > >
> > > > > > > >  #include <dt-bindings/gpio/gpio.h>
> > > > > > > >  #include <dt-bindings/input/input.h>
> > > > > > > > +#include <dt-bindings/clk/versaclock.h>
> > > > > > > >
> > > > > > > >  / {
> > > > > > > >         backlight_lvds: backlight-lvds {
> > > > > > > > @@ -294,12 +295,12 @@ &du_out_rgb {
> > > > > > > >  &ehci0 {
> > > > > > > >         dr_mode = "otg";
> > > > > > > >         status = "okay";
> > > > > > > > -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> > > > > > > > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
> > > > > > >
> > > > > > > Why this change? You said before you don't need this
> > > > > > > https://lore.kernel.org/linux-renesas-soc/CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com/
> > > > > > >
> > > > > >
> > > > > > I had talked with the hardware guys about buy pre-programmed
> > > > > > versaclock chips which would have been pre-configured and pre-enabled.
> > > > > > I thought it was going to happen, but it didn't, so we need the
> > > > > > versaclock driver to enable the reference clock for the USB
> > > > > > controllers, ethernet controller and audio clocks.  Previously we were
> > > > > > manually configuring it or it was coincidentally working. Ideally,
> > > > > > we'd have the clock system intentionally enable/disable the clocks
> > > > > > when drivers are loaded/unloaded for for power management reasons.
> > > > >
> > > > > Can you tell me how exactly the Versaclock outputs are wired?
> > > >
> > > > The SoC is expecting a fixed external 50 MHz clock connected to
> > > > USB_EXTAL.  Instead of a fixed clock, we're using the Versaclock.
> > > > We're also using the Versaclock to drive the AVB TXCRefClk,
> > > > du_dotclkiun0 and du_dotclkin2 (also also called du_dotclkin3 on
> > > > RZ/G2N) instead of fixed clocks.
> > > >
> > > > > E.g. for USB, the bindings don't say anything about a third clock input,
> > > > > so I'd like to know where that clock is fed into USB.
> > > >
> > > > The way the driver is crafted, it can take in multiple clocks and it
> > > > goes through a list to enable them all, so I added the versaclock to
> > > > the array.  Without the versaclock reference, the clock doesn't get
> > > > turned on and the USB fails to operate.
> > >
> > > According to the Hardware User's Manual, USBL_EXTAL is used for USB3.0,
> > > while you added the clock references to the EHCI nodes.
> > > Are you sure EHCI is failing without this?

Geert,

I talked to a colleague about the USB_EXTAL.  He pointed me to table
60.1 of the RZ/2 Series, 2nd Generate reference manual
(R01UH0808EJ0100 Rev.1.00),  which shows the USB EHCI needing the
50MHz.  When I clear out the references from ehci0 and echi1, the USB
stops working, so it does appear that using the versaclock as the 3rd
clock is needed for operating.  The device tree bindings for the
generic-ehci provide for up to 4 clocks, so it seems like referencing
clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3> are
not a violation of the bindings.

I can add a better description when I do the V2 update for this if you like.


> > > Still, it means we need to extend the bindings/driver for
> > > renesas,rcar-gen3-xhci to handle USB_EXTAL.
> >
> > After investigating this, it looks like the USB_EXTAL is already
> > referenced from the device tree and it's referenced by the USB3 Phy.
> > The SoC calls it usb_extal_clk.  Since the phy driver is calling
> > devm_clk_get() it looks like i could just redefine the clocks of
> > usb3_phy0 to point to the versaclock instead of usb_extal_clk.
> >
> > The other option is to use a similar method I proposed for the audio
> > reference clock and redefine the usb_extal_clk as a fixed
> > fixed-factor-clock.
> >
> > Do you have a preference as to which direction I go?
>
> I'd go for the classical solution: override the clocks property of the
> usb3_phy0 node.

I dug into the USB3_phy and it enables and immediately disables the
clocks for the simple purpose of determining which clock reference to
use between usb3s0_clk or usb_extal_clk.  I was hoping that simply
referencing the versaclock here would be sufficient, but the Beacon
board has a usb3s0_clk at 100MHz, and the driver appears to use it
instead of the versaclock so adding the versaclock reference here
isn't sufficient to make it work for the ehci, nor do I think it's
appropriate.

It seems like the driver shouldn't immediately disable the clocks, but
they're expecting external fixed clocks.  Since we meet that criteria
with the usb3s0_clk, the USB3 works without the versaclock reference.

adam
>
> Thanks!
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
