Return-Path: <linux-renesas-soc+bounces-32349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eApHHQCZAWrPfgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:53:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848250A5FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC9FA30078AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2194A3BED5A;
	Mon, 11 May 2026 08:53:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6818E3BED31;
	Mon, 11 May 2026 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489582; cv=none; b=OxodooPS9ehBVfKUprwEaCBvLRGmg2wq2SjMcv84vBZ9YlacF+0W69EBzjVOolfPHlczmeXUkOfoIu5kskutZe0qmEhqCGZ12Pzuix03kC1MJH/43drYDi4uYzRReh7TEJKfNetp/q0dBJ3K5Kumh93nhuWdzr4iM+12kNAo8HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489582; c=relaxed/simple;
	bh=hkjuP3fD8RUOCXLPGqZ55U5OK8Y8iNWY4aoCgxW6cmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qzLWCGsCvTt2nmPblHxFTx+TGddHs7eYX7qy/FCf6+o/mR5qnIfqC3GlG9YDAvFSZ3c94bflCIaOFK4NfFYAllSem52XXf7pvP2BqJmZk7Gg3c6JAwt8u2xHqKT12S1jLwJhexaaq5bPP5G9ZkZC9LW385frLO0MYXxt4g7ZARM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 1PvqY/fjT12nf5lFqjiJxw==
X-CSE-MsgGUID: rE+AugzlR1CkOWRNhhV5FA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 May 2026 17:53:00 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 12B324010DEB;
	Mon, 11 May 2026 17:52:56 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Mon, 11 May 2026 10:52:12 +0200
Subject: [PATCH net-next v4 09/13] net: renesas: rswitch: update port HW
 init
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rswitch_add_vlans-v4-9-a5a225f8faae@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489544; l=2575;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=hkjuP3fD8RUOCXLPGqZ55U5OK8Y8iNWY4aoCgxW6cmI=;
 b=OKYuXT0pJNhF9q2X7lg7IAdGMPEFrNRFmXXOFM2bKmI3qVQ+/Yw7l73v9m5inRcOTj6jRFPX7
 4dWwasvULNlB05Ou5SltFxreGxT10Mwkk/yoieYWoV4OWecU1P4J0ab
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Rspamd-Queue-Id: 1848250A5FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32349-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.986];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Certain Ethernet and cpu port settings need to be updated for vlan
support.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  4 ----
 drivers/net/ethernet/renesas/rswitch_main.c | 15 ++++++++++++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index d7a8866a3993..89315b6cde0f 100644
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
index 90c44dcfd169..d00af333fcce 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -737,8 +737,11 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
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
@@ -880,6 +883,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	limit = boguscnt;
 
 	desc = &gq->rx_ring[gq->cur];
+
 	while ((desc->desc.die_dt & DT_MASK) != DT_FEMPTY) {
 		dma_rmb();
 		skb = rswitch_rx_handle_desc(ndev, gq, desc);
@@ -1284,7 +1288,12 @@ static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
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


