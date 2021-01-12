Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F21A2F3667
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391048AbhALRCX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:23 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:18672 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390846AbhALRCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470770;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=ysgrWTXzHu/Rh1qZdcSrLhoSOvZqp2Vn47gMRkHyFcQ=;
        b=OVd9Rxx+tFWYKNidS5adFhJpNPu3cY07vHLk1GcEJrhZtgMi31FxfM9iwPIpydoLs7
        4TV4cDeJiitaB6pYx7Mk0+O1D3k0ZVjuoRPm2fIcHwSyODr6ts9RLTBdduKlRDIYOukF
        kYUmQzw3SUITayT36DNolKAbScnByKrDQiEggaPr1vVFi3jKekksTkBxi7B9Zyv9MNmm
        5sUXvkYkHIPIqnckY3hxsEth/uSfNCAudGl7UuM0U8pyqTaj+8SPup6gg3lotonK+Mm1
        SUL0oAzSQUTigQwW7z942J8xHtVHiBArWGPePWNkGUTCcfx4zXh5yu7ZIaQCyIk84MgX
        mpwg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxNNUD
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:23 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 1/6] pinctrl: renesas: implement unlock register masks
Date:   Tue, 12 Jan 2021 17:59:07 +0100
Message-Id: <20210112165912.30876-2-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165912.30876-1-uli+renesas@fpond.eu>
References: <20210112165912.30876-1-uli+renesas@fpond.eu>
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
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/renesas/core.c   | 28 ++++++++++++++++++----------
 drivers/pinctrl/renesas/sh_pfc.h |  2 +-
 2 files changed, 19 insertions(+), 11 deletions(-)

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
 
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index dc484c13f59c..1404bd897d25 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -300,7 +300,7 @@ struct sh_pfc_soc_info {
 	const u16 *pinmux_data;
 	unsigned int pinmux_data_size;
 
-	u32 unlock_reg;
+	u32 unlock_reg;		/* can be literal address or mask */
 };
 
 extern const struct sh_pfc_soc_info emev2_pinmux_info;
-- 
2.20.1

