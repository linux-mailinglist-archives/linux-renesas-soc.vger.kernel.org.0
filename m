Return-Path: <linux-renesas-soc+bounces-19370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7805EAFC70A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 11:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 903591655EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 09:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6777626657D;
	Tue,  8 Jul 2025 09:28:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1ECB22B8D0;
	Tue,  8 Jul 2025 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751966883; cv=none; b=Z0evZUMv5GwWibP2xlHZWm7kKAaA0jLTPFSy0xnhnLL3IKmO45920B8zwFINOlE/DMXDQhkOOOBaVg9YNaXDgS/6GXE+yx8CQ6Pp3XKSTJFK0fsT1acpF9mlVnnMZY/aCA9JsT4mEcQIXjjLqimXo5rOhKfy21Z+dOGBcHT5/cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751966883; c=relaxed/simple;
	bh=KVrzRmQGG2cdaeFhNKeIxvEvNE+9YXP1pbh5qNJxgq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpxQXikfcQelqT81F661StTWWqXPdhTfiPeQo7zYH9BDxxgkOo8ayZxUU4d8eAlt2CmNF1SxclbqJ2uInMHRlGYex3AM+ZFlO73xLVRq6+yZi64Wl+oQwP5uB2s628XctCiDWaW3F+e6J6OYWO60FWUIEUjzTEgickLQ3J5+Szk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: il9EKbu7SK2cU6f8KfR/wQ==
X-CSE-MsgGUID: Lben6mkeQcS2kDFHnXzE3Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2025 18:27:57 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5630B400A8B4;
	Tue,  8 Jul 2025 18:27:54 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 08 Jul 2025 11:27:38 +0200
Subject: [PATCH v2 2/4] net: renesas: rswitch: configure default ageing
 time
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-add_l2_switching-v2-2-f91f5556617a@renesas.com>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
In-Reply-To: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751966866; l=2858;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=KVrzRmQGG2cdaeFhNKeIxvEvNE+9YXP1pbh5qNJxgq8=;
 b=TVnx45njwCp5BH422RmcAWnWYLfBWfhSbieDx2qYNcrjlsh8qsDkLLtd6co8er8O9ZfNhgnQU
 0IBwPdg3H8lCbYhmqbCKrqcjihxRJfmovVNoPK2t8AmcQzhYmZNmn8V
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Enable MAC ageing by setting up the timer and setting the ageging
time to the default of 300s.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      | 13 ++++++++++++-
 drivers/net/ethernet/renesas/rswitch_main.c | 11 ++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 532192cbca4b520e06a7e35653929d8364f1ccb2..feb62b99bceb50e1d68345ff9eba581f7c38edbe 100644
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
@@ -826,6 +826,17 @@ enum rswitch_gwca_mode {
 
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
+#define RSW_AGEING_TIME		300
+
 /* TOP */
 #define TPEMIMC7(queue)		(TPEMIMC70 + (queue) * 4)
 
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index aba772e14555d30891dc74a5a123121dad77e92b..2474271cac7f057fffb472131f5a7a72a0fa9a87 100644
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
+		       FIELD_PREP(FWMACAGUSPC_MACAGUSP, 0x140));
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


