Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31541FAEF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 11:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfKMKvE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 05:51:04 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55589 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfKMKvD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 05:51:03 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iUqEf-0004fz-G4; Wed, 13 Nov 2019 11:50:53 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iUqEd-0005zF-K8; Wed, 13 Nov 2019 11:50:51 +0100
Date:   Wed, 13 Nov 2019 11:50:51 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.miao@nvidia.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] ARM: boot: Relax kernel image alignment for RZ/A
 with CS3 SDRAM
Message-ID: <20191113105051.3fexzhvnb6d4nicv@pengutronix.de>
References: <20191113102729.29303-1-geert+renesas@glider.be>
 <20191113103919.GM25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191113103919.GM25745@shell.armlinux.org.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Russell,

On Wed, Nov 13, 2019 at 10:39:19AM +0000, Russell King - ARM Linux admin wrote:
> On Wed, Nov 13, 2019 at 11:27:29AM +0100, Geert Uytterhoeven wrote:
> > The RZA2MEVB sub board has 64 MiB of SDRAM at 0x0C000000 (CS3 space).
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
> We occasionally have discussions about this - the last one was a big
> one in Edinburgh, and the answer is we can't change this in mainline.
> They've also come up on the mailing lists as well.
> 
> I'm not going to rehash this old argument yet again - the comment
> details the reason for it, and is there to prevent exactly this.
> 
> If someone is silly enough to come up with a platform that violates
> the documented 32-bit ARM booting protocol, then they can't expect
> the kernel to bend to their platform's requirements at the expense of
> already merged platforms.

While I agree to your conclusion I think the last paragraph isn't a
valid justification. The "32-bit ARM booting protocol"[1] doesn't
mention an alignment, it only states "The kernel should be placed in the
first 128MiB of RAM." And if this is done on a platform where RAM starts
at 0x0C000000 this results in writes to [0x0b000000, 0x0c000000].

Best regards
Uwe

[1] that's Documentation/arm/booting.rst, right?

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
