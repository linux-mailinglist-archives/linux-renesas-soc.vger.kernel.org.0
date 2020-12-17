Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B5E2DCD80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 09:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgLQIRh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 03:17:37 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:47067 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgLQIRg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 03:17:36 -0500
Received: by mail-ot1-f53.google.com with SMTP id w3so26451059otp.13;
        Thu, 17 Dec 2020 00:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DRkib19GY9SGtyX+MPcBbrQbFZN6frBiaalsVVLI5vo=;
        b=q35hq5avdC8Exn+RRSiE2edQcOWGgN8FPaY5FwP3958lL3vbVxBG3xr1gJyXjOfYq2
         OvwhmgiWQC35unNpXEtv755CuMbU6VqCdA7YzXvToTBCTtwibSwBEZlVDQpWn/W/dzXu
         aj0JbVxfziQWZDfWR1HXxbU1QQFSyTW2/F3aDGosrRxDqKFhhUHAWF8HkSMlCw6KLDoT
         GEhye42yggNadSjuI0EGeKD2j2B0U1d5KaDRORVbNZMtAjRupfsOyaszA9hE/ePIpW+2
         sJBNBRAOvXGAOSsRPsSvTA/Hbrw59BDwQ9AXqnzllpZxRjesMYs5xnkx9LSrp9u80dk+
         HVnA==
X-Gm-Message-State: AOAM531IywWsCT935pl/UMjASZnHaCNr/moHFcT8YX75SpmkciumIjRv
        nZtqaKCLU+XiD+08lUM/v8vu+NieKNK+Qzy01H8=
X-Google-Smtp-Source: ABdhPJwfT2lJ9VDkqEO0SRMPijbldtGsHGs7WTBRJYQFWgl2gfK+oQjlXl/eq2Cro6PKOLjPr//z4bwA4GwNs1WiyNk=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr28626570otc.145.1608193015622;
 Thu, 17 Dec 2020 00:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-2-aford173@gmail.com>
 <CAMuHMdWRieM1H5WLySVDVQds-xKgsqo-OibegJrXgonfqbAL8g@mail.gmail.com> <CAHCN7xL3KU4dA=0-S7J5AEPmjAtpz4j-frEUqBD=JU7BV7g1WA@mail.gmail.com>
In-Reply-To: <CAHCN7xL3KU4dA=0-S7J5AEPmjAtpz4j-frEUqBD=JU7BV7g1WA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 09:16:44 +0100
Message-ID: <CAMuHMdWc=qD=Oqa-7o9K1bd_OM0L7Br8BVAbDvYNraO0wAX2jw@mail.gmail.com>
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
        Luca Ceresoli <luca@lucaceresoli.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Wed, Dec 16, 2020 at 6:03 PM Adam Ford <aford173@gmail.com> wrote:
> On Wed, Dec 16, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > When the board was added, clock drivers were being updated done at
> > > the same time to allow the versaclock driver to properly configure
> > > the modes.  Unforutnately, the updates were not applied to the board

> > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > @@ -5,6 +5,7 @@
> > >
> > >  #include <dt-bindings/gpio/gpio.h>
> > >  #include <dt-bindings/input/input.h>
> > > +#include <dt-bindings/clk/versaclock.h>
> > >
> > >  / {
> > >         backlight_lvds: backlight-lvds {
> > > @@ -294,12 +295,12 @@ &du_out_rgb {
> > >  &ehci0 {
> > >         dr_mode = "otg";
> > >         status = "okay";
> > > -       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
> > > +       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
> >
> > Why this change? You said before you don't need this
> > https://lore.kernel.org/linux-renesas-soc/CAHCN7xJWbP16SA-Ok-5syNnqOZAt8OFJo2_rtg5VrNVsN2-eiQ@mail.gmail.com/
> >
>
> I had talked with the hardware guys about buy pre-programmed
> versaclock chips which would have been pre-configured and pre-enabled.
> I thought it was going to happen, but it didn't, so we need the
> versaclock driver to enable the reference clock for the USB
> controllers, ethernet controller and audio clocks.  Previously we were
> manually configuring it or it was coincidentally working. Ideally,
> we'd have the clock system intentionally enable/disable the clocks
> when drivers are loaded/unloaded for for power management reasons.

Can you tell me how exactly the Versaclock outputs are wired?
E.g. for USB, the bindings don't say anything about a third clock input,
so I'd like to know where that clock is fed into USB.

> Thank you for the review.  Is that the only patch in the series with
> concerns?  I probably won't get to V2 until this weekend.

Sorry, I still have to review the other patches in your series.
Anyway, we have time until the end of January to queue DT patches for
v5.12...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
