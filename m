Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC501C74F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2020 17:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729786AbgEFPdr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 May 2020 11:33:47 -0400
Received: from foss.arm.com ([217.140.110.172]:39578 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729411AbgEFPdr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 May 2020 11:33:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B02E4D6E;
        Wed,  6 May 2020 08:33:46 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com [10.1.196.255])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC0003F68F;
        Wed,  6 May 2020 08:33:45 -0700 (PDT)
Date:   Wed, 6 May 2020 16:33:40 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     linux-pci <linux-pci@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] PCI: pcie-rcar: Cache PHY init function pointer
Message-ID: <20200506153340.GA2978@e121166-lin.cambridge.arm.com>
References: <20200426123148.56051-1-marek.vasut@gmail.com>
 <20200428083231.GC12459@e121166-lin.cambridge.arm.com>
 <717765f1-b5be-a436-20d6-d0a95f58cbdc@gmail.com>
 <20200505180214.GA18468@e121166-lin.cambridge.arm.com>
 <a7971547-869a-b3ca-5934-4ce5028aacf1@gmail.com>
 <20200506085736.GA30251@e121166-lin.cambridge.arm.com>
 <CAMuHMdUB2JySwcw0PCEFKNrvmOhF5q=CG265wm1a=Pivn-fWLQ@mail.gmail.com>
 <20200506091928.GA2805@red-moon.cambridge.arm.com>
 <CAMuHMdVYOmDMKEiYmT0hFhVL46K4fLCRykpixyDPFPxrMsN75g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVYOmDMKEiYmT0hFhVL46K4fLCRykpixyDPFPxrMsN75g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 06, 2020 at 12:22:13PM +0200, Geert Uytterhoeven wrote:
> Hi Lorenzo,
> 
> On Wed, May 6, 2020 at 11:19 AM Lorenzo Pieralisi
> <lorenzo.pieralisi@arm.com> wrote:
> > On Wed, May 06, 2020 at 11:02:31AM +0200, Geert Uytterhoeven wrote:
> > > On Wed, May 6, 2020 at 10:57 AM Lorenzo Pieralisi
> > > <lorenzo.pieralisi@arm.com> wrote:
> > > > On Tue, May 05, 2020 at 08:35:04PM +0200, Marek Vasut wrote:
> > > > > On 5/5/20 8:02 PM, Lorenzo Pieralisi wrote:
> > > > > > On Fri, May 01, 2020 at 10:42:06PM +0200, Marek Vasut wrote:
> > > > > >> On 4/28/20 10:32 AM, Lorenzo Pieralisi wrote:
> > > > > >>> On Sun, Apr 26, 2020 at 02:31:47PM +0200, marek.vasut@gmail.com wrote:
> > > > > >>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> > > > > >>>>
> > > > > >>>> The PHY initialization function pointer does not change during the
> > > > > >>>> lifetime of the driver instance, it is therefore sufficient to get
> > > > > >>>> the pointer in .probe(), cache it in driver private data, and just
> > > > > >>>> call the function through the cached pointer in .resume().
> > > > > >>>>
> > > > > >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > > > > >>>> Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > > > >>>> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > > > > >>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > >>>> Cc: Wolfram Sang <wsa@the-dreams.de>
> > > > > >>>> Cc: linux-renesas-soc@vger.kernel.org
> > > > > >>>> ---
> > > > > >>>> NOTE: Based on git://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git
> > > > > >>>>       branch pci/rcar
> > > > > >>>> NOTE: The driver tag is now 'pcie-rcar' to distinguish it from pci-rcar-gen2.c
> > > > > >>>> ---
> > > > > >>>>  drivers/pci/controller/pcie-rcar.c | 10 ++++------
> > > > > >>>>  1 file changed, 4 insertions(+), 6 deletions(-)
> > > > > >>>
> > > > > >>> Squashed in https://patchwork.kernel.org/patch/11438665
> > > > > >>
> > > > > >> Thanks
> > > > > >>
> > > > > >>> Do you want me to rename the $SUBJECT (and the branch name while at it)
> > > > > >>> in the patches in my pci/rcar branch ("PCI: pcie-rcar: ...") to start
> > > > > >>> the commit subject tag renaming from this cycle (and in the interim you
> > > > > >>> send a rename for the drivers files ?)
> > > > > >>
> > > > > >> I don't really have a particular preference either way. I can keep
> > > > > >> marking the drivers with pcie-rcar and pci-rcar tags if that helps
> > > > > >> discern them.
> > > > > >
> > > > > > So:
> > > > > >
> > > > > > - "rcar" for the PCIe driver
> > > > >
> > > > > Wouldn't it be better to mark this rcar-pcie , so it's clear it's the
> > > > > PCIe driver ?
> > > >
> > > > All other drivers in drivers/pci/controller are PCIe but don't require
> > > > an extra tag to clarify it - that's the rationale behind "rcar".
> > > >
> > > > How does that sound ?
> > >
> > > Are there any other platforms that have two different drivers for the same
> > > platform, one for PCI, and one for PCIe?
> >
> > I don't think so - nonetheless it's time we agreed on something and be
> > done with it. Bjorn expressed his opinion on this and unless we have a
> > compelling reason not to follow it IMO it'd be better to take it.
> >
> > I don't think using rcar-pcie is a disaster either.
> >
> > Let me know how you want to proceed, thanks.
> 
> /me has just returned from a bike ride, so it's time for a bike-shed
> 
> "PCI: rcar:" for pcie-rcar.c, "PCI: rcar-gen2:" (or "PCI: rcar2"?) for
> pci-rcar-gen2.c?

Fine by me, all agreed ?

Lorenzo
