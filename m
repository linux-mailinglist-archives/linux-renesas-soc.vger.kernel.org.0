Return-Path: <linux-renesas-soc+bounces-30642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAm1Bzeey2loJgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:13:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7728E367AD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC08330CE573
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347393EF0BB;
	Tue, 31 Mar 2026 10:04:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D30C3E8C78;
	Tue, 31 Mar 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951480; cv=none; b=RQYm0aYpDh1YUc4n1+X1gaqTYM7nJZVPXcFEjWSYj+gvLLxOgNYNKiJLxu/FbcKjSZSgtiLcNlsC4u0h0NE7R++mZNQGS45YIWemRvU6BDOwS+hRK/3NCwWC0Iod+RHBw9FdSVJJrT+tiw54nQP94k4IRp1WKRJYIR5GtObeXrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951480; c=relaxed/simple;
	bh=tC+SG52R0mtloz5r9G0Wu1IxFfsNRk0HFBPss2jLDUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVWUKH7MWXGSNiO7MFO6diEaZWwyoCjcgTV/nCZALA8k3Q3LpQ6lcqMqqvqH4/FVN0Fd6jKmuBYhxHCQgBXojS6UEFF4aQaNQvcQU0vuCKBqEce633oZ5WzZC9tHCM/Cj0PwSLYc2ANUCskCuotNJHzS/KxhmI5bsqdm5PhBFys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: zXVdgTNZQEWw95OKvmQeuA==
X-CSE-MsgGUID: RpL6pmDHTWC6T3jnDLW+tQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Mar 2026 19:04:38 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 645CF416C823;
	Tue, 31 Mar 2026 19:04:35 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 31 Mar 2026 12:04:03 +0200
Subject: [PATCH net-next v3 09/13] net: renesas: rswitch: update port HW
 init
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rswitch_add_vlans-v3-9-c37f41b1c556@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774951442; l=2575;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=tC+SG52R0mtloz5r9G0Wu1IxFfsNRk0HFBPss2jLDUc=;
 b=KVAbd+7HxIeN1nS95czmWaNclhzgBWdbKOIC1OG2ZW0TZc8nHBEpFibJc6wfgMvuH4fF9vUU1
 jdAUxtc3qYeBBit8cvazatbgeR7s/7+Cg7ac/K5UIxRI57IvXCrH6Hs
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-30642-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7728E367AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Certain Ethernet and cpu port settings need to be updated for vlan
support.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  4 ----
 drivers/net/ethernet/renesas/rswitch_main.c | 15 ++++++++++++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index ff2a84057f01..42c8bbafa27d 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -766,8 +766,6 @@ enum vlan_egress_mode {
 	HW_SC_TAG_VLAN,
 };
 
-#define EAVCC_VEM_SC_TAG	(0x3 << 16)
-
 #define MPIC_PIS		GENMASK(2, 0)
 #define MPIC_PIS_GMII		2
 #define MPIC_PIS_XGMII		4
@@ -806,8 +804,6 @@ enum rswitch_gwca_mode {
 #define GWMTIRM_MTIOG		BIT(0)
 #define GWMTIRM_MTR		BIT(1)
 
-#define GWVCC_VEM_SC_TAG	(0x3 << 16)
-
 #define GWARIRM_ARIOG		BIT(0)
 #define GWARIRM_ARR		BIT(1)
 
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 160b70997924..60bfa22cc412 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -735,8 +735,11 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 	if (err < 0)
 		return err;
 
-	iowrite32(GWVCC_VEM_SC_TAG, priv->addr + GWVCC);
-	iowrite32(0, priv->addr + GWTTFC);
+	iowrite32(0, priv->addr + GWIRC);
+	iowrite32(FIELD_PREP(DQD, DES_RAM_DP), priv->addr + GWRDQDC0);
+	/* Drop frames with unknown tags */
+	iowrite32(UT, priv->addr + GWTTFC);
+
 	iowrite32(lower_32_bits(priv->gwca.linkfix_table_dma), priv->addr + GWDCBAC1);
 	iowrite32(upper_32_bits(priv->gwca.linkfix_table_dma), priv->addr + GWDCBAC0);
 	iowrite32(lower_32_bits(priv->gwca.ts_queue.ring_dma), priv->addr + GWTDCAC10);
@@ -878,6 +881,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	limit = boguscnt;
 
 	desc = &gq->rx_ring[gq->cur];
+
 	while ((desc->desc.die_dt & DT_MASK) != DT_FEMPTY) {
 		dma_rmb();
 		skb = rswitch_rx_handle_desc(ndev, gq, desc);
@@ -1267,7 +1271,12 @@ static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
 	if (err < 0)
 		return err;
 
-	iowrite32(EAVCC_VEM_SC_TAG, etha->addr + EAVCC);
+	iowrite32(0, etha->addr + EAIRC);
+	iowrite32(FIELD_PREP(DQD, DES_RAM_DP), etha->addr + EATDQDC0);
+
+	/* Drop frames with unknown tags */
+	iowrite32(UT, etha->addr + EARTFC);
+
 	rswitch_rmac_setting(etha, mac);
 	rswitch_etha_enable_mii(etha);
 

-- 
2.43.0


