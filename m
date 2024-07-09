Return-Path: <linux-renesas-soc+bounces-7185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 215F192AE37
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 04:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76787B2155C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 02:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A8842076;
	Tue,  9 Jul 2024 02:36:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF2D3BBC9;
	Tue,  9 Jul 2024 02:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492564; cv=none; b=EaKaCFvlCogX+z2a2kJPcf+0qjBthzfn0+Fu172+RwjXa7kI3nAd6zK+7kcQ8LO0IAHm3iNRNmLU16s7ClyLuJ3ET8CScSbzCL+HKVgGMZKSczMATBxLQfv+R8kaD5abWCIpd+cS8FNtcKyWU+Bq6U4vW8w0+Gl/HGjbZzhBp9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492564; c=relaxed/simple;
	bh=Z03CIdy70wu+xookzZwpyFvTPjdZBYsdzqHr0KnIlPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rs6rY+0vp2yIlkrzkJPBXJYzbhM8CTrDJjS5gy6EY1JragnI76IqDuO23aMH54FWchxuk4Ro12A1Y6xt+E/qyHmuikPF+xSPEhn8Ds83IJY4gThw2jxEBOkhqE+l+4hiuMiPR/qs5W/BjTW5YaUNi0oNHLCAzSIo+gxuwqUbsjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,193,1716217200"; 
   d="scan'208";a="214695290"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jul 2024 11:35:58 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 270034140BEF;
	Tue,  9 Jul 2024 11:35:58 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/5] scsi: ufs: renesas: Remove a static local variable
Date: Tue,  9 Jul 2024 11:35:47 +0900
Message-Id: <20240709023550.1750333-3-yoshihiro.shimoda.uh@renesas.com>
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

After refactored code, the driver can store register values in
variables. So, remove a static local variable "save" in
ufs_renesas_reg_control() to improve code readability.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/ufs/host/ufs-renesas.c | 97 ++++++++--------------------------
 1 file changed, 23 insertions(+), 74 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index 70a591f7aa16..e541f86c9eb0 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -22,18 +22,9 @@ struct ufs_renesas_priv {
 	bool initialized;	/* The hardware needs initialization once */
 };
 
-enum {
-	SET_PHY_INDEX_LO = 0,
-	SET_PHY_INDEX_HI,
-	TIMER_INDEX,
-	MAX_INDEX
-};
-
 enum ufs_renesas_init_param_mode {
-	MODE_RESTORE,
-	MODE_SET,
-	MODE_SAVE,
 	MODE_POLL,
+	MODE_READ,
 	MODE_WAIT,
 	MODE_WRITE,
 };
