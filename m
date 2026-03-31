Return-Path: <linux-renesas-soc+bounces-30640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJpzFuacy2loJgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:07:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7B2367978
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E76BA30331E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2873B3EDAD5;
	Tue, 31 Mar 2026 10:04:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CE43F20F1;
	Tue, 31 Mar 2026 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951473; cv=none; b=sgEXKKoTqhQPk0YWsvQ7AB5PjeOniO1LPAhO5V/6iImjDO3C9N3s2IwU4Xjwe2RlrrAF+YPlikdcfkm07h6oGSaIIqla7HWb86RayV826DqdZ75gLsN3p6jFq7jVZXrUnoHhzgHg3N4705JV0SXDLaI6n9ljTY2A8gjiMZgsytM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951473; c=relaxed/simple;
	bh=6edi9epqRQK97jgNLWH1B49uvX0IGGcIOTispn58OuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMRbj1ZWwzJpdk/09sjOq0ivg8e9Ub+g74aQwgs81ahEuKCw1SDqsTqS+V8nzczce2hlI34udwZNJM2PEh/Q9/n6rzaIUgkfYMoacJPbtbZX7J8v+lMnUlFVXL+3Uoo6cQ9wPUiBsS1V7FVY1S3U12PUn7F1+S71oKNmPEYBfPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: ZxFHVT1hREm57JX7WeXrxA==
X-CSE-MsgGUID: 0Lq8zLQ3T02I44GWcV0niA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Mar 2026 19:04:31 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4D539416C823;
	Tue, 31 Mar 2026 19:04:28 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 31 Mar 2026 12:04:01 +0200
Subject: [PATCH net-next v3 07/13] net: renesas: rswitch: make helper
 functions available to whole driver
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rswitch_add_vlans-v3-7-c37f41b1c556@renesas.com>
References: <20260331-rswitch_add_vlans-v3-0-c37f41b1c556@renesas.com>
In-Reply-To: <20260331-rswitch_add_vlans-v3-0-c37f41b1c556@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774951442; l=2846;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=6edi9epqRQK97jgNLWH1B49uvX0IGGcIOTispn58OuI=;
 b=5l8pTq8YmPCr3gt96lfagR107qh+ZkUZ0reP/e3etQ5UNKjWJ9dE/LKVftQ7o4qjJtGX4+rn1
 G9E6amMKh6bD10J9yMTd2DPPOIBPzaC69GqKXgt7Rtprl/530Gyq10e
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-30640-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 1D7B2367978
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
index 3c142fa3c810..99c9bef14ca5 100644
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


