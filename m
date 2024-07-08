Return-Path: <linux-renesas-soc+bounces-7172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB90392A251
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 14:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17D7C1C20F72
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 12:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2B613E055;
	Mon,  8 Jul 2024 12:10:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C468113DDB6;
	Mon,  8 Jul 2024 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720440601; cv=none; b=UkusThn+BDe4Uv7yibSW2G5H6saHvpM9dHlx0ldeCxRKBvWezAuF/TEHioyWvR6YYTWYeM65OpVRLvh/XnJvZpnUDIp7gasm6qnUh9Ml7QlswVp5IiCz47l064zPpiEGzpOwENKjMsmHO3hw+OwQiOwO4bh66ZIUR3V/am/ssEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720440601; c=relaxed/simple;
	bh=3jx3gI7/4QzzK2GDedvL/QLgFH+FBGmQr9Fdn0kFI38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Aj9qoExw3TLLkm9fccAnNyn+Jov0PFzFVmx85S+m9CXaCgNFFUauILbnLbvcA2aNn13hah0XVtk88nqdqjHVMTO55e+SWVFsITCUsedGW3d4rPClfbR5P9jIVc0xgqUTGVEmFXqKPLMfRuxuDLtaW/cVaH5tmulcRz+yRGweuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,191,1716217200"; 
   d="scan'208";a="214631183"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2024 21:09:53 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C30334005643;
	Mon,  8 Jul 2024 21:09:53 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/5] scsi: ufs: renesas: Remove a static local variable
Date: Mon,  8 Jul 2024 21:09:28 +0900
Message-Id: <20240708120931.1703956-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240708120931.1703956-1-yoshihiro.shimoda.uh@renesas.com>
References: <20240708120931.1703956-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After refactored code, the driver can store register values in
variables. So, remove a static local variable "save" in
ufs_renesas_reg_control() to improve code readability.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/ufs/host/ufs-renesas.c | 97 +++++++++-------------------------
 1 file changed, 25 insertions(+), 72 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index 36e880449479..3a393bd4c407 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -23,10 +23,8 @@ struct ufs_renesas_priv {
 };
 
 enum ufs_renesas_init_param_mode {
-	MODE_RESTORE,
-	MODE_SET,
-	MODE_SAVE,
 	MODE_POLL,
+	MODE_READ,
 	MODE_WAIT,
 	MODE_WRITE,
 };
@@ -37,7 +35,6 @@ struct ufs_renesas_init_param {
 	union {
 		u32 expected;
 		u32 delay_us;
-		u32 set;
 		u32 val;
 	} u;
 	u32 mask;
@@ -49,22 +46,15 @@ static void ufs_renesas_dbg_register_dump(struct ufs_hba *hba)
 	ufshcd_dump_regs(hba, 0xc0, 0x40, "regs: 0xc0 + ");
 }
 
