Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1A6917068C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 18:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgBZRth (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 12:49:37 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:51634 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbgBZRth (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 12:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=x4Vj5piDPv46jmto0S7kmzvMB3oeWgg0MLt8q+7J4pg=; b=X6G/6ilIcCd1TgGGgK+EjpM9H
        YeSpKBMXuBd0P6L1c1In2MmwfFSlk+y3/LR9g4MWSKAtjqupNwvexTcrfOa2i7G4KOZFg+LqFa7mL
        Uyb7HqBUxvXggFxapouOssHYL+sac+84WVWKFEZNBCB3E7GTDP2FP5rZzkvrE2TvSQPHahtsZCOyz
        /93Wf6cSUY/ScvGy4ad5pg5ZnqX12cPJy858sASWPVsPqWqVZDWWtVozIxc33kYefFs9QsSR896Hz
        p/FGW7P/75xIZM5YMNFNDGNVxgich89QGMaLlXdZxt9PWMwhh9M3VIM2o2jvNnJC8DRj7uIz1Ts/m
        4dfpdcGJA==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:53116)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1j70o4-0000ZM-Bz; Wed, 26 Feb 2020 17:49:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1j70nx-0000A1-E1; Wed, 26 Feb 2020 17:49:05 +0000
Date:   Wed, 26 Feb 2020 17:49:05 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: boot: Fix ATAGs with appended DTB
Message-ID: <20200226174905.GE25745@shell.armlinux.org.uk>
References: <CGME20200225144815eucas1p1229ceb0d017b46cbbe2409639a7c1f83@eucas1p1.samsung.com>
 <20200225144749.19815-1-geert+renesas@glider.be>
 <e249c123-8d00-4aa3-34b8-f82d52428966@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e249c123-8d00-4aa3-34b8-f82d52428966@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 26, 2020 at 07:35:14AM +0100, Marek Szyprowski wrote:
> Hi Geert,
> 
> On 25.02.2020 15:47, Geert Uytterhoeven wrote:
> > At early boot, register r8 may contain an ATAGs or DTB pointer.
> > When an appended DTB is found, its address is stored in r8, for
> > extraction of the RAM base address later.
> >
> > However, if r8 contained an ATAGs pointer before, that pointer will be
> > lost, and the provided ATAGs is no longer folded into the provided DTB.
> >
> > Fix this by leaving r8 untouched.
> >
> > Fixes: 137e522593918be2 ("ARM: 8960/1: boot: Obtain start of physical memory from DTB")
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

The original commit hasn't been submitted, so it can be fixed before it
hits mainline if you want.  Let me know what you want to do.  Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