@@ -44,7 +35,6 @@ struct ufs_renesas_init_param {
 	union {
 		u32 expected;
 		u32 delay_us;
-		u32 set;
 		u32 val;
 	} u;
 	u32 mask;
@@ -56,23 +46,13 @@ static void ufs_renesas_dbg_register_dump(struct ufs_hba *hba)
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
-		break;
 	case MODE_POLL:
 		ret = readl_poll_timeout_atomic(hba->mmio_base + p->reg,
 						val,
@@ -82,6 +62,9 @@ static void ufs_renesas_reg_control(struct ufs_hba *hba,
 			dev_err(hba->dev, "%s: poll failed %d (%08x, %08x, %08x)\n",
 				__func__, ret, val, p->mask, p->u.expected);
 		break;
+	case MODE_READ:
+		val = ufshcd_readl(hba, p->reg);
+		break;
 	case MODE_WAIT:
 		if (p->u.delay_us > 1000)
 			mdelay(DIV_ROUND_UP(p->u.delay_us, 1000));
@@ -94,6 +77,8 @@ static void ufs_renesas_reg_control(struct ufs_hba *hba,
 	default:
 		break;
 	}
+
+	return val;
 }
 
 static void ufs_renesas_poll(struct ufs_hba *hba, u32 reg, u32 expected, u32 mask)
@@ -108,38 +93,14 @@ static void ufs_renesas_poll(struct ufs_hba *hba, u32 reg, u32 expected, u32 mas
 	ufs_renesas_reg_control(hba, &param);
 }
 
-static void ufs_renesas_restore(struct ufs_hba *hba, u32 reg, u32 index)
-{
-	struct ufs_renesas_init_param param = {
-		.mode = MODE_RESTORE,
-		.reg = reg,
-		.index = index,
-	};
-
-	ufs_renesas_reg_control(hba, &param);
-}
-
-static void ufs_renesas_save(struct ufs_hba *hba, u32 reg, u32 mask, u32 index)
+static u32 ufs_renesas_read(struct ufs_hba *hba, u32 reg)
 {
 	struct ufs_renesas_init_param param = {
-		.mode = MODE_SAVE,
+		.mode = MODE_READ,
 		.reg = reg,
-		.mask = mask,
-		.index = index,
 	};
 
-	ufs_renesas_reg_control(hba, &param);
-}
-
-static void ufs_renesas_set(struct ufs_hba *hba, u32 index, u32 set)
-{
-	struct ufs_renesas_init_param param = {
-		.mode = MODE_SAVE,
-		.index = index,
-		.u.set = set,
-	};
-
-	ufs_renesas_reg_control(hba, &param);
+	return ufs_renesas_reg_control(hba, &param);
 }
 
 static void ufs_renesas_wait(struct ufs_hba *hba, u32 delay_us)
@@ -178,15 +139,6 @@ static void ufs_renesas_write_800_80c_poll(struct ufs_hba *hba, u32 addr,
 	ufs_renesas_poll(hba, 0xd4, BIT(8), BIT(8));
 }
 
-static void ufs_renesas_restore_800_80c_poll(struct ufs_hba *hba, u32 index)
-{
-	ufs_renesas_write_d0_d4(hba, 0x0000080c, 0x00000100);
-	ufs_renesas_write(hba, 0xd0, 0x00000800);
-	ufs_renesas_restore(hba, 0xd4, index);
-	ufs_renesas_write(hba, 0xd0, 0x0000080c);
-	ufs_renesas_poll(hba, 0xd4, BIT(8), BIT(8));
-}
-
 static void ufs_renesas_write_804_80c_poll(struct ufs_hba *hba, u32 addr, u32 data_804)
 {
 	ufs_renesas_write_d0_d4(hba, 0x0000080c, 0x00000100);
@@ -217,6 +169,8 @@ static void ufs_renesas_write_phy(struct ufs_hba *hba, u32 addr16, u32 data16)
 
 static void ufs_renesas_set_phy(struct ufs_hba *hba, u32 addr16, u32 data16)
 {
+	u32 low, high;
+
 	ufs_renesas_write(hba, 0xf0, 1);
 	ufs_renesas_write_800_80c_poll(hba, 0x16, addr16 & 0xff);
 	ufs_renesas_write_800_80c_poll(hba, 0x17, (addr16 >> 8) & 0xff);
@@ -224,22 +178,15 @@ static void ufs_renesas_set_phy(struct ufs_hba *hba, u32 addr16, u32 data16)
 	ufs_renesas_write_828_82c_poll(hba, 0x0f000000);
 	ufs_renesas_write_804_80c_poll(hba, 0x1a, 0);
 	ufs_renesas_write(hba, 0xd0, 0x00000808);
-	ufs_renesas_save(hba, 0xd4, 0xff, SET_PHY_INDEX_LO);
+	low = ufs_renesas_read(hba, 0xd4) & 0xff;
 	ufs_renesas_write_804_80c_poll(hba, 0x1b, 0);
 	ufs_renesas_write(hba, 0xd0, 0x00000808);
-	ufs_renesas_save(hba, 0xd4, 0xff, SET_PHY_INDEX_HI);
-	ufs_renesas_write_828_82c_poll(hba, 0x0f000000);
-	ufs_renesas_write(hba, 0xf0, 0);
-	ufs_renesas_write(hba, 0xf0, 1);
-	ufs_renesas_write_800_80c_poll(hba, 0x16, addr16 & 0xff);
-	ufs_renesas_write_800_80c_poll(hba, 0x17, (addr16 >> 8) & 0xff);
-	ufs_renesas_set(hba, SET_PHY_INDEX_LO, ((data16 & 0xff) << 16) | BIT(8) | 0x18);
-	ufs_renesas_restore_800_80c_poll(hba, SET_PHY_INDEX_LO);
-	ufs_renesas_set(hba, SET_PHY_INDEX_HI, (((data16 >> 8) & 0xff) << 16) | BIT(8) | 0x19);
-	ufs_renesas_restore_800_80c_poll(hba, SET_PHY_INDEX_HI);
-	ufs_renesas_write_800_80c_poll(hba, 0x1c, 0x01);
+	high = ufs_renesas_read(hba, 0xd4) & 0xff;
 	ufs_renesas_write_828_82c_poll(hba, 0x0f000000);
 	ufs_renesas_write(hba, 0xf0, 0);
+
+	data16 |= (high << 8) | low;
+	ufs_renesas_write_phy(hba, addr16, data16);
 }
 
 static void ufs_renesas_indirect_write(struct ufs_hba *hba, u32 gpio, u32 addr,
@@ -263,6 +210,8 @@ static void ufs_renesas_indirect_poll(struct ufs_hba *hba, u32 gpio, u32 addr,
 
 static void ufs_renesas_pre_init(struct ufs_hba *hba)
 {
+	u32 timer_val;
+
 	/* This setting is for SERIES B */
 	ufs_renesas_write(hba, 0xc0, 0x49425308);
 	ufs_renesas_write_d0_d4(hba, 0x00000104, 0x00000002);
@@ -289,7 +238,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_poll(hba, 0xd4, BIT(8) | BIT(6) | BIT(0), BIT(8) | BIT(6) | BIT(0));
 
 	ufs_renesas_write(hba, 0xd0, 0x00000d00);
-	ufs_renesas_save(hba, 0xd4, 0x0000ffff, TIMER_INDEX);
+	timer_val = ufs_renesas_read(hba, 0xd4) & 0x0000ffff;
 	ufs_renesas_write(hba, 0xd4, 0x00000000);
 	ufs_renesas_write_d0_d4(hba, 0x0000082c, 0x0f000000);
 	ufs_renesas_write_d0_d4(hba, 0x00000828, 0x08000000);
@@ -384,7 +333,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 
 	ufs_renesas_write(hba, 0xf0, 0);
 	ufs_renesas_write(hba, 0xd0, 0x00000d00);
-	ufs_renesas_restore(hba, 0xd4, TIMER_INDEX);
+	ufs_renesas_write(hba, 0xd4, timer_val);
 }
 
 static int ufs_renesas_hce_enable_notify(struct ufs_hba *hba,
-- 
2.25.1


