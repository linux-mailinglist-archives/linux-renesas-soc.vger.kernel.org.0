Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6245E28F2FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Oct 2020 15:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbgJONNN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Oct 2020 09:13:13 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:53839 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbgJONNN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 09:13:13 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B685460004;
        Thu, 15 Oct 2020 13:13:09 +0000 (UTC)
Date:   Thu, 15 Oct 2020 17:12:53 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r8a779a0: Add CSI-2 nodes
Message-ID: <20201015151253.36jpl2rnqc3hcrxn@uno.localdomain>
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
 <20201014094443.11070-4-jacopo+renesas@jmondi.org>
 <CAMuHMdW_z3Rppv4LcMabbfZ9SLY+TxDjw7=13F2sWStMdEdaag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdW_z3Rppv4LcMabbfZ9SLY+TxDjw7=13F2sWStMdEdaag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Oct 15, 2020 at 02:43:51PM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Wed, Oct 14, 2020 at 11:40 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Add CSI-2 nodes to R8A779A0 R-Car V3U SoC.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Thanks for your patch!
>
> > The chip manual reports that the CSI-2 units are fed with S1D1 and S1D2
> > clocks. The same applies to other SoCs, but none lists the two
> > additional clocks in the DTS node. So I left them out here as well.
>
> As these clocks are always-on, and as long as the driver does't
> care about the actual clock rates, that is fine.
>
> > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > @@ -105,6 +105,47 @@ scif0: serial@e6e60000 {
> >                         status = "disabled";
> >                 };
> >
> > +               csi40: csi2@feaa0000 {
> > +                       compatible = "renesas,r8a779a0-csi2";
> > +                       reg = <0 0xfeaa0000 0 0x10000>;
> > +                       interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 331>;
> > +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 331>;
> > +                       status = "disabled";
>
> Missing "ports" subnode?

I decided to left the nodes unconnected, but without 'ports' the dts
will probably fail at validation time.

Same for the VINs.

>
> Apart from that:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
