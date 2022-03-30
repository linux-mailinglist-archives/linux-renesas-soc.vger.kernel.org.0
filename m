Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4247B4EC566
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344188AbiC3NWa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 09:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245017AbiC3NW3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 09:22:29 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFFA488AB;
        Wed, 30 Mar 2022 06:20:43 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5916B24000A;
        Wed, 30 Mar 2022 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648646441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=8tgPc3SBGZRS7mw9Xf7bKDfSZM+aKVUU9tzsvmEqNeI=;
        b=iKHH/DdXa9MUiHYPO7NqUzAeZxkBR1bYFrP8zIIjoN5hnrYIdaLZivoyGj2FB/hwJX1y0l
        /QzbKMp9KphVQdhB0K86mjJoHbz2LM/SSAjC5EDuF9qsBbFjRZfkKb8PX3oBLN/ekT3OoO
        pHEPvFzdVEcap/CPFcLeoVFmYLEBFLZl4pvq0TRU0Z3QY5l+oB9zv+TpzD+Tbmf5OLgjsJ
        Ka6QdFCFxbb/B2mFnhoGvzMXGUs5BFnUYkaUqYfgpgVLBw7OR6P8vKi2HVLkGxz2CuAqKf
        rt+fRYgSQJ8NFVfg8ETGR+zGxjI+Amap5p7L4CwYUNl/L3MOmMAw3wuG1PLKyw==
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
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v4 0/9] serial: 8250: dw: RZN1 DMA support
Date:   Wed, 30 Mar 2022 15:20:29 +0200
Message-Id: <20220330132038.808679-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

Support for the RZN1 DMA engine allows us adapt a little bit the 8250 DW
UART driver with to bring DMA support for this SoC.

This short series applies on top of the series bringing RZN1 DMA
support, currently on its v5, see [1]. Technically speaking, only the DT
patch needs to be applied after [1]. The other patches can come in at
any moment, because if no "dmas" property is provided in the DT, DMA
support will simply be ignored.

[1] https://lore.kernel.org/dmaengine/20220315191255.221473-1-miquel.raynal@bootlin.com/T/#m0ef3323abce3eec961e142bf2fb35e95b9045fc5

Thanks,
Miquèl

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

Miquel Raynal (6):
  serial: 8250: dw: Use the device API
  serial: 8250: dw: Create a more generic platform data structure
  serial: 8250: dw: Allow to use a fallback CPR value if not synthesized
  serial: 8250: dma: Allow driver operations before starting DMA
    transfers
  serial: 8250: dw: Introduce an rx_timeout variable in the IRQ path
  ARM: dts: r9a06g032: Fill the UART DMA properties

Phil Edworthy (3):
  serial: 8250: dw: Move definitions to the shared header
  serial: 8250: dw: Add support for DMA flow controlling devices
  serial: 8250: dw: Improve RZN1 support

 arch/arm/boot/dts/r9a06g032.dtsi     |  15 ++++
 drivers/tty/serial/8250/8250.h       |  18 ++++
 drivers/tty/serial/8250/8250_dma.c   |   4 +
 drivers/tty/serial/8250/8250_dw.c    | 123 ++++++++++++++++++++-------
 drivers/tty/serial/8250/8250_dwlib.c |  12 ++-
 drivers/tty/serial/8250/8250_dwlib.h |  32 +++++++
 6 files changed, 172 insertions(+), 32 deletions(-)

-- 
2.27.0

