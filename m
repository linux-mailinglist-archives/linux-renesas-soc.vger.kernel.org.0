Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4B32CB0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 18:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfE1QFN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 12:05:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58882 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbfE1QFN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 12:05:13 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6F41B25AD7D;
        Wed, 29 May 2019 02:05:11 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 51FA5E212E7; Tue, 28 May 2019 18:05:09 +0200 (CEST)
Date:   Tue, 28 May 2019 18:05:09 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Oleksandr Tyshchenko <olekstysh@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julien Grall <julien.grall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V5] ARM: mach-shmobile: Don't init CNTVOFF/counter if
 PSCI is available
Message-ID: <20190528160509.5vunuxxxcjduobpb@verge.net.au>
References: <1558087093-22113-1-git-send-email-olekstysh@gmail.com>
 <CAMuHMdVC=aNQTZ0r+7qpiWEyEaoQ587pm1FxhWqR3pwHwv2ARg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVC=aNQTZ0r+7qpiWEyEaoQ587pm1FxhWqR3pwHwv2ARg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 28, 2019 at 10:27:56AM +0200, Geert Uytterhoeven wrote:
> Hi Oleksandr,
> 
> On Fri, May 17, 2019 at 11:58 AM Oleksandr Tyshchenko
> <olekstysh@gmail.com> wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > If PSCI is available then most likely we are running on PSCI-enabled
> > U-Boot which, we assume, has already taken care of resetting CNTVOFF
> > and updating counter module before switching to non-secure mode
> > and we don't need to.
> >
> > As the psci_smp_available() helper always returns false if CONFIG_SMP
> > is disabled, it can't be used safely as an indicator of PSCI usage.
> > For that reason, we check for the mandatory PSCI operation to be
> > available.
> >
> > Please note, an extra check to prevent secure_cntvoff_init() from
> > being called for secondary CPUs in headsmp-apmu.S is not needed,
> > as SMP code for APMU based system is not executed if PSCI is in use.
> >
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> >    Changes in v5:
> >       - Check for psci_ops.cpu_on if CONFIG_ARM_PSCI_FW is defined
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Two cosmetic comments below. I'll leave it to Simon to ignore them for
> applying ;-)

Oleksandr, could I trouble you to respin with the
changes suggested by Geert?

> 
> > @@ -62,6 +63,21 @@ void __init rcar_gen2_timer_init(void)
> >  {
> >         void __iomem *base;
> >         u32 freq;
> > +       bool need_update = true;
> 
> Some people like reverse Xmas tree declaration order...
> 
> > +
> > +       /*
> > +        * If PSCI is available then most likely we are running on PSCI-enabled
> > +        * U-Boot which, we assume, has already taken care of resetting CNTVOFF
> > +        * and updating counter module before switching to non-secure mode
> > +        * and we don't need to.
> > +        */
> > +#if defined(CONFIG_ARM_PSCI_FW)
> 
> #ifdef CONFIG_ARM_PSCI_FW ?
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
> 
