Return-Path: <linux-renesas-soc+bounces-29568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPKPCwsiuWkrrwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:42:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A94CC2A70B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1A5C30382BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270A539F16E;
	Tue, 17 Mar 2026 09:42:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D715378D89;
	Tue, 17 Mar 2026 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740535; cv=none; b=h6JLtUKTdBkGed5KH+SdsUc8owLk6TiUAVFNA6kqRF0remRLys3jbbn0+lMj7s6sIb/WDHRHdTnGauS2DGG6zO8cjr8YP5Ie55AEhIdyMfo9mURdpio+1F8YIS7RtmYcz05A5X+OSaAtW2djngy7nrv2eaNroPWTM4v9/g4UZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740535; c=relaxed/simple;
	bh=aqwo6YDRLA2mVz94WYaEU1NWDqPecZfQ0fOXF3ovnY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p3gh4h+Px0ZYWmXxA2OaulTNPuS8/MjvW+ZQOCxvf4v12Wb5I/t8oRieW9EwHJMqP2ovNoMemZ7tYrv8oFIl/eVHYKq4sBXjpLP8WONKjaHHvrpCJW68xJG5EyeFdUDeUszoC4jW8gM/Egp2EJHmJt3sp+FJnO4k0I1mu5vzGmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: AaYzSEM4Sh2TMumCrcnurA==
X-CSE-MsgGUID: BpPtnz9zSpefIlrUb67l3A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Mar 2026 18:42:04 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 557484016D6A;
	Tue, 17 Mar 2026 18:42:02 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 17 Mar 2026 10:41:54 +0100
Subject: [PATCH net-next 01/13] net: renesas: rswitch: improve port change
 mode functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rswitch_add_vlans-v1-1-3a57bfa0f2d1@renesas.com>
References: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
In-Reply-To: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773740518; l=3529;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=aqwo6YDRLA2mVz94WYaEU1NWDqPecZfQ0fOXF3ovnY0=;
 b=8nreXECy8+Cjtg0k27Zya8vFp5z52h/Ea5Iior2Zeehln1w1JYj4ed7gdQNno3cpSVauvlFB/
 Zgm4rrP+H+dDvjnhWsv/JK+Pz6Xtmeslscl9Bw+UY7RIa9dV3JIehJH
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29568-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.594];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A94CC2A70B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For ETHA and GWCA ports every mode change from operational to
configuration and vice-versa requires to change the mode to
"disable" first. This was done by calling the function twice.
Let the change_mode functione take care of this requiered step
in a single call.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 39 +++++++++++++----------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 6fe964816322..f6d1e610e7fa 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -176,14 +176,19 @@ static int rswitch_gwca_change_mode(struct rswitch_private *priv,
 	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
 		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
 
-	iowrite32(mode, priv->addr + GWMC);
+	iowrite32(GWMC_OPC_DISABLE, priv->addr + GWMC);
 
-	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, mode);
+	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, GWMC_OPC_DISABLE);
 
-	if (mode == GWMC_OPC_DISABLE)
+	if (mode == GWMC_OPC_DISABLE) {
 		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 0);
 
-	return ret;
+		return ret;
+	}
+
+	iowrite32(mode, priv->addr + GWMC);
+
+	return rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, mode);
 }
 
 static int rswitch_gwca_mcast_table_reset(struct rswitch_private *priv)
@@ -682,9 +687,6 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 	unsigned int i;
 	int err;
 
-	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	err = rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
 	if (err < 0)
 		return err;
@@ -717,9 +719,6 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 			return err;
 	}
 
-	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
 }
 
@@ -727,9 +726,6 @@ static int rswitch_gwca_hw_deinit(struct rswitch_private *priv)
 {
 	int err;
 
-	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	err = rswitch_gwca_change_mode(priv, GWMC_OPC_RESET);
 	if (err < 0)
 		return err;
@@ -1116,14 +1112,18 @@ static int rswitch_etha_change_mode(struct rswitch_etha *etha,
 	if (!rswitch_agent_clock_is_enabled(etha->coma_addr, etha->index))
 		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 1);
 
-	iowrite32(mode, etha->addr + EAMC);
-
-	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, mode);
+	iowrite32(EAMC_OPC_DISABLE, etha->addr + EAMC);
+	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, EAMC_OPC_DISABLE);
 
-	if (mode == EAMC_OPC_DISABLE)
+	if (mode == EAMC_OPC_DISABLE) {
 		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 0);
 
-	return ret;
+		return ret;
+	}
+
+	iowrite32(mode, etha->addr + EAMC);
+
+	return rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, mode);
 }
 
 static void rswitch_etha_read_mac_address(struct rswitch_etha *etha)
@@ -1203,9 +1203,6 @@ static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
 {
 	int err;
 
-	err = rswitch_etha_change_mode(etha, EAMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	err = rswitch_etha_change_mode(etha, EAMC_OPC_CONFIG);
 	if (err < 0)
 		return err;

-- 
2.43.0


