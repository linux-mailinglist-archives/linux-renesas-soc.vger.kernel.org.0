Return-Path: <linux-renesas-soc+bounces-7188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD192AE3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 04:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83E391F22141
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 02:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33D5482FA;
	Tue,  9 Jul 2024 02:36:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8C443AC0;
	Tue,  9 Jul 2024 02:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492566; cv=none; b=ugGsf5tq0MR+4cK5O4m4zPjS1Hyz4i+oFi4fR5mpelRnexVMsl0lRgNHgch44qfMkuwmcHSTE3HzPKqVSA/Qd0sRDSVi5gyQnV7ou62oa5IVYBwIxlMRoi6GEITWt++AQJ2ch1CiYEZR/sEhZ5L6YMeiEmqzJzmKDn4tCTbEFWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492566; c=relaxed/simple;
	bh=B7MDSaSS3fjbo0Dc1cc49jseRxHmhXnCQI7g+DML+94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EjXsvq+Fh3pecnwZB3azrEDGl6sTyEWIkqLM/q29lXOyrtaYmUJO15QHk8/svLC38wEmqpYEWSDFpugFxURSsxlsWqsrjbcVln8e0KatHkF1UvL0ED1b6qyays97gERKQ2boAvhSSK+uf0D8spGds8Wiu5bdLgn1i9f8zrPXOlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,193,1716217200"; 
   d="scan'208";a="214695296"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jul 2024 11:35:58 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5059E4140BEE;
	Tue,  9 Jul 2024 11:35:58 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 5/5] scsi: ufs: renesas: Add reusable functions
Date: Tue,  9 Jul 2024 11:35:50 +0900
Message-Id: <20240709023550.1750333-6-yoshihiro.shimoda.uh@renesas.com>
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

Since some settings can be reused on other UFS controller (R-Car S4-8
ES 1.2), add reusable functions.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/ufs/host/ufs-renesas.c | 64 +++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index 4d83f8f4610e..35eb720206b4 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -144,11 +144,8 @@ static void ufs_renesas_write_phy_10ad_10af(struct ufs_hba *hba,
 	ufs_renesas_write_phy(hba, 0x10ae, 0x0000);
 }
 
-static void ufs_renesas_pre_init(struct ufs_hba *hba)
+static void ufs_renesas_init_ufshc(struct ufs_hba *hba)
 {
-	u32 timer_val;
-
-	/* This setting is for SERIES B */
 	ufs_renesas_write(hba, 0xc0, 0x49425308);
 	ufs_renesas_write_d0_d4(hba, 0x00000104, 0x00000002);
 	udelay(1);
@@ -162,16 +159,11 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 
 	ufs_renesas_write(hba, 0xc0, 0x49425308);
 	ufs_renesas_write(hba, 0xc0, 0x41584901);
+}
 
-	ufs_renesas_write_d0_d4(hba, 0x0000080c, 0x00000100);
-	ufs_renesas_write_d0_d4(hba, 0x00000804, 0x00000000);
-	ufs_renesas_write(hba, 0xd0, 0x0000080c);
-	ufs_renesas_poll(hba, 0xd4, BIT(8), BIT(8));
-
-	ufs_renesas_write(hba, REG_CONTROLLER_ENABLE, 0x00000001);
-
-	ufs_renesas_write(hba, 0xd0, 0x00000804);
-	ufs_renesas_poll(hba, 0xd4, BIT(8) | BIT(6) | BIT(0), BIT(8) | BIT(6) | BIT(0));
+static u32 ufs_renesas_init_disable_timer(struct ufs_hba *hba)
+{
+	u32 timer_val;
 
 	ufs_renesas_write(hba, 0xd0, 0x00000d00);
 	timer_val = ufs_renesas_read(hba, 0xd4) & 0x0000ffff;
@@ -183,6 +175,43 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_write(hba, 0xd0, 0x00000d2c);
 	ufs_renesas_poll(hba, 0xd4, BIT(0), BIT(0));
 
+	return timer_val;
+}
+
+static void ufs_renesas_init_enable_timer(struct ufs_hba *hba, u32 timer_val)
+{
+	ufs_renesas_write(hba, 0xf0, 0);
+	ufs_renesas_write(hba, 0xd0, 0x00000d00);
+	ufs_renesas_write(hba, 0xd4, timer_val);
+}
+
+static void ufs_renesas_init_compensation_and_slicers(struct ufs_hba *hba)
+{
+	ufs_renesas_write_phy_10ad_10af(hba, 0x0000, 0x0001);
+	ufs_renesas_write_phy_10ad_10af(hba, 0x0000, 0x0002);
+	ufs_renesas_write_phy_10ad_10af(hba, 0x0080, 0x0000);
+	ufs_renesas_write_phy_10ad_10af(hba, 0x0080, 0x001a);
+}
+
+static void ufs_renesas_pre_init(struct ufs_hba *hba)
+{
+	u32 timer_val;
+
+	/* This setting is for SERIES B */
+	ufs_renesas_init_ufshc(hba);
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
+	timer_val = ufs_renesas_init_disable_timer(hba);
+
 	/* phy setup */
 	ufs_renesas_indirect_write(hba, 1, 0x01, 0x001f);
 	ufs_renesas_indirect_write(hba, 7, 0x5d, 0x0014);
@@ -218,10 +247,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_write_phy(hba, 0x4000, 0x0000);
 	ufs_renesas_write_phy(hba, 0x4001, 0x0000);
 
-	ufs_renesas_write_phy_10ad_10af(hba, 0x0000, 0x0001);
-	ufs_renesas_write_phy_10ad_10af(hba, 0x0000, 0x0002);
-	ufs_renesas_write_phy_10ad_10af(hba, 0x0080, 0x0000);
-	ufs_renesas_write_phy_10ad_10af(hba, 0x0080, 0x001a);
+	ufs_renesas_init_compensation_and_slicers(hba);
 
 	ufs_renesas_indirect_write(hba, 7, 0x70, 0x0016);
 	ufs_renesas_indirect_write(hba, 7, 0x71, 0x0016);
@@ -248,9 +274,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_indirect_poll(hba, 7, 0x41, 0, BIT(7));
 	/* end of phy setup */
 
-	ufs_renesas_write(hba, 0xf0, 0);
-	ufs_renesas_write(hba, 0xd0, 0x00000d00);
-	ufs_renesas_write(hba, 0xd4, timer_val);
+	ufs_renesas_init_enable_timer(hba, timer_val);
 }
 
 static int ufs_renesas_hce_enable_notify(struct ufs_hba *hba,
-- 
2.25.1


