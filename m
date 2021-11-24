Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5CD45C71A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 15:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351000AbhKXOVT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 09:21:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357767AbhKXOUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 09:20:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA34C0619DF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Nov 2021 04:43:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2E2E1224;
        Wed, 24 Nov 2021 13:43:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637757809;
        bh=52CxSuMcqYGhhXKXy1ujH85gqLWy2ivpVLpvPyrtof0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UGQNovsMtp41yUAgDqBzr9qSrhkIhKud9oL58Aa5h/59B3FmxZCeABopk+i18mqBm
         VFHi34pRgvoHfUKl8H2v0ADDSVZJk7upgXF1LNLTw7eDrLq+0ZSmwa22FfSV4box2x
         EU0fkAme7VVZzoXZl30Zlnr/hovf5MhOsuT/7RW0=
Date:   Wed, 24 Nov 2021 14:43:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI isn't probed on v5.15-rc1 on ULCB+KF
Message-ID: <YZ4zWow+bfb5PITm@pendragon.ideasonboard.com>
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com>
 <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com>
 <87v929moad.wl-kuninori.morimoto.gx@renesas.com>
 <YV6A5xAWth6dkHor@pendragon.ideasonboard.com>
 <87tuhtmn8u.wl-kuninori.morimoto.gx@renesas.com>
 <87ilxc1ibv.wl-kuninori.morimoto.gx@renesas.com>
 <87r1bny1fl.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87r1bny1fl.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Morimoto-san,

On Thu, Nov 11, 2021 at 09:35:10AM +0900, Kuninori Morimoto wrote:
> 
> Hi Laurent
> 
> You back !

And now I'm even back in Finland. I've found my H3 ULCB and tried to
boot it up, but I got stuck updating the firmware :-S

NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.2.0.6
NOTICE:  BL2: PRR is R-Car H3 Ver.2.0
NOTICE:  BL2: Board is Starter Kit Premier Rev.1.0
NOTICE:  BL2: Boot device is HyperFlash(80MHz)
NOTICE:  BL2: LCM state is CM
NOTICE:  AVS setting succeeded. DVFS_SetVID=0x53
NOTICE:  BL2: DDR3200(rev.0.40)
NOTICE:  BL2: [COLD_BOOT]
NOTICE:  BL2: Failed to DRAM initialize (-1).

This is on the ATF abloader branch from Marek. I've also tried the
master branch from
https://github.com/ARM-software/arm-trusted-firmware.git and the
rcar_gen3_v2.5 branch from
git://github.com/renesas-rcar/arm-trusted-firmware.git. They fail the
same way.

I have compiled ATF with

make PLAT=rcar LSI=H3 RCAR_DRAM_SPLIT=1 RCAR_GEN3_ULCB=1 SPD=opteed \
	CROSS_COMPILE=aarch64-buildroot-linux-gnu- \
	MBEDTLS_DIR=$PWD/../mbedtls/ clean bl2 bl31 rcar

and have flashed the four files to the addresses listed in
https://elinux.org/R-Car/Boards/H3SK#Flashing_firmware for the 4GiB
model (my board is a RTP0RC77951SKBX010SA00, S/N 2298)..

For reference, before trying to update the firmware, I had

[    0.000190] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.13
[    0.005757] NOTICE:  BL2: PRR is R-Car H3 Ver2.0
[    0.010336] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
[    0.015776] NOTICE:  BL2: LCM state is CM
[    0.019752] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=0x52
[    0.025942] NOTICE:  BL2: DDR3200(rev.0.22)[    0.055637] NOTICE:  [COLD_BOOT][    0.087833] NOTICE:  ..0
[    0.088885] NOTICE:  BL2: DRAM Split is 4ch
[    0.093031] NOTICE:  BL2: QoS is default setting(rev.0.12)
[    0.098531] NOTICE:  BL2: Lossy Decomp areas
[    0.102708] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540 DCMPAREACRBx:0x570
[    0.109793] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000 DCMPAREACRBx:0x0
[    0.116705] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000 DCMPAREACRBx:0x0
[    0.123620] NOTICE:  BL2: v1.3(release):867d841
[    0.128110] NOTICE:  BL2: Built : 16:02:18, Mar 16 2017
[    0.133297] NOTICE:  BL2: Normal boot
[    0.136938] NOTICE:  BL2: dst=0xe6320190 src=0x8180000 len=512(0x200)
[    0.143484] NOTICE:  BL2: dst=0x43f00000 src=0x8180400 len=6144(0x1800)
[    0.149946] NOTICE:  BL2: dst=0x44000000 src=0x81c0000 len=65536(0x10000)
[    0.157172] NOTICE:  BL2: dst=0x44100000 src=0x8200000 len=524288(0x80000)
[    0.167652] NOTICE:  BL2: dst=0x50000000 src=0x8640000 len=1048576(0x100000)

I don't have firmware binaries I can use to boot the board, so I can't
debug the HDMI probe issue :-(

I wonder if someone could help me. Has the latest ATF been tested on H3
ULCB ?

> This is gentle ping mail not to buried in a large amount of emails,
> it had happen before ;P
> 
> > About this topic, v5.15 was released, but it still
> > has "No soundcards" issue.
> > There is no dw-hdmi, thus no soundcards
> > 
> > 	...
> > 	[    1.431196] printk: console [ttySC0] enabled
> > =>	[    1.442432] rcar-du feb00000.display: failed to initialize DRM/KMS (-6)
> > 	[    1.481179] loop: module loaded
> > 	...
> > 	[    9.568307] ALSA device list:
> > =>	[    9.571446]   No soundcards found.
> > 	...
> > 
> > I re-start works for me if I reverted this patch
> > 
> > 	--------------------------------
> > 	commit d0f44e0dac29aca3f85d238dfbcd2e52450b38dc
> > 	Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 	Date:   Mon May 25 07:05:26 2020 +0300
> > 
> > 	    drm: rcar-du: dw-hdmi: Set output port number
> > 
> > 	    Report the DT output port number in dw_hdmi_plat_data to connect to the
> > 	    next bridge in the dw-hdmi driver.
> > 
> > 	    Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 	    Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com> # On V3U
> > 	    Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 	--------------------------------
> > 
> > 	...
> > 	[    1.431130] printk: console [ttySC0] enabled
> > =>	[    1.442219] rcar-du feb00000.display: failed to initialize DRM/KMS (-6)
> > =>	[    1.451050] rcar-dw-hdmi fead0000.hdmi: Detected HDMI TX controller v2.01a with HDCP (DWC HDMI 2.0 TX PHY)
> > =>	[    1.461560] rcar-dw-hdmi fead0000.hdmi: registered DesignWare HDMI I2C bus driver
> > 	[    1.501043] loop: module loaded
> > 	...
> > 	[    9.180464] ALSA device list:
> > =>	[    9.183519]   #0: rcar-sound
> > 	...

-- 
Regards,

Laurent Pinchart
