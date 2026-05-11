Return-Path: <linux-renesas-soc+bounces-32355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGfmNGecAWqTgQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:07:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E5F50A9A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A131303AAA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05FA3C4554;
	Mon, 11 May 2026 08:57:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148543C3C12;
	Mon, 11 May 2026 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489862; cv=none; b=mlbjZsN8GAyVQjAggTZIOQwM30Hj4dqbkaWMB1YrQzRAMX8NAbggpNRZvNlkT6QzNHa0TmY8oiXSzQnVL2cs6SKBbcHbhTFu2I/8QUPBSm5M6TEEbp1+ubo7gQiwaO7MiZ4XkbwPSV97WPzKTYHOkUR0pVXAXD44fRWKqiM8mSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489862; c=relaxed/simple;
	bh=KjtGe1BQGxipfuBuOYFRkxY7t6hscTJYReI9p1EyeTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I4UXNYRTp2jR14Ehe29WJ0aX5IrzC8GhlSSaqo+mmS/XgH6ZchgbU9qiY5igkHGU9o6WgCUZ5l7U2ctDVkxjsvF5ZVl4/jawww9o5inaqwNkNgKWeSMlso8disLatH+2u0LvdRoxrTfmfpxuvaco7tkYk5G6In3BGilCMQE2G/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Gzr1SZuHQwCFh2L9ldp1Ug==
X-CSE-MsgGUID: goS03OfaQiygx023Yb7gCA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 May 2026 17:52:38 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B56734010DEB;
	Mon, 11 May 2026 17:52:35 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Mon, 11 May 2026 10:52:06 +0200
Subject: [PATCH net-next v4 03/13] net: renesas: rswitch: fix FWPC2
 register access macros
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rswitch_add_vlans-v4-3-a5a225f8faae@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489544; l=2272;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=KjtGe1BQGxipfuBuOYFRkxY7t6hscTJYReI9p1EyeTo=;
 b=oUxrm9hLrj2ijwUf308C2le5VQzOE/42ZTzau/IdEfTkoNz2BZGwofYTkg/z/GHm3YrGsoOIk
 Fbbip/jmT82A9nwi04BZDe8O89UJYXio0VClixA/U6vp95qQ5F7Ob0Y
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Rspamd-Queue-Id: 33E5F50A9A5
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32355-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.987];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Fix typo in macro name and remove duplicate macro definition.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      | 3 +--
 drivers/net/ethernet/renesas/rswitch_l2.c   | 2 +-
 drivers/net/ethernet/renesas/rswitch_main.c | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index aa605304fed0..340524d995ac 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -826,8 +826,7 @@ enum rswitch_gwca_mode {
 #define FWPC1_DDE		BIT(0)
 
 #define FWPC2(i)		(FWPC20 + (i) * 0x10)
-#define FWCP2_LTWFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
-#define FWCP2_LTWFW_MASK	GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
+#define FWPC2_LTWFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
 
 #define FWPBFC(i)		(FWPBFC0 + (i) * 0x10)
 #define FWPBFC_PBDV		GENMASK(RSWITCH_NUM_AGENTS - 1, 0)
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 9433cd8adced..709524c8a5c4 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -82,7 +82,7 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 			 *
 			 * Do not allow L2 forwarding to self for hw port.
 			 */
-			iowrite32(FIELD_PREP(FWCP2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
+			iowrite32(FIELD_PREP(FWPC2_LTWFW, fwd_mask | BIT(rdev->port)),
 				  priv->addr + FWPC2(rdev->port));
 		}
 
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 3a2bc14e5bd7..e05c42db5f4c 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -129,7 +129,7 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 		iowrite32(FIELD_PREP(FWCP1_LTHFW, all_ports_mask),
 			  priv->addr + FWPC1(i));
 		/* Disallow L2 forwarding */
-		iowrite32(FIELD_PREP(FWCP2_LTWFW, all_ports_mask),
+		iowrite32(FIELD_PREP(FWPC2_LTWFW, all_ports_mask),
 			  priv->addr + FWPC2(i));
 		/* Disallow port based forwarding */
 		iowrite32(0, priv->addr + FWPBFC(i));

-- 
2.43.0


