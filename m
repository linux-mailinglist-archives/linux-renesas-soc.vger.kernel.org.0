Return-Path: <linux-renesas-soc+bounces-7186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF2B92AE38
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 04:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76EC9282043
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 02:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340443BBC9;
	Tue,  9 Jul 2024 02:36:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3138441C6C;
	Tue,  9 Jul 2024 02:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492565; cv=none; b=N9/Hi3smxWUV7rXMuggAz3DEYWqyfCJCh9qXBtsh4mTit/9Rhi4DfHzFliKVh8FBW/ihR6da3/C2cb1fnakYpZzO1aK2DgisYJvXskLVPYKocg7ykcpNuGtuHh+4bdOZXQaY7moMPpISNiWBHO4ujp8HxtJTMMpp8OlS2+zs+FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492565; c=relaxed/simple;
	bh=XYWBSPdp1TXXAl0uKcMJXqoI0E/Taa2kJErMzdL/hjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m3ExjZylFjQlfLP+qb3wdWXJ4YyMPNXNiR+RYLsPcIyLiqPK7e5Xn2hUa4GV62xRTofR35r/phL+NcEhtG+ymkGOlxRLO553AWhQ9lXHnl9JIh0DCRvQ3uhAZxGkboBqXievJwjH2KTo9/LPpzzGRHvh2jeh3g1UpJo0h13ZS/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,193,1716217200"; 
   d="scan'208";a="214695293"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jul 2024 11:35:58 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 431894140BEF;
	Tue,  9 Jul 2024 11:35:58 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 4/5] scsi: ufs: renesas: Refactoring specific PHY settings of 0x10a[df]
Date: Tue,  9 Jul 2024 11:35:49 +0900
Message-Id: <20240709023550.1750333-5-yoshihiro.shimoda.uh@renesas.com>
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

Refactoring specific PHY setting of 0x10a[df] into a new function.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/ufs/host/ufs-renesas.c | 37 +++++++++++++---------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index e02c147e6248..4d83f8f4610e 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -134,6 +134,16 @@ static void ufs_renesas_indirect_poll(struct ufs_hba *hba, u32 gpio, u32 addr,
 	ufs_renesas_write(hba, 0xf0, 0);
 }
 
+static void ufs_renesas_write_phy_10ad_10af(struct ufs_hba *hba,
+					    u32 data_10ad, u32 data_10af)
+{
+	ufs_renesas_write_phy(hba, 0x10ae, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10ad, data_10ad);
+	ufs_renesas_write_phy(hba, 0x10af, data_10af);
+	ufs_renesas_write_phy(hba, 0x10b6, 0x0001);
+	ufs_renesas_write_phy(hba, 0x10ae, 0x0000);
+}
+
 static void ufs_renesas_pre_init(struct ufs_hba *hba)
 {
 	u32 timer_val;
@@ -208,29 +218,10 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_write_phy(hba, 0x4000, 0x0000);
 	ufs_renesas_write_phy(hba, 0x4001, 0x0000);
 
-	ufs_renesas_write_phy(hba, 0x10ae, 0x0001);
-	ufs_renesas_write_phy(hba, 0x10ad, 0x0000);
-	ufs_renesas_write_phy(hba, 0x10af, 0x0001);
-	ufs_renesas_write_phy(hba, 0x10b6, 0x0001);
-	ufs_renesas_write_phy(hba, 0x10ae, 0x0000);
-
-	ufs_renesas_write_phy(hba, 0x10ae, 0x0001);
-	ufs_renesas_write_phy(hba, 0x10ad, 0x0000);
-	ufs_renesas_write_phy(hba, 0x10af, 0x0002);
-	ufs_renesas_write_phy(hba, 0x10b6, 0x0001);
-	ufs_renesas_write_phy(hba, 0x10ae, 0x0000);
-
-	ufs_renesas_write_phy(hba, 0x10ae, 0x0001);
-	ufs_renesas_write_phy(hba, 0x10ad, 0x0080);
-	ufs_renesas_write_phy(hba, 0x10af, 0x0000);
-	ufs_renesas_write_phy(hba, 0x10b6, 0x0001);
-	ufs_renesas_write_phy(hba, 0x10ae, 0x0000);
-
-	ufs_renesas_write_phy(hba, 0x10ae, 0x0001);
-	ufs_renesas_write_phy(hba, 0x10ad, 0x0080);
-	ufs_renesas_write_phy(hba, 0x10af, 0x001a);
-	ufs_renesas_write_phy(hba, 0x10b6, 0x0001);
-	ufs_renesas_write_phy(hba, 0x10ae, 0x0000);
+	ufs_renesas_write_phy_10ad_10af(hba, 0x0000, 0x0001);
+	ufs_renesas_write_phy_10ad_10af(hba, 0x0000, 0x0002);
+	ufs_renesas_write_phy_10ad_10af(hba, 0x0080, 0x0000);
+	ufs_renesas_write_phy_10ad_10af(hba, 0x0080, 0x001a);
 
 	ufs_renesas_indirect_write(hba, 7, 0x70, 0x0016);
 	ufs_renesas_indirect_write(hba, 7, 0x71, 0x0016);
-- 
2.25.1


