Return-Path: <linux-renesas-soc+bounces-29573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDsEMfoiuWkrrwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:46:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4702D2A7239
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DFE230D342D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CC139F171;
	Tue, 17 Mar 2026 09:42:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2E339F164;
	Tue, 17 Mar 2026 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740546; cv=none; b=pV9iYv7Io5kiHJEA3wXI7lMy3RpBWFyZb0p2SdgR4fsYqL2BCmrs2i9GPAtHJ6BUT86OTLImxt40gKVzQaR+ZhIndBvujXSHk0hctyqPSnnC39jCcHjaxiSuUt1Xz8dvWpymFQtn/3YXPq2P0y2AL6cSvNER19nwb7JUivBUlmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740546; c=relaxed/simple;
	bh=qP4I8G9zNImRW0K3+hJs+IDbBZErpgqcOxRSKe0y7x8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rW4MxosZAsLemBHePyoMKL01WK6/rIpnQPHHDzgMX1oXjaVGe9GoDnVuRy1PNc7fQKgYvbN7L+pu9H3DoSB2glA/yGOKr25vywnOsU1wWzQZ5fOQ10fNZRGFLORUEY6Rw+Fvj5EhLHj0QLcRHnjZnJzJQ4bhuUKmMGK3tJ0vCW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: r0V9xmgxSDa27bLOxoizcA==
X-CSE-MsgGUID: HjXUgoI6SoykPguj+Jd0zA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Mar 2026 18:42:23 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id BC3284016D6A;
	Tue, 17 Mar 2026 18:42:20 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 17 Mar 2026 10:42:00 +0100
Subject: [PATCH net-next 07/13] net: renesas: rswitch: make helper
 functions available to whole driver
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rswitch_add_vlans-v1-7-3a57bfa0f2d1@renesas.com>
References: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
In-Reply-To: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773740518; l=2846;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=qP4I8G9zNImRW0K3+hJs+IDbBZErpgqcOxRSKe0y7x8=;
 b=18DRQRcTtFPHSrsQYdL4fD8P56EQskkIb2lPO1r74ea89RjPr1Q/UZONwAAIUCs+hDWQx2mwY
 q/iCKcPm4/LB6HLETY9FZDvj70ZbA/pr/a0u4Z2ceGZcNVqUw40NLDb
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29573-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.646];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 4702D2A7239
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These functions will be needed in L2 and vlan handling. Remove static
declaration and add function prototype to rswitch.h.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  6 ++++--
 drivers/net/ethernet/renesas/rswitch_main.c | 12 ++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index bf123b564ed1..ff2a84057f01 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Renesas Ethernet Switch device driver
  *
- * Copyright (C) 2022-2025 Renesas Electronics Corporation
+ * Copyright (C) 2022-2026 Renesas Electronics Corporation
  */
 
 #ifndef __RSWITCH_H__
@@ -1218,5 +1218,7 @@ struct rswitch_private {
 
 bool is_rdev(const struct net_device *ndev);
 void rswitch_modify(void __iomem *addr, enum rswitch_reg reg, u32 clear, u32 set);
-
+int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected);
+int rswitch_gwca_change_mode(struct rswitch_private *priv, enum rswitch_gwca_mode mode);
+int rswitch_etha_change_mode(struct rswitch_etha *etha, enum rswitch_etha_mode mode);
 #endif	/* #ifndef __RSWITCH_H__ */
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index f8ceb7f66903..b16f7aca4a69 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Renesas Ethernet Switch device driver
  *
- * Copyright (C) 2022-2025 Renesas Electronics Corporation
+ * Copyright (C) 2022-2026 Renesas Electronics Corporation
  */
 
 #include <linux/clk.h>
@@ -32,7 +32,7 @@
 
 #define RSWITCH_GPTP_OFFSET_S4 0x00018000
 
-static int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected)
+int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected)
 {
 	u32 val;
 
@@ -168,8 +168,8 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 }
 
 /* Gateway CPU agent block (GWCA) */
-static int rswitch_gwca_change_mode(struct rswitch_private *priv,
-				    enum rswitch_gwca_mode mode)
+int rswitch_gwca_change_mode(struct rswitch_private *priv,
+			     enum rswitch_gwca_mode mode)
 {
 	int ret;
 
@@ -1153,8 +1153,8 @@ static int rswitch_gwca_ts_request_irqs(struct rswitch_private *priv)
 }
 
 /* Ethernet TSN Agent block (ETHA) and Ethernet MAC IP block (RMAC) */
-static int rswitch_etha_change_mode(struct rswitch_etha *etha,
-				    enum rswitch_etha_mode mode)
+int rswitch_etha_change_mode(struct rswitch_etha *etha,
+			     enum rswitch_etha_mode mode)
 {
 	int ret;
 

-- 
2.43.0


