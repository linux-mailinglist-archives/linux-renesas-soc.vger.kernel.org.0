Return-Path: <linux-renesas-soc+bounces-29570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDy6KZMiuWkrrwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:44:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 919882A71A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87838303E1EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810573A0B2D;
	Tue, 17 Mar 2026 09:42:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33B239E6CB;
	Tue, 17 Mar 2026 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740538; cv=none; b=Kn3csKnKA0tbFD3fGqQxMtLtSoBbfkT6AmVXQLLdpfAS8SJvdotSaw53dtcbu6pqZr2ZFGKMsBxMzPraXBypL41eMgfDtfAGaEqoPeQkI3g4/o0jpTAZnG0d+yLI+poEwtb+PGrXOliPEVykq2a71AO28c1Gb8NTJCQLjzcKDpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740538; c=relaxed/simple;
	bh=qOJp9NLB9+UtI5DU5azk15Hf+Q/qHTqK5aYPyRrfBfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ocWkkTtAQ2/zzo3swamu1qW8LT7mBbvgWrrkC9WQeyyyPyxjtbPXfQLJaSiCPp4hzF7prSPSSFN5H573g8l7jaOFr+1graRp/5uqJNd7xZRDj2mWodIAOJxRrgPCpHagyWHTF17rgzy74Sloa4mx0YfSHOgM93bzlsdJSR9cmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: XZ0pU5lOQo+COdt66mkQ9g==
X-CSE-MsgGUID: uPn7UzoYTnuW5VoUBH8Rjw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Mar 2026 18:42:11 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 796AE4016D6A;
	Tue, 17 Mar 2026 18:42:08 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 17 Mar 2026 10:41:56 +0100
Subject: [PATCH net-next 03/13] net: renesas: rswitch: fix FWPC2 register
 access macros
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rswitch_add_vlans-v1-3-3a57bfa0f2d1@renesas.com>
References: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
In-Reply-To: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773740518; l=2272;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=qOJp9NLB9+UtI5DU5azk15Hf+Q/qHTqK5aYPyRrfBfY=;
 b=mpsgcYeW/QZEEfI4IR/P9wQRZcJ/vONj3jrEkfpAFg2LrLi+Az9M52SGOHQDj0Y9wCtsJHgfE
 Rdv/FTi5YvWDaLtYBbk0B6M3cUVK2KXNOOP7ibo5GcihoM4aJYhW1Sr
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29570-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.610];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 919882A71A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index f10e188bc0bd..d404bc41bd1e 100644
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


