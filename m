Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAA38632349
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 14:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiKUNSq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 08:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiKUNSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 08:18:45 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48ABE73BB8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 05:18:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:4821:1ba5:2638:5c3a])
        by baptiste.telenet-ops.be with bizsmtp
        id n1Jg2800i5WXlCv011JgX9; Mon, 21 Nov 2022 14:18:41 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ox6h6-001900-HS; Mon, 21 Nov 2022 14:18:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ox6h6-00BMkJ-4U; Mon, 21 Nov 2022 14:18:40 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] pinctrl: renesas: r8a779g0: Fix alignment in GPSR[678]_* macros
Date:   Mon, 21 Nov 2022 14:18:36 +0100
Message-Id: <9424a0e7f6d66a94d333df9fdc5cdf3b7defb8f5.1669036423.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669036423.git.geert+renesas@glider.be>
References: <cover.1669036423.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The alignment of the second column in the definitions of the GPSR[678]_*
macros does not match the alignment used in other definitions.
Fix this to improve uniformity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 112 ++++++++++++-------------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 5dd1c2c7708a802b..bf7fcce2d9c6b2a1 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -206,66 +206,66 @@
 #define GPSR5_0		FM(AVB2_AVTP_PPS)
 
 /* GPSR 6 */
-#define GPSR6_20	F_(AVB1_TXCREFCLK,		IP2SR6_19_16)
-#define GPSR6_19	F_(AVB1_RD3,			IP2SR6_15_12)
-#define GPSR6_18	F_(AVB1_TD3,			IP2SR6_11_8)
-#define GPSR6_17	F_(AVB1_RD2,			IP2SR6_7_4)
-#define GPSR6_16	F_(AVB1_TD2,			IP2SR6_3_0)
-#define GPSR6_15	F_(AVB1_RD0,			IP1SR6_31_28)
-#define GPSR6_14	F_(AVB1_RD1,			IP1SR6_27_24)
-#define GPSR6_13	F_(AVB1_TD0,			IP1SR6_23_20)
-#define GPSR6_12	F_(AVB1_TD1,			IP1SR6_19_16)
-#define GPSR6_11	F_(AVB1_AVTP_CAPTURE,		IP1SR6_15_12)
-#define GPSR6_10	F_(AVB1_AVTP_PPS,		IP1SR6_11_8)
-#define GPSR6_9		F_(AVB1_RX_CTL,			IP1SR6_7_4)
-#define GPSR6_8		F_(AVB1_RXC,			IP1SR6_3_0)
-#define GPSR6_7		F_(AVB1_TX_CTL,			IP0SR6_31_28)
-#define GPSR6_6		F_(AVB1_TXC,			IP0SR6_27_24)
-#define GPSR6_5		F_(AVB1_AVTP_MATCH,		IP0SR6_23_20)
-#define GPSR6_4		F_(AVB1_LINK,			IP0SR6_19_16)
-#define GPSR6_3		F_(AVB1_PHY_INT,		IP0SR6_15_12)
-#define GPSR6_2		F_(AVB1_MDC,			IP0SR6_11_8)
-#define GPSR6_1		F_(AVB1_MAGIC,			IP0SR6_7_4)
-#define GPSR6_0		F_(AVB1_MDIO,			IP0SR6_3_0)
+#define GPSR6_20	F_(AVB1_TXCREFCLK,	IP2SR6_19_16)
+#define GPSR6_19	F_(AVB1_RD3,		IP2SR6_15_12)
+#define GPSR6_18	F_(AVB1_TD3,		IP2SR6_11_8)
+#define GPSR6_17	F_(AVB1_RD2,		IP2SR6_7_4)
+#define GPSR6_16	F_(AVB1_TD2,		IP2SR6_3_0)
+#define GPSR6_15	F_(AVB1_RD0,		IP1SR6_31_28)
+#define GPSR6_14	F_(AVB1_RD1,		IP1SR6_27_24)
+#define GPSR6_13	F_(AVB1_TD0,		IP1SR6_23_20)
+#define GPSR6_12	F_(AVB1_TD1,		IP1SR6_19_16)
+#define GPSR6_11	F_(AVB1_AVTP_CAPTURE,	IP1SR6_15_12)
+#define GPSR6_10	F_(AVB1_AVTP_PPS,	IP1SR6_11_8)
+#define GPSR6_9		F_(AVB1_RX_CTL,		IP1SR6_7_4)
+#define GPSR6_8		F_(AVB1_RXC,		IP1SR6_3_0)
+#define GPSR6_7		F_(AVB1_TX_CTL,		IP0SR6_31_28)
+#define GPSR6_6		F_(AVB1_TXC,		IP0SR6_27_24)
+#define GPSR6_5		F_(AVB1_AVTP_MATCH,	IP0SR6_23_20)
+#define GPSR6_4		F_(AVB1_LINK,		IP0SR6_19_16)
+#define GPSR6_3		F_(AVB1_PHY_INT,	IP0SR6_15_12)
+#define GPSR6_2		F_(AVB1_MDC,		IP0SR6_11_8)
+#define GPSR6_1		F_(AVB1_MAGIC,		IP0SR6_7_4)
+#define GPSR6_0		F_(AVB1_MDIO,		IP0SR6_3_0)
 
 /* GPSR7 */
