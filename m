Return-Path: <linux-renesas-soc+bounces-19484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D9B00217
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 14:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCAE01AA09D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 12:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9912E8894;
	Thu, 10 Jul 2025 12:31:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533CC2E7657;
	Thu, 10 Jul 2025 12:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150707; cv=none; b=MA2NjIrJnfSgbweNl3Nub03j6xCf30fp4YRoDTzWsOv/dOj9AoO+g5cAxFXWVF4O+PSWOLdjagnbz9GXuHoSlvaZTK4Sj/NSo/FTOSmjdUjxlRpO3AHJVgx+qIbMNBSwEhyf+VVmF9fUoWw+naf1Pf3a1ranc5HFIrKrsJ4Txuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150707; c=relaxed/simple;
	bh=9Jl1ym2arkbPB3/vw5Og2mnLgQSWuDM5UoiErcPf36k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=McQ6WmbDLcH2p8tIGZY+pzamZvsS1hP/0GdVht4XYtP3prgSUPAGyRzH/Ov/Jv1g+YvZXwcUP376IWnOVUAGJ1/Ot//A8C0Is0UoOTKRB9gZ6C/MhmlvlKOVu7cEeOeduemipTwe4aGSoJW3TQr8o/jT2TqnhhxN1MvQsPZSDYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 0tDSsBUwQTKu1eUZ+DzJ2A==
X-CSE-MsgGUID: 50LypmJ2RZe2BQxPThaUJA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jul 2025 21:31:44 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8E389424F40F;
	Thu, 10 Jul 2025 21:31:41 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 10 Jul 2025 14:31:10 +0200
Subject: [PATCH v3 2/4] net: renesas: rswitch: configure default ageing
 time
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-add_l2_switching-v3-2-c0a328327b43@renesas.com>
References: <20250710-add_l2_switching-v3-0-c0a328327b43@renesas.com>
In-Reply-To: <20250710-add_l2_switching-v3-0-c0a328327b43@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752150692; l=2913;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=9Jl1ym2arkbPB3/vw5Og2mnLgQSWuDM5UoiErcPf36k=;
 b=IsgUGo0tYPI3pk0kCyf4EkWWJA0MeVy1ZMm8+G5jve3AVIey/tySlcmQVRutpreOZOycs1XFK
 LD8ttQGZF6UCvDGjVs02xgEolVQLHEKOEYOQmSSAyiqbBi5/pCfoAbF
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Enable MAC ageing by setting up the timer and setting the ageging
time to the default of 300s.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      | 14 +++++++++++++-
 drivers/net/ethernet/renesas/rswitch_main.c | 11 ++++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 532192cbca4b520e06a7e35653929d8364f1ccb2..131034d5d992eb59fd2299fa25de3a65285d29ad 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Renesas Ethernet Switch device driver
  *
- * Copyright (C) 2022 Renesas Electronics Corporation
+ * Copyright (C) 2022-2025 Renesas Electronics Corporation
  */
 
 #ifndef __RSWITCH_H__
@@ -826,6 +826,18 @@ enum rswitch_gwca_mode {
 
 #define FWPBFCSDC(j, i)         (FWPBFCSDC00 + (i) * 0x10 + (j) * 0x04)
 
+#define FWMACAGUSPC_MACAGUSP	GENMASK(9, 0)
+#define FWMACAGC_MACAGT		GENMASK(15, 0)
+#define FWMACAGC_MACAGE		BIT(16)
+#define FWMACAGC_MACAGSL	BIT(17)
+#define FWMACAGC_MACAGPM	BIT(18)
+#define FWMACAGC_MACDES		BIT(24)
+#define FWMACAGC_MACAGOG	BIT(28)
+#define FWMACAGC_MACDESOG	BIT(29)
+
+#define RSW_AGEING_CLK_PER_US	0x140
+#define RSW_AGEING_TIME		300
+
 /* TOP */
 #define TPEMIMC7(queue)		(TPEMIMC70 + (queue) * 4)
 
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index aba772e14555d30891dc74a5a123121dad77e92b..99019ad9de224eaf1c4128bd29609b24d1a6f263 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Renesas Ethernet Switch device driver
  *
- * Copyright (C) 2022 Renesas Electronics Corporation
+ * Copyright (C) 2022-2025 Renesas Electronics Corporation
  */
 
 #include <linux/clk.h>
@@ -113,6 +113,7 @@ static void rswitch_fwd_init(struct rswitch_private *priv)
 {
 	u32 all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
 	unsigned int i;
+	u32 reg_val;
 
 	/* Start with empty configuration */
 	for (i = 0; i < RSWITCH_NUM_AGENTS; i++) {
@@ -128,6 +129,14 @@ static void rswitch_fwd_init(struct rswitch_private *priv)
 		iowrite32(0, priv->addr + FWPBFC(i));
 	}
 
+	/* Configure MAC table aging */
+	rswitch_modify(priv->addr, FWMACAGUSPC, FWMACAGUSPC_MACAGUSP,
+		       FIELD_PREP(FWMACAGUSPC_MACAGUSP, RSW_AGEING_CLK_PER_US));
+
+	reg_val = FIELD_PREP(FWMACAGC_MACAGT, RSW_AGEING_TIME);
+	reg_val |= FWMACAGC_MACAGE | FWMACAGC_MACAGSL;
+	iowrite32(reg_val, priv->addr + FWMACAGC);
+
 	/* For enabled ETHA ports, setup port based forwarding */
 	rswitch_for_each_enabled_port(priv, i) {
 		/* Port based forwarding from port i to GWCA port */

-- 
2.49.0


