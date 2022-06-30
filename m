Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C761E56154C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jun 2022 10:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbiF3IjU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jun 2022 04:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbiF3IjT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 04:39:19 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E9067419A7;
        Thu, 30 Jun 2022 01:39:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,233,1650898800"; 
   d="scan'208";a="126192432"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jun 2022 17:39:15 +0900
Received: from localhost.localdomain (unknown [10.226.93.21])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CDEB443165D0;
        Thu, 30 Jun 2022 17:39:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Johan Hovold <johan@kernel.org>, linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] serial: 8250: dw: Fix the macro RZN1_UART_xDMACR_8_WORD_BURST
Date:   Thu, 30 Jun 2022 09:39:09 +0100
Message-Id: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per RZ/N1 peripheral user manual(r01uh0752ej0100-rzn1-peripheral.pdf)
rev 1.0.0 Mar,2019, the value for 8_WORD_BURST is 4(b2,b1=2’b10).

This patch fixes the macro as per the user manual.

Fixes: aa63d786cea2 ("serial: 8250: dw: Add support for DMA flow controlling devices")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/8250/8250_dw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index f57bbd32ef11..931490b27d6b 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -47,7 +47,7 @@
 #define RZN1_UART_xDMACR_DMA_EN		BIT(0)
 #define RZN1_UART_xDMACR_1_WORD_BURST	(0 << 1)
 #define RZN1_UART_xDMACR_4_WORD_BURST	(1 << 1)
-#define RZN1_UART_xDMACR_8_WORD_BURST	(3 << 1)
+#define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
 /* Quirks */
-- 
2.25.1

