Return-Path: <linux-renesas-soc+bounces-29575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOMRET0juWkrrwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:47:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B47F2A7295
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F274030F84BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4D13A1E69;
	Tue, 17 Mar 2026 09:42:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AB93A1A27;
	Tue, 17 Mar 2026 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740551; cv=none; b=hl4VTDIew8VifCpYk0UJdRGdAjWOw1XLyRVpS4BAZN+K7rsjJRNUwnlABNwMwvekXWsLn+x3zm75VuVXUCizLHjg7I2lnVk5ohPH8qUww4mEGOCflFZWj9NvZHUGvdNRicMwvSvm7dbXk3sBIVig6HKdQHKJRZ2Hw/9Sn4ioG/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740551; c=relaxed/simple;
	bh=be72gMXAAPLEEl16TU8jP7s7AtiEA7bNqEE8ajTJQZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ka9MEhB9h3b+1pbSq2bQwgi7cekqlTASg0B5XUT8OGWK2HU0pC5vAHuCMsk5NOyY0BUufTBo1DKbci/jH/Z3eZ9731anduHEZEukLvXeG9D6b81+3rLKrncQdY3X1f6rqdNOo000kawBnrilZiOKGEEGHChMVnjMyJ8De91GhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: NqW9jM4wTO2k/mh0Lsor1w==
X-CSE-MsgGUID: 4NzH5/3OQkusjAwQ0XIglA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Mar 2026 18:42:26 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CBF294016D6A;
	Tue, 17 Mar 2026 18:42:23 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 17 Mar 2026 10:42:01 +0100
Subject: [PATCH net-next 08/13] net: renesas: rswitch: add basic vlan init
 to rswitch_fwd_init
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rswitch_add_vlans-v1-8-3a57bfa0f2d1@renesas.com>
References: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
In-Reply-To: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773740518; l=1893;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=be72gMXAAPLEEl16TU8jP7s7AtiEA7bNqEE8ajTJQZE=;
 b=MFjCirNrzHzQGbQctEGilbGxiRxemWdC25iOKwCQErwGI4bl+rHtAc0JXQYxkjexcZzXvO1C6
 20WvfmNk2oDC/5KDp6mQQuNBnW076f1Pj9r0YUwhzEEcSLANFs1i+BT
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
	TAGGED_FROM(0.00)[bounces-29575-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.601];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 9B47F2A7295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add basic vlan related register initialization.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index b16f7aca4a69..ac87175b918e 100644
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


