Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11143FAEAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 11:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbfKMKk7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 05:40:59 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59391 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfKMKk7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 05:40:59 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iUq4m-0003S2-JM; Wed, 13 Nov 2019 11:40:40 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iUq4j-0005jl-TW; Wed, 13 Nov 2019 11:40:37 +0100
Date:   Wed, 13 Nov 2019 11:40:37 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.miao@nvidia.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] ARM: boot: Relax kernel image alignment for RZ/A
 with CS3 SDRAM
Message-ID: <20191113104037.e45j37xoxeztvut3@pengutronix.de>
References: <20191113102729.29303-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191113102729.29303-1-geert+renesas@glider.be>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 13, 2019 at 11:27:29AM +0100, Geert Uytterhoeven wrote:
> The RZA2MEVB sub board has 64 MiB of SDRAM at 0x0C000000 (CS3 space).

This wording is misleading. You don't adapt the limit because 128 MiB >
the amount of RAM on that platform but because the alignment of the CS3
space isn't a multiple of 128 MiB. So I suggest:

	On the RZA2MEVB the SDRAM's base is at 0x0C000000 which isn't
	aligned to 128 MiB. So to ensure the assumptions of the
	decompressor are valid the used alignment must be decreased.

> Hence the mask for CONFIG_AUTO_ZRELADDR needs to be changed, otherwise
> the system will crash because it will try to decompress a zImage or
> uImage to a non-RAM garbage address.
> 
> Based on a patch in the BSP by Chris Brandt <chris.brandt@renesas.com>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> No idea what to do with the rest of the comment, or if this breaks
> existing platforms.

I would assume that it indeed breaks existing platforms. So maybe better
make this configurable, default to 128 MiB and select it to 64 MiB on
the affected platform? If the resulting kernel supports also other
machines a warning (at compile time) might be a good idea.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
