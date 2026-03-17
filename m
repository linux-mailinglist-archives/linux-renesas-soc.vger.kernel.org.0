Return-Path: <linux-renesas-soc+bounces-29572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIR7E9EiuWkrrwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:45:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F92A71FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0F4C30B9FB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F40539E6FD;
	Tue, 17 Mar 2026 09:42:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0033A257B;
	Tue, 17 Mar 2026 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740542; cv=none; b=em0gAy61m2v4sLkW7E/CJtLNRK/L+7mIedYYv58V35KKO68tdWCY0hGDpgzNp5s8lgv5OoskIKBTIqIP2TNALtfKO0uRgI3Z+21KdhpaRMz7a3nE19ACjczKnLV5yIeGkPIWJOKEfaGE3lyl3ebafTXkgkRnypN6xoiVLgXjehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740542; c=relaxed/simple;
	bh=uaOzubV6lX5PuPIXhNg1QdvFlsthNSX4pUWq9WpfST8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0e7+46AUSLnzcAfPG/zVhTxA7d4GriowXwDpYXRnNivBbclk6NH+OxysS0wOyBMdFp6GWCszGr4gHpJ5E0PdKPd8DH8+mucKx72baJD+QM+0b1VNkv9WvOaMbspetTAwhrG5cpulPTJK0NApeiLhlbwViPyjDpPLV6FpvVg7jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: BiaSvzRMR0azA6MQmx14wg==
X-CSE-MsgGUID: 6O7hJI4eTE6r5+r5gFZ/SQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Mar 2026 18:42:20 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AC5724016D6A;
	Tue, 17 Mar 2026 18:42:17 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 17 Mar 2026 10:41:59 +0100
Subject: [PATCH net-next 06/13] net: renesas: rswitch: add forwarding rules
 for gwca
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rswitch_add_vlans-v1-6-3a57bfa0f2d1@renesas.com>
References: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
In-Reply-To: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773740518; l=1726;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=uaOzubV6lX5PuPIXhNg1QdvFlsthNSX4pUWq9WpfST8=;
 b=JECrVpLlbdHqnll3A+o4IaUH3ZFVXPQ2fQAOmg5UDxizQmUiEtSE2pWmgKX2Jmhj/Zr18CYrw
 ZIMvHgA4rFQB9yYLN4ryDFOFZ+P84ADZX81w/r6pZuskEjvXfseV3r1
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
	TAGGED_FROM(0.00)[bounces-29572-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.613];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: C68F92A71FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add rules to forward packets from the Ethernet ports to the CPU port (GWCA)
using L2 forwarding instead of port forwarding.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 709524c8a5c4..21165ec56ce8 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -93,10 +93,36 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 	}
 }
 
+static void rswitch_update_l2_hw_forwarding_gwca(struct rswitch_private *priv)
+{
+	struct rswitch_device *rdev;
+
+	if (priv->offload_brdev) {
+		rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
+			       0, FWPC0_MACSSA | FWPC0_MACDSA | FWPC0_MACRUDA);
+
+		rswitch_for_all_ports(priv, rdev) {
+			rswitch_modify(priv->addr, FWPC2(rdev->etha->index),
+				       FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA)),
+				       0);
+		}
+	} else {
+		rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
+			       FWPC0_MACSSA | FWPC0_MACDSA | FWPC0_MACRUDA,
+			       0);
+		rswitch_for_all_ports(priv, rdev) {
+			rswitch_modify(priv->addr, FWPC2(rdev->etha->index),
+				       0,
+				       FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA)));
+		}
+	}
+}
+
 void rswitch_update_l2_offload(struct rswitch_private *priv)
 {
 	rswitch_update_l2_hw_learning(priv);
 	rswitch_update_l2_hw_forwarding(priv);
+	rswitch_update_l2_hw_forwarding_gwca(priv);
 }
 
 static void rswitch_update_offload_brdev(struct rswitch_private *priv)

-- 
2.43.0


