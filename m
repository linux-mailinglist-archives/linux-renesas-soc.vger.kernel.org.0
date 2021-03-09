Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC08F332040
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 09:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbhCIIJK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 03:09:10 -0500
Received: from mail-vs1-f49.google.com ([209.85.217.49]:35389 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhCIIIx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 03:08:53 -0500
Received: by mail-vs1-f49.google.com with SMTP id j12so4076956vsm.2;
        Tue, 09 Mar 2021 00:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vPUUC5NOOI07+JZDCNzm3fWcBLuWSnpoZYLuk26btPk=;
        b=LYGP8W26Ofv1CXL5cKVt4Cy05NhiWMgnTSLV2HAzsHMFAaGzV/X0vW+36B4XV6e3DD
         5fPF56RBARMI5oYMgGd3s955lG/+8IIjZvFTJX2DL+A++7gfEFOM3o8YyNKO2Eocx3FY
         U+RURh9Denh4egqrQOT4rowpKlZ3R6snD99NW1Q1gyCvRE5S6IRLLV+QN7bgfR+tjBJN
         q+owS2tjllYxuCoZGLT5BbSfF2uef9DRZFhlNIV5igKjNDroxBqmnYZAcjE2xB6QMADu
         l7vTc3/qn3PNiGq8fLEUsK2vPkehtJ7zFdxMPSN8MBJr0vok9SOqrHZamWgPR+AWPlBA
         fg5g==
X-Gm-Message-State: AOAM533ErYqyIf5WcL92yUDTHRw7N3MPaP7Hud27dVEO+T2JfCknbBzj
        T5/VSdhhPPQDLOi5vmxptv7HoMQRQ8cFhy8EmyE=
X-Google-Smtp-Source: ABdhPJz9nXBJJar99emYdQQKLqeElKhOWeIWp4UPFQbUwPlqADzS3wbNDYHpc27cS8UBRFuwQQxeAelC5piFVZEiUD8=
X-Received: by 2002:a67:fe90:: with SMTP id b16mr16200934vsr.40.1615277332317;
 Tue, 09 Mar 2021 00:08:52 -0800 (PST)
MIME-Version: 1.0
References: <20210305133703.42179-1-geert+renesas@glider.be> <20210308221636.GA3031492@robh.at.kernel.org>
In-Reply-To: <20210308221636.GA3031492@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Mar 2021 09:08:41 +0100
Message-ID: <CAMuHMdVf=VQJacSgMy1fcYx4yn=kNYxTWiZP5G4UVEVPYhvgCQ@mail.gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: arm: renesas: Document Renesas Falcon sub-boards
To:     Rob Herring <robh@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Mon, Mar 8, 2021 at 11:16 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, Mar 05, 2021 at 02:37:03PM +0100, Geert Uytterhoeven wrote:
> > Add device tree bindings documentation for the Renesas R-Car V3U Falcon
> > CSI/DSI and Ethernet sub-boards.  These are plugged into the Falcon
> > BreakOut board to form the full Falcon board stack.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Marked as RFC
> >
> > The Falcon board stack consists of 4 boards:
> >   1. CPU board, containing the R-Car V3U SoC, and core system parts like
> >      RAM, console, eMMC,
> >   2. BreakOut board, providing power, an Ethernet PHY, and a backplane
> >      where boards 1, 3, and 4 are plugged in,
> >   3. CSI/DSI sub-board, providing 2 GMSL displays and 12 GMSL cameras,
> >   4. Ethernet sub-board, providing 6 Ethernet PHYs.
> >
> > As the BreakOut board provides power, the CPU board cannot be used
> > without the BreakOut board.  However, both the CSI/DSI and Ethernet
> > sub-boards are optional.  So that means we have to support 4 stacks of
> > board combinations (1+2, 1+2+3, 1+2+4, 1+2+3+4).
> >
> > That sounds like a good target for fdtoverlay, right?
> >
> > For now[1] the Falcon include hierarchy looks like this (supporting only
> > the full stack 1+2+3+4):
> >
> >     r8a779a0-falcon.dts
> >     |-- r8a779a0-falcon-cpu.dtsi
> >     |   `-- r8a779a0.dtsi
> >     |-- r8a779a0-falcon-csi-dsi.dtsi
> >     `-- r8a779a0-falcon-ethernet.dtsi
> >
> > Traditionally, we augmented the "model" and "compatible" properties of
> > the root node in each additional layer:
> >
> >     r8a779a0.dtsi:
> >       compatible = "renesas,r8a779a0";
> >
> >     r8a779a0-falcon-cpu.dtsi:
> >       model = "Renesas Falcon CPU board";
> >       compatible = "renesas,falcon-cpu", "renesas,r8a779a0";
> >
> >     r8a779a0-falcon.dts:
> >       model = "Renesas Falcon CPU and Breakout boards based on r8a779a0";
> >       compatible = "renesas,falcon-breakout", "renesas,falcon-cpu", "renesas,r8a779a0";
> >
> > (Note: I haven't done that yet for the CSI/DSI and Ethernet sub-boards)
> >
> > With a stack of 4 boards, some optional, this becomes a bit cumbersome.
> > But it is still doable when using .dts and .dtsi files, by just adding 3
> > more r8a779a0-falcon*.dts files.
> >
> > So we can add model/compatible properties to the sub-boards:
> >
> >     r8a779a0-falcon-csi-dsi.dtsi
> >       model = "Renesas Falcon CSI/DSI sub-board";
> >       compatible = "renesas,falcon-csi-dsi";
> >
> >     r8a779a0-falcon-ethernet.dtsi:
> >       model = "Renesas Falcon Ethernet sub-board";
> >       compatible = "renesas,falcon-ethernet";
> >
> > and update r8a779a0-falcon*dts to augment the properties.
> >
> > However, this is currently not possible when using overlays, as applying
> > an overlay would override the properties in the underlying DTB, not
> > augment them.
> >
> > Questions:
> >   a. Should we document all possible combinations in the bindings file?
> >      After this patch, we only have 1, 1+2, and 1+2+3+4 documented.
> >
> >   b. How to handle "model" and "compatible" properties for (sub)boards?
> >      Perhaps fdtoverlay could combine the "model" and "compatible"
> >      properties in the root nodes?  However, that is not always desired.
>
> I think we just don't want to put sub-board compatibles in the root
> compatible at least if they are optional, peripheral components like
> this case seems to be. For something like a SoM plus baseboard I tend to
> feel differently.

OK, makes sense.

> Do you really need it? I'd assume you could just check for the

Just being cautious.  We once (actually 5 times) needed a quirk for
boards with regulators keeping shared IRQS asserted[1].  Something
like that might happen with an expansion board, too.

> components? Or we define connectors and under the connector we define a
> top level compatible for the sub-board. This sounds like an eval or
> validation board? Those tend to have every possible option and I'm not
> sure we want to solve that before solving the simple cases.

Let's do without for now.  We can still check for main board compatible
value + components when needed.

Thanks!

[1] arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
