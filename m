Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 132AEFAEC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 11:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727678AbfKMKos (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 05:44:48 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:39204 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfKMKos (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 05:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kvtuen9NUxjRmvtFGYNShRuWZ73W73fPXLDttAqY7iE=; b=QivEy3YhYpbtWRSJHGj5bZUfP
        J6Rno+DA+ATD7ZghcTxxqrc0+IyjzH071t5o8kuR8Xzff34KIC+HPOGUE6FcxX/dEjcDPgncKtdwv
        lCYAaTX/+TO+plrNHMe4SGsVgtfrU36yHsfvHC3G+2p/CFZdMptUKmGTzg3+qbtl7yvgF7DX2IeaM
        p8HMcm2hdLzJenlOtRmBdR3FBWI0EKGZVV+rvcctKqpq0moTLPbeh6nLExz6LPiwnPNgXLg/9HiJk
        SdQWZlPH22qaT04sWqDoiS7DuEL2cBcC+45AOqU1AL/brcjuMWIo1VA0AX1gRLoZBXldmmmLum1rM
        ONTst1S/A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39056)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iUq8f-0003c8-Cz; Wed, 13 Nov 2019 10:44:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iUq8d-0002OV-HN; Wed, 13 Nov 2019 10:44:39 +0000
Date:   Wed, 13 Nov 2019 10:44:39 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Eric Miao <eric.miao@nvidia.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC] ARM: boot: Relax kernel image alignment for RZ/A
 with CS3 SDRAM
Message-ID: <20191113104439.GN25745@shell.armlinux.org.uk>
References: <20191113102729.29303-1-geert+renesas@glider.be>
 <20191113104037.e45j37xoxeztvut3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191113104037.e45j37xoxeztvut3@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 13, 2019 at 11:40:37AM +0100, Uwe Kleine-König wrote:
> On Wed, Nov 13, 2019 at 11:27:29AM +0100, Geert Uytterhoeven wrote:
> > The RZA2MEVB sub board has 64 MiB of SDRAM at 0x0C000000 (CS3 space).
> 
> This wording is misleading. You don't adapt the limit because 128 MiB >
> the amount of RAM on that platform but because the alignment of the CS3
> space isn't a multiple of 128 MiB. So I suggest:
> 
> 	On the RZA2MEVB the SDRAM's base is at 0x0C000000 which isn't
> 	aligned to 128 MiB. So to ensure the assumptions of the
> 	decompressor are valid the used alignment must be decreased.
> 
> > Hence the mask for CONFIG_AUTO_ZRELADDR needs to be changed, otherwise
> > the system will crash because it will try to decompress a zImage or
> > uImage to a non-RAM garbage address.
> > 
> > Based on a patch in the BSP by Chris Brandt <chris.brandt@renesas.com>.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > No idea what to do with the rest of the comment, or if this breaks
> > existing platforms.
> 
> I would assume that it indeed breaks existing platforms. So maybe better
> make this configurable, default to 128 MiB and select it to 64 MiB on
> the affected platform? If the resulting kernel supports also other
> machines a warning (at compile time) might be a good idea.

Are we going back to non-multi-platform kernels? ;)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
