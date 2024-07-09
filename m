Return-Path: <linux-renesas-soc+bounces-7187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D72492AE3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 04:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89341F2288A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 02:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE0241C6C;
	Tue,  9 Jul 2024 02:36:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5204A42052;
	Tue,  9 Jul 2024 02:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492565; cv=none; b=Bo+KKCEDPsjUFn04ZNopRiPrQH3HzSKCjggrRPOBASKBhObE45d9AXvUrgVhzTmEJq2rg45Eh+A0+UJsVYedgZngO3mr2haw2wTlJ7byo+Cfv1TeDFw+PPaj/C4Jo6xadtQWjl96JvjIvN2FiyT4Ss7h/5uT0MKetF+vmHZDxjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492565; c=relaxed/simple;
	bh=TU5T9ENmDTsWEciMnmXdYfOHV4lEhG/9l3yumKGcW1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZLGiIrDqdEhAf+Lq8lBz1jHETXWmXDoz3P/ixlf4FmPue5Q6BXgiTOKaoqkGrwM/FBRq7ijyofJx8yrCh3KcLDSZfTP7SGtRWidG87FzXQbJ0a6AIUktaTufp3N3RPdMgPwtLoVHBJSG4DvnArUM9yb5X+bkb0LQdmZb2IWobsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,193,1716217200"; 
   d="scan'208";a="210737180"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jul 2024 11:35:58 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 35C884140BEE;
	Tue,  9 Jul 2024 11:35:58 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 3/5] scsi: ufs: renesas: Remove a register controll helper function
Date: Tue,  9 Jul 2024 11:35:48 +0900
Message-Id: <20240709023550.1750333-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709023550.1750333-1-yoshihiro.shimoda.uh@renesas.com>
References: <20240709023550.1750333-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After refactored the code, ufs_renesas_reg_control() was not needed
anymore because a suitable function can be called directly. So, remove
the helper function.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/ufs/host/ufs-renesas.c | 102 +++++----------------------------
 1 file changed, 14 insertions(+), 88 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index e541f86c9eb0..e02c147e6248 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -22,106 +22,32 @@ struct ufs_renesas_priv {
 	bool initialized;	/* The hardware needs initialization once */
 };
 
-enum ufs_renesas_init_param_mode {
-	MODE_POLL,
-	MODE_READ,
-	MODE_WAIT,
-	MODE_WRITE,
-};
-
-struct ufs_renesas_init_param {
-	enum ufs_renesas_init_param_mode mode;
-	u32 reg;
-	union {
-		u32 expected;
-		u32 delay_us;
-		u32 val;
-	} u;
-	u32 mask;
-	u32 index;
-};
-
 static void ufs_renesas_dbg_register_dump(struct ufs_hba *hba)
 {
 	ufshcd_dump_regs(hba, 0xc0, 0x40, "regs: 0xc0 + ");
 }
 
-static u32 ufs_renesas_reg_control(struct ufs_hba *hba,
-				   const struct ufs_renesas_init_param *p)
-{
-	u32 val = 0;
-	int ret;
-
-	switch (p->mode) {
-	case MODE_POLL:
-		ret = readl_poll_timeout_atomic(hba->mmio_base + p->reg,
-						val,
-						(val & p->mask) == p->u.expected,
-						10, 1000);
-		if (ret)
-			dev_err(hba->dev, "%s: poll failed %d (%08x, %08x, %08x)\n",
-				__func__, ret, val, p->mask, p->u.expected);
-		break;
-	case MODE_READ:
-		val = ufshcd_readl(hba, p->reg);
-		break;
-	case MODE_WAIT:
-		if (p->u.delay_us > 1000)
-			mdelay(DIV_ROUND_UP(p->u.delay_us, 1000));
-		else
-			udelay(p->u.delay_us);
-		break;
-	case MODE_WRITE:
-		ufshcd_writel(hba, p->u.val, p->reg);
-		break;
-	default:
-		break;
-	}
-
-	return val;
-}
-
 static void ufs_renesas_poll(struct ufs_hba *hba, u32 reg, u32 expected, u32 mask)
 {
-	struct ufs_renesas_init_param param = {
-		.mode = MODE_POLL,
-		.reg = reg,
-		.u.expected = expected,
-		.mask = mask,
-	};
-
-	ufs_renesas_reg_control(hba, &param);
+	int ret;
+	u32 val;
+
+	ret = readl_poll_timeout_atomic(hba->mmio_base + reg,
+					val, (val & mask) == expected,
+					10, 1000);
+	if (ret)
+		dev_err(hba->dev, "%s: poll failed %d (%08x, %08x, %08x)\n",
+			__func__, ret, val, mask, expected);
 }
 
 static u32 ufs_renesas_read(struct ufs_hba *hba, u32 reg)
 {
-	struct ufs_renesas_init_param param = {
-		.mode = MODE_READ,
-		.reg = reg,
-	};
-
-	return ufs_renesas_reg_control(hba, &param);
-}
-
-static void ufs_renesas_wait(struct ufs_hba *hba, u32 delay_us)
-{
-	struct ufs_renesas_init_param param = {
-		.mode = MODE_WAIT,
-		.u.delay_us = delay_us,
-	};
-
-	ufs_renesas_reg_control(hba, &param);
+	return ufshcd_readl(hba, reg);
 }
 
 static void ufs_renesas_write(struct ufs_hba *hba, u32 reg, u32 value)
 {
-	struct ufs_renesas_init_param param = {
-		.mode = MODE_WRITE,
-		.reg = reg,
-		.u.val = value,
-	};
-
-	ufs_renesas_reg_control(hba, &param);
+	ufshcd_writel(hba, value, reg);
 }
 
 static void ufs_renesas_write_d0_d4(struct ufs_hba *hba, u32 d0, u32 d4)
@@ -215,13 +141,13 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	/* This setting is for SERIES B */
 	ufs_renesas_write(hba, 0xc0, 0x49425308);
 	ufs_renesas_write_d0_d4(hba, 0x00000104, 0x00000002);
-	ufs_renesas_wait(hba, 1);
+	udelay(1);
 	ufs_renesas_write_d0_d4(hba, 0x00000828, 0x00000200);
-	ufs_renesas_wait(hba, 1);
+	udelay(1);
 	ufs_renesas_write_d0_d4(hba, 0x00000828, 0x00000000);
 	ufs_renesas_write_d0_d4(hba, 0x00000104, 0x00000001);
 	ufs_renesas_write_d0_d4(hba, 0x00000940, 0x00000001);
-	ufs_renesas_wait(hba, 1);
+	udelay(1);
 	ufs_renesas_write_d0_d4(hba, 0x00000940, 0x00000000);
 
 	ufs_renesas_write(hba, 0xc0, 0x49425308);
-- 
2.25.1


