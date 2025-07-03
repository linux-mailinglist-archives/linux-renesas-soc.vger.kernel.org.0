Return-Path: <linux-renesas-soc+bounces-19081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E77FAF71AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 13:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37E4A1888182
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 11:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3532E2F01;
	Thu,  3 Jul 2025 11:08:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9493F2DE70B;
	Thu,  3 Jul 2025 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540894; cv=none; b=Dwzun08ODprjb29TMQTtyWkH7dGJ3mhJI1W595jkmPUcdESnRLp+G6k9cHQvQ2kK+8ZJTHUi/JgLmwAl/LzijR16D4vsOKUnvKRrlKQDFp3/SQ8I2BhqGMjWGLgkMKNUtAOpJncX9sKHXL/Rs61HSNodTlJP7KDTHgwuY4gu7MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540894; c=relaxed/simple;
	bh=vdlPPURZFqLW0CfYUqmDIFGE6MunILIj03Dugkm8ypU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F031oYo8bPgdg2icA/wKcKwjGYB1gKzABMxEeO4UAfuJd+osWI14Lhf6KEqK1rMkm9PptiuXc8re/91k0WuZMf3F95TR2ZaUkBM5XiI0t6xrV2HL2ahnqbOg5TzNRpaIJyXZ0Vx6pCbOlpxPCi+2MyRCFmRsSdojtsyE1Pk5c5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: V1tynd9+RaKn7lWBzI6Zhw==
X-CSE-MsgGUID: ZEgVgj95QbGhPZ2ohx7gEQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Jul 2025 20:08:11 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7B1BE40015C3;
	Thu,  3 Jul 2025 20:08:09 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 03 Jul 2025 13:07:23 +0200
Subject: [PATCH v4 1/2] phy: renesas: r8a779f0-ether-serdes: add USXGMII
 mode
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-renesas-serdes-update-v4-1-1db5629cac2b@renesas.com>
References: <20250703-renesas-serdes-update-v4-0-1db5629cac2b@renesas.com>
In-Reply-To: <20250703-renesas-serdes-update-v4-0-1db5629cac2b@renesas.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Dege <michael.dege@renesas.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751540886; l=5036;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=vdlPPURZFqLW0CfYUqmDIFGE6MunILIj03Dugkm8ypU=;
 b=4VwDH1QnRz8C5u6Pyk9LJQNlWvLB+BSXLM5RndA1pJoSOIs8l6QTEumBXoa2uLIAHxfy3RJAi
 UHHeDq10OfgCaDGXRiwGUni7Gyk1bcm+1NTrjAtDTvtLqRDr9jlScNr
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

The initial driver implementation was limited to SGMII and 1GBit/s. The
new mode allows speeds up to 2.5GBit/s on R-Car S4-8 SOCs.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/phy/renesas/r8a779f0-ether-serdes.c | 69 ++++++++++++++++++++++++-----
 1 file changed, 57 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index 3b2d8cef75e52c939fcc8806961e172dbafb8008..ed83c46f6d00c255852cc5af867c89ab0d0db02a 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Renesas Ethernet SERDES device driver
  *
- * Copyright (C) 2022 Renesas Electronics Corporation
+ * Copyright (C) 2022-2025 Renesas Electronics Corporation
  */
 
 #include <linux/delay.h>
@@ -92,17 +92,18 @@ r8a779f0_eth_serdes_common_setting(struct r8a779f0_eth_serdes_channel *channel)
 {
 	struct r8a779f0_eth_serdes_drv_data *dd = channel->dd;
 
-	switch (channel->phy_interface) {
-	case PHY_INTERFACE_MODE_SGMII:
-		r8a779f0_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x0097);
-		r8a779f0_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060);
-		r8a779f0_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200);
-		r8a779f0_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000);
-		r8a779f0_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d);
-		return 0;
-	default:
-		return -EOPNOTSUPP;
-	}
+	/* Set combination mode */
+	r8a779f0_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x00d7);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01cc, 0x180, 0xc200);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01c4, 0x180, 0x0042);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01c8, 0x180, 0x0000);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01dc, 0x180, 0x002f);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d);
+
+	return 0;
 }
 
 static int
@@ -155,6 +156,42 @@ r8a779f0_eth_serdes_chan_setting(struct r8a779f0_eth_serdes_channel *channel)
 		r8a779f0_eth_serdes_write32(channel->addr, 0x0028, 0x1f80, 0x07a1);
 		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f80, 0x0208);
 		break;
+
+	case PHY_INTERFACE_MODE_USXGMII:
+		r8a779f0_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0014, 0x380, 0x0050);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2200);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x001c, 0x380, 0x0400);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0x0001);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0x056a);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0x0015);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x1100);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 0x0001);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0x0001);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0x0001);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x0300);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0300);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x0004);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x0310);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x0301);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x00c8, 0x180, BIT(0), 0);
+		if (ret)
+			return ret;
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0301);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0148, 0x180, BIT(0), 0);
+		if (ret)
+			return ret;
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x1310);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0x1800);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2300);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0000, 0x380, BIT(8), 0);
+		if (ret)
+			return ret;
+		break;
+
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -179,6 +216,14 @@ r8a779f0_eth_serdes_chan_speed(struct r8a779f0_eth_serdes_channel *channel)
 			return ret;
 		r8a779f0_eth_serdes_write32(channel->addr, 0x0008, 0x1f80, 0x0000);
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x0120);
+		usleep_range(10, 20);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2600);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0000, 0x380, BIT(10), 0);
+		if (ret)
+			return ret;
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}

-- 
2.25.1


