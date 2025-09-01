Return-Path: <linux-renesas-soc+bounces-21103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E4BB3D86F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 06:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81A0F7A912D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 04:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007B4244671;
	Mon,  1 Sep 2025 04:58:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DE623D7D7;
	Mon,  1 Sep 2025 04:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756702732; cv=none; b=HT0ghc0hm470UdUXqXXc44zUDf8BS/sZ88+/OLefBBqk5elMweLitPJYo+Jnk5ftAf9FbXhUZXm7MmTD+KowufObkGWYpnYnc3NH5Zm64j/sWY1fK9y6SJjPI3nrh97lbWBBu93hdKiNK/QANk54o/ZJ6PHuCyTpK7bvioNkPxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756702732; c=relaxed/simple;
	bh=NGVLu+ANiYC6kypprQAWXttJWY9+tu/YpWeVZkLFzKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mi1704Mi0Y6yZcXL2zQhjUITqNF3gd1aA9bF+/rdvGV+9pe5a8PWIKwEQ6N7hUXjkd8Z+wLRrIvBnlO+6enlHQGSsj74Mm/Q3g1qpNpuCC+/6M8zkAvGnCwSvPVf9kCFZvOZBDLnvdooE2yUvnrRdm22wHACH68/fMKABXVRvYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: /cGT5SjGQoW1gf8UzptG4A==
X-CSE-MsgGUID: TO+G7Jk4SQ2sCtlBQARSEw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2025 13:58:45 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E983D400F334;
	Mon,  1 Sep 2025 13:58:41 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Mon, 01 Sep 2025 06:58:06 +0200
Subject: [PATCH net-next v5 2/4] net: renesas: rswitch: configure default
 ageing time
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-add_l2_switching-v5-2-5f13e46860d5@renesas.com>
References: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
In-Reply-To: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756702712; l=2913;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=NGVLu+ANiYC6kypprQAWXttJWY9+tu/YpWeVZkLFzKA=;
 b=dyl3LJ/DCskC3UNlwH7gvmvIRIFcfsSdpgJO/xvOmbWdAigkQSSyzu1H/7vfAk32uZS2iwkVE
 a+y6VHx7WlIDeMPdxFBFSGJoFdGbl8HAJf+uFT+Qlj3RX+r529J3/Sf
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


