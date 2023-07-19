Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF5727595D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 14:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjGSMri (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 08:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjGSMrh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 08:47:37 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 177FF1B5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 05:47:35 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,216,1684767600"; 
   d="scan'208";a="173644478"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jul 2023 21:47:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.206])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3286541F6EC3;
        Wed, 19 Jul 2023 21:47:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mfd: rz-mtu3: Replace raw_spin_lock->spin_lock()
Date:   Wed, 19 Jul 2023 13:47:29 +0100
Message-Id: <20230719124729.270393-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per kernel documentation, use raw_spinlock_t only in real critical core
code, low-level interrupt handling, and places where disabling preemption
or interrupts is required. Here the lock is for concurrent register access
from different drivers, hence spin_lock() is sufficient.

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230717120333.165219-1-biju.das.jz@bp.renesas.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230717120333.165219-1-biju.das.jz@bp.renesas.com/
---
 drivers/mfd/rz-mtu3.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index e5cace963c7c..2400bf5830b9 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -21,7 +21,7 @@
 struct rz_mtu3_priv {
 	void __iomem *mmio;
 	struct reset_control *rstc;
-	raw_spinlock_t lock;
+	spinlock_t lock;
 };
 
 /******* MTU3 registers (original offset is +0x1200) *******/
@@ -175,11 +175,11 @@ void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 offset,
 	struct rz_mtu3_priv *priv = mtu->priv_data;
 	unsigned long tmdr, flags;
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	spin_lock_irqsave(&priv->lock, flags);
 	tmdr = rz_mtu3_shared_reg_read(ch, offset);
 	__assign_bit(pos, &tmdr, !!val);
 	rz_mtu3_shared_reg_write(ch, offset, tmdr);
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
+	spin_unlock_irqrestore(&priv->lock, flags);
 }
 EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_update_bit);
 
@@ -255,13 +255,13 @@ static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
 	bitpos = rz_mtu3_get_tstr_bit_pos(ch);
 
 	/* start stop register shared by multiple timer channels */
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	spin_lock_irqsave(&priv->lock, flags);
 
 	tstr = rz_mtu3_shared_reg_read(ch, offset);
 	__assign_bit(bitpos, &tstr, start);
 	rz_mtu3_shared_reg_write(ch, offset, tstr);
 
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
+	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
 bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
@@ -276,9 +276,9 @@ bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
 	bitpos = rz_mtu3_get_tstr_bit_pos(ch);
 
 	/* start stop register shared by multiple timer channels */
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	spin_lock_irqsave(&priv->lock, flags);
 	tstr = rz_mtu3_shared_reg_read(ch, offset);
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
+	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return tstr & BIT(bitpos);
 }
@@ -348,7 +348,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 		return PTR_ERR(ddata->clk);
 
 	reset_control_deassert(priv->rstc);
-	raw_spin_lock_init(&priv->lock);
+	spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, ddata);
 
 	for (i = 0; i < RZ_MTU_NUM_CHANNELS; i++) {
-- 
2.25.1

