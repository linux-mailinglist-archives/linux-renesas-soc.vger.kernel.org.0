Return-Path: <linux-renesas-soc+bounces-7174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9805392A256
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 14:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9C6F1C205BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 12:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D20413E8AE;
	Mon,  8 Jul 2024 12:10:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2EC13E03D;
	Mon,  8 Jul 2024 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720440602; cv=none; b=GNA5KkzG7LMO/YAsipO1TCju5SnabdtjgzSfLMqC95QQq6rVxE00By/cqJXCflanVq9ZWejIW4OLPj56kcZUR9//43dglFbudy05cBFOyVy/lAdkt5CCREJFU79b5cv1FqEfEtvO63oHYwstv+qzfmtcsyKDMC9Xz2sFMFflW48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720440602; c=relaxed/simple;
	bh=a/Y8b/L0YObGjc1fEfYenTlHUEjNAgBWxTW2dYzLl9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lm5o5oknHCD5giWVZYwerpSmxWNmdWWZhTrFf6DTfmmLGFAOATEPtpB4zrRl/xFSg+HUIPJGP2Nr0BHMBx91wIM5K9hMbMVf0ubDHFkNYSSewbaHcqCbke8AoYIptJkMY7bUDe4Gf9t2o9ud2riC3m1r8cthvrlgnYi+V+cDkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,191,1716217200"; 
   d="scan'208";a="214631186"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2024 21:09:53 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DE79F40029DC;
	Mon,  8 Jul 2024 21:09:53 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/5] scsi: ufs: renesas: Refactoring specific PHY settings of 0x10a[df]
Date: Mon,  8 Jul 2024 21:09:30 +0900
Message-Id: <20240708120931.1703956-5-yoshihiro.shimoda.uh@renesas.com>
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

Refactoring specific PHY setting of 0x10a[df] into a new function.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/ufs/host/ufs-renesas.c | 37 +++++++++++++---------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index 9b855606a9fb..abe33b0c64db 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -191,6 +191,16 @@ static void ufs_renesas_param_indirect_poll(struct ufs_hba *hba, u32 gpio,
 	ufs_renesas_param_write(hba, 0xf0, 0);
 }
 
+static void ufs_renesas_param_write_phy_10ad_10af(struct ufs_hba *hba,
+						  u32 data_10ad, u32 data_10af)
+{
+	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0001);
+	ufs_renesas_param_write_phy(hba, 0x10ad, data_10ad);
+	ufs_renesas_param_write_phy(hba, 0x10af, data_10af);
+	ufs_renesas_param_write_phy(hba, 0x10b6, 0x0001);
+	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0000);
+}
+
 static void ufs_renesas_pre_init(struct ufs_hba *hba)
 {
 	u32 timer_val;
@@ -266,29 +276,10 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_param_write_phy(hba, 0x4000, 0x0000);
 	ufs_renesas_param_write_phy(hba, 0x4001, 0x0000);
 
-	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0001);
-	ufs_renesas_param_write_phy(hba, 0x10ad, 0x0000);
-	ufs_renesas_param_write_phy(hba, 0x10af, 0x0001);
-	ufs_renesas_param_write_phy(hba, 0x10b6, 0x0001);
-	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0000);
-
-	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0001);
-	ufs_renesas_param_write_phy(hba, 0x10ad, 0x0000);
-	ufs_renesas_param_write_phy(hba, 0x10af, 0x0002);
-	ufs_renesas_param_write_phy(hba, 0x10b6, 0x0001);
-	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0000);
-
-	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0001);
-	ufs_renesas_param_write_phy(hba, 0x10ad, 0x0080);
-	ufs_renesas_param_write_phy(hba, 0x10af, 0x0000);
-	ufs_renesas_param_write_phy(hba, 0x10b6, 0x0001);
-	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0000);
-
-	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0001);
-	ufs_renesas_param_write_phy(hba, 0x10ad, 0x0080);
-	ufs_renesas_param_write_phy(hba, 0x10af, 0x001a);
-	ufs_renesas_param_write_phy(hba, 0x10b6, 0x0001);
-	ufs_renesas_param_write_phy(hba, 0x10ae, 0x0000);
+	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0000, 0x0001);
+	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0000, 0x0002);
+	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0080, 0x0000);
+	ufs_renesas_param_write_phy_10ad_10af(hba, 0x0080, 0x001a);
 
 	ufs_renesas_param_indirect_write(hba, 7, 0x70, 0x0016);
 	ufs_renesas_param_indirect_write(hba, 7, 0x71, 0x0016);
-- 
2.25.1


