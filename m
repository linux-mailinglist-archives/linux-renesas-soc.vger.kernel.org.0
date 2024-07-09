Return-Path: <linux-renesas-soc+bounces-7184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6821092AE35
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 04:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19EED281FF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 02:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9C23FB87;
	Tue,  9 Jul 2024 02:36:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3608139F;
	Tue,  9 Jul 2024 02:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492563; cv=none; b=oq4WaG5nn+D9VZuWyYTHttD4FTYXLdq46RufQhYtlf/+G4ZU2ht54GqWtaRVuh1Kisyx+A3TaqNZ6LIpvdX+mPOijS+t1/vAbhUOp0OsHMZaiLO+OOBdZXSxnM8p2x7EITJObYJPnuQwKbk/Z792Y20w9Y0E9oHzOvAniqALjao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492563; c=relaxed/simple;
	bh=DKeoFI06heS6hdwfAcFxdDBgK9bNB1jQx5Ti2Gfbx94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e4VbEMhXwDRdMG/N/muR9vUvTGUny44o1kG2vpLU1cDK7XB5xUK03dQlI8uiFY++zfuON7Bc1vK8+gUbDwDG+c7livjeA49Mb5srssbM1C/Ti0QtUBnXM9dOdLDW1Q0f/lOTPpg7ye2sbgJdtgQqNHedu3qMFbVPjnL+pFBq7jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,193,1716217200"; 
   d="scan'208";a="210737177"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jul 2024 11:35:58 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 149C64140BEE;
	Tue,  9 Jul 2024 11:35:58 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/5] scsi: ufs: renesas: Refactor init code for other UFS controller
Date: Tue,  9 Jul 2024 11:35:46 +0900
Message-Id: <20240709023550.1750333-2-yoshihiro.shimoda.uh@renesas.com>
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

Since the current UFS controller of R-Car S4-8 ES 1.0 only requires
statical values for initializing it, the driver has const ufs_param[]
array. However, other UFS controller (R-Car S4-8 ES 1.2) will require
dynamic values like eFuse values. So, refactor initializing code for it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/ufs/host/ufs-renesas.c | 513 ++++++++++++++++++---------------
 1 file changed, 286 insertions(+), 227 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index 8711e5cbc968..70a591f7aa16 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -38,98 +38,6 @@ enum ufs_renesas_init_param_mode {
 	MODE_WRITE,
 };
 
