Return-Path: <linux-renesas-soc+bounces-30408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAJJAec/xmm7HgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:29:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E4771340F8E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 791493077161
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DBC3D75D2;
	Fri, 27 Mar 2026 08:28:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD0A3D567E;
	Fri, 27 Mar 2026 08:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600085; cv=none; b=IF2uuGg/DqsZm7bLNoj3fO90jpVWYMjMb0WjhkCW8vRQhJA/RZHXcGv2KCfcBg7y5OE6S5VNwytL+uk54cHqeT7uHx+CpJ+5eYhzHrfui6tchPa1RqoB05h5mQx0ovIaqmYUdO/HOR4btr+RJiJnzaDAx1MjKcijCgtnK4PJi70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600085; c=relaxed/simple;
	bh=qOJp9NLB9+UtI5DU5azk15Hf+Q/qHTqK5aYPyRrfBfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BvqPihtblLyvjhl39oeO1j/N8J94bR7PayRAmGvmocjdOx425axecjN/xtDFX2ho9MogI4IhS3weJQnZfWGXdgAW2ncc5m5y2skJrCzZWV9roBhQr6i2wVfYUvzPGfafrJqxAz5r7whZuKIK0/NC68Viu8QjhuisJn2Oo5PxAIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: AFSuGeolQzKfydotGsVmtQ==
X-CSE-MsgGUID: 1hSlWY5bQ2WHl/PqBhwUxA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Mar 2026 17:27:55 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 741C0401226C;
	Fri, 27 Mar 2026 17:27:52 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 27 Mar 2026 09:27:33 +0100
Subject: [PATCH net-next v2 03/13] net: renesas: rswitch: fix FWPC2
 register access macros
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rswitch_add_vlans-v2-3-d7f4358ca57a@renesas.com>
References: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
In-Reply-To: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774600062; l=2272;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=qOJp9NLB9+UtI5DU5azk15Hf+Q/qHTqK5aYPyRrfBfY=;
 b=BSGRHwgqDwMcBi9EKP75oWlH3e4xLBPrbb85ssn8gQkuqB/ugb9NV8aD7hzx+wc4sK1wdR26F
 k+q/STZfFFfCiUfPoyuLpQznHKRmZPWcguE2+B6JDC2bXZVupKHN5yJ
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
	TAGGED_FROM(0.00)[bounces-30408-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: E4771340F8E
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


