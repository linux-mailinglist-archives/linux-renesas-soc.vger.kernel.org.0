Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEEA2E3723
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 13:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgL1Me1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 07:34:27 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:34686 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgL1Me0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 07:34:26 -0500
Received: by mail-oi1-f182.google.com with SMTP id s75so11331752oih.1;
        Mon, 28 Dec 2020 04:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DhsUhlUGmAXN4EXX9F3nlVv3tC7B658SwbZ+95FpGT4=;
        b=b1Z0fkOevfh7DpxR3c/IpSgdBWwBxC5KOwEuR0SPHmeFpnXPPidwv6gGGi7xIxmq7q
         U8m7hVmD3Qb73R7zM01SHNwbNm1kt0yP7OIm+botPj02nr+eVYYhmkF1PU0gBBnUy+Gj
         rQPhUgWcCpFq/fIpzn0d6omRU3h1MlcgNv4H8jNozhffijzHEulc7KSIDKwH07gqFeZQ
         3sCueKtMx2diUL2ozWyjU46h7/NnUg3z2fZrIe2jpzfLt1Jl4vp4R68pCxg/KCwXi0LU
         G5qLoNG1OZvcBsO7NPUsh38B6MaLoCo6k9kNTCGXQlyjqdA2AdoHAK4uRhIVOUNZea5s
         6Wig==
X-Gm-Message-State: AOAM532F73mVkOUCBBtZ0+DlCP2d3xLrw4GQ+CA8yplvtUI0aD24iw2h
        HLrc3d0ERGEc6D4v8J9e5EltMIXQUSC2EwYZUno=
X-Google-Smtp-Source: ABdhPJxYxCfpY77LW3Syfq+6c6sxzRzLeyvGO2sN+ocx1LIFlKkBBp2K/v4U8f4+/D3C/pxkp+2tD6kca1sUJPRYSMg=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr11722486oih.153.1609158825156;
 Mon, 28 Dec 2020 04:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-2-aford173@gmail.com>
 <CAMuHMdWRieM1H5WLySVDVQds-xKgsqo-OibegJrXgonfqbAL8g@mail.gmail.com>
 <CAHCN7xL3KU4dA=0-S7J5AEPmjAtpz4j-frEUqBD=JU7BV7g1WA@mail.gmail.com>
 <CAMuHMdWc=qD=Oqa-7o9K1bd_OM0L7Br8BVAbDvYNraO0wAX2jw@mail.gmail.com>
 <CAHCN7xKsSgM+=MFOKpNZTsJJiNyx6_mqZL2g_PKhN5fWyE6y7Q@mail.gmail.com>
 <CAMuHMdVxzcyVuK06BqE4GQPLE8J7V5Jc-W_RSENNxEQG68krCw@mail.gmail.com>
 <CAHCN7xJVn7gbCX8ibSFbyjA4HqyxPR9_vXvJQQSbJRKoaF_51Q@mail.gmail.com>
 <CAMuHMdV0djkKTSHbCuv0d2sh+rGs1=WNNEcCNXE3daM8uAcRxw@mail.gmail.com> <CAHCN7x+re5Qswbw=n8Gq0newXW0WoO7=ZseD3YZWMvD_nmBq3w@mail.gmail.com>
In-Reply-To: <CAHCN7x+re5Qswbw=n8Gq0newXW0WoO7=ZseD3YZWMvD_nmBq3w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Dec 2020 13:33:34 +0100
Message-ID: <CAMuHMdUDb8e3Vv3C3N74D2-VYgsyVEHG9iVcnuNESTX6NArkFA@mail.gmail.com>
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

On Thu, Dec 24, 2020 at 2:53 PM Adam Ford <aford173@gmail.com> wrote:
> On Tue, Dec 22, 2020 at 2:03 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Dec 22, 2020 at 2:39 AM Adam Ford <aford173@gmail.com> wrote:
> > > On Fri, Dec 18, 2020 at 7:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Thu, Dec 17, 2020 at 12:52 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > On Thu, Dec 17, 2020 at 2:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Wed, Dec 16, 2020 at 6:03 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > > > On Wed, Dec 16, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > > > > > When the board was added, clock drivers were being updated done at
> > > > > > > > > the same time to allow the versaclock driver to properly configure
> > > > > > > > > the modes.  Unforutnately, the updates were not applied to the board
> > > > > >
> > > > > > > > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > > > > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > > > > > > @@ -5,6 +5,7 @@
> > > > > > > > >
> > > > > > > > >  #include <dt-bindings/gpio/gpio.h>
> > > > > > > > >  #include <dt-bindings/input/input.h>
> > > > > > > > > +#include <dt-bindings/clk/versaclock.h>
> > > > > > > > >
> > > > > > > > >  / {
> > > > > > > > >         backlight_lvds: backlight-lvds {
> > > > > > > > > @@ -294,12 +295,12 @@ &du_out_rgb {
> > > > > > > > >  &ehci0 {
> > > > > > > > >         dr_mode = "otg";
> > > > > > > > >         status = "okay";
> > > > > > > > > -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> > > > > > > > > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
> > > > > > > >
> > > > > > > > Why this change? You said before you don't need this
> > > > > > > > https://lore.kernel.org/linux-renesas-soc/CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com/
> > > > > > > >
> > > > > > >
> > > > > > > I had talked with the hardware guys about buy pre-programmed
> > > > > > > versaclock chips which would have been pre-configured and pre-enabled.
> > > > > > > I thought it was going to happen, but it didn't, so we need the
> > > > > > > versaclock driver to enable the reference clock for the USB
> > > > > > > controllers, ethernet controller and audio clocks.  Previously we were
> > > > > > > manually configuring it or it was coincidentally working. Ideally,
> > > > > > > we'd have the clock system intentionally enable/disable the clocks
> > > > > > > when drivers are loaded/unloaded for for power management reasons.
> > > > > >
> > > > > > Can you tell me how exactly the Versaclock outputs are wired?
> > > > >
> > > > > The SoC is expecting a fixed external 50 MHz clock connected to
> > > > > USB_EXTAL.  Instead of a fixed clock, we're using the Versaclock.
> > > > > We're also using the Versaclock to drive the AVB TXCRefClk,
> > > > > du_dotclkiun0 and du_dotclkin2 (also also called du_dotclkin3 on
> > > > > RZ/G2N) instead of fixed clocks.
> > > > >
> > > > > > E.g. for USB, the bindings don't say anything about a third clock input,
> > > > > > so I'd like to know where that clock is fed into USB.
> > > > >
> > > > > The way the driver is crafted, it can take in multiple clocks and it
> > > > > goes through a list to enable them all, so I added the versaclock to
> > > > > the array.  Without the versaclock reference, the clock doesn't get
> > > > > turned on and the USB fails to operate.
> > > >
> > > > According to the Hardware User's Manual, USBL_EXTAL is used for USB3.0,
> > > > while you added the clock references to the EHCI nodes.
> > > > Are you sure EHCI is failing without this?
>
> I talked to a colleague about the USB_EXTAL.  He pointed me to table
> 60.1 of the RZ/2 Series, 2nd Generate reference manual
> (R01UH0808EJ0100 Rev.1.00),  which shows the USB EHCI needing the
> 50MHz.  When I clear out the references from ehci0 and echi1, the USB
> stops working, so it does appear that using the versaclock as the 3rd
> clock is needed for operating.  The device tree bindings for the
> generic-ehci provide for up to 4 clocks, so it seems like referencing
> clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3> are
> not a violation of the bindings.

Perhaps you need to use renesas,rcar-usb2-clock-sel?
Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
