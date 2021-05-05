Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32165373A5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 May 2021 14:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233197AbhEEMKR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 May 2021 08:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233370AbhEEMJf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 May 2021 08:09:35 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00562C061379;
        Wed,  5 May 2021 05:07:27 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id g14so1708115edy.6;
        Wed, 05 May 2021 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rx1VEX81q1ChdjCI07W8anCY28BJeunkExULztPi9nU=;
        b=KR3JcDeA+BT6mJwqCLQrjcZ+IVskCYY/9MExMq+fMPbPht/fJLesVE9WO1Auk8ylE0
         6lMtae/shaHTrbJnQivibZ0Tl8Vw5PHkEtKhmEY3+Xkxd2BbbkQm2qMwq7WscHj+wJAS
         m0EW8TEvfYQ++G6nZQCdSFn6DNUMM3QNjHYrkYGEyc/Nooa2+ecAF2ksMFCgccDONDFH
         nUUPp0A1z2DreHxwJigVmWBQYASc92bY9IkJ/1teg3cxdt5TRfmS8zl5KAlBuwDfqwLx
         gQ82lfMYE0aY/Gsn7/EpipGEeJjRItsNob3aY8WibQU3pLy0qtbnrOFIQIIKaqKloXCI
         mm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rx1VEX81q1ChdjCI07W8anCY28BJeunkExULztPi9nU=;
        b=lQQhvVM0hsOwI9UIuWOFwXogPRaqhb8MqmUy1RgJnAghbemE32wHay3ahcD1hsVT8K
         LNHTuoct6hjkCRbraAKw3rqvfB/3NJgB+cgrFAcnCa439YGbaLN+o/hGnF+uCmRQIfXZ
         EskqGyPKxLAjqLk2dyHkElwg8cs4i0gQ3OGPGj79t6At1G3x3gFAUvH9Q0AFb97HpEZv
         BItKQWQ4yk5IzLRL/3QJSbcFcTYaKjzCJY7FYwH1Htr+mUlMHOzZ37XLwSSUHj8iuwPe
         Tql6rHWsMNTwzynC3YB/1JbGzCKai+BfqcaJO+AXewfVg6bWu9xqB8Dcp/PiZIJQfBKP
         Q+zw==
X-Gm-Message-State: AOAM531LmVKo0zXFLRPCvjcmUKydzklMcW1V/m7HSIswrCjJCG5clrii
        QyAUDY4yAKfyIkb/6sS43xs9v/9wmk2YUgxKzVg=
X-Google-Smtp-Source: ABdhPJw00WIlIQRb3MdcSb+o7FmfX4fziLXK/2zeqEbJF2aHAZwE8rJfgiZR07fCMgrZ//y+mgw/QoCensBdwUyFyfU=
X-Received: by 2002:aa7:c349:: with SMTP id j9mr31677913edr.230.1620216446365;
 Wed, 05 May 2021 05:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-2-aford173@gmail.com>
 <CAMuHMdWRieM1H5WLySVDVQds-xKgsqo-OibegJrXgonfqbAL8g@mail.gmail.com>
 <CAHCN7xL3KU4dA=0-S7J5AEPmjAtpz4j-frEUqBD=JU7BV7g1WA@mail.gmail.com>
 <CAMuHMdWc=qD=Oqa-7o9K1bd_OM0L7Br8BVAbDvYNraO0wAX2jw@mail.gmail.com>
 <CAHCN7xKsSgM+=MFOKpNZTsJJiNyx6_mqZL2g_PKhN5fWyE6y7Q@mail.gmail.com>
 <CAMuHMdVxzcyVuK06BqE4GQPLE8J7V5Jc-W_RSENNxEQG68krCw@mail.gmail.com>
 <CAHCN7xJVn7gbCX8ibSFbyjA4HqyxPR9_vXvJQQSbJRKoaF_51Q@mail.gmail.com>
 <CAMuHMdV0djkKTSHbCuv0d2sh+rGs1=WNNEcCNXE3daM8uAcRxw@mail.gmail.com>
 <CAHCN7x+re5Qswbw=n8Gq0newXW0WoO7=ZseD3YZWMvD_nmBq3w@mail.gmail.com> <CAMuHMdUDb8e3Vv3C3N74D2-VYgsyVEHG9iVcnuNESTX6NArkFA@mail.gmail.com>
