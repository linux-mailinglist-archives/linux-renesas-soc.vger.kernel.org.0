Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08C1977C8A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbjHOHf0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbjHOHe5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:34:57 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1D1461989
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2023 00:34:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,174,1684767600"; 
   d="scan'208";a="176668734"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Aug 2023 16:34:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.136])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9018F417BE7E;
        Tue, 15 Aug 2023 16:34:52 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] mfd: rz-mtu3: Replace raw_spin_lock->spin_lock()
Date:   Tue, 15 Aug 2023 08:34:45 +0100
Message-Id: <20230815073445.9579-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230815073445.9579-1-biju.das.jz@bp.renesas.com>
References: <20230815073445.9579-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
Closes: https://lore.kernel.org/all/ZIL%2FitcJvV5s3Bnf@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Rebased to next.
 * Updated Closes tag link.
---
 drivers/mfd/rz-mtu3.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 416eef1d1dfd..19afdd8e96fe 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -23,7 +23,7 @@
 struct rz_mtu3_priv {
 	void __iomem *mmio;
 	struct reset_control *rstc;
-	raw_spinlock_t lock;
+	spinlock_t lock;
 };
 
 /******* MTU3 registers (original offset is +0x1200) *******/
@@ -177,11 +177,11 @@ void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 offset,
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
 
@@ -257,13 +257,13 @@ static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
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
@@ -278,9 +278,9 @@ bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
 	bitpos = rz_mtu3_get_tstr_bit_pos(ch);
 
 	/* start stop register shared by multiple timer channels */
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	spin_lock_irqsave(&priv->lock, flags);
 	tstr = rz_mtu3_shared_reg_read(ch, offset);
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
+	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return tstr & BIT(bitpos);
 }
@@ -350,7 +350,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 		return PTR_ERR(ddata->clk);
 
 	reset_control_deassert(priv->rstc);
-	raw_spin_lock_init(&priv->lock);
+	spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, ddata);
 
 	for (i = 0; i < RZ_MTU_NUM_CHANNELS; i++) {
-- 
2.25.1

