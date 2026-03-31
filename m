Return-Path: <linux-renesas-soc+bounces-30639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGqrBWiey2loJgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:14:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 545DB367B2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6178930A617E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86ED43783A2;
	Tue, 31 Mar 2026 10:04:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBF03F1662;
	Tue, 31 Mar 2026 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951470; cv=none; b=eAXea/yjUVBPauhO6/3ll80xdvdLyfPzpyw2PBY945GVPesXncY5wuutj9Fa5KRd3WTLu89wmava2UwdEG596i0QdSho3sEwqh37w778wd/tOSodhR7voaOgFd12Phi06AZDV2tTcVLD8uKVB5ShM4bOsCvWEIn1ABi1GvYPGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951470; c=relaxed/simple;
	bh=iNxe+78/8LfJp0QgyF9JQQuVKOLxeDUsKgyPSJLqbQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBZlutz5LUS7ALLj4J7qFAYGM8ytLHHAdkRNcHMxRJS/csQ6A5dQCqN3S/T2MVLujCF5Nl8N2yDkVzBDrF1XlE+txezfrZqFqrz+oEVsRFl02i949Qj7+RMZ5ThXqpVQ5fZidofFX6fxTKu2AQzsXbU9RS3gRhi8XhTtODd5Wsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Do6nEv58T+W3Y6r9x4SA1g==
X-CSE-MsgGUID: 3U9RsP6pT4+jIyxhm2dm6w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Mar 2026 19:04:27 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BAFD4416C39F;
	Tue, 31 Mar 2026 19:04:24 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 31 Mar 2026 12:04:00 +0200
Subject: [PATCH net-next v3 06/13] net: renesas: rswitch: add forwarding
 rules for gwca
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rswitch_add_vlans-v3-6-c37f41b1c556@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774951442; l=1614;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=iNxe+78/8LfJp0QgyF9JQQuVKOLxeDUsKgyPSJLqbQ0=;
 b=Cy0fN8GLSdKuAI8N3y0cz88KRZaFVlthY+KiH4LruqgwEE/aGeMO4dvM+PakWe41UpGd0Xjua
 wKXW+t3xYkkC0N1+TCihUXz+2TwMHYEpFeaGvqxpoYVAgm2uBFmPWd6
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
	TAGGED_FROM(0.00)[bounces-30639-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 545DB367B2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add rules to forward packets from the Ethernet ports to the CPU port (GWCA)
using L2 forwarding instead of port forwarding.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 709524c8a5c4..cabf1f92ad0c 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -93,10 +93,32 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 	}
 }
 
+static void rswitch_update_l2_hw_forwarding_gwca(struct rswitch_private *priv)
+{
+	struct rswitch_device *rdev;
+	u32 fwpc0_set, fwpc0_clr, fwpc2_set, fwpc2_clr;
+
+	fwpc0_clr = FWPC0_MACSSA | FWPC0_MACDSA | FWPC0_MACRUDA;
+	fwpc0_set = fwpc0_clr;
+	fwpc2_clr = FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA));
+	fwpc2_set = fwpc2_clr;
+
+	(priv->offload_brdev) ? (fwpc0_clr = 0, fwpc2_set = 0)
+			      : (fwpc0_set = 0, fwpc2_set = 0);
+
+	rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA), fwpc0_clr, fwpc0_set);
+
+	rswitch_for_all_ports(priv, rdev) {
+		rswitch_modify(priv->addr, FWPC2(rdev->etha->index),
+			       fwpc2_clr, fwpc2_set);
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