In-Reply-To: <CAMuHMdUDb8e3Vv3C3N74D2-VYgsyVEHG9iVcnuNESTX6NArkFA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 5 May 2021 07:07:12 -0500
Message-ID: <CAHCN7xLtYxQtY4NDo2UVdwbEJ5mKcL2jysack2yddCp6-+p95g@mail.gmail.com>
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
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Charles Stevens <charles.stevens@logicpd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 28, 2020 at 6:33 AM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> Hi Adam,
>
> On Thu, Dec 24, 2020 at 2:53 PM Adam Ford <aford173@gmail.com> wrote:
> > On Tue, Dec 22, 2020 at 2:03 AM Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
> > > On Tue, Dec 22, 2020 at 2:39 AM Adam Ford <aford173@gmail.com> wrote:
> > > > On Fri, Dec 18, 2020 at 7:16 AM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> > > > > On Thu, Dec 17, 2020 at 12:52 PM Adam Ford <aford173@gmail.com> w=
rote:
> > > > > > On Thu, Dec 17, 2020 at 2:16 AM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > > > > > On Wed, Dec 16, 2020 at 6:03 PM Adam Ford <aford173@gmail.com=
> wrote:
> > > > > > > > On Wed, Dec 16, 2020 at 8:55 AM Geert Uytterhoeven <geert@l=
inux-m68k.org> wrote:
> > > > > > > > > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail=
.com> wrote:
> > > > > > > > > > When the board was added, clock drivers were being upda=
ted done at
> > > > > > > > > > the same time to allow the versaclock driver to properl=
y configure
> > > > > > > > > > the modes.  Unforutnately, the updates were not applied=
 to the board
