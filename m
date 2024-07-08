Return-Path: <linux-renesas-soc+bounces-7173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F1A92A253
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 14:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C94781C20E02
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 12:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A38213E3FF;
	Mon,  8 Jul 2024 12:10:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9029184FA0;
	Mon,  8 Jul 2024 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720440601; cv=none; b=MhqTkvjP33SpnKXRcMq2/6MrstBRPW55ajeUTvlE9OrZeKwNHbmq2OScVrYvd/a0nLmwq+KOh2hojI89H75uN6/iCa/HeSCSwVkmPn+J7KaQWtfwbG8+6Yb47m8ruw/DAnTqGzbOVaE+4M/q+klLB6qzgnhpB81NOO4JOsIpPIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720440601; c=relaxed/simple;
	bh=M7DyuYt89+OVBd2W0gpys6EAs1yFZjr+WovQd6Ry6Yk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UsBNJY0SCv7nuJ5ihsQep557YvV7pp0IeW2NPOz8KBozRpnOi4wNHks0oDpBHUQ+uzkc+pkBiJCceZH+ozP4ilMEB49gLIfIhfbW34lguSNjOm1clwDcPR+oddqZr4mfncIIspsHxagJz/pMDF+S/OhLVv3Pdn5nvDy2xtAjhzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,191,1716217200"; 
   d="scan'208";a="210673230"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2024 21:09:53 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D177440029BE;
	Mon,  8 Jul 2024 21:09:53 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/5] scsi: ufs: renesas: Use udelay() directly
Date: Mon,  8 Jul 2024 21:09:29 +0900
Message-Id: <20240708120931.1703956-4-yoshihiro.shimoda.uh@renesas.com>
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

After refactored code, this driver can call udelay() directly. So,
use udelay() directly to improve code readability.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/ufs/host/ufs-renesas.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index 3a393bd4c407..9b855606a9fb 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -25,7 +25,6 @@ struct ufs_renesas_priv {
 enum ufs_renesas_init_param_mode {
 	MODE_POLL,
 	MODE_READ,
-	MODE_WAIT,
 	MODE_WRITE,
 };
 
@@ -34,7 +33,6 @@ struct ufs_renesas_init_param {
 	u32 reg;
 	union {
 		u32 expected;
-		u32 delay_us;
 		u32 val;
 	} u;
 	u32 mask;
@@ -65,12 +63,6 @@ static u32 ufs_renesas_reg_control(struct ufs_hba *hba,
 			dev_err(hba->dev, "%s: poll failed %d (%08x, %08x, %08x)\n",
 				__func__, ret, val, p->mask, p->u.expected);
 		break;
-	case MODE_WAIT:
-		if (p->u.delay_us > 1000)
-			mdelay(DIV_ROUND_UP(p->u.delay_us, 1000));
-		else
-			udelay(p->u.delay_us);
-		break;
 	case MODE_WRITE:
 		ufshcd_writel(hba, p->u.val, p->reg);
 		break;
@@ -104,16 +96,6 @@ static void ufs_renesas_param_poll(struct ufs_hba *hba, u32 reg, u32 expected,
 	ufs_renesas_reg_control(hba, &param);
 }
 
-static void ufs_renesas_param_wait(struct ufs_hba *hba, u32 delay_us)
-{
-	struct ufs_renesas_init_param param = { 0 };
-
-	param.mode = MODE_WAIT;
-	param.u.delay_us = delay_us;
-
-	ufs_renesas_reg_control(hba, &param);
-}
-
 static void ufs_renesas_param_write(struct ufs_hba *hba, u32 reg, u32 value)
 {
 	struct ufs_renesas_init_param param = { 0 };
@@ -216,13 +198,13 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	/* This setting is for SERIES B */
 	ufs_renesas_param_write(hba, 0xc0, 0x49425308);
 	ufs_renesas_param_write_d0_d4(hba, 0x00000104, 0x00000002);
-	ufs_renesas_param_wait(hba, 1);
+	udelay(1);
 	ufs_renesas_param_write_d0_d4(hba, 0x00000828, 0x00000200);
-	ufs_renesas_param_wait(hba, 1);
+	udelay(1);
 	ufs_renesas_param_write_d0_d4(hba, 0x00000828, 0x00000000);
 	ufs_renesas_param_write_d0_d4(hba, 0x00000104, 0x00000001);
 	ufs_renesas_param_write_d0_d4(hba, 0x00000940, 0x00000001);
-	ufs_renesas_param_wait(hba, 1);
+	udelay(1);
 	ufs_renesas_param_write_d0_d4(hba, 0x00000940, 0x00000000);
 
 	ufs_renesas_param_write(hba, 0xc0, 0x49425308);
-- 
2.25.1


