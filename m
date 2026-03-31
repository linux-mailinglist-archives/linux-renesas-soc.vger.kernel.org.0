Return-Path: <linux-renesas-soc+bounces-30641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNsTOwSdy2loJgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:08:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 951CE367991
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5955E3007532
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D333ED12C;
	Tue, 31 Mar 2026 10:04:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1903A3E8C78;
	Tue, 31 Mar 2026 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951476; cv=none; b=RiYr6H/CYCeIEa+97Ar83x74OANUbQi8UaxOJL1KuNtCmRv3DEzBciQLq59o+M0kB4wnn2nMT66xsGKqep+n/32qp5ijVMDvF+2Rq1ZIMWtukfBPjF5XKK5pDRMJ99elok9Ef/EmkRb7bSKT40WUA97FpbdDPwfhtonwM8oQrVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951476; c=relaxed/simple;
	bh=td1I14EXlazWrIEBK/atTJgs/cbblMkCLk3f/CFOynk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHVqrQo++UI7Rc5NtjLgHcnu6t/ULe0pPTZfgSE5EnxPdDu7o62S2SLjH6bkQDSS9GnFRq/1R+lfdTYfr57lgmduW46oCIksh1hSCuJkgU3V+Kl2Mjh90RSTsABOTrM8BjS32/YDIjbDYVECWGZx24430Ny+MuYjEjQRe34mmB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: e/4C8ROoRoi0I6n0PX1TcA==
X-CSE-MsgGUID: 1Tc/wNM8Tj25pqqiKLwLkA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Mar 2026 19:04:34 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D2D98416C823;
	Tue, 31 Mar 2026 19:04:31 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 31 Mar 2026 12:04:02 +0200
Subject: [PATCH net-next v3 08/13] net: renesas: rswitch: add basic vlan
 init to rswitch_fwd_init
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rswitch_add_vlans-v3-8-c37f41b1c556@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774951442; l=1893;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=td1I14EXlazWrIEBK/atTJgs/cbblMkCLk3f/CFOynk=;
 b=nh4FdZ9jgMtwPt+TAvBS6IVHnwktccVQazoJlBjnw9+3Mo8KaUjM+TRxBoEcVm1XfVJEdcxL6
 dqxdB+URCDLALNecvl7aEptNyHK+2dCS8kZJDM4kK3j8Fmw6AXVWx9W
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
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
	TAGGED_FROM(0.00)[bounces-30641-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.959];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 951CE367991
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add basic vlan related register initialization.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 99c9bef14ca5..160b70997924 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -120,6 +120,7 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 	u32 all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
 	unsigned int i;
 	u32 reg_val;
+	int ret;
 
 	/* Start with empty configuration */
 	for (i = 0; i < RSWITCH_NUM_AGENTS; i++) {
@@ -154,17 +155,27 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 	}
 
 	/* For GWCA port, allow direct descriptor forwarding */
-	rswitch_modify(priv->addr, FWPC1(priv->gwca.index), FWPC1_DDE, FWPC1_DDE);
+	rswitch_modify(priv->addr, FWPC1(priv->gwca.index), 0, FWPC1_DDE);
 
 	/* Initialize hardware L2 forwarding table */
 
-	/* Allow entire table to be used for "unsecure" entries */
+	/* Allow entire table to be used for "un-secure" entries */
 	rswitch_modify(priv->addr, FWMACHEC, 0, FWMACHEC_MACHMUE_MASK);
 
 	/* Initialize MAC hash table */
 	iowrite32(FWMACTIM_MACTIOG, priv->addr + FWMACTIM);
 
-	return rswitch_reg_wait(priv->addr, FWMACTIM, FWMACTIM_MACTIOG, 0);
+	ret = rswitch_reg_wait(priv->addr, FWMACTIM, FWMACTIM_MACTIOG, 0);
+	if (ret)
+		return ret;
+
+	/* Allow entire VLAN table to be used for "un-secure" entries */
+	iowrite32(VLANTMUE, priv->addr + FWVLANTEC);
+
+	/* Initialize VLAN table */
+	iowrite32(VLANTIOG, priv->addr + FWVLANTIM);
+
+	return rswitch_reg_wait(priv->addr, FWVLANTIM, VLANTIOG, 0);
 }
 
 /* Gateway CPU agent block (GWCA) */

-- 
2.43.0