-#define PARAM_RESTORE(_reg, _index) \
-		{ .mode = MODE_RESTORE, .reg = _reg, .index = _index }
-#define PARAM_SET(_index, _set) \
-		{ .mode = MODE_SET, .index = _index, .u.set = _set }
-#define PARAM_SAVE(_reg, _mask, _index) \
-		{ .mode = MODE_SAVE, .reg = _reg, .mask = (u32)(_mask), \
-		  .index = _index }
-#define PARAM_POLL(_reg, _expected, _mask) \
-		{ .mode = MODE_POLL, .reg = _reg, .u.expected = _expected, \
-		  .mask = (u32)(_mask) }
-#define PARAM_WAIT(_delay_us) \
-		{ .mode = MODE_WAIT, .u.delay_us = _delay_us }
-
-#define PARAM_WRITE(_reg, _val) \
-		{ .mode = MODE_WRITE, .reg = _reg, .u.val = _val }
-
-#define PARAM_WRITE_D0_D4(_d0, _d4) \
-		PARAM_WRITE(0xd0, _d0),	PARAM_WRITE(0xd4, _d4)
-
-#define PARAM_WRITE_800_80C_POLL(_addr, _data_800)		\
-		PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),	\
-		PARAM_WRITE_D0_D4(0x00000800, ((_data_800) << 16) | BIT(8) | (_addr)), \
-		PARAM_WRITE(0xd0, 0x0000080c),			\
-		PARAM_POLL(0xd4, BIT(8), BIT(8))
-
-#define PARAM_RESTORE_800_80C_POLL(_index)			\
-		PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),	\
-		PARAM_WRITE(0xd0, 0x00000800),			\
-		PARAM_RESTORE(0xd4, _index),			\
-		PARAM_WRITE(0xd0, 0x0000080c),			\
-		PARAM_POLL(0xd4, BIT(8), BIT(8))
-
-#define PARAM_WRITE_804_80C_POLL(_addr, _data_804)		\
-		PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),	\
-		PARAM_WRITE_D0_D4(0x00000804, ((_data_804) << 16) | BIT(8) | (_addr)), \
-		PARAM_WRITE(0xd0, 0x0000080c),			\
-		PARAM_POLL(0xd4, BIT(8), BIT(8))
-
-#define PARAM_WRITE_828_82C_POLL(_data_828)			\
-		PARAM_WRITE_D0_D4(0x0000082c, 0x0f000000),	\
-		PARAM_WRITE_D0_D4(0x00000828, _data_828),	\
-		PARAM_WRITE(0xd0, 0x0000082c),			\
-		PARAM_POLL(0xd4, _data_828, _data_828)
-
-#define PARAM_WRITE_PHY(_addr16, _data16)			\
-		PARAM_WRITE(0xf0, 1),				\
-		PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
-		PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff), \
-		PARAM_WRITE_800_80C_POLL(0x18, (_data16) & 0xff), \
-		PARAM_WRITE_800_80C_POLL(0x19, ((_data16) >> 8) & 0xff), \
-		PARAM_WRITE_800_80C_POLL(0x1c, 0x01),		\
-		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
-		PARAM_WRITE(0xf0, 0)
-
-#define PARAM_SET_PHY(_addr16, _data16)				\
-		PARAM_WRITE(0xf0, 1),				\
-		PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
-		PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff), \
-		PARAM_WRITE_800_80C_POLL(0x1c, 0x01),		\
-		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
-		PARAM_WRITE_804_80C_POLL(0x1a, 0),		\
-		PARAM_WRITE(0xd0, 0x00000808),			\
-		PARAM_SAVE(0xd4, 0xff, SET_PHY_INDEX_LO),	\
-		PARAM_WRITE_804_80C_POLL(0x1b, 0),		\
-		PARAM_WRITE(0xd0, 0x00000808),			\
-		PARAM_SAVE(0xd4, 0xff, SET_PHY_INDEX_HI),	\
-		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
-		PARAM_WRITE(0xf0, 0),				\
-		PARAM_WRITE(0xf0, 1),				\
-		PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
-		PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff), \
-		PARAM_SET(SET_PHY_INDEX_LO, ((_data16 & 0xff) << 16) | BIT(8) | 0x18), \
-		PARAM_RESTORE_800_80C_POLL(SET_PHY_INDEX_LO),	\
-		PARAM_SET(SET_PHY_INDEX_HI, (((_data16 >> 8) & 0xff) << 16) | BIT(8) | 0x19), \
-		PARAM_RESTORE_800_80C_POLL(SET_PHY_INDEX_HI),	\
-		PARAM_WRITE_800_80C_POLL(0x1c, 0x01),		\
-		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
-		PARAM_WRITE(0xf0, 0)
-
-#define PARAM_INDIRECT_WRITE(_gpio, _addr, _data_800)		\
-		PARAM_WRITE(0xf0, _gpio),			\
-		PARAM_WRITE_800_80C_POLL(_addr, _data_800),	\
-		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
-		PARAM_WRITE(0xf0, 0)
-
-#define PARAM_INDIRECT_POLL(_gpio, _addr, _expected, _mask)	\
-		PARAM_WRITE(0xf0, _gpio),			\
-		PARAM_WRITE_800_80C_POLL(_addr, 0),		\
-		PARAM_WRITE(0xd0, 0x00000808),			\
-		PARAM_POLL(0xd4, _expected, _mask),		\
-		PARAM_WRITE(0xf0, 0)
-
 struct ufs_renesas_init_param {
 	enum ufs_renesas_init_param_mode mode;
 	u32 reg;
@@ -143,135 +51,6 @@ struct ufs_renesas_init_param {
 	u32 index;
 };
 
-/* This setting is for SERIES B */
-static const struct ufs_renesas_init_param ufs_param[] = {
-	PARAM_WRITE(0xc0, 0x49425308),
-	PARAM_WRITE_D0_D4(0x00000104, 0x00000002),
-	PARAM_WAIT(1),
-	PARAM_WRITE_D0_D4(0x00000828, 0x00000200),
-	PARAM_WAIT(1),
-	PARAM_WRITE_D0_D4(0x00000828, 0x00000000),
-	PARAM_WRITE_D0_D4(0x00000104, 0x00000001),
-	PARAM_WRITE_D0_D4(0x00000940, 0x00000001),
-	PARAM_WAIT(1),
-	PARAM_WRITE_D0_D4(0x00000940, 0x00000000),
-
-	PARAM_WRITE(0xc0, 0x49425308),
-	PARAM_WRITE(0xc0, 0x41584901),
-
-	PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),
-	PARAM_WRITE_D0_D4(0x00000804, 0x00000000),
-	PARAM_WRITE(0xd0, 0x0000080c),
-	PARAM_POLL(0xd4, BIT(8), BIT(8)),
-
-	PARAM_WRITE(REG_CONTROLLER_ENABLE, 0x00000001),
-
-	PARAM_WRITE(0xd0, 0x00000804),
-	PARAM_POLL(0xd4, BIT(8) | BIT(6) | BIT(0), BIT(8) | BIT(6) | BIT(0)),
-
-	PARAM_WRITE(0xd0, 0x00000d00),
-	PARAM_SAVE(0xd4, 0x0000ffff, TIMER_INDEX),
-	PARAM_WRITE(0xd4, 0x00000000),
-	PARAM_WRITE_D0_D4(0x0000082c, 0x0f000000),
-	PARAM_WRITE_D0_D4(0x00000828, 0x08000000),
-	PARAM_WRITE(0xd0, 0x0000082c),
-	PARAM_POLL(0xd4, BIT(27), BIT(27)),
-	PARAM_WRITE(0xd0, 0x00000d2c),
-	PARAM_POLL(0xd4, BIT(0), BIT(0)),
-
-	/* phy setup */
-	PARAM_INDIRECT_WRITE(1, 0x01, 0x001f),
-	PARAM_INDIRECT_WRITE(7, 0x5d, 0x0014),
-	PARAM_INDIRECT_WRITE(7, 0x5e, 0x0014),
-	PARAM_INDIRECT_WRITE(7, 0x0d, 0x0003),
-	PARAM_INDIRECT_WRITE(7, 0x0e, 0x0007),
-	PARAM_INDIRECT_WRITE(7, 0x5f, 0x0003),
-	PARAM_INDIRECT_WRITE(7, 0x60, 0x0003),
-	PARAM_INDIRECT_WRITE(7, 0x5b, 0x00a6),
-	PARAM_INDIRECT_WRITE(7, 0x5c, 0x0003),
-
-	PARAM_INDIRECT_POLL(7, 0x3c, 0, BIT(7)),
-	PARAM_INDIRECT_POLL(7, 0x4c, 0, BIT(4)),
-
-	PARAM_INDIRECT_WRITE(1, 0x32, 0x0080),
-	PARAM_INDIRECT_WRITE(1, 0x1f, 0x0001),
-	PARAM_INDIRECT_WRITE(0, 0x2c, 0x0001),
-	PARAM_INDIRECT_WRITE(0, 0x32, 0x0087),
-
-	PARAM_INDIRECT_WRITE(1, 0x4d, 0x0061),
-	PARAM_INDIRECT_WRITE(4, 0x9b, 0x0009),
-	PARAM_INDIRECT_WRITE(4, 0xa6, 0x0005),
-	PARAM_INDIRECT_WRITE(4, 0xa5, 0x0058),
-	PARAM_INDIRECT_WRITE(1, 0x39, 0x0027),
-	PARAM_INDIRECT_WRITE(1, 0x47, 0x004c),
-
-	PARAM_INDIRECT_WRITE(7, 0x0d, 0x0002),
-	PARAM_INDIRECT_WRITE(7, 0x0e, 0x0007),
-
-	PARAM_WRITE_PHY(0x0028, 0x0061),
-	PARAM_WRITE_PHY(0x4014, 0x0061),
-	PARAM_SET_PHY(0x401c, BIT(2)),
-	PARAM_WRITE_PHY(0x4000, 0x0000),
-	PARAM_WRITE_PHY(0x4001, 0x0000),
-
-	PARAM_WRITE_PHY(0x10ae, 0x0001),
-	PARAM_WRITE_PHY(0x10ad, 0x0000),
-	PARAM_WRITE_PHY(0x10af, 0x0001),
-	PARAM_WRITE_PHY(0x10b6, 0x0001),
-	PARAM_WRITE_PHY(0x10ae, 0x0000),
-
-	PARAM_WRITE_PHY(0x10ae, 0x0001),
-	PARAM_WRITE_PHY(0x10ad, 0x0000),
-	PARAM_WRITE_PHY(0x10af, 0x0002),
-	PARAM_WRITE_PHY(0x10b6, 0x0001),
-	PARAM_WRITE_PHY(0x10ae, 0x0000),
-
-	PARAM_WRITE_PHY(0x10ae, 0x0001),
-	PARAM_WRITE_PHY(0x10ad, 0x0080),
-	PARAM_WRITE_PHY(0x10af, 0x0000),
-	PARAM_WRITE_PHY(0x10b6, 0x0001),
-	PARAM_WRITE_PHY(0x10ae, 0x0000),
-
-	PARAM_WRITE_PHY(0x10ae, 0x0001),
-	PARAM_WRITE_PHY(0x10ad, 0x0080),
-	PARAM_WRITE_PHY(0x10af, 0x001a),
-	PARAM_WRITE_PHY(0x10b6, 0x0001),
-	PARAM_WRITE_PHY(0x10ae, 0x0000),
-
-	PARAM_INDIRECT_WRITE(7, 0x70, 0x0016),
-	PARAM_INDIRECT_WRITE(7, 0x71, 0x0016),
-	PARAM_INDIRECT_WRITE(7, 0x72, 0x0014),
-	PARAM_INDIRECT_WRITE(7, 0x73, 0x0014),
-	PARAM_INDIRECT_WRITE(7, 0x74, 0x0000),
-	PARAM_INDIRECT_WRITE(7, 0x75, 0x0000),
-	PARAM_INDIRECT_WRITE(7, 0x76, 0x0010),
-	PARAM_INDIRECT_WRITE(7, 0x77, 0x0010),
-	PARAM_INDIRECT_WRITE(7, 0x78, 0x00ff),
-	PARAM_INDIRECT_WRITE(7, 0x79, 0x0000),
-
-	PARAM_INDIRECT_WRITE(7, 0x19, 0x0007),
-
-	PARAM_INDIRECT_WRITE(7, 0x1a, 0x0007),
-
-	PARAM_INDIRECT_WRITE(7, 0x24, 0x000c),
-
-	PARAM_INDIRECT_WRITE(7, 0x25, 0x000c),
-
-	PARAM_INDIRECT_WRITE(7, 0x62, 0x0000),
-	PARAM_INDIRECT_WRITE(7, 0x63, 0x0000),
-	PARAM_INDIRECT_WRITE(7, 0x5d, 0x0014),
-	PARAM_INDIRECT_WRITE(7, 0x5e, 0x0017),
-	PARAM_INDIRECT_WRITE(7, 0x5d, 0x0004),
-	PARAM_INDIRECT_WRITE(7, 0x5e, 0x0017),
-	PARAM_INDIRECT_POLL(7, 0x55, 0, BIT(6)),
-	PARAM_INDIRECT_POLL(7, 0x41, 0, BIT(7)),
-	/* end of phy setup */
-
-	PARAM_WRITE(0xf0, 0),
-	PARAM_WRITE(0xd0, 0x00000d00),
-	PARAM_RESTORE(0xd4, TIMER_INDEX),
-};
-
 static void ufs_renesas_dbg_register_dump(struct ufs_hba *hba)
 {
 	ufshcd_dump_regs(hba, 0xc0, 0x40, "regs: 0xc0 + ");
@@ -284,8 +63,6 @@ static void ufs_renesas_reg_control(struct ufs_hba *hba,
 	int ret;
 	u32 val;
 
-	WARN_ON(p->index >= MAX_INDEX);
-
 	switch (p->mode) {
 	case MODE_RESTORE:
 		ufshcd_writel(hba, save[p->index], p->reg);
@@ -319,13 +96,295 @@ static void ufs_renesas_reg_control(struct ufs_hba *hba,
 	}
 }
 
+static void ufs_renesas_poll(struct ufs_hba *hba, u32 reg, u32 expected, u32 mask)
+{
+	struct ufs_renesas_init_param param = {
+		.mode = MODE_POLL,
+		.reg = reg,
+		.u.expected = expected,
+		.mask = mask,
+	};
+
+	ufs_renesas_reg_control(hba, &param);
+}
+
+static void ufs_renesas_restore(struct ufs_hba *hba, u32 reg, u32 index)
+{
+	struct ufs_renesas_init_param param = {
+		.mode = MODE_RESTORE,
+		.reg = reg,
+		.index = index,
+	};
+
+	ufs_renesas_reg_control(hba, &param);
+}
+
+static void ufs_renesas_save(struct ufs_hba *hba, u32 reg, u32 mask, u32 index)
+{
+	struct ufs_renesas_init_param param = {
+		.mode = MODE_SAVE,
+		.reg = reg,
+		.mask = mask,
+		.index = index,
+	};
+
+	ufs_renesas_reg_control(hba, &param);
+}
+
+static void ufs_renesas_set(struct ufs_hba *hba, u32 index, u32 set)
+{
+	struct ufs_renesas_init_param param = {
+		.mode = MODE_SAVE,
+		.index = index,
+		.u.set = set,
+	};
+
+	ufs_renesas_reg_control(hba, &param);
+}
+
+static void ufs_renesas_wait(struct ufs_hba *hba, u32 delay_us)
+{
+	struct ufs_renesas_init_param param = {
+		.mode = MODE_WAIT,
+		.u.delay_us = delay_us,
+	};
+
+	ufs_renesas_reg_control(hba, &param);
+}
+
+static void ufs_renesas_write(struct ufs_hba *hba, u32 reg, u32 value)
+{
+	struct ufs_renesas_init_param param = {
+		.mode = MODE_WRITE,
+		.reg = reg,
+		.u.val = value,
+	};
+
+	ufs_renesas_reg_control(hba, &param);
+}
+
+static void ufs_renesas_write_d0_d4(struct ufs_hba *hba, u32 d0, u32 d4)
+{
+	ufs_renesas_write(hba, 0xd0, d0);
+	ufs_renesas_write(hba, 0xd4, d4);
+}
+
+static void ufs_renesas_write_800_80c_poll(struct ufs_hba *hba, u32 addr,
+					   u32 data_800)
+{
+	ufs_renesas_write_d0_d4(hba, 0x0000080c, 0x00000100);
+	ufs_renesas_write_d0_d4(hba, 0x00000800, (data_800 << 16) | BIT(8) | addr);
+	ufs_renesas_write(hba, 0xd0, 0x0000080c);
+	ufs_renesas_poll(hba, 0xd4, BIT(8), BIT(8));
+}
+
+static void ufs_renesas_restore_800_80c_poll(struct ufs_hba *hba, u32 index)
+{
+	ufs_renesas_write_d0_d4(hba, 0x0000080c, 0x00000100);
+	ufs_renesas_write(hba, 0xd0, 0x00000800);
+	ufs_renesas_restore(hba, 0xd4, index);
+	ufs_renesas_write(hba, 0xd0, 0x0000080c);
+	ufs_renesas_poll(hba, 0xd4, BIT(8), BIT(8));
+}
+
+static void ufs_renesas_write_804_80c_poll(struct ufs_hba *hba, u32 addr, u32 data_804)
+{
+	ufs_renesas_write_d0_d4(hba, 0x0000080c, 0x00000100);
+	ufs_renesas_write_d0_d4(hba, 0x00000804, (data_804 << 16) | BIT(8) | addr);
+	ufs_renesas_write(hba, 0xd0, 0x0000080c);
+	ufs_renesas_poll(hba, 0xd4, BIT(8), BIT(8));
+}
+
+static void ufs_renesas_write_828_82c_poll(struct ufs_hba *hba, u32 data_828)
+{
+	ufs_renesas_write_d0_d4(hba, 0x0000082c, 0x0f000000);
+	ufs_renesas_write_d0_d4(hba, 0x00000828, data_828);
+	ufs_renesas_write(hba, 0xd0, 0x0000082c);
+	ufs_renesas_poll(hba, 0xd4, data_828, data_828);
+}
+
+static void ufs_renesas_write_phy(struct ufs_hba *hba, u32 addr16, u32 data16)
+{
+	ufs_renesas_write(hba, 0xf0, 1);
+	ufs_renesas_write_800_80c_poll(hba, 0x16, addr16 & 0xff);
+	ufs_renesas_write_800_80c_poll(hba, 0x17, (addr16 >> 8) & 0xff);
+	ufs_renesas_write_800_80c_poll(hba, 0x18, data16 & 0xff);
+	ufs_renesas_write_800_80c_poll(hba, 0x19, (data16 >> 8) & 0xff);
+	ufs_renesas_write_800_80c_poll(hba, 0x1c, 0x01);
+	ufs_renesas_write_828_82c_poll(hba, 0x0f000000);
+	ufs_renesas_write(hba, 0xf0, 0);
+}
+
+static void ufs_renesas_set_phy(struct ufs_hba *hba, u32 addr16, u32 data16)
+{
+	ufs_renesas_write(hba, 0xf0, 1);
+	ufs_renesas_write_800_80c_poll(hba, 0x16, addr16 & 0xff);
+	ufs_renesas_write_800_80c_poll(hba, 0x17, (addr16 >> 8) & 0xff);
+	ufs_renesas_write_800_80c_poll(hba, 0x1c, 0x01);
+	ufs_renesas_write_828_82c_poll(hba, 0x0f000000);
+	ufs_renesas_write_804_80c_poll(hba, 0x1a, 0);
+	ufs_renesas_write(hba, 0xd0, 0x00000808);
+	ufs_renesas_save(hba, 0xd4, 0xff, SET_PHY_INDEX_LO);
+	ufs_renesas_write_804_80c_poll(hba, 0x1b, 0);
+	ufs_renesas_write(hba, 0xd0, 0x00000808);
+	ufs_renesas_save(hba, 0xd4, 0xff, SET_PHY_INDEX_HI);
+	ufs_renesas_write_828_82c_poll(hba, 0x0f000000);
+	ufs_renesas_write(hba, 0xf0, 0);
+	ufs_renesas_write(hba, 0xf0, 1);
+	ufs_renesas_write_800_80c_poll(hba, 0x16, addr16 & 0xff);
+	ufs_renesas_write_800_80c_poll(hba, 0x17, (addr16 >> 8) & 0xff);
+	ufs_renesas_set(hba, SET_PHY_INDEX_LO, ((data16 & 0xff) << 16) | BIT(8) | 0x18);
+	ufs_renesas_restore_800_80c_poll(hba, SET_PHY_INDEX_LO);
+	ufs_renesas_set(hba, SET_PHY_INDEX_HI, (((data16 >> 8) & 0xff) << 16) | BIT(8) | 0x19);
+	ufs_renesas_restore_800_80c_poll(hba, SET_PHY_INDEX_HI);
+	ufs_renesas_write_800_80c_poll(hba, 0x1c, 0x01);
+	ufs_renesas_write_828_82c_poll(hba, 0x0f000000);
+	ufs_renesas_write(hba, 0xf0, 0);
+}
+
+static void ufs_renesas_indirect_write(struct ufs_hba *hba, u32 gpio, u32 addr,
+				       u32 data_800)
+{
+	ufs_renesas_write(hba, 0xf0, gpio);
+	ufs_renesas_write_800_80c_poll(hba, addr, data_800);
+	ufs_renesas_write_828_82c_poll(hba, 0x0f000000);
+	ufs_renesas_write(hba, 0xf0, 0);
+}
+
+static void ufs_renesas_indirect_poll(struct ufs_hba *hba, u32 gpio, u32 addr,
+				      u32 expected, u32 mask)
+{
+	ufs_renesas_write(hba, 0xf0, gpio);
+	ufs_renesas_write_800_80c_poll(hba, addr, 0);
+	ufs_renesas_write(hba, 0xd0, 0x00000808);
+	ufs_renesas_poll(hba, 0xd4, expected, mask);
+	ufs_renesas_write(hba, 0xf0, 0);
+}
+
 static void ufs_renesas_pre_init(struct ufs_hba *hba)
 {
-	const struct ufs_renesas_init_param *p = ufs_param;
-	unsigned int i;
+	/* This setting is for SERIES B */
+	ufs_renesas_write(hba, 0xc0, 0x49425308);
+	ufs_renesas_write_d0_d4(hba, 0x00000104, 0x00000002);
+	ufs_renesas_wait(hba, 1);
+	ufs_renesas_write_d0_d4(hba, 0x00000828, 0x00000200);
+	ufs_renesas_wait(hba, 1);
+	ufs_renesas_write_d0_d4(hba, 0x00000828, 0x00000000);
+	ufs_renesas_write_d0_d4(hba, 0x00000104, 0x00000001);
+	ufs_renesas_write_d0_d4(hba, 0x00000940, 0x00000001);
+	ufs_renesas_wait(hba, 1);
+	ufs_renesas_write_d0_d4(hba, 0x00000940, 0x00000000);
+
+	ufs_renesas_write(hba, 0xc0, 0x49425308);
+	ufs_renesas_write(hba, 0xc0, 0x41584901);
+
+	ufs_renesas_write_d0_d4(hba, 0x0000080c, 0x00000100);
+	ufs_renesas_write_d0_d4(hba, 0x00000804, 0x00000000);
+	ufs_renesas_write(hba, 0xd0, 0x0000080c);
+	ufs_renesas_poll(hba, 0xd4, BIT(8), BIT(8));
+
+	ufs_renesas_write(hba, REG_CONTROLLER_ENABLE, 0x00000001);
+
+	ufs_renesas_write(hba, 0xd0, 0x00000804);
+	ufs_renesas_poll(hba, 0xd4, BIT(8) | BIT(6) | BIT(0), BIT(8) | BIT(6) | BIT(0));
+
+	ufs_renesas_write(hba, 0xd0, 0x00000d00);
+	ufs_renesas_save(hba, 0xd4, 0x0000ffff, TIMER_INDEX);
+	ufs_renesas_write(hba, 0xd4, 0x00000000);
+	ufs_renesas_write_d0_d4(hba, 0x0000082c, 0x0f000000);
+	ufs_renesas_write_d0_d4(hba, 0x00000828, 0x08000000);
+	ufs_renesas_write(hba, 0xd0, 0x0000082c);
+	ufs_renesas_poll(hba, 0xd4, BIT(27), BIT(27));
+	ufs_renesas_write(hba, 0xd0, 0x00000d2c);
+	ufs_renesas_poll(hba, 0xd4, BIT(0), BIT(0));
+
+	/* phy setup */
+	ufs_renesas_indirect_write(hba, 1, 0x01, 0x001f);
+	ufs_renesas_indirect_write(hba, 7, 0x5d, 0x0014);
+	ufs_renesas_indirect_write(hba, 7, 0x5e, 0x0014);
+	ufs_renesas_indirect_write(hba, 7, 0x0d, 0x0003);
+	ufs_renesas_indirect_write(hba, 7, 0x0e, 0x0007);
+	ufs_renesas_indirect_write(hba, 7, 0x5f, 0x0003);
+	ufs_renesas_indirect_write(hba, 7, 0x60, 0x0003);
+	ufs_renesas_indirect_write(hba, 7, 0x5b, 0x00a6);
+	ufs_renesas_indirect_write(hba, 7, 0x5c, 0x0003);
+
+	ufs_renesas_indirect_poll(hba, 7, 0x3c, 0, BIT(7));
+	ufs_renesas_indirect_poll(hba, 7, 0x4c, 0, BIT(4));
+
+	ufs_renesas_indirect_write(hba, 1, 0x32, 0x0080);
+	ufs_renesas_indirect_write(hba, 1, 0x1f, 0x0001);
+	ufs_renesas_indirect_write(hba, 0, 0x2c, 0x0001);
+	ufs_renesas_indirect_write(hba, 0, 0x32, 0x0087);
+
+	ufs_renesas_indirect_write(hba, 1, 0x4d, 0x0061);
+	ufs_renesas_indirect_write(hba, 4, 0x9b, 0x0009);
+	ufs_renesas_indirect_write(hba, 4, 0xa6, 0x0005);
+	ufs_renesas_indirect_write(hba, 4, 0xa5, 0x0058);
+	ufs_renesas_indirect_write(hba, 1, 0x39, 0x0027);
+	ufs_renesas_indirect_write(hba, 1, 0x47, 0x004c);
+
+	ufs_renesas_indirect_write(hba, 7, 0x0d, 0x0002);
+	ufs_renesas_indirect_write(hba, 7, 0x0e, 0x0007);
+
+	ufs_renesas_write_phy(hba, 0x0028, 0x0061);
+	ufs_renesas_write_phy(hba, 0x4014, 0x0061);
+	ufs_renesas_set_phy(hba, 0x401c, BIT(2));
+	ufs_renesas_write_phy(hba, 0x4000, 0x0000);
+	ufs_renesas_write_phy(hba, 0x4001, 0x0000);
+
+	ufs_renesas_write_phy(hba, 0x10ae, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10ad, 0x0000);
+	ufs_renesas_write_phy(hba, 0x10af, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10b6, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10ae, 0x0000);
+
+	ufs_renesas_write_phy(hba, 0x10ae, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10ad, 0x0000);
+	ufs_renesas_write_phy(hba, 0x10af, 0x0002);
+	ufs_renesas_write_phy(hba, 0x10b6, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10ae, 0x0000);
+
+	ufs_renesas_write_phy(hba, 0x10ae, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10ad, 0x0080);
+	ufs_renesas_write_phy(hba, 0x10af, 0x0000);
+	ufs_renesas_write_phy(hba, 0x10b6, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10ae, 0x0000);
+
+	ufs_renesas_write_phy(hba, 0x10ae, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10ad, 0x0080);
+	ufs_renesas_write_phy(hba, 0x10af, 0x001a);
+	ufs_renesas_write_phy(hba, 0x10b6, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10ae, 0x0000);
+
+	ufs_renesas_indirect_write(hba, 7, 0x70, 0x0016);
+	ufs_renesas_indirect_write(hba, 7, 0x71, 0x0016);
+	ufs_renesas_indirect_write(hba, 7, 0x72, 0x0014);
+	ufs_renesas_indirect_write(hba, 7, 0x73, 0x0014);
+	ufs_renesas_indirect_write(hba, 7, 0x74, 0x0000);
+	ufs_renesas_indirect_write(hba, 7, 0x75, 0x0000);
+	ufs_renesas_indirect_write(hba, 7, 0x76, 0x0010);
+	ufs_renesas_indirect_write(hba, 7, 0x77, 0x0010);
+	ufs_renesas_indirect_write(hba, 7, 0x78, 0x00ff);
+	ufs_renesas_indirect_write(hba, 7, 0x79, 0x0000);
+
+	ufs_renesas_indirect_write(hba, 7, 0x19, 0x0007);
+	ufs_renesas_indirect_write(hba, 7, 0x1a, 0x0007);
+	ufs_renesas_indirect_write(hba, 7, 0x24, 0x000c);
+	ufs_renesas_indirect_write(hba, 7, 0x25, 0x000c);
+	ufs_renesas_indirect_write(hba, 7, 0x62, 0x0000);
+	ufs_renesas_indirect_write(hba, 7, 0x63, 0x0000);
+	ufs_renesas_indirect_write(hba, 7, 0x5d, 0x0014);
+	ufs_renesas_indirect_write(hba, 7, 0x5e, 0x0017);
+	ufs_renesas_indirect_write(hba, 7, 0x5d, 0x0004);
+	ufs_renesas_indirect_write(hba, 7, 0x5e, 0x0017);
+	ufs_renesas_indirect_poll(hba, 7, 0x55, 0, BIT(6));
+	ufs_renesas_indirect_poll(hba, 7, 0x41, 0, BIT(7));
+	/* end of phy setup */
 
-	for (i = 0; i < ARRAY_SIZE(ufs_param); i++)
-		ufs_renesas_reg_control(hba, &p[i]);
+	ufs_renesas_write(hba, 0xf0, 0);
+	ufs_renesas_write(hba, 0xd0, 0x00000d00);
+	ufs_renesas_restore(hba, 0xd4, TIMER_INDEX);
 }
 
 static int ufs_renesas_hce_enable_notify(struct ufs_hba *hba,
-- 
2.25.1


