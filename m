Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06957127A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 15:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243481AbjEZNe2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 09:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243684AbjEZNe1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 09:34:27 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A3EA71B7;
        Fri, 26 May 2023 06:34:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,194,1681138800"; 
   d="scan'208";a="164481231"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 May 2023 22:33:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.166])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 66BB84216EE7;
        Fri, 26 May 2023 22:33:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
Subject: [PATCH v2 2/3] i2c: rzv2m: Replace lowercase macros with static inline functions
Date:   Fri, 26 May 2023 14:33:02 +0100
Message-Id: <20230526133303.309582-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526133303.309582-1-biju.das.jz@bp.renesas.com>
References: <20230526133303.309582-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert macros bit_setl and bit_clrl with static inline functions
as normally we'd put macro names in all uppercase.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit header and description.
 * Replaced macros bit_setl and bit_clrl with static inline functions.
---
 drivers/i2c/busses/i2c-rzv2m.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 56d0faee5c46..8518ae5dfeee 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -50,9 +50,6 @@
 #define IICB0MDSC	BIT(7)		/* Bus Mode */
 #define IICB0SLSE	BIT(1)		/* Start condition output */
 
-#define bit_setl(addr, val)		writel(readl(addr) | (val), (addr))
-#define bit_clrl(addr, val)		writel(readl(addr) & ~(val), (addr))
-
 struct rzv2m_i2c_priv {
 	void __iomem *base;
 	struct i2c_adapter adap;
@@ -78,6 +75,16 @@ static const struct bitrate_config bitrate_configs[] = {
 	[RZV2M_I2C_400K] = { 52, 900 },
 };
 
+static inline void bit_setl(void __iomem *addr, u32 val)
+{
+	writel(readl(addr) | (val), (addr));
+}
+
+static inline void bit_clrl(void __iomem *addr, u32 val)
+{
+	writel(readl(addr) & ~(val), (addr));
+}
+
 static irqreturn_t rzv2m_i2c_tia_irq_handler(int this_irq, void *dev_id)
 {
 	struct rzv2m_i2c_priv *priv = dev_id;
-- 
2.25.1

