Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 667494EB02E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 17:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238521AbiC2P0U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 11:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238514AbiC2P0S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 11:26:18 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC26B68303;
        Tue, 29 Mar 2022 08:24:34 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1A424100008;
        Tue, 29 Mar 2022 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648567473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Dfuw4MrrlyWb3IK7vHvif8wyTdZ2niPWNGPSQ7FdVAQ=;
        b=prcJQcFwSuM4Bl8MWQDGzdiqkQg/qpw/3HEI2p32mPNycKTlrgLqtmNvRCv7MTY17x1q4k
        JWm731exEpcGJY5JYyvJ76nzZBUeZjN4gYnyNnFltnz3d7ghp0z+4WovvDHqX0JNyLpKOE
        +zzac741omQo+YQuXiCyAYYcDUbqs8LAlRb7Zzkr5GNzQKjLoAwwqv2DNID3oOk5LmGCwO
        PorgD52EEeBdAf4caNuGPlnerr/Sncuaf8UKXBRSU4jT42Bs7B48Cd/reqV6oKKXeJsBKk
        9EPOnBK3nfaOjsqoe/76CtFbS1NXLvbkuzjfm53x2Wf7fPdL4OMgxLdaeH2xdQ==
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
Subject: [PATCH v3 00/10] serial: 8250: dw: RZN1 DMA support
Date:   Tue, 29 Mar 2022 17:24:20 +0200
Message-Id: <20220329152430.756947-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_BL_SPAMCOP_NET,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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

Miquel Raynal (7):
  serial: 8250: dw: Use the device API
  serial: 8250: dw: Change the quirks type to unsigned int
  serial: 8250: dw: Create a more generic platform data structure
  serial: 8250: dw: Allow to use a fallback CPR value if not synthesized
  serial: 8250: dma: Allow driver operations before starting DMA
    transfers
  serial: 8250: dw: Introduce an rx_timeout variable in the IRQ path
  ARM: dts: r9a06g032: Fill the UART DMA properties

Phil Edworthy (3):
  serial: 8250: dw: Move the per-device structure
  serial: 8250: dw: Add support for DMA flow controlling devices
  serial: 8250: dw: Improve RZN1 support

 arch/arm/boot/dts/r9a06g032.dtsi     |  15 ++++
 drivers/tty/serial/8250/8250.h       |  18 +++++
 drivers/tty/serial/8250/8250_dma.c   |   4 +
 drivers/tty/serial/8250/8250_dw.c    | 114 +++++++++++++++++++++------
 drivers/tty/serial/8250/8250_dwlib.c |   9 +++
 drivers/tty/serial/8250/8250_dwlib.h |  26 ++++++
 6 files changed, 163 insertions(+), 23 deletions(-)

-- 
2.27.0

