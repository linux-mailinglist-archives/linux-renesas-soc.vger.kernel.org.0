Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4564B325
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 09:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfFSHeK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 03:34:10 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45499 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfFSHeK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 03:34:10 -0400
Received: by mail-lf1-f68.google.com with SMTP id u10so11265409lfm.12;
        Wed, 19 Jun 2019 00:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VW4Cp5ek0vb4QtqRCxv8BZywls0dRbsD7ASrUWev8OI=;
        b=roTOgyWcD4j2Ajnnkt+BQ5H3PYV2PXy1+b5VyN+cmY+FQU67/31z/6ba403V/aGfSD
         IIyK3XjPIIjyAMH2DrP+Iik4ja/HnB/ptEXULxJbYaviZQRSGvI1yAklTSjS1B9qhY+U
         g+Ifkj1FaKtEgJVE2LTumotUxJc7k1wEHqXVGnUwN4hmViI/XmssM59n/W836ghgsH60
         P8q6/21lvduApUe6QsDP6Bnz2Ki9sAjMPKqmCe6bC7lQR4jJDPyWrf1Y+6+ahhPUCn9P
         cUKvv+6/AyQaKH750gNgThko7kP8xPuzlMLRRRoIAovYyJQUqLLREFKyXcrFK9n02BGv
         4jwg==
X-Gm-Message-State: APjAAAXKisa4TPntn+d1RnIRaJ9qRx2kWXybhndjnEuw34JpYWYqnTu5
        y6eSIdiAHnitwpfIgOPx7jJFrpIoB9cSwCB0PdGzoA==
X-Google-Smtp-Source: APXvYqzr+ikpJYw7CRxK8QBm66gMcKeDrfegqyW3im12taF0F0VOrbF6dnT8jX5vHljT4SmdMK7epHvDsGD3aPVue2k=
X-Received: by 2002:a19:7f17:: with SMTP id a23mr18880078lfd.49.1560929647887;
 Wed, 19 Jun 2019 00:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdU8oag+1oNa_jS=v99W05=8SRLhdoZdCusmeVf1VZbarQ@mail.gmail.com> <TY1PR01MB17707C3C979FB60611FB34A7C0EA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB17707C3C979FB60611FB34A7C0EA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Jun 2019 09:33:55 +0200
Message-ID: <CAMuHMdVb+sc0vdvbsAE0fkEY6wFS7KsbtqLmtB03ghVeuiHe1w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Tue, Jun 18, 2019 at 5:56 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Geert Uytterhoeven
> > Sent: 18 June 2019 16:10
> > Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
> >
> > On Fri, Jun 14, 2019 at 3:17 PM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > This patch adds LEDs support to the HiHope RZ/G2[MN] Main Board
> > > common device tree.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > @@ -17,6 +17,30 @@
> > >                 stdout-path = "serial0:115200n8";
> > >         };
> > >
> > > +       leds {
> > > +               compatible = "gpio-leds";
> > > +
> > > +               led0 {
> > > +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> > > +                       label = "LED0";
> >
> > There's no need for a label property, if it matches the node name
> > (applies to all four LEDs).
>
> I could have used the actual names on the schematic, but then I realised that
> would not have been too helpful due to the corresponding switch names:
> LED0 - GP6_11 - SW2202 - LED2201
> LED1 - GP6_12 - SW2201 - LED2202
> LED2 - GP6_13 - SW2203 - LED2203
> LED3 - GP0_00 - N/A - LED2402
> The first 3 LEDs are found next to the micro USB connector for the debug console,
> the forth LED is found next to the WiFi and BT LEDs.
>
> I thought that using "LEDn" as labels would put a remark on the
> "desired ordering" of the LEDs (even though there is no actual
> requirement for that), but as you pointed out it's probably a bit
> confusing? Do you think I should take the label out?

If the LEDs don't have nice labels on the PCB, I would drop the label
properties.

> > Note that this GPIO is shared with a switch, like on Salvator-X(S) and
> > ULCB.  As currently Linux cannot handle both, describing the LED
> > precludes adding the switch later.
> > (applies to the first 3 LEDs).
>
> Thank you for pointing this out. That's desired behaviour in this case.

OK.

> > > +               led3 {
> > > +                       gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
> > > +                       label = "LED3";
> > > +               };
> >
> > I cannot find LED3. According to the schematics GP0_0 == CS0n is used
> > as the chipselect for the LVDS switch?
>
> My understanding is that CS0n is on GP1_20, could you please double
> check?
> (pin name: AJ4) GP0_00 == D0 == ExD0 on the schematic I have, I thought
> you may have been looking at an older version of the schematic, but after
> going through the history it seems like that line has always been there.

Sorry, my mistake.  As there is no GP0_0 in the schematic, I looked up
the pin number in the docs, but ended up using the R-Car M3-W SiP pin
number, instead of the RZ/G2M FCBGA SoC pin number :-(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
