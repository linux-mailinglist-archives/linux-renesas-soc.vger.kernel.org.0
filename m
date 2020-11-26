Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092022C5A80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391686AbgKZR1I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:27:08 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:20098 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391683AbgKZR1I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606411626;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=E8fODucT7NMP07QcLt5hFnI6M+SMTjHLe6E7Qar+0HM=;
        b=sOdvBLLvJYILQApcxAOtvfvbiwWQdDQjYqkbAdI5fXX2ge0+ZLHYzz5il1DSlha/l/
        0B7kEb/wLqyyK4026v310Qsd7/ee/gVhDDzXUNOiKRvDyGMcEn5D1Mn7AuRnvFIasg18
        hiphzRLmC3jaD6LMvuu9MeHAdI649xlPiOH8pLLGMKEaI4iOiNbZcJFOScIT0OCqTY3c
        txc4XqGyMsT6B15Hdn5JelC5/Q2O09il4tf1j4BLsF0VGdHQeOwYOr02TyEyNwwRTyy9
        Rb1o/a/shQCbbEQG0XybzC1nQgE4XZpql/4AW4NrV+mn5a59YnSu/+DbBp0T/ED77ImD
        1Rwg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82ped3jxkhQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wAQHL4MpM
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 26 Nov 2020 18:21:04 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 1/3] pinctrl: renesas: implement unlock register masks
Date:   Thu, 26 Nov 2020 18:20:56 +0100
Message-Id: <20201126172058.25275-2-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126172058.25275-1-uli+renesas@fpond.eu>
References: <20201126172058.25275-1-uli+renesas@fpond.eu>
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

