Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9B8D303A9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 11:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404235AbhAZKn2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 05:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404228AbhAZKmr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 05:42:47 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC04C061573;
        Tue, 26 Jan 2021 02:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hr2jNE3FMs8l6Tfz1HIwxXewKUv5fGgvc4zfcKNrlaA=; b=WEjIlqkhoVgDHdg9Ci9uC20sx
        Aq1xjvy8PWLCLqhxTv70yicvH+0kQAObTd0/f5e+0xFweCfTW1eThsfgw69Wqj+VBXTZsNd2j8hoT
        fSgHaIniEvMfRZKBIcSRlaUv8TJHVSKuBViU6pScN25mk7DhylHilRVZZImp/bOqeBszQ/rJ9lwbr
        OrhK0yRPaGHjC7MX78I7otVrF+x9Z4vD6alNVN3KqU0ashV2KonhjSEGtgYnfMcKLVOMShZEk2SHL
        xYpxuF9hV0A6H/lMUHaQFeljsooO23dqnz1ZUtyOVWNu6AgqYX7L9ABu+UlenVS2SEatkKZEJnBE6
        o5pnSNlug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52916)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1l4LnI-0004Hj-Tt; Tue, 26 Jan 2021 10:41:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1l4LnH-0003jP-6L; Tue, 26 Jan 2021 10:41:55 +0000
Date:   Tue, 26 Jan 2021 10:41:55 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm: smp: remove unused variable
Message-ID: <20210126104155.GF1551@shell.armlinux.org.uk>
References: <20201228120147.59387-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWD-8YxdrTmaTW7YTOFj+8hHM5LvegnC274QOTOO_gXcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWD-8YxdrTmaTW7YTOFj+8hHM5LvegnC274QOTOO_gXcg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 26, 2021 at 11:04:47AM +0100, Geert Uytterhoeven wrote:
> Hi Wolfram,
> 
> On Mon, Dec 28, 2020 at 1:03 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Not used anymore after refactoring:
> >
> > arch/arm/kernel/smp.c: In function ‘show_ipi_list’:
> > arch/arm/kernel/smp.c:543:16: warning: variable ‘irq’ set but not used [-Wunused-but-set-variable]
> >   543 |   unsigned int irq;
> >
> > Fixes: 88c637748e31 ("ARM: smp: Use irq_desc_kstat_cpu() in show_ipi_list()")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> 
> Known issue since Dec 15, and still not fixed...
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Those who cause breakage really should be the ones to look at patches
that fix their breakage.

The way patches get applied is if they end up in my patch system... if
they don't make it there, they don't get applied.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
