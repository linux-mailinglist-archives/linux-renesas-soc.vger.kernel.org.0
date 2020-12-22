Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB7F2E0707
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 09:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgLVIEH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 03:04:07 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:37985 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgLVIEH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 03:04:07 -0500
Received: by mail-oi1-f178.google.com with SMTP id x13so13981630oic.5;
        Tue, 22 Dec 2020 00:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TU6Z+p8rj7hNy0WqWgXcrf5QYAgxuq/VfyW2F/dym7w=;
        b=Hhzq+EZqd216/xREV5Hvt18pANFBNDVE9bAd4IcAWzwD5ZklTyShx6DFhrwK0WxRSz
         Nv74pR3TMO26d9d+fi3ru9SC/EAMzxcwHYVNbt9uWr/c8MkrALmst5G3uiYqkLs+9R8s
         MsHl7JpeoI/x2Kf8P/Ldx6H1kKohz6SJkWM7A3c4SZbaNAFdYEZzHIBGr4wgE+hcuAmz
         gt8k9FE0eJ5E54AXIDZ7qy6M2dbZ0F5zAQEyKk6S41NGRYXlGj8tzhVEFnfefYMWDDqj
         TNiWrQd70ImF+5ykIK1wbCwK8LFUSM6JwUN6MHqxzPCiwJRLfc6qeWXnZW29tubgqvVW
         t/ww==
X-Gm-Message-State: AOAM531rBYTEMS9dF5PQabmonsJAF2M8gYFkjt1Dd4nvDQfILKaXvAc4
        KeybH5ZFsASgPS/clHothdpPmW+FJyJbKTC4w0s=
X-Google-Smtp-Source: ABdhPJy8kwkFwEN0N8CEZzEhFn3lX9B9xGYYPTYwNy/KlTmu9ei9Wndk6t/Jx+35ngXCas3lYyW9leNojEeKzYk5UP0=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr13485908oih.153.1608624205483;
 Tue, 22 Dec 2020 00:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-2-aford173@gmail.com>
 <CAMuHMdWRieM1H5WLySVDVQds-xKgsqo-OibegJrXgonfqbAL8g@mail.gmail.com>
 <CAHCN7xL3KU4dA=0-S7J5AEPmjAtpz4j-frEUqBD=JU7BV7g1WA@mail.gmail.com>
 <CAMuHMdWc=qD=Oqa-7o9K1bd_OM0L7Br8BVAbDvYNraO0wAX2jw@mail.gmail.com>
 <CAHCN7xKsSgM+=MFOKpNZTsJJiNyx6_mqZL2g_PKhN5fWyE6y7Q@mail.gmail.com>
 <CAMuHMdVxzcyVuK06BqE4GQPLE8J7V5Jc-W_RSENNxEQG68krCw@mail.gmail.com> <CAHCN7xJVn7gbCX8ibSFbyjA4HqyxPR9_vXvJQQSbJRKoaF_51Q@mail.gmail.com>
In-Reply-To: <CAHCN7xJVn7gbCX8ibSFbyjA4HqyxPR9_vXvJQQSbJRKoaF_51Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 09:03:14 +0100
Message-ID: <CAMuHMdV0djkKTSHbCuv0d2sh+rGs1=WNNEcCNXE3daM8uAcRxw@mail.gmail.com>
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

On Tue, Dec 22, 2020 at 2:39 AM Adam Ford <aford173@gmail.com> wrote:
> On Fri, Dec 18, 2020 at 7:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Dec 17, 2020 at 12:52 PM Adam Ford <aford173@gmail.com> wrote:
> > > On Thu, Dec 17, 2020 at 2:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Wed, Dec 16, 2020 at 6:03 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > On Wed, Dec 16, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > > > When the board was added, clock drivers were being updated done at
> > > > > > > the same time to allow the versaclock driver to properly configure
> > > > > > > the modes.  Unforutnately, the updates were not applied to the board
> > > >
> > > > > > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > > > > @@ -5,6 +5,7 @@
> > > > > > >
> > > > > > >  #include <dt-bindings/gpio/gpio.h>
> > > > > > >  #include <dt-bindings/input/input.h>
> > > > > > > +#include <dt-bindings/clk/versaclock.h>
> > > > > > >
> > > > > > >  / {
> > > > > > >         backlight_lvds: backlight-lvds {
> > > > > > > @@ -294,12 +295,12 @@ &du_out_rgb {
> > > > > > >  &ehci0 {
> > > > > > >         dr_mode = "otg";
> > > > > > >         status = "okay";
> > > > > > > -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> > > > > > > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
> > > > > >
> > > > > > Why this change? You said before you don't need this
> > > > > > https://lore.kernel.org/linux-renesas-soc/CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com/
> > > > > >
> > > > >
> > > > > I had talked with the hardware guys about buy pre-programmed
> > > > > versaclock chips which would have been pre-configured and pre-enabled.
> > > > > I thought it was going to happen, but it didn't, so we need the
> > > > > versaclock driver to enable the reference clock for the USB
> > > > > controllers, ethernet controller and audio clocks.  Previously we were
> > > > > manually configuring it or it was coincidentally working. Ideally,
> > > > > we'd have the clock system intentionally enable/disable the clocks
> > > > > when drivers are loaded/unloaded for for power management reasons.
> > > >
> > > > Can you tell me how exactly the Versaclock outputs are wired?
> > >
> > > The SoC is expecting a fixed external 50 MHz clock connected to
> > > USB_EXTAL.  Instead of a fixed clock, we're using the Versaclock.
> > > We're also using the Versaclock to drive the AVB TXCRefClk,
> > > du_dotclkiun0 and du_dotclkin2 (also also called du_dotclkin3 on
> > > RZ/G2N) instead of fixed clocks.
> > >
> > > > E.g. for USB, the bindings don't say anything about a third clock input,
> > > > so I'd like to know where that clock is fed into USB.
> > >
> > > The way the driver is crafted, it can take in multiple clocks and it
> > > goes through a list to enable them all, so I added the versaclock to
> > > the array.  Without the versaclock reference, the clock doesn't get
> > > turned on and the USB fails to operate.
> >
> > According to the Hardware User's Manual, USBL_EXTAL is used for USB3.0,
> > while you added the clock references to the EHCI nodes.
> > Are you sure EHCI is failing without this?
> >
> > Still, it means we need to extend the bindings/driver for
> > renesas,rcar-gen3-xhci to handle USB_EXTAL.
>
> After investigating this, it looks like the USB_EXTAL is already
> referenced from the device tree and it's referenced by the USB3 Phy.
> The SoC calls it usb_extal_clk.  Since the phy driver is calling
> devm_clk_get() it looks like i could just redefine the clocks of
> usb3_phy0 to point to the versaclock instead of usb_extal_clk.
>
> The other option is to use a similar method I proposed for the audio
> reference clock and redefine the usb_extal_clk as a fixed
> fixed-factor-clock.
>
> Do you have a preference as to which direction I go?

I'd go for the classical solution: override the clocks property of the
usb3_phy0 node.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
