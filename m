Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07D06C30B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Mar 2023 12:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjCULsE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 07:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjCULsC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 07:48:02 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96AD2273E;
        Tue, 21 Mar 2023 04:48:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,278,1673881200"; 
   d="scan'208";a="156652119"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Mar 2023 20:48:00 +0900
Received: from localhost.localdomain (unknown [10.226.93.140])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7001241E3338;
        Tue, 21 Mar 2023 20:47:56 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/5] Renesas SCI fixes
Date:   Tue, 21 Mar 2023 11:47:48 +0000
Message-Id: <20230321114753.75038-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2UL SMARC EVK has sci pins exposed through PMOD1 interface.
On testing, found that irq handler, tx and rx is broken.

This series fixes these issues.

v3->v4:
 * Updated the fixes tag for patch#2 and patch#3
 * Replaced sci_port->is_rz_sci with dev->dev.of_node as regshift are only needed
   for sh770x/sh7750/sh7760, which don't use DT yet.
 * Dropped is_rz_sci variable from struct sci_port.
 * Removed fixes tag from patch#4, as it is a feature enhancement to make tx
   fully functional on RZ/G2L alike SOCs. With previous patch#3, eventhough
   we get tx interrupts, still it is broken as characters entered on
   uart terminal is not visible except for the first character.
 * Updated commit header sci0 nodes->sci0 node for patch#5 
 * Removed PMOD USBUART reference and connection details as user can connect
   anything on that PMOD1 pins.
 * Renamed r9a07g043-smarc.dtso->r9a07g043-smarc-pmod.dtso
 * Dropped unused header file dt-bindings/gpio/gpio.h
v2->v3:
 * Cced stable@vger.kernel.org
 * Added Rx, Tx and Tx end interrupt handler patch.
v1->v2:
 * Replaced the wrong fixes tag
 * Added a simpler check in sci_init_single() and added a check in
   probe to catch invalid interrupt count.
Tested the SCI0 interface on RZ/G2UL by connecting to PMOD USBUART.
 39:          0     GICv3 437 Level     1004d000.serial:rx err
 40:         12     GICv3 438 Edge      1004d000.serial:rx full
 41:         70     GICv3 439 Edge      1004d000.serial:tx empty
 42:         18     GICv3 440 Level     1004d000.serial:tx end

Biju Das (5):
  tty: serial: sh-sci: Fix transmit end interrupt handler
  tty: serial: sh-sci: Fix Rx on RZ/G2L SCI
  tty: serial: sh-sci: Fix Tx on SCI IP
  tty: serial: sh-sci: Add support for tx end interrupt handling
  arm64: dts: renesas: r9a07g044: Enable sci0 node using dt overlay

 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../dts/renesas/r9a07g043-smarc-pmod.dtso     | 42 ++++++++++++
 drivers/tty/serial/sh-sci.c                   | 66 +++++++++++++++++--
 drivers/tty/serial/sh-sci.h                   |  3 +
 4 files changed, 106 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043-smarc-pmod.dtso

-- 
2.25.1

