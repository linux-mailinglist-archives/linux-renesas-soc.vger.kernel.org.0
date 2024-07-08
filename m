Return-Path: <linux-renesas-soc+bounces-7175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8692A259
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 14:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31EE3B25CB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 12:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9036E13E03D;
	Mon,  8 Jul 2024 12:10:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8242313E03F;
	Mon,  8 Jul 2024 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720440602; cv=none; b=jJfX8/9OX/NhIdeFEvuncY12k2imA4W3tSMOY3fZfAnsvngHqqrDOpLwyRbDKHJIBPvt8vdjn4H337WzSFviOYZ0z/F7DKG4BqD50roKiRdax7eh5dAb39V7eCRpXz7L9v+e0zZ+ZVk0klCROwHkvWu1Gbe4SmJdWemnLypvdLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720440602; c=relaxed/simple;
	bh=o3mMkOtHrDokpgnyNGp9GdXMUM1ai2VATgquhbKri2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BcywkC2J0SG0DgmpR0+j1rrIas5FYscSw3eALdb/5I5SHp1BZ+6VfCMFArNzMv6nWF/Zh2RAP2P4uTI083PKDyztL2COonwD3Er3iIPIuMILvxMcAcazO5vP0TqRaZnZfHpg4bROp75YoyBrf8HzRAEVbjmeSqm0lx8zhMS2lsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,191,1716217200"; 
   d="scan'208";a="210673233"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2024 21:09:53 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EBE4D40029BE;
	Mon,  8 Jul 2024 21:09:53 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 5/5] scsi: ufs: renesas: Add reusable functions
Date: Mon,  8 Jul 2024 21:09:31 +0900
Message-Id: <20240708120931.1703956-6-yoshihiro.shimoda.uh@renesas.com>
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

Since some settings can be reused on other UFS controller (R-Car S4-8
ES 1.2), add reusable functions.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/ufs/host/ufs-renesas.c | 64 +++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index abe33b0c64db..48b3ccad99c1 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -201,11 +201,8 @@ static void ufs_renesas_param_write_phy_10ad_10af(struct ufs_hba *hba,
 	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0000);
 }
 
-static void ufs_renesas_pre_init(struct ufs_hba *hba)
+static void ufs_renesas_init_ufshc(struct ufs_hba *hba)
 {
-	u32 timer_val;
-
-	/* This setting is for SERIES B */
 	ufs_renesas_param_write(hba, 0xc0, 0x49425308);
 	ufs_renesas_param_write_d0_d4(hba, 0x00000104, 0x00000002);
 	udelay(1);
@@ -219,6 +216,46 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 
 	ufs_renesas_param_write(hba, 0xc0, 0x49425308);
 	ufs_renesas_param_write(hba, 0xc0, 0x41584901);
+}
+
+static u32 ufs_renesas_init_disable_timer(struct ufs_hba *hba)
+{
+	u32 timer_val;
+
+	ufs_renesas_param_write(hba, 0xd0, 0x00000d00);
+	timer_val = ufs_renesas_param_read(hba, 0xd4) & 0x0000ffff;
+	ufs_renesas_param_write(hba, 0xd4, 0x00000000);
+	ufs_renesas_param_write_d0_d4(hba, 0x0000082c, 0x0f000000);
+	ufs_renesas_param_write_d0_d4(hba, 0x00000828, 0x08000000);
+	ufs_renesas_param_write(hba, 0xd0, 0x0000082c);
+	ufs_renesas_param_poll(hba, 0xd4, BIT(27), BIT(27));
+	ufs_renesas_param_write(hba, 0xd0, 0x00000d2c);
+	ufs_renesas_param_poll(hba, 0xd4, BIT(0), BIT(0));
+
+	return timer_val;
+}
+
+static void ufs_renesas_init_enable_timer(struct ufs_hba *hba, u32 timer_val)
+{
+	ufs_renesas_param_write(hba, 0xf0, 0);
+	ufs_renesas_param_write(hba, 0xd0, 0x00000d00);
+	ufs_renesas_param_write(hba, 0xd4, timer_val);
+}
+
+static void ufs_renesas_init_compensation_and_slicers(struct ufs_hba *hba)
+{
+	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0000, 0x0001);
+	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0000, 0x0002);
+	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0080, 0x0000);
+	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0080, 0x001a);
+}
+
+static void ufs_renesas_pre_init(struct ufs_hba *hba)
+{
+	u32 timer_val;
+
+	/* This setting is for SERIES B */
+	ufs_renesas_init_ufshc(hba);
 
 	ufs_renesas_param_write_d0_d4(hba, 0x0000080c, 0x00000100);
 	ufs_renesas_param_write_d0_d4(hba, 0x00000804, 0x00000000);
@@ -231,15 +268,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_param_poll(hba, 0xd4, BIT(8) | BIT(6) | BIT(0),
 			       BIT(8) | BIT(6) | BIT(0));
 
-	ufs_renesas_param_write(hba, 0xd0, 0x00000d00);
-	timer_val = ufs_renesas_param_read(hba, 0xd4) & 0x0000ffff;
-	ufs_renesas_param_write(hba, 0xd4, 0x00000000);
-	ufs_renesas_param_write_d0_d4(hba, 0x0000082c, 0x0f000000);
-	ufs_renesas_param_write_d0_d4(hba, 0x00000828, 0x08000000);
-	ufs_renesas_param_write(hba, 0xd0, 0x0000082c);
-	ufs_renesas_param_poll(hba, 0xd4, BIT(27), BIT(27));
-	ufs_renesas_param_write(hba, 0xd0, 0x00000d2c);
-	ufs_renesas_param_poll(hba, 0xd4, BIT(0), BIT(0));
+	timer_val = ufs_renesas_init_disable_timer(hba);
 
 	/* phy setup */
 	ufs_renesas_param_indirect_write(hba, 1, 0x01, 0x001f);
@@ -276,10 +305,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_param_write_phy(hba, 0x4000, 0x0000);
 	ufs_renesas_param_write_phy(hba, 0x4001, 0x0000);
 
-	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0000, 0x0001);
-	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0000, 0x0002);
-	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0080, 0x0000);
-	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0080, 0x001a);
+	ufs_renesas_init_compensation_and_slicers(hba);
 
 	ufs_renesas_param_indirect_write(hba, 7, 0x70, 0x0016);
 	ufs_renesas_param_indirect_write(hba, 7, 0x71, 0x0016);
@@ -306,9 +332,7 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_param_indirect_poll(hba, 7, 0x41, 0, BIT(7));
 	/* end of phy setup */
 
-	ufs_renesas_param_write(hba, 0xf0, 0);
-	ufs_renesas_param_write(hba, 0xd0, 0x00000d00);
-	ufs_renesas_param_write(hba, 0xd4, timer_val);
+	ufs_renesas_init_enable_timer(hba, timer_val);
 }
 
 static int ufs_renesas_hce_enable_notify(struct ufs_hba *hba,
-- 
2.25.1


