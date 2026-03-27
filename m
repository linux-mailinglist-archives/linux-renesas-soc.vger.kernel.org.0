Return-Path: <linux-renesas-soc+bounces-30414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIFnO4JBxmlRIAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:36:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6986A3411A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DADB3099B03
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6073DBD55;
	Fri, 27 Mar 2026 08:28:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B33E3DA7C8;
	Fri, 27 Mar 2026 08:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600101; cv=none; b=X43KO3eveOSg8rE2Qg7tZ+71RvZXnhk/CGcqj/UAGBkeOc4hFSl4LFvr93hxvlR1jd/f5ntXxnuyag7YEpoE2/UCZ7zMCn4UqUuLVS1j94No5alaBOdrFSMczRlS3IqDA9ex2pAXxJzl301dPhvXNbGpyZvujSCZcSAwxRTpykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600101; c=relaxed/simple;
	bh=OefNjGkxEG5kTziyf+/8NB1KQyg+CiOUkHHInvBgL+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9BlcckC1/cvVZwH6hREybx8TsqCLE0QNMH0CH/ujZGWAh5CalRptXzIBYIvbAKKMpmRkWpTJ6aSglBOwOVfS+ztVrFIxQRLbQzvmWp1uTO0EGau87pzL6K4KxrA9YmffM1xrkotm8mc2wmLrlsiYh8HHNrHli9Pden9eg6T95s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: u1mWMyWeThaz0CjuaYvWBA==
X-CSE-MsgGUID: 3wFlpXYUR6GxhApDqzmyPA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Mar 2026 17:28:13 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E1BB14012274;
	Fri, 27 Mar 2026 17:28:10 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 27 Mar 2026 09:27:39 +0100
Subject: [PATCH net-next v2 09/13] net: renesas: rswitch: update port HW
 init
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rswitch_add_vlans-v2-9-d7f4358ca57a@renesas.com>
References: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
In-Reply-To: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774600062; l=2575;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=OefNjGkxEG5kTziyf+/8NB1KQyg+CiOUkHHInvBgL+8=;
 b=AUlhcD7FCoOtR2USWvzNR2o3g9YzdbnzzCkytZlXVJdWYyodKIde1jVeQkpmlB5wd6sa/Ybcj
 Uim8cBto8taA3OOn3EzUrgX8IRPp2FMcWWadkSZ4z3Jmacq5LCMU2av
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30414-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6986A3411A7
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
index ac87175b918e..d1be588fb625 100644
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


