Return-Path: <linux-renesas-soc+bounces-21009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C01FB399F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 12:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138431886518
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 10:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3080C30F549;
	Thu, 28 Aug 2025 10:28:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A6630C368;
	Thu, 28 Aug 2025 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376919; cv=none; b=PuzLGFBaWSeL6NhoL8H3GrrZdqZYVt6PCQTKMd9CShnuHOxXSUiH89vQQWXcicBwUkaYYzZDzcEoWRkduXpP4RGm6msc6W4wgjDxd8VUCJU+2ddrnZUFL9m+NsCgD1bC/1gvETSYMVY8enks2LGuJfdoZ1cKc+6Hrnxu0P3x7d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376919; c=relaxed/simple;
	bh=NGVLu+ANiYC6kypprQAWXttJWY9+tu/YpWeVZkLFzKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOvZB7gKexkQ+WvYNYJoeSA4fRXbj+No3Eu+BTZHI0grSILeua6Ig28qID4LHc+zK3f2eek9qF19PpnGnzm718fLFE83Fkm8z2NEwLgccx9a1MXCmw8ZaHvkbn0F5Wy5+qGI72K0iSSQBFjah7bxOXaWADcmSqvtgVMy3lUbiPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: zToJAvGkR7ih32xFapJGuQ==
X-CSE-MsgGUID: SSDnpXXDRPuMxPvZvnEJLg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2025 19:23:32 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 20D63417D5AD;
	Thu, 28 Aug 2025 19:23:28 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 28 Aug 2025 12:23:13 +0200
Subject: [PATCH net-next v4 2/4] net: renesas: rswitch: configure default
 ageing time
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-add_l2_switching-v4-2-89d7108c8592@renesas.com>
References: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
In-Reply-To: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756376599; l=2913;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=NGVLu+ANiYC6kypprQAWXttJWY9+tu/YpWeVZkLFzKA=;
 b=wfFJ3wkubKaYLTWFXVUlA2SDNAkbChOlNiRu2nVzqWqbkGzdZAhrgbFJSNYZtv2c7iaU18uux
 luG5Bi2iapNBQ1NezhF12IAm1eNnEBxUzwWDAR3+CqyY6NrSOv3gqWt
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
2.50.1


