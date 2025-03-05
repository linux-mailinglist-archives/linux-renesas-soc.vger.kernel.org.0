Return-Path: <linux-renesas-soc+bounces-14003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A7A5009C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 14:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A36D8163292
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 13:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F4C244E8F;
	Wed,  5 Mar 2025 13:34:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCE24501D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Mar 2025 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181666; cv=none; b=aEEId5duvW5QrsHjl4BoCswjBXyAmmULBQdhPoU/39+IgqQOp/RvR9TTFVizTLaZYiHvi0IDlk9jcG1VgAx0aD4bAZdRwwZScMn1+KLCuV+0fiyUmGSiSuIQkcMUncpKN74cNk/TLYZE88bnIv/ySQhtkgmfDnq1auaFeLulz5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181666; c=relaxed/simple;
	bh=R0TpDo0YORm6VbpEJvV2CmjrvHgSpTI8rK2PRPb1rVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jt2PE3tq1uM32hbQJYix68ZuT/hI/CClOr954V5u2FlElVzdNfHWYSSOTrBaEttObMgT48FNOUoZS/nme+w9nc837jvuLOHVIjwi8u9zePfrPU5xhxuA2nYkuN6OvyJI6TYwYgWdZU5KIGd0tatfL9SLAqLvxCjMo/XjLiM8OjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fba:8cad:3d23:9db3])
	by michel.telenet-ops.be with cmsmtp
	id M1aJ2E0070exi8p061aJJC; Wed, 05 Mar 2025 14:34:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tposn-0000000Cv3w-1CoI;
	Wed, 05 Mar 2025 14:34:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tpot8-00000008woV-1gwa;
	Wed, 05 Mar 2025 14:34:18 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 3/7] scsi: ufs: renesas: Add register read to remove save/set/restore
Date: Wed,  5 Mar 2025 14:34:11 +0100
Message-ID: <9fa240a9dc0308d6675138f8434eccb77f051650.1741179611.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741179611.git.geert+renesas@glider.be>
References: <cover.1741179611.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Add support for returning read register values from
ufs_renesas_reg_control(), so ufs_renesas_set_phy() can use the existing
ufs_renesas_write_phy() helper.
Remove the now unused code to save to, set, and restore from a static
array inside ufs_renesas_reg_control().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Reword,

v2:
  - Remove *_INDEX* enums only in this patch,
  - Move MODE_READ handling after MODE_POLL handling,
  - Move ufs_renesas_read() after ufs_renesas_poll(),
---
 drivers/ufs/host/ufs-renesas.c | 99 ++++++++--------------------------
 1 file changed, 23 insertions(+), 76 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index ac096d013287b187..100186a2e1807445 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -23,18 +23,9 @@ struct ufs_renesas_priv {
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
@@ -45,7 +36,6 @@ struct ufs_renesas_init_param {
 	union {
 		u32 expected;
 		u32 delay_us;
-		u32 set;
 		u32 val;
 	} u;
 	u32 mask;
@@ -57,25 +47,13 @@ static void ufs_renesas_dbg_register_dump(struct ufs_hba *hba)
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
-
-	WARN_ON(p->index >= MAX_INDEX);
 
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
@@ -85,6 +63,9 @@ static void ufs_renesas_reg_control(struct ufs_hba *hba,
 			dev_err(hba->dev, "%s: poll failed %d (%08x, %08x, %08x)\n",
 				__func__, ret, val, p->mask, p->u.expected);
 		break;
+	case MODE_READ:
+		val = ufshcd_readl(hba, p->reg);
+		break;
 	case MODE_WAIT:
 		if (p->u.delay_us > 1000)
 			mdelay(DIV_ROUND_UP(p->u.delay_us, 1000));
@@ -97,6 +78,8 @@ static void ufs_renesas_reg_control(struct ufs_hba *hba,
 	default:
 		break;
 	}
+
+	return val;
 }
 
 static void ufs_renesas_poll(struct ufs_hba *hba, u32 reg, u32 expected, u32 mask)
@@ -111,38 +94,14 @@ static void ufs_renesas_poll(struct ufs_hba *hba, u32 reg, u32 expected, u32 mas
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
-	};
-
-	ufs_renesas_reg_control(hba, &param);
-}
-
-static void ufs_renesas_set(struct ufs_hba *hba, u32 index, u32 set)
-{
-	struct ufs_renesas_init_param param = {
-		.mode = MODE_SAVE,
-		.index = index,
-		.u.set = set,
 	};
 
-	ufs_renesas_reg_control(hba, &param);
+	return ufs_renesas_reg_control(hba, &param);
 }
 
 static void ufs_renesas_wait(struct ufs_hba *hba, u32 delay_us)
@@ -181,15 +140,6 @@ static void ufs_renesas_write_800_80c_poll(struct ufs_hba *hba, u32 addr,
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
@@ -220,6 +170,8 @@ static void ufs_renesas_write_phy(struct ufs_hba *hba, u32 addr16, u32 data16)
 
 static void ufs_renesas_set_phy(struct ufs_hba *hba, u32 addr16, u32 data16)
 {
+	u32 low, high;
+
 	ufs_renesas_write(hba, 0xf0, 1);
 	ufs_renesas_write_800_80c_poll(hba, 0x16, addr16 & 0xff);
 	ufs_renesas_write_800_80c_poll(hba, 0x17, (addr16 >> 8) & 0xff);
@@ -227,22 +179,15 @@ static void ufs_renesas_set_phy(struct ufs_hba *hba, u32 addr16, u32 data16)
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
@@ -266,6 +211,8 @@ static void ufs_renesas_indirect_poll(struct ufs_hba *hba, u32 gpio, u32 addr,
 
 static void ufs_renesas_pre_init(struct ufs_hba *hba)
 {
+	u32 timer_val;
+
 	/* This setting is for SERIES B */
 	ufs_renesas_write(hba, 0xc0, 0x49425308);
 	ufs_renesas_write_d0_d4(hba, 0x00000104, 0x00000002);
@@ -292,7 +239,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_poll(hba, 0xd4, BIT(8) | BIT(6) | BIT(0), BIT(8) | BIT(6) | BIT(0));
 
 	ufs_renesas_write(hba, 0xd0, 0x00000d00);
-	ufs_renesas_save(hba, 0xd4, 0x0000ffff, TIMER_INDEX);
+	timer_val = ufs_renesas_read(hba, 0xd4) & 0x0000ffff;
 	ufs_renesas_write(hba, 0xd4, 0x00000000);
 	ufs_renesas_write_d0_d4(hba, 0x0000082c, 0x0f000000);
 	ufs_renesas_write_d0_d4(hba, 0x00000828, 0x08000000);
@@ -387,7 +334,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 
 	ufs_renesas_write(hba, 0xf0, 0);
 	ufs_renesas_write(hba, 0xd0, 0x00000d00);
-	ufs_renesas_restore(hba, 0xd4, TIMER_INDEX);
+	ufs_renesas_write(hba, 0xd4, timer_val);
 }
 
 static int ufs_renesas_hce_enable_notify(struct ufs_hba *hba,
-- 
2.43.0


