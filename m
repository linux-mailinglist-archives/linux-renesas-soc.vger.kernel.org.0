Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24DF12DD0D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbgLQLxJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbgLQLxI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:53:08 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648B3C061794;
        Thu, 17 Dec 2020 03:52:28 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id z136so27233748iof.3;
        Thu, 17 Dec 2020 03:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SWAnzpoIcE5rEwzTDRr2wTpeH8UpAAJFMs0DyDjCpqM=;
        b=sYvid2XG3x7b/6t0LkLeGAdk9h3WY2FincKoCHtxCWzv76/zw/Lmlu1reWy6pED7Hy
         QmHHvVVtG3ZXtAexF/hWf4VgB6h2RDEwWVIQl5fKKo6NOJngk6rwpVPvBxzASxf9bQoc
         04GNRnlazw+lXUHtDg2BdI0nIeoE9dzTQFDI5y+r2du0gbUFwNeOclu/jOppfQhLrPmm
         s4UPC4mIsZUKuzzr7078aNpbZxsmmkqpsvw7m55PcIY1cus6xlujWgM4ZNFlA38V3Um9
         Y+IvcAbBIiGmSj6YfY7T247/BaTG+UueT5gRONFdSKUhGnvSXPu2FhAKaQNGQKxaoaGi
         5l1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SWAnzpoIcE5rEwzTDRr2wTpeH8UpAAJFMs0DyDjCpqM=;
        b=TK29FO+2xAo3NLUb9HD8ZJU2um6mI7UoprIYz1JUq5DMiRN2NTjaUXjlT5/Evgkm61
         O1WBsYIVYjA/TwSafrFhqFE/JwwIDV2FLLqt8Y4zE6plTRUnkYyYFXOWw0oh8DAm9/2U
         rb/o/X68eqzVaNCir2fv7SrmGApf5hY+jhA++vwuk4jMvprPwtsJIoyOaKD7hsklcy9o
         b4Fn3mnqDbEzb7kLfnV+AjuPGZPXjLCJalIuCnQu59Rlxy8lky/Ntz1hh6yv+IWY+iRU
         SKJl0URwLFdXrTZLetWabtAzxYhmrdWJDQmemQr/XsRmHMLTq0M5rpH2RPg+eUwSe3Qo
         sgfQ==
X-Gm-Message-State: AOAM533zvhMwE/CXQgn345GGizvlgOFHcQ46HsAZXn+PyDJFmA3wfewX
        VAWy+3Ad5Mgv9vhDCbSR64pboHBzuxNwEPZw05s=
X-Google-Smtp-Source: ABdhPJxLqPiDWz8F0NrugQuAfroa5tM3N+LuhLGdowWERAYKEafweFFocLSidDpsv3IWLXVCK90HBFHvAYtKQHaN7sk=
X-Received: by 2002:a02:caac:: with SMTP id e12mr46551817jap.45.1608205947532;
 Thu, 17 Dec 2020 03:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-2-aford173@gmail.com>
 <CAMuHMdWRieM1H5WLySVDVQds-xKgsqo-OibegJrXgonfqbAL8g@mail.gmail.com>
 <CAHCN7xL3KU4dA=0-S7J5AEPmjAtpz4j-frEUqBD=JU7BV7g1WA@mail.gmail.com> <CAMuHMdWc=qD=Oqa-7o9K1bd_OM0L7Br8BVAbDvYNraO0wAX2jw@mail.gmail.com>
In-Reply-To: <CAMuHMdWc=qD=Oqa-7o9K1bd_OM0L7Br8BVAbDvYNraO0wAX2jw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 17 Dec 2020 05:52:16 -0600
Message-ID: <CAHCN7xKsSgM+=MFOKpNZTsJJiNyx6_mqZL2g_PKhN5fWyE6y7Q@mail.gmail.com>
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

On Thu, Dec 17, 2020 at 2:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> On Wed, Dec 16, 2020 at 6:03 PM Adam Ford <aford173@gmail.com> wrote:
> > On Wed, Dec 16, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > > When the board was added, clock drivers were being updated done at
> > > > the same time to allow the versaclock driver to properly configure
> > > > the modes.  Unforutnately, the updates were not applied to the board
>
> > > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > @@ -5,6 +5,7 @@
> > > >
> > > >  #include <dt-bindings/gpio/gpio.h>
> > > >  #include <dt-bindings/input/input.h>
> > > > +#include <dt-bindings/clk/versaclock.h>
> > > >
> > > >  / {
> > > >         backlight_lvds: backlight-lvds {
> > > > @@ -294,12 +295,12 @@ &du_out_rgb {
> > > >  &ehci0 {
> > > >         dr_mode = "otg";
> > > >         status = "okay";
> > > > -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> > > > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
> > >
> > > Why this change? You said before you don't need this
> > > https://lore.kernel.org/linux-renesas-soc/CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com/
> > >
> >
> > I had talked with the hardware guys about buy pre-programmed
> > versaclock chips which would have been pre-configured and pre-enabled.
> > I thought it was going to happen, but it didn't, so we need the
> > versaclock driver to enable the reference clock for the USB
> > controllers, ethernet controller and audio clocks.  Previously we were
> > manually configuring it or it was coincidentally working. Ideally,
> > we'd have the clock system intentionally enable/disable the clocks
> > when drivers are loaded/unloaded for for power management reasons.
>
> Can you tell me how exactly the Versaclock outputs are wired?

The SoC is expecting a fixed external 50 MHz clock connected to
USB_EXTAL.  Instead of a fixed clock, we're using the Versaclock.
We're also using the Versaclock to drive the AVB TXCRefClk,
du_dotclkiun0 and du_dotclkin2 (also also called du_dotclkin3 on
RZ/G2N) instead of fixed clocks.

> E.g. for USB, the bindings don't say anything about a third clock input,
> so I'd like to know where that clock is fed into USB.

The way the driver is crafted, it can take in multiple clocks and it
goes through a list to enable them all, so I added the versaclock to
the array.  Without the versaclock reference, the clock doesn't get
turned on and the USB fails to operate.

The DU clocks are also expecting an array, so I added the versaclock
to that array as well.

It's similar to the rationale that I'm trying to add the option clock
for the AVB TXC_Ref clock on the other path.  We're using the
versaclock there as well.  The difference is that in the case of the
AVB_TXCRefClk, the driver isn't expecting an array of clocks, it's
only expecting a single clock.  In order to enable the additional
clock,  I started the patch to accept the optional clock for the
TXCRefClk in order to get the clock system to enable the clock.

Because the Versaclock isn't programmed to automatically start, they
need the consumers of the clock to request and enable them.

I admit that I'll probably need to update the bindings to add the
extra clocks as optional, so if you want, I can submit additional
patches to add these optional clocks to their respective bindings.

>
> > Thank you for the review.  Is that the only patch in the series with
> > concerns?  I probably won't get to V2 until this weekend.
>
> Sorry, I still have to review the other patches in your series.
> Anyway, we have time until the end of January to queue DT patches for
> v5.12...

Great.  Thank you,

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