> > > > > > >
> > > > > > > > > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-basebo=
ard.dtsi
> > > > > > > > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-basebo=
ard.dtsi
> > > > > > > > > > @@ -5,6 +5,7 @@
> > > > > > > > > >
> > > > > > > > > >  #include <dt-bindings/gpio/gpio.h>
> > > > > > > > > >  #include <dt-bindings/input/input.h>
> > > > > > > > > > +#include <dt-bindings/clk/versaclock.h>
> > > > > > > > > >
> > > > > > > > > >  / {
> > > > > > > > > >         backlight_lvds: backlight-lvds {
> > > > > > > > > > @@ -294,12 +295,12 @@ &du_out_rgb {
> > > > > > > > > >  &ehci0 {
> > > > > > > > > >         dr_mode =3D "otg";
> > > > > > > > > >         status =3D "okay";
> > > > > > > > > > -       clocks =3D <&cpg CPG_MOD 703>, <&cpg CPG_MOD 70=
4>;
> > > > > > > > > > +       clocks =3D <&cpg CPG_MOD 703>, <&cpg CPG_MOD 70=
4>, <&versaclock5 3>;
> > > > > > > > >
> > > > > > > > > Why this change? You said before you don't need this
> > > > > > > > > https://lore.kernel.org/linux-renesas-soc/CAHCN7xJWbP16SA=
-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com/
> > > > > > > > >
> > > > > > > >
> > > > > > > > I had talked with the hardware guys about buy pre-programme=
d
> > > > > > > > versaclock chips which would have been pre-configured and p=
re-enabled.
> > > > > > > > I thought it was going to happen, but it didn't, so we need=
 the
> > > > > > > > versaclock driver to enable the reference clock for the USB
> > > > > > > > controllers, ethernet controller and audio clocks.  Previou=
sly we were
> > > > > > > > manually configuring it or it was coincidentally working. I=
deally,
> > > > > > > > we'd have the clock system intentionally enable/disable the=
 clocks
> > > > > > > > when drivers are loaded/unloaded for for power management r=
easons.
> > > > > > >
> > > > > > > Can you tell me how exactly the Versaclock outputs are wired?
> > > > > >
> > > > > > The SoC is expecting a fixed external 50 MHz clock connected to
> > > > > > USB_EXTAL.  Instead of a fixed clock, we're using the Versacloc=
k.
> > > > > > We're also using the Versaclock to drive the AVB TXCRefClk,
> > > > > > du_dotclkiun0 and du_dotclkin2 (also also called du_dotclkin3 o=
n
> > > > > > RZ/G2N) instead of fixed clocks.
> > > > > >
> > > > > > > E.g. for USB, the bindings don't say anything about a third c=
lock input,
> > > > > > > so I'd like to know where that clock is fed into USB.
> > > > > >
> > > > > > The way the driver is crafted, it can take in multiple clocks a=
nd it
> > > > > > goes through a list to enable them all, so I added the versaclo=
ck to
> > > > > > the array.  Without the versaclock reference, the clock doesn't=
 get
> > > > > > turned on and the USB fails to operate.
> > > > >
> > > > > According to the Hardware User's Manual, USBL_EXTAL is used for U=
SB3.0,
> > > > > while you added the clock references to the EHCI nodes.
> > > > > Are you sure EHCI is failing without this?
> >
> > I talked to a colleague about the USB_EXTAL.  He pointed me to table
> > 60.1 of the RZ/2 Series, 2nd Generate reference manual
> > (R01UH0808EJ0100 Rev.1.00),  which shows the USB EHCI needing the
> > 50MHz.  When I clear out the references from ehci0 and echi1, the USB
> > stops working, so it does appear that using the versaclock as the 3rd
> > clock is needed for operating.  The device tree bindings for the
> > generic-ehci provide for up to 4 clocks, so it seems like referencing
> > clocks =3D <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3> are
> > not a violation of the bindings.
>
> Perhaps you need to use renesas,rcar-usb2-clock-sel?
> Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
>

Geert,

Sorry to resurrect an old thread, but I've been working with a
colleague on this, but we've had a lot of interruptions, and we're
just now getting back to this.

Based on our previous conversations, you didn=E2=80=99t want me to add a
reference clock to the EHCI node, because you wanted us to use the
rcar-usb2-clock-sel driver.
If I just add the node for the rcar-usb2-clock-sel  that references
the versaclock, the clock tree shows it=E2=80=99s present, but neither the
rcar-usb2-clock-sel nor the versaclock are actually enabled.  From
what we=E2=80=99re seeing, the rcar-usb2-clock-sel driver needs a consumer =
in
order for it to activate.

It seems like it makes sense to optionally associate the
rcar-usb2-clock-sel to all USB nodes, including the USB3 node. The
EHCI controller section in the UG calls out USB_XTAL/USB_EXTAL as
external pins as well as the USBHS module calling out the same pins in
its overview section.  The USB3 Phy section mentions
USB_XTAL/USB_EXTAL, but for some reason the USB3 controller overview
does not mention them as =E2=80=9Cexternal pins=E2=80=9D

I=E2=80=99d like to propose that we add an optional reference clock for the
USB3 which can point to the rcar-usb2-clock-sel.
On the USB EHCI nodes where I previously wanted to reference the
versaclock, I=E2=80=99d like to reference the rcar-usb2-clock-sel.

The clock tree would look something like:
     Versaclock-> rcar-usb2-clock-sel->USB

The EHCI clocks would look like:
 clocks =3D <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&usb2_clksel>

If we do it this way, we=E2=80=99d need to modify the rcar-usb2-clock-sel t=
o
enable the external versaclock and keep it enabled.  Currently, it
enables the clock, reads the clock speed and shuts down after
determining the clock speed.

An alternative to modifying the rcar-usb2-clock-sel code would be to
add both usb2_clksel and the versaclock reference to the EHCI nodes,
but I know you were not completely satisfied with that idea, but it
would likely not require any code changes.

Versaclock-> rcar-usb2-clock-sel->USB<-versaclock

The ECHI clocks would like:
clocks =3D <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>,
<&usb2_clksel>

Before I move forward on writing this code, I'd like to make sure
you're OK with one of those options , since there are a few ways to do
it.  If you have another suggestion, I'm willing to do that instead.

adam
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
