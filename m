Return-Path: <linux-renesas-soc+bounces-32356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLqJBDmcAWqDgAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:07:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85650A97E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E540307E281
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0EA3C4567;
	Mon, 11 May 2026 08:57:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061E63C3C0B;
	Mon, 11 May 2026 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489862; cv=none; b=mETPf9t54Ui6MbOYphi6z1lyn6eny7lb74DJ4pzMfxk4a9zexnDPSqM59Fy+UTv6z51IwoHwGSen58MmbkHhGmfunkKgG0rpAiEW5O7vtcyBLMtI2f1e2n4KL0lNvgqsvuIwjIGIYfukV7H0sxZmzEBCwnIriMXoZxFKr+T/oMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489862; c=relaxed/simple;
	bh=3lkr+RE11y4eF24FLC88bvRLrDKItySrEf6pwuvS2n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YOczF4JzUc/bLSqCW7XvOMTXPmBraMlcMN6fcNr9BUoFj0/MJ1Im4HeG9/pXXyBvaJbYEGPpu6nRMILTzLbZc0tAxvQDxUIXaISxHhBm+vURLMlVWDB62wdSZz0zFl4NTp2UHs/395NRRX+TDl95BTLpL8mv8huyAgpq+vx/6C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: MF6PMOYrRAOmIzw67suatg==
X-CSE-MsgGUID: LkMrMzCLQzyqFxj/zmNqFg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 May 2026 17:52:31 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9AA1C4009A31;
	Mon, 11 May 2026 17:52:28 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Mon, 11 May 2026 10:52:04 +0200
Subject: [PATCH net-next v4 01/13] net: renesas: rswitch: improve port
 change mode functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rswitch_add_vlans-v4-1-a5a225f8faae@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489544; l=3593;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=3lkr+RE11y4eF24FLC88bvRLrDKItySrEf6pwuvS2n8=;
 b=vsTl+CtPIXCaSOxiE8LfnywK/aJMXln7+/W4itStZchqG/ihgu2vdMlzOd0WbO/HC2vJC5wlZ
 mRZ/nSaM/BgBszhLJtTx9mpLxGMFkqCZmXNpUg9b+snyyMYJXr8kSHW
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Rspamd-Queue-Id: BB85650A97E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32356-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

For ETHA and GWCA ports every mode change from operational to
configuration and vice-versa requires to change the mode to
"disable" first. This was done by calling the function twice.
Let the change_mode functione take care of this requiered step
in a single call.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 43 +++++++++++++++--------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 6fe964816322..9b739594cc02 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -176,14 +176,21 @@ static int rswitch_gwca_change_mode(struct rswitch_private *priv,
 	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
 		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
 
-	iowrite32(mode, priv->addr + GWMC);
+	iowrite32(GWMC_OPC_DISABLE, priv->addr + GWMC);
 
-	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, mode);
+	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, GWMC_OPC_DISABLE);
+	if (ret < 0)
+		return ret;
 
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
@@ -682,9 +689,6 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 	unsigned int i;
 	int err;
 
-	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	err = rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
 	if (err < 0)
 		return err;
@@ -717,9 +721,6 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 			return err;
 	}
 
-	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
 }
 
@@ -727,9 +728,6 @@ static int rswitch_gwca_hw_deinit(struct rswitch_private *priv)
 {
 	int err;
 
-	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	err = rswitch_gwca_change_mode(priv, GWMC_OPC_RESET);
 	if (err < 0)
 		return err;
@@ -1116,14 +1114,20 @@ static int rswitch_etha_change_mode(struct rswitch_etha *etha,
 	if (!rswitch_agent_clock_is_enabled(etha->coma_addr, etha->index))
 		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 1);
 
-	iowrite32(mode, etha->addr + EAMC);
-
-	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, mode);
+	iowrite32(EAMC_OPC_DISABLE, etha->addr + EAMC);
+	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, EAMC_OPC_DISABLE);
+	if (ret < 0)
+		return ret;
 
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
@@ -1203,9 +1207,6 @@ static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
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


