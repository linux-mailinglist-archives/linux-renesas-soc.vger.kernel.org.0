Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E7577C8A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234809AbjHOHfY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235207AbjHOHex (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:34:53 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3E10B172C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2023 00:34:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,174,1684767600"; 
   d="scan'208";a="172983120"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2023 16:34:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.136])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 132B4417C107;
        Tue, 15 Aug 2023 16:34:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] mfd: rz-mtu3: Reduce critical sections
Date:   Tue, 15 Aug 2023 08:34:44 +0100
Message-Id: <20230815073445.9579-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230815073445.9579-1-biju.das.jz@bp.renesas.com>
References: <20230815073445.9579-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Reduce critical sections on rz_mtu3_start_stop_ch() and
rz_mtu3_is_enabled() by moving offset and bitpos computation
outside the critical section and drop the 'ret' variable on
rz_mtu3_is_enabled() and return 'tstr & BIT(bitpos)' directly.

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/all/ZIMAse1ikTuycJ02@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Pavel Machek <pavel@denx.de>
---
v1->v2:
 * Added Rb tag from Pavel
 * Updated Closes tag link.
 * Replaced "Improve critical sections"->"Reduce critical sections" in
   commit header and description.
 * Retained Rb tag as it is trivial change.
---
 drivers/mfd/rz-mtu3.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 0156e381fe07..416eef1d1dfd 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -253,11 +253,12 @@ static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
 	u16 offset;
 	u8 bitpos;
 
+	offset = rz_mtu3_get_tstr_offset(ch);
+	bitpos = rz_mtu3_get_tstr_bit_pos(ch);
+
 	/* start stop register shared by multiple timer channels */
 	raw_spin_lock_irqsave(&priv->lock, flags);
 
-	offset = rz_mtu3_get_tstr_offset(ch);
-	bitpos = rz_mtu3_get_tstr_bit_pos(ch);
 	tstr = rz_mtu3_shared_reg_read(ch, offset);
 	__assign_bit(bitpos, &tstr, start);
 	rz_mtu3_shared_reg_write(ch, offset, tstr);
@@ -270,21 +271,18 @@ bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
 	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
 	struct rz_mtu3_priv *priv = mtu->priv_data;
 	unsigned long flags, tstr;
-	bool ret = false;
 	u16 offset;
 	u8 bitpos;
 
-	/* start stop register shared by multiple timer channels */
-	raw_spin_lock_irqsave(&priv->lock, flags);
-
 	offset = rz_mtu3_get_tstr_offset(ch);
 	bitpos = rz_mtu3_get_tstr_bit_pos(ch);
-	tstr = rz_mtu3_shared_reg_read(ch, offset);
-	ret = tstr & BIT(bitpos);
 
+	/* start stop register shared by multiple timer channels */
+	raw_spin_lock_irqsave(&priv->lock, flags);
+	tstr = rz_mtu3_shared_reg_read(ch, offset);
 	raw_spin_unlock_irqrestore(&priv->lock, flags);
 
-	return ret;
+	return tstr & BIT(bitpos);
 }
 EXPORT_SYMBOL_GPL(rz_mtu3_is_enabled);
 
-- 
2.25.1

