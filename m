Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0C6075624D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 14:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjGQMEK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 08:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjGQMEK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 08:04:10 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ADADE10F0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 05:03:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="173141339"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2023 21:03:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 075B74192B33;
        Mon, 17 Jul 2023 21:03:35 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mfd: rz-mtu3: Improve critical sections
Date:   Mon, 17 Jul 2023 13:03:33 +0100
Message-Id: <20230717120333.165219-1-biju.das.jz@bp.renesas.com>
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

Improve critical sections on rz_mtu3_start_stop_ch() and
rz_mtu3_is_enabled() by moving offset and bitpos computation
outside the critical section and drop the 'ret' variable on
rz_mtu3_is_enabled() and return 'tstr & BIT(bitpos)' directly.

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://patchwork.kernel.org/project/cip-dev/patch/20230606075235.183132-4-biju.das.jz@bp.renesas.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mfd/rz-mtu3.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 037956f0254b..e5cace963c7c 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -251,11 +251,12 @@ static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
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
@@ -268,21 +269,18 @@ bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
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

