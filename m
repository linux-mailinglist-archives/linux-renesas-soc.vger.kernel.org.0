Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5173F2DFE4B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgLUQ5w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:57:52 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:36395 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgLUQ5w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569700;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=E8fODucT7NMP07QcLt5hFnI6M+SMTjHLe6E7Qar+0HM=;
        b=LDezslk98ws+03ZU4X0xPA6uIdlcgsxLKxLR+P4mUcvLKho2FULhEfuuy6si85RcgI
        DTz+rsq1tyxOqqAYlkquQEsP/4tY0rJexARh+N+KgnmHOK3CQ3W5bSs7kH46iFFnjhTh
        Y0pPQsuWz0cXGMD3jV4j7QWCpc5WnMs71QU4RYzNQzE19emtEGatfvpnu9pphvHicuj1
        EwZ4NoY8sQy2eCYxcaWa50CQpQV+7pDoEM3U3Ofs49xFYaZ1/toJQIBPYixtjTjebosX
        vPiX4Pw2H2H5DNpn5AnVdxhPx6MUlHn8qkaNy51VeJ67+sPSo/1N610bQRVlBUvJUWAh
        xKAQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGss0K9
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:54:54 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 1/5] pinctrl: renesas: implement unlock register masks
Date:   Mon, 21 Dec 2020 17:54:44 +0100
Message-Id: <20201221165448.27312-2-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221165448.27312-1-uli+renesas@fpond.eu>
References: <20201221165448.27312-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The V3U SoC has several unlock registers, one per register group. They
reside at offset zero in each 0x200 bytes-sized block.

To avoid adding yet another table to the PFC implementation, this
patch adds the option to specify an address mask instead of the fixed
address in sh_pfc_soc_info::unlock_reg.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/core.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 2cc457279345..4cd95e220900 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -175,13 +175,25 @@ u32 sh_pfc_read(struct sh_pfc *pfc, u32 reg)
 	return sh_pfc_read_raw_reg(sh_pfc_phys_to_virt(pfc, reg), 32);
 }
 
-void sh_pfc_write(struct sh_pfc *pfc, u32 reg, u32 data)
+static void sh_pfc_unlock_reg(struct sh_pfc *pfc, u32 reg, u32 data)
 {
-	if (pfc->info->unlock_reg)
-		sh_pfc_write_raw_reg(
-			sh_pfc_phys_to_virt(pfc, pfc->info->unlock_reg), 32,
-			~data);
+	u32 unlock;
+
+	if (!pfc->info->unlock_reg)
+		return;
 
+	if (pfc->info->unlock_reg >= 0x80000000UL)
+		unlock = pfc->info->unlock_reg;
+	else
+		/* unlock_reg is a mask */
+		unlock = reg & ~pfc->info->unlock_reg;
+
+	sh_pfc_write_raw_reg(sh_pfc_phys_to_virt(pfc, unlock), 32, ~data);
+}
+
+void sh_pfc_write(struct sh_pfc *pfc, u32 reg, u32 data)
+{
+	sh_pfc_unlock_reg(pfc, reg, data);
 	sh_pfc_write_raw_reg(sh_pfc_phys_to_virt(pfc, reg), 32, data);
 }
 
@@ -227,11 +239,7 @@ static void sh_pfc_write_config_reg(struct sh_pfc *pfc,
 	data &= mask;
 	data |= value;
 
-	if (pfc->info->unlock_reg)
-		sh_pfc_write_raw_reg(
-			sh_pfc_phys_to_virt(pfc, pfc->info->unlock_reg), 32,
-			~data);
-
+	sh_pfc_unlock_reg(pfc, crp->reg, data);
 	sh_pfc_write_raw_reg(mapped_reg, crp->reg_width, data);
 }
 
-- 
2.20.1