-static void ufs_renesas_reg_control(struct ufs_hba *hba,
-				    const struct ufs_renesas_init_param *p)
+static u32 ufs_renesas_reg_control(struct ufs_hba *hba,
+				   const struct ufs_renesas_init_param *p)
 {
-	static u32 save[MAX_INDEX];
+	u32 val = 0;
 	int ret;
-	u32 val;
 
 	switch (p->mode) {
-	case MODE_RESTORE:
-		ufshcd_writel(hba, save[p->index], p->reg);
-		break;
-	case MODE_SET:
-		save[p->index] |= p->u.set;
-		break;
-	case MODE_SAVE:
-		save[p->index] = ufshcd_readl(hba, p->reg) & p->mask;
+	case MODE_READ:
+		val = ufshcd_readl(hba, p->reg);
 		break;
 	case MODE_POLL:
 		ret = readl_poll_timeout_atomic(hba->mmio_base + p->reg,
@@ -87,52 +77,29 @@ static void ufs_renesas_reg_control(struct ufs_hba *hba,
 	default:
 		break;
 	}
-}
 
-static void ufs_renesas_param_poll(struct ufs_hba *hba, u32 reg, u32 expected,
-				   u32 mask)
-{
-	struct ufs_renesas_init_param param = { 0 };
-
-	param.mode = MODE_POLL;
-	param.reg = reg;
-	param.u.expected = expected;
-	param.mask = mask;
-
-	ufs_renesas_reg_control(hba, &param);
+	return val;
 }
 
-static void ufs_renesas_param_restore(struct ufs_hba *hba, u32 reg, u32 index)
+static u32 ufs_renesas_param_read(struct ufs_hba *hba, u32 reg)
 {
 	struct ufs_renesas_init_param param = { 0 };
 
-	param.mode = MODE_RESTORE;
+	param.mode = MODE_READ;
 	param.reg = reg;
-	param.index = index;
 
-	ufs_renesas_reg_control(hba, &param);
+	return ufs_renesas_reg_control(hba, &param);
 }
 
-static void ufs_renesas_param_save(struct ufs_hba *hba, u32 reg, u32 mask,
-				   u32 index)
+static void ufs_renesas_param_poll(struct ufs_hba *hba, u32 reg, u32 expected,
+				   u32 mask)
 {
 	struct ufs_renesas_init_param param = { 0 };
 
-	param.mode = MODE_SAVE;
+	param.mode = MODE_POLL;
 	param.reg = reg;
+	param.u.expected = expected;
 	param.mask = mask;
-	param.index = index;
-
-	ufs_renesas_reg_control(hba, &param);
-}
-
-static void ufs_renesas_param_set(struct ufs_hba *hba, u32 index, u32 set)
-{
-	struct ufs_renesas_init_param param = { 0 };
-
-	param.mode = MODE_SAVE;
-	param.index = index;
-	param.u.set = set;
 
 	ufs_renesas_reg_control(hba, &param);
 }
@@ -173,15 +140,6 @@ static void ufs_renesas_param_write_800_80c_poll(struct ufs_hba *hba, u32 addr,
 	ufs_renesas_param_poll(hba, 0xd4, BIT(8), BIT(8));
 }
 
-static void ufs_renesas_param_restore_800_80c_poll(struct ufs_hba *hba, u32 index)
-{
-	ufs_renesas_param_write_d0_d4(hba, 0x0000080c, 0x00000100);
-	ufs_renesas_param_write(hba, 0xd0, 0x00000800);
-	ufs_renesas_param_restore(hba, 0xd4, index);
-	ufs_renesas_param_write(hba, 0xd0, 0x0000080c);
-	ufs_renesas_param_poll(hba, 0xd4, BIT(8), BIT(8));
-}
-
 static void ufs_renesas_param_write_804_80c_poll(struct ufs_hba *hba, u32 addr, u32 data_804)
 {
 	ufs_renesas_param_write_d0_d4(hba, 0x0000080c, 0x00000100);
@@ -212,6 +170,8 @@ static void ufs_renesas_param_write_phy(struct ufs_hba *hba, u32 addr16, u32 dat
 
 static void ufs_renesas_param_set_phy(struct ufs_hba *hba, u32 addr16, u32 data16)
 {
+	u32 low, high;
+
 	ufs_renesas_param_write(hba, 0xf0, 1);
 	ufs_renesas_param_write_800_80c_poll(hba, 0x16, addr16 & 0xff);
 	ufs_renesas_param_write_800_80c_poll(hba, 0x17, (addr16 >> 8) & 0xff);
@@ -219,24 +179,15 @@ static void ufs_renesas_param_set_phy(struct ufs_hba *hba, u32 addr16, u32 data1
 	ufs_renesas_param_write_828_82c_poll(hba, 0x0f000000);
 	ufs_renesas_param_write_804_80c_poll(hba, 0x1a, 0);
 	ufs_renesas_param_write(hba, 0xd0, 0x00000808);
-	ufs_renesas_param_save(hba, 0xd4, 0xff, SET_PHY_INDEX_LO);
+	low = ufs_renesas_param_read(hba, 0xd4) & 0xff;
 	ufs_renesas_param_write_804_80c_poll(hba, 0x1b, 0);
 	ufs_renesas_param_write(hba, 0xd0, 0x00000808);
-	ufs_renesas_param_save(hba, 0xd4, 0xff, SET_PHY_INDEX_HI);
-	ufs_renesas_param_write_828_82c_poll(hba, 0x0f000000);
-	ufs_renesas_param_write(hba, 0xf0, 0);
-	ufs_renesas_param_write(hba, 0xf0, 1);
-	ufs_renesas_param_write_800_80c_poll(hba, 0x16, addr16 & 0xff);
-	ufs_renesas_param_write_800_80c_poll(hba, 0x17, (addr16 >> 8) & 0xff);
-	ufs_renesas_param_set(hba, SET_PHY_INDEX_LO,
-			      ((data16 & 0xff) << 16) | BIT(8) | 0x18);
-	ufs_renesas_param_restore_800_80c_poll(hba, SET_PHY_INDEX_LO);
-	ufs_renesas_param_set(hba, SET_PHY_INDEX_HI,
-			      (((data16 >> 8) & 0xff) << 16) | BIT(8) | 0x19);
-	ufs_renesas_param_restore_800_80c_poll(hba, SET_PHY_INDEX_HI);
-	ufs_renesas_param_write_800_80c_poll(hba, 0x1c, 0x01);
+	high = ufs_renesas_param_read(hba, 0xd4) & 0xff;
 	ufs_renesas_param_write_828_82c_poll(hba, 0x0f000000);
 	ufs_renesas_param_write(hba, 0xf0, 0);
+
+	data16 |= (high << 8) | low;
+	ufs_renesas_param_write_phy(hba, addr16, data16);
 }
 
 static void ufs_renesas_param_indirect_write(struct ufs_hba *hba, u32 gpio,
@@ -260,6 +211,8 @@ static void ufs_renesas_param_indirect_poll(struct ufs_hba *hba, u32 gpio,
 
 static void ufs_renesas_pre_init(struct ufs_hba *hba)
 {
+	u32 timer_val;
+
 	/* This setting is for SERIES B */
 	ufs_renesas_param_write(hba, 0xc0, 0x49425308);
 	ufs_renesas_param_write_d0_d4(hba, 0x00000104, 0x00000002);
@@ -287,7 +240,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 			       BIT(8) | BIT(6) | BIT(0));
 
 	ufs_renesas_param_write(hba, 0xd0, 0x00000d00);
-	ufs_renesas_param_save(hba, 0xd4, 0x0000ffff, TIMER_INDEX);
+	timer_val = ufs_renesas_param_read(hba, 0xd4) & 0x0000ffff;
 	ufs_renesas_param_write(hba, 0xd4, 0x00000000);
 	ufs_renesas_param_write_d0_d4(hba, 0x0000082c, 0x0f000000);
 	ufs_renesas_param_write_d0_d4(hba, 0x00000828, 0x08000000);
@@ -382,7 +335,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 
 	ufs_renesas_param_write(hba, 0xf0, 0);
 	ufs_renesas_param_write(hba, 0xd0, 0x00000d00);
-	ufs_renesas_param_restore(hba, 0xd4, TIMER_INDEX);
+	ufs_renesas_param_write(hba, 0xd4, timer_val);
 }
 
 static int ufs_renesas_hce_enable_notify(struct ufs_hba *hba,
-- 
2.25.1


