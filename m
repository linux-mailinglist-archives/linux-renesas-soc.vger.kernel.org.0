Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89A0A16214
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 12:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbfEGKla (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 06:41:30 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:33517 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfEGKl3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 06:41:29 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id BDF9E3C00C6;
        Tue,  7 May 2019 12:41:25 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sDSzZlqS6bzU; Tue,  7 May 2019 12:41:18 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id B361F3C004C;
        Tue,  7 May 2019 12:41:18 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 7 May 2019
 12:41:18 +0200
Date:   Tue, 7 May 2019 12:41:15 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Marek Vasut <marek.vasut@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
CC:     <u-boot@lists.denx.de>, <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Gotthard Voellmeke <gotthard.voellmeke@renesas.com>,
        Adam Bass <adam.bass@renesas.com>,
        Bastian Farkas <bfarkas@de.adit-jv.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Philipp Ahmann <pahmann@de.adit-jv.com>,
        Simon Maleyka <smaleyka@de.adit-jv.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Automated/remote flashing of R-Car3
Message-ID: <20190507104115.GA27355@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Marek, dear Kieran,

CC: Michael, Gotthard, Adam
CC: U-Boot, linux-renesas-soc
CC: ADIT

We in ADIT have recently set up some remote servers for CI
deployment/testing of R-Car3 targets (Salvator-X and ULCB-KF).

Since re-flashing of "firmware" (i.e. ATF, U-Boot and OPTEE-OS) on
Hyperflash involves manipulation of on-board DIP switches and direct
access to the targets is difficult/infeasible in our case, we've
started to look for a solution of flashing the boards remotely.
Anticipating that you might have potentially implemented this in your
private setups, would you please provide your valuable feedback on
below thoughts which we have collected together with Michael Dege?

1.a Use Lauterbach
+ No changes in Renesas boot concept/flow
+ No changes in release/production ATF build flags
+ No physical changes on the boards
+ Immune to corrupted/wrong binaries
+ Tested. Fast and reliable.
- Keeping one lauterbach/target for flashing purpose only _is_ expensive

1.b Replace relevant on-board DIP switches with remote-controlled relays
+ No changes in Renesas boot concept/flow
+ No changes in release/production ATF build flags
+ If set up properly, presumably immune to corrupted/wrong binaries
- Major/intrusive physical changes required on the board
- Lost warranty for the modified targets

1.c Use OpenOCD
+ Presumably same advantages as using a Lauterbach
+ Based on Kieran's https://github.com/kbingham/renesas-jtag
  and on Adam's https://github.com/ntfreak/openocd/commit/1afec4f561392
  the solution is currently in use.
? Any ideas on the model/price of the JTAG adapter?
? Not tested. Any patches needed on top of vanilla OpenOCD?

1.d. Use CPLD Configurator
+ H3_M3_StarterKit_Configurator.exe is a Windows tool shipped by
  Renesas, hence readily available, which allows to modify the MD
  pins, to conveniently switch between QSPI/Hyperflash/SCIF
  boot mode from a GUI
+ Most of the advantages pointed out above
- ULCB-only solution (i.e. does not apply to Salvator-X)
- Requires a Windows host

2.a Enable non-secure access to Hyperflash and write from U-Boot/Linux
+ Implemented/used by CogentEmbedded via [0-3]
+ No changes in Renesas boot concept/flow
+ No physical changes on the boards
+ No additional HW adapters
- Requires changes in ATF build flags, i.e. the tested build flavor
  of ATF diverges from what's used in production
- Not immune to corrupted/wrong binaries and failures/interruptions,
  i.e. flashing a wrong binary would result in unbootable target
  (afterwards, direct access to the target is needed for either
  MiniMonitor or Lauterbach-based flashing)

2.b Implement a TA to get write access to Hyperflash via OPTEE OS
+ Same pros as (2.a) plus no need to build a special ATF variant
- Same as (2.a), not immune to flashing failures
- Not yet developed/tested

3 Add flash writer [4] to the boot chain between BL1 and BL2
+ No physical changes on the boards
+ No additional HW adapters
+ Presumably no changes in release/production ATF build flags
+ Presumably immune to flashing failures, since it is assumed to be
  executed before BL2
- Changes/mangles the Renesas boot concept/flow
- Not yet developed/tested. As pointed out by Michael offline,
  the implementation might be not so trivial
- Expensive (initial development + new bugs due to diverging
  from Renesas)

4 Store/load (BL31, cert_header, U-Boot and OPTEE) to/from eMMC
+ This is a PoC/dirty solution received in the Renesas Android release,
  which relies on the fact that eMMC can be written to regardless of
  DIP switch settings. Writing to eMMC can be done via fastboot.
+ No physical changes on the boards
+ No additional HW adapters
- BL2 remains in Hyperflash, hence can't be updated with this approach
- Not immune to flashing failures
- Not supported in vanilla or in Renesas Yocto ATF

It's really amazing that with this great number of options, there
is no perfect solution. If you have any comments, especially in the
area of OpenOCD, those would be highly appreciated. TIA!

[0] https://github.com/CogentEmbedded/meta-rcar/blob/v3.15.0/meta-rcar-gen3-adas/recipes-bsp/arm-trusted-firmware/files/0001-plat-renesas-rcar-Make-RPC-secure-settings-optional.patch
[1] https://github.com/CogentEmbedded/meta-rcar/blob/v3.15.0/meta-rcar-gen3-adas/recipes-bsp/u-boot/u-boot/0040-arm-renesas-Enable-RPC-HF-MTD-support-for-all-Salvat.patch
[2] https://github.com/CogentEmbedded/meta-rcar/blob/v3.15.0/meta-rcar-gen3-adas/recipes-bsp/u-boot/u-boot/0041-arm-renesas-Enable-RPC-HF-MTD-support-for-all-ULCB-b.patch
[3] https://github.com/CogentEmbedded/meta-rcar/blob/v3.15.0/meta-rcar-gen3-adas/recipes-kernel/linux/linux-renesas/0012-mtd-Add-RPC-HyperFlash-driver.patch
[4] https://github.com/renesas-rcar/flash_writer

-- 
Best Regards,
Eugeniu.
