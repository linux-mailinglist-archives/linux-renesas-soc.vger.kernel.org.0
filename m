Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6A9D6C0FFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 11:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCTK7S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 06:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjCTK6N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 06:58:13 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D785C19135;
        Mon, 20 Mar 2023 03:54:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,274,1673881200"; 
   d="scan'208";a="153188024"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Mar 2023 19:53:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.205])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 119084004BCF;
        Mon, 20 Mar 2023 19:53:41 +0900 (JST)
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
Subject: [PATCH v3 0/5] Renesas SCI fixes
Date:   Mon, 20 Mar 2023 10:53:34 +0000
Message-Id: <20230320105339.236279-1-biju.das.jz@bp.renesas.com>
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

Overlay compilation:
--------------------
Enable CONFIG_OF_OVERLAY in defconfig

cpp -nostdinc -I include -I arch -undef -x assembler-with-cpp \
  arch/arm64/boot//dts/renesas/r9a07g043u11-smarc.dts \
  r9a07g043u11-smarc.dts.tmp

dtc -@ -i include/ -I dts -O dtb -o arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb   r9a07g043u11-smarc.dts.tmp

cpp -nostdinc -I include -I arch -undef -x assembler-with-cpp \
  arch/arm64/boot/dts/renesas/r9a07g043-smarc.dtso \
  r9a07g043-smarc.dtso.tmp

dtc -@ -i include/ -I dts -O dtb -o arch/arm64/boot/dts/renesas/r9a07g043-smarc.dtbo   r9a07g043-smarc.dtso.tmp

Applying overlay:
-----------------
apply_overlay=tftp 0x48000000 RZ-G2UL/r9a07g043u11-smarc.dtb;fdt addr 0x48000000;fdt resize 8192;tftp 0x4A000000 RZ-G2UL/r9a07g043-smarc.dtbo;fdt apply 0x4A000000
bootcmd-overlay=run apply_overlay;tftp 0x48080000 RZ-G2UL/Image;booti 0x48080000 - 0x48000000

Biju Das (5):
  tty: serial: sh-sci: Fix transmit end interrupt handler
  tty: serial: sh-sci: Fix Rx on RZ/G2L SCI
  tty: serial: sh-sci: Fix Tx on SCI IP
  tty: serial: sh-sci: Add support for tx end interrupt handling
  arm64: dts: renesas: r9a07g044: Enable sci0 nodes using dt overlay

 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/r9a07g043-smarc.dtso     | 45 ++++++++++++
 drivers/tty/serial/sh-sci.c                   | 72 +++++++++++++++++--
 drivers/tty/serial/sh-sci.h                   |  3 +
 4 files changed, 115 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043-smarc.dtso

-- 
2.25.1

