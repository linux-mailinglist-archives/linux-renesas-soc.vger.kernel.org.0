Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB4250BF81
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 20:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbiDVSNl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 14:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238386AbiDVSJO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 14:09:14 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113C512010E;
        Fri, 22 Apr 2022 11:06:19 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2DF95100002;
        Fri, 22 Apr 2022 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650650778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=XLCUUuK371ZisXNLd3kPgQFu8+USFQsrBHBO1DtBmRg=;
        b=oLr6cSBgUALO/vcVv68xVF8AgeNh5H6F6nAjN7adN/4YMCmirx2w6YKH1z83UR9QhZ3RfN
        cJmp9WQGfMkMqKDfwg4j6oc8kyOb6PH6AwJcsDcN4OpVB86BsqLLUtnbl9tt2X7JJwf659
        f4CJ2O6VsVh/3OCnlgHTtfRBRGORgqCtD48OsYUtCKsjKr9/yh31opRMeHGPQOwvX00/eU
        FSSDD5mLVa9Jp+5SHzgozUSRdCzqd004KV7GGRuT+MFSvDEVpkZw/CoolO3+o4ElLRkw8C
        yZhlJxks9b5YQETiatXmsgnhWHcncbmeOoyqJiRapMSj1aw51LGhfRMES/cEbw==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v7 0/9] serial: 8250: dw: RZN1 DMA support
Date:   Fri, 22 Apr 2022 20:06:06 +0200
Message-Id: <20220422180615.9098-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

Support for the RZN1 DMA engine allows us adapt a little bit the 8250 DW
UART driver with to bring DMA support for this SoC.

This short series applies on top of the series bringing RZN1 DMA
support, currently on its v11, see [1]. Technically speaking, only the DT
patch needs to be applied after [1]. The other patches can come in at
any moment, because if no "dmas" property is provided in the DT, DMA
support will simply be ignored.

[1] https://lore.kernel.org/dmaengine/20220421085112.78858-1-miquel.raynal@bootlin.com/T/#t

Thanks,
Miquèl

Changes in v7:
* Dropped the two personal patches at the end of the series sent by
  accident.
* Also dropped the DT patch as requested be Geert.
* Only serial patches remain.

Changes in v6:
* Collected more tags.
* Moved some RZN1 definitions below to respect the increasing order of
  the register offsets.
* Renamed the cpr platdata entry to cpr_val.
* Moved the cpr/cpr_val platdata entry closer to usr_reg.
* Dropped the patch from Emil Renner Berthing adding jh7100 support from
  my tree. Squashed the other patch from this external series with the
  fixes which applied on top of it and were supposed to bring platform
  data support.
* Rebased on top of tty-next.

Changes in v5:
* Collected the various tags.
* Updated the style to fit Andy's requests.
* Moved the usr register offset to pdata as advised by Andy.
* Moved the addition of the property.h header to the right patch.
* Return earlier from the IRQ handler whenever possible.
* Moved the dw8250_readl/writel_ext() helpers to dwlib.h so that they
  could be reused by the patch adding rzn1 support.

Changes in v4:
* Squashed the patch changing the quirks type with the patch introducing
  the pdata structure. This way I don't need to go through the uintptr_t
  step. 
* Added a pdata stub to the DW compatible. This way "if (pdata)" checks
  are no longer needed and we can avoid ternary operators disliked by
  Greg.
* Saved the pdata structure pointer inside the per-device structure to
  avoid calling the same device property heplper over and over again. 
* Changed the style a bit to fit Andy's requirements.

Changes in v3:
* Added Geert's Reviewed-by's.
* Used forward declaration in dwlib.h when relevant.
* Reordered the headers when necessary.
* Added a patch changing the quirks type from unsigned long to unsigned
  int as advised by Andy.
* s/up->port.dev/p->dev/ when relevant.
* Added a debug message in dwlib when no CPR is available.
* Dropped the CPR_DMA_EXTRA bit addition: we assume DMA is there.
* Changed the prefix of certain definitions.

Changes in v2:
* Rebased on top of Emil's patches. Added platform data structures
  instead of raw quirk integers in order to provide a CPR value.
* Added includes in dwlib.h even though it's not particularly useful, it
  may help preventing a build error later on if we ever decide to include
  this file from another location.
* Dropped the call to ->tx_dma and instead implemented a callback that
  can be called from serial8250_tx/rx_dma.
* Used the device API instead of the of API.
* Changed the logic about DMA capabilities to avoid breaking existing
  designs.
* Introduced a new quirk related to the flow-control feature of the
  RZ/N1 version of the UART controller when used with DMA.
* Re-arranged the entire series as advised by Andy and Geert.
* Added several preparation patches to ease the review of various
  functional changes.

Emil Renner Berthing (1):
  serial: 8250: dw: Create a generic platform data structure

Miquel Raynal (5):
  serial: 8250: dw: Move the USR register to pdata
  serial: 8250: dw: Allow to use a fallback CPR value if not synthesized
  serial: 8250: dma: Allow driver operations before starting DMA
    transfers
  serial: 8250: dw: Introduce an rx_timeout variable in the IRQ path
  serial: 8250: dw: Move the IO accessors to 8250_dwlib.h

Phil Edworthy (3):
  serial: 8250: dw: Move definitions to the shared header
  serial: 8250: dw: Add support for DMA flow controlling devices
  serial: 8250: dw: Improve RZN1 support

 drivers/tty/serial/8250/8250.h       |  18 ++++
 drivers/tty/serial/8250/8250_dma.c   |   4 +
 drivers/tty/serial/8250/8250_dw.c    | 139 +++++++++++++++++++++------
 drivers/tty/serial/8250/8250_dwlib.c |  26 ++---
 drivers/tty/serial/8250/8250_dwlib.h |  48 +++++++++
 5 files changed, 185 insertions(+), 50 deletions(-)

-- 
2.27.0

