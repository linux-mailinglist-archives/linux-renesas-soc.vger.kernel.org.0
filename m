Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C500B4613C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 12:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240348AbhK2LW2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 06:22:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242732AbhK2LUQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 06:20:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599FFC061A16;
        Mon, 29 Nov 2021 02:34:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BFCADB80E58;
        Mon, 29 Nov 2021 10:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F305C004E1;
        Mon, 29 Nov 2021 10:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638182057;
        bh=4iPiUiPIc+VM22h/qw+lAfg+m8wof+zg6KfOSm+51FY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G4i9Thjj6feymwqEaOaOgswivNiP/FG+jmr6aCzKy9fTMBUh9B0MJRt4t8/EYn5au
         g50j/NZI1RJ6BUfLDwof73QE69+RYp+umID5YOicNecbMg0hEbkXz67VcSYi6ggTwT
         UMTzXYNZrHrJrRdHlejUYsoLxX7ml6Xt1oSUCXG03Z07J2c4aGUeIa24HAM/SBVILZ
         BG9cdKpnSlUOn07bVqZ6eGQeEBvSSpgXcj72Y5VtL6QhTnpgoIarIH78AmDVKVSmZT
         Nj+HZ+YlC5i4kJe+fc8SN/SnAdXG9XIQ8WX6sosJpwrT8o5IwvtnYK8SPxjBn1y42y
         iCp/9/u5MeEAQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mrdzC-008Zjc-Ec; Mon, 29 Nov 2021 10:34:14 +0000
Date:   Mon, 29 Nov 2021 10:34:14 +0000
Message-ID: <87tufvmes9.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        John Crispin <john@phrozen.org>, Biwen Li <biwen.li@nxp.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] of/irq: Add a quirk for controllers with their own definition of interrupt-map
In-Reply-To: <OSZPR01MB7019E7DD7119EFF9C994AA62AA649@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20211122103032.517923-1-maz@kernel.org>
        <CAMuHMdX2ZRvDYA3idmw3nBcP6CO=2od6ZU-UeJo9vYsuB=fQNQ@mail.gmail.com>
        <8735no70tt.wl-maz@kernel.org>
        <CAMuHMdVS67BLP2XEdD6ZvVBVE2x11gKnQa1TqG659HXPM5scqQ@mail.gmail.com>
        <CAMuHMdWJhnXabKGpW7k944dzQHtwQtxw-yb2bRBsoaMw6N6nuA@mail.gmail.com>
        <87tug3clvc.wl-maz@kernel.org>
        <CAMuHMdWGb2xik+94RVwtq8E6+9eN=HfQLX3a4sTjKQXR96Udkw@mail.gmail.com>
        <87r1b7ck40.wl-maz@kernel.org>
        <OSZPR01MB7019E7DD7119EFF9C994AA62AA649@OSZPR01MB7019.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: prabhakar.mahadev-lad.rj@bp.renesas.com, geert@linux-m68k.org, robh@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel-team@android.com, john@phrozen.org, biwen.li@nxp.com, Chris.Brandt@renesas.com, linux-renesas-soc@vger.kernel.org, prabhakar.csengg@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 27 Nov 2021 00:42:49 +0000,
Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> 
> Hi Marc,
> 
> > -----Original Message-----
> > From: Marc Zyngier <maz@kernel.org>
> > Sent: 23 November 2021 09:11
> > To: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; kernel-team@android.com; Rob Herring
> > <robh@kernel.org>; John Crispin <john@phrozen.org>; Biwen Li <biwen.li@nxp.com>; Chris Brandt
> > <Chris.Brandt@renesas.com>; linux-renesas-soc@vger.kernel.org; Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH] of/irq: Add a quirk for controllers with their own definition of interrupt-map
> > 
> > On Tue, 23 Nov 2021 08:44:19 +0000,
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >
> > > Hi Marc,
> > >
> > > On Tue, Nov 23, 2021 at 9:33 AM Marc Zyngier <maz@kernel.org> wrote:
> > > > On Tue, 23 Nov 2021 07:57:48 +0000,
> > > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > Summarized:
> > > > >   - Before the bad commit, and after your fix, irqc-rza1 is invoked,
> > > > >     and the number of interrupts seen is correct, but input events
> > > > >     are doubled.
> > > > >   - After the bad commit, irqc-rza1 is not invoked, and there is an
> > > > >     interrupt storm, but input events are OK.
> > > >
> > > > OK, that's reassuring, even if the "twice the events" stuff isn't
> > > > what you'd expect. We at least know this is a separate issue, and
> > > > that this patch on top of -rc1 brings you back to the 5.15 behaviour.
> > > >
> > > > I'd expect it to be the case for the other platforms as well.
> > >
> > > OK.
> > >
> > > BTW, what would have been the correct way to do this for irqc-rza1?
> > > I think we're about to make the same mistake with RZ/G2L IRQC
> > > support[1]?
> > 
> > Indeed, and I was about to look into it.
> > 
> > There are multiple ways to skin this cat, including renaming 'interrupt-map' to 'my-own-private-
> > interrupt-map'. Or use something akin the new 'msi-range' (which we could call interrupt-range), and
> > replace:
> > 
> >   interrupt-map = <0 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> >                   <1 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> >                   <2 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> >                   <3 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> >                   <4 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> >                   <5 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> >                   <6 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> >                   <7 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> > 
> > with:
> > 
> >   interrupt-range = <&gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0 8>;
> > 
> Just to clarify, do you suggest to add interrupt-range as a generic
> DT property or SoC/company specific property?

As a generic one. I have no interest in SoC-specific stuff (though you
are free to invent your own and run it by Rob).

> If you meant to add generic property where would you suggest to
> document this property?

Ideally collocated with the rest of the interrupt properties.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