-#define GPSR7_20	F_(AVB0_RX_CTL,			IP2SR7_19_16)
-#define GPSR7_19	F_(AVB0_RXC,			IP2SR7_15_12)
-#define GPSR7_18	F_(AVB0_RD0,			IP2SR7_11_8)
-#define GPSR7_17	F_(AVB0_RD1,			IP2SR7_7_4)
-#define GPSR7_16	F_(AVB0_TX_CTL,			IP2SR7_3_0)
-#define GPSR7_15	F_(AVB0_TXC,			IP1SR7_31_28)
-#define GPSR7_14	F_(AVB0_MDIO,			IP1SR7_27_24)
-#define GPSR7_13	F_(AVB0_MDC,			IP1SR7_23_20)
-#define GPSR7_12	F_(AVB0_RD2,			IP1SR7_19_16)
-#define GPSR7_11	F_(AVB0_TD0,			IP1SR7_15_12)
-#define GPSR7_10	F_(AVB0_MAGIC,			IP1SR7_11_8)
-#define GPSR7_9		F_(AVB0_TXCREFCLK,		IP1SR7_7_4)
-#define GPSR7_8		F_(AVB0_RD3,			IP1SR7_3_0)
-#define GPSR7_7		F_(AVB0_TD1,			IP0SR7_31_28)
-#define GPSR7_6		F_(AVB0_TD2,			IP0SR7_27_24)
-#define GPSR7_5		F_(AVB0_PHY_INT,		IP0SR7_23_20)
-#define GPSR7_4		F_(AVB0_LINK,			IP0SR7_19_16)
-#define GPSR7_3		F_(AVB0_TD3,			IP0SR7_15_12)
-#define GPSR7_2		F_(AVB0_AVTP_MATCH,		IP0SR7_11_8)
-#define GPSR7_1		F_(AVB0_AVTP_CAPTURE,		IP0SR7_7_4)
-#define GPSR7_0		F_(AVB0_AVTP_PPS,		IP0SR7_3_0)
+#define GPSR7_20	F_(AVB0_RX_CTL,		IP2SR7_19_16)
+#define GPSR7_19	F_(AVB0_RXC,		IP2SR7_15_12)
+#define GPSR7_18	F_(AVB0_RD0,		IP2SR7_11_8)
+#define GPSR7_17	F_(AVB0_RD1,		IP2SR7_7_4)
+#define GPSR7_16	F_(AVB0_TX_CTL,		IP2SR7_3_0)
+#define GPSR7_15	F_(AVB0_TXC,		IP1SR7_31_28)
+#define GPSR7_14	F_(AVB0_MDIO,		IP1SR7_27_24)
+#define GPSR7_13	F_(AVB0_MDC,		IP1SR7_23_20)
+#define GPSR7_12	F_(AVB0_RD2,		IP1SR7_19_16)
+#define GPSR7_11	F_(AVB0_TD0,		IP1SR7_15_12)
+#define GPSR7_10	F_(AVB0_MAGIC,		IP1SR7_11_8)
+#define GPSR7_9		F_(AVB0_TXCREFCLK,	IP1SR7_7_4)
+#define GPSR7_8		F_(AVB0_RD3,		IP1SR7_3_0)
+#define GPSR7_7		F_(AVB0_TD1,		IP0SR7_31_28)
+#define GPSR7_6		F_(AVB0_TD2,		IP0SR7_27_24)
+#define GPSR7_5		F_(AVB0_PHY_INT,	IP0SR7_23_20)
+#define GPSR7_4		F_(AVB0_LINK,		IP0SR7_19_16)
+#define GPSR7_3		F_(AVB0_TD3,		IP0SR7_15_12)
+#define GPSR7_2		F_(AVB0_AVTP_MATCH,	IP0SR7_11_8)
+#define GPSR7_1		F_(AVB0_AVTP_CAPTURE,	IP0SR7_7_4)
+#define GPSR7_0		F_(AVB0_AVTP_PPS,	IP0SR7_3_0)
 
 /* GPSR8 */
