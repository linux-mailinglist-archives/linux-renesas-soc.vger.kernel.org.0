Return-Path: <linux-renesas-soc+bounces-32347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAsHOe2YAWomfgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:53:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30550A5EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55CAC3008C29
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6983BA236;
	Mon, 11 May 2026 08:52:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B18C3BB9FC;
	Mon, 11 May 2026 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489574; cv=none; b=m2lw3zfpGoEg46VeDcDJCxd0xsWOGY7wEmB8w2l31i+/cj0CDtObDWjAEj88aiMS3PsTuxEvRLRkQnmC8uNCB+ej0EQpVO3xMTe2bcbXrWvYSyXYDaJpWC1eeP2G6kHyXcsHcdGSqtvTmdKeaCTSqvRGbD5M3WcgEAld6mwM+/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489574; c=relaxed/simple;
	bh=l6Or7TtGjPAtyZp/mjgkAkaX0FlXmpjsymwHngG/R/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eu/LB9Y0d4li7VEYcImPfbPeFIR/wygKkfXYibX84TgN+YpYodrFLxCm77ELJUw+vdqordF0oQV+EdCYUeEBmDbO5nu8sZBt4TYZbz02Mlge1CN0+IrlxSCjkLmW+Sb7lBHgy6nyIczWhWqiWk+1kk9JFsDKDTyLbA75bOWX0Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: jyYYp573RhyBRk28yrmfKw==
X-CSE-MsgGUID: 6f1T1Po4Thy7YFzBfsV6JA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 May 2026 17:52:53 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EC6964010DEB;
	Mon, 11 May 2026 17:52:49 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Mon, 11 May 2026 10:52:10 +0200
Subject: [PATCH net-next v4 07/13] net: renesas: rswitch: make helper
 functions available to whole driver
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rswitch_add_vlans-v4-7-a5a225f8faae@renesas.com>
References: <20260511-rswitch_add_vlans-v4-0-a5a225f8faae@renesas.com>
In-Reply-To: <20260511-rswitch_add_vlans-v4-0-a5a225f8faae@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489544; l=2846;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=l6Or7TtGjPAtyZp/mjgkAkaX0FlXmpjsymwHngG/R/Y=;
 b=TrYarLSWFRLZgEGVj+JFcuouNsuH+IJfJHocXw1N8cMjQaNOmWXNauJXOjSjA/A8zRGEw96Sy
 09rXNRK6tWUBcOOl9izHc2N56bgMDjDiG66w++PZk9n2jGM+HtoDz8W
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Rspamd-Queue-Id: 8B30550A5EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32347-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

These functions will be needed in L2 and vlan handling. Remove static
declaration and add function prototype to rswitch.h.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  6 ++++--
 drivers/net/ethernet/renesas/rswitch_main.c | 12 ++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 8415f52a239e..d7a8866a3993 100644
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
@@ -1219,5 +1219,7 @@ struct rswitch_private {
 
 bool is_rdev(const struct net_device *ndev);
 void rswitch_modify(void __iomem *addr, enum rswitch_reg reg, u32 clear, u32 set);
-
+int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected);
+int rswitch_gwca_change_mode(struct rswitch_private *priv, enum rswitch_gwca_mode mode);
+int rswitch_etha_change_mode(struct rswitch_etha *etha, enum rswitch_etha_mode mode);
 #endif	/* #ifndef __RSWITCH_H__ */
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index bf26c1a3384a..7d85905f2be2 100644
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
 
@@ -1168,8 +1168,8 @@ static int rswitch_gwca_ts_request_irqs(struct rswitch_private *priv)
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


