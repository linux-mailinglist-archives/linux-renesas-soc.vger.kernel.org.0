Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4081B2BD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 18:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgDUQCR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 12:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725930AbgDUQCR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 12:02:17 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1222C061A10;
        Tue, 21 Apr 2020 09:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=FMOKi9JN1zmL3ex+upDVJ+JPiBtToBzeS9dSmqwVosg=; b=Wv6j/tRpqNiXWtF1allIjgglQ
        wCkIn+1dSOjzx9s33cJ53XlMgapGXUtnCb87O5un+VMg1aZajWfMzSGd2TLBW8Ha6HdyQFbcmaA+v
        tWr5M4uIJJL8JlK8h+oeULeBZkaTITb/e+qz/iY3KKQusbXCUnh0eQyPlKeifFOAIuLwgz6GrXi+A
        HPLTTUh3Jh80t9DHH3VzrBbmkW8I3f09LA/iFFNnaOrM+wJl3c7CNREETRaIphmZwgMZ87zjSdxEj
        CHV4voJDJ7W4lRx797+SBuXSukrYpeOouAJK0WPecaqpr/j2txC5GXfdYzeLjbT4xNEP9p0Mjkw9j
        i4qtFisaQ==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:41646)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jQvLE-0002XX-Id; Tue, 21 Apr 2020 17:01:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jQvL7-00079R-7Q; Tue, 21 Apr 2020 17:01:37 +0100
Date:   Tue, 21 Apr 2020 17:01:37 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] ARM: boot: Obtain start of physical memory from DTB
Message-ID: <20200421160137.GE25745@shell.armlinux.org.uk>
References: <20200415153409.30112-1-geert+renesas@glider.be>
 <CAMj1kXHm=xA4gafwAaBn8=YcAsQCYDNmZ=4REsfvEUgZShm3Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHm=xA4gafwAaBn8=YcAsQCYDNmZ=4REsfvEUgZShm3Ww@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 21, 2020 at 05:19:40PM +0200, Ard Biesheuvel wrote:
> On Wed, 15 Apr 2020 at 17:34, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > Currently, the start address of physical memory is obtained by masking
> > the program counter with a fixed mask of 0xf8000000.  This mask value
> > was chosen as a balance between the requirements of different platforms.
> > However, this does require that the start address of physical memory is
> > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > requirement is not fulfilled.
> >
> > Fix this limitation by obtaining the start address from the DTB instead,
> > if available (either explicitly passed, or appended to the kernel).
> > Fall back to the traditional method when needed.
> >
> > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > i.e. not at a multiple of 128 MiB.
> >
> > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> 
> This is ready to go into the patch system, no?
> 
> The sooner Russell picks it up, the sooner I can respin my patches
> that go on top.

This seems to be a particularly risky change (it's already been subject
to various failures for people) so I do not intend to rush to pick it
up.

In any case, Masahiro Yamada has resubmitted a patch to sort out the
libfdt builds that he's been trying to get merged for some time now,
so I'm going to be giving that priority. Your change conflicts with
this libfdt build change.

So, I think all in all, it needs to spend a bit longer being provenly
tested before I merged it (and eventually fixed up for the libfdt
change), and I don't think merging it so it appears in linux-next
will help with that.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
