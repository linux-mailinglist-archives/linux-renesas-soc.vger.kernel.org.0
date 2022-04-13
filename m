Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACC994FF0D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 09:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233487AbiDMHyI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 03:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233400AbiDMHyH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 03:54:07 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B822B24B;
        Wed, 13 Apr 2022 00:51:45 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B7B01FF804;
        Wed, 13 Apr 2022 07:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649836304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=8xVQHqAznFJQ+ZEQGChJuAhtzrMDXb3vM10v3sqYHdE=;
        b=njUSIUDqwnQR4DF7/P0IZCpDOwvcyDkzi9PDcMWvzwNdHz2H+AnAga8UqRBeN3fWqxaQZv
        0pRCfzJMslAp+7GlLzz5ylVWGkqMWJ3QoNKGDrBFZfpEcTQjPZxhh/RryvyuhGoqV+3/RK
        y1ImsMRTGcxJOSzYLHeRV3/C+D84tOn7pxNWoUF9Hr082s5MGUGAfLlAOrYgPqljVgYxxd
        YrFoVWI2OrxiTKDK0JAiSdX0sxH3l3xI6RtM3wc53E7eUPNFgl4+7sUismTzqJAkFmMMLT
        HZQ+tfhOqe2VB7Kvub5K7yl13gIeMi4XJmEJ1hElzC0bZbDTLecpG5qfyWYPIw==
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
Subject: [PATCH v5 00/11] serial: 8250: dw: RZN1 DMA support
Date:   Wed, 13 Apr 2022 09:51:30 +0200
Message-Id: <20220413075141.72777-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

Support for the RZN1 DMA engine allows us adapt a little bit the 8250 DW
UART driver with to bring DMA support for this SoC.

This short series applies on top of the series bringing RZN1 DMA
support, currently on its v10, see [1]. Technically speaking, only the DT
patch needs to be applied after [1]. The other patches can come in at
any moment, because if no "dmas" property is provided in the DT, DMA
support will simply be ignored.

[1] https://lore.kernel.org/dmaengine/20220412193936.63355-1-miquel.raynal@bootlin.com/T/#t

Thanks,
Miquèl

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

Miquel Raynal (8):
  serial: 8250: dw: Use the device API
  serial: 8250: dw: Create a more generic platform data structure
  serial: 8250: dw: Move the USR register to pdata
  serial: 8250: dw: Allow to use a fallback CPR value if not synthesized
  serial: 8250: dma: Allow driver operations before starting DMA
    transfers
  serial: 8250: dw: Introduce an rx_timeout variable in the IRQ path
  serial: 8250: dw: Move the IO accessors to 8250_dwlib.h
  ARM: dts: r9a06g032: Fill the UART DMA properties

Phil Edworthy (3):
  serial: 8250: dw: Move definitions to the shared header
  serial: 8250: dw: Add support for DMA flow controlling devices
  serial: 8250: dw: Improve RZN1 support

 arch/arm/boot/dts/r9a06g032.dtsi     |  15 +++
 drivers/tty/serial/8250/8250.h       |  18 ++++
 drivers/tty/serial/8250/8250_dma.c   |   4 +
 drivers/tty/serial/8250/8250_dw.c    | 135 ++++++++++++++++++++-------
 drivers/tty/serial/8250/8250_dwlib.c |  26 ++----
 drivers/tty/serial/8250/8250_dwlib.h |  48 ++++++++++
 6 files changed, 195 insertions(+), 51 deletions(-)

-- 
2.27.0