-#define GPSR8_13	F_(GP8_13,			IP1SR8_23_20)
-#define GPSR8_12	F_(GP8_12,			IP1SR8_19_16)
-#define GPSR8_11	F_(SDA5,			IP1SR8_15_12)
-#define GPSR8_10	F_(SCL5,			IP1SR8_11_8)
-#define GPSR8_9		F_(SDA4,			IP1SR8_7_4)
-#define GPSR8_8		F_(SCL4,			IP1SR8_3_0)
-#define GPSR8_7		F_(SDA3,			IP0SR8_31_28)
-#define GPSR8_6		F_(SCL3,			IP0SR8_27_24)
-#define GPSR8_5		F_(SDA2,			IP0SR8_23_20)
-#define GPSR8_4		F_(SCL2,			IP0SR8_19_16)
-#define GPSR8_3		F_(SDA1,			IP0SR8_15_12)
-#define GPSR8_2		F_(SCL1,			IP0SR8_11_8)
-#define GPSR8_1		F_(SDA0,			IP0SR8_7_4)
-#define GPSR8_0		F_(SCL0,			IP0SR8_3_0)
+#define GPSR8_13	F_(GP8_13,		IP1SR8_23_20)
+#define GPSR8_12	F_(GP8_12,		IP1SR8_19_16)
+#define GPSR8_11	F_(SDA5,		IP1SR8_15_12)
+#define GPSR8_10	F_(SCL5,		IP1SR8_11_8)
+#define GPSR8_9		F_(SDA4,		IP1SR8_7_4)
+#define GPSR8_8		F_(SCL4,		IP1SR8_3_0)
+#define GPSR8_7		F_(SDA3,		IP0SR8_31_28)
+#define GPSR8_6		F_(SCL3,		IP0SR8_27_24)
+#define GPSR8_5		F_(SDA2,		IP0SR8_23_20)
+#define GPSR8_4		F_(SCL2,		IP0SR8_19_16)
+#define GPSR8_3		F_(SDA1,		IP0SR8_15_12)
+#define GPSR8_2		F_(SCL1,		IP0SR8_11_8)
+#define GPSR8_1		F_(SDA0,		IP0SR8_7_4)
+#define GPSR8_0		F_(SCL0,		IP0SR8_3_0)
 
 /* SR0 */
 /* IP0SR0 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-- 
2.25.1

