Return-Path: <linux-renesas-soc+bounces-28006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P6HC/HxhWk+IgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 14:51:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B69FE710
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 14:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E55153066DE7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 13:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E073E95BB;
	Fri,  6 Feb 2026 13:42:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C4D36CE1D;
	Fri,  6 Feb 2026 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385330; cv=none; b=GP0BjHtdUYvd1jNTIkc8+kn6vlGj1Ki4lFonL6Ga2OXEjkOxSm5h4UriVdUeEhiHOdUVQ3VEta+HWhOl577vX5sI0+yTGg5dL2mSa2QkpSvGZUG7WTLSecGJn9JWEpUzyzoaw4Rqa7yoPPzPIw3fg1kysLBhPYjjLeZ4I20hcE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385330; c=relaxed/simple;
	bh=eNbsApCM+5XJGh5iPWbagu4kXGlHMFEM9VQCVUWUaD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CQBebVtT1K5TXkgVi8uQ5ULt22u37Udj44ARdS4G3y3SH8VHPYOd5Y0wsGKz6eUPu8VxA8NOmHmr0Ax2nuvDZadXddwtcS6ISrTih0ObOXhZr64S82s9swQJCBE77a5/NiiIS578s267uCcszm1RIzQlRft6CTJQ7zhfMz/CM4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: UJUHiFlCRAWyRn7hKqi14Q==
X-CSE-MsgGUID: R8dJq83cTz+Oq/j/s6TwtQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Feb 2026 22:42:02 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AB75E4017D86;
	Fri,  6 Feb 2026 22:41:59 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 06 Feb 2026 14:41:53 +0100
Subject: [PATCH net v3] net: renesas: rswitch: fix forwarding offload
 statemachine
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-fix-offloading-statemachine-v3-1-07bfba07d03e@renesas.com>
X-B4-Tracking: v=1; b=H4sIAKDvhWkC/5XNQQrCMBCF4auUrI1M0jaIK+8hLsZk0g7YRJISl
 NK7m3bnTpf/Y/hmEZkSUxbnZhGJCmeOoUZ7aIQdMQwk2dUWGrQBDb30/JLR+0dEx2GQecaZJrQ
 jB5LKtaBMCwgnJ6rwTFTPd/16qz1ynmN678+K2tbf3KKkkqYDrTvsW+XgkihQxny0cRKbXPQfm
 q6aR289WEN35b61dV0/zLbn3xYBAAA=
X-Change-ID: 20260205-fix-offloading-statemachine-1d301630a08d
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770385319; l=3055;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=eNbsApCM+5XJGh5iPWbagu4kXGlHMFEM9VQCVUWUaD4=;
 b=wuaLrGv/KMfjOQsp1y67ylhFb3LVZ31UDqDcEAXIzcq9IIEqssSDFwAf4Ka3iDX2ZGkwWPa+z
 qtTQTSuIPZQACFacqESUrYC7ESj4fLKbw2YoF7ikjEa3inYybbxGBqO
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28006-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.276];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 55B69FE710
X-Rspamd-Action: no action

A change of the port state of one port, caused the state of another
port to change. This behvior was unintended.

Fixes: b7502b1043de ("net: renesas: rswitch: add offloading for L2 switching")

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
A change of the port state of one port, caused the state of another
port to change. This behvior was unintended.

Changes in v3:
- Fix cover letter.
- Link to v2: https://lore.kernel.org/r/20260205-fix-offloading-statemachine-v2-1-fafcf0c6eb1d@renesas.com

Changes in v2:
- Implemented suggested improvements to the function.
- Addded missing condition to an if statement.
- introduced bool variable, to reduce the the logic in the if
  statements.
- Link to v1: https://lore.kernel.org/r/20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com
---

---
 drivers/net/ethernet/renesas/rswitch_l2.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 4a69ec77d69c..9433cd8adced 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Renesas Ethernet Switch device driver
  *
- * Copyright (C) 2025 Renesas Electronics Corporation
+ * Copyright (C) 2025 - 2026 Renesas Electronics Corporation
  */
 
 #include <linux/err.h>
@@ -60,6 +60,7 @@ static void rswitch_update_l2_hw_learning(struct rswitch_private *priv)
 static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 {
 	struct rswitch_device *rdev;
+	bool new_forwarding_offload;
 	unsigned int fwd_mask;
 
 	/* calculate fwd_mask with zeroes in bits corresponding to ports that
@@ -73,8 +74,9 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 	}
 
 	rswitch_for_all_ports(priv, rdev) {
-		if ((rdev_for_l2_offload(rdev) && rdev->forwarding_requested) ||
-		    rdev->forwarding_offloaded) {
+		new_forwarding_offload = (rdev_for_l2_offload(rdev) && rdev->forwarding_requested);
+
+		if (new_forwarding_offload || rdev->forwarding_offloaded) {
 			/* Update allowed offload destinations even for ports
 			 * with L2 offload enabled earlier.
 			 *
@@ -84,13 +86,10 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 				  priv->addr + FWPC2(rdev->port));
 		}
 
-		if (rdev_for_l2_offload(rdev) &&
-		    rdev->forwarding_requested &&
-		    !rdev->forwarding_offloaded) {
+		if (new_forwarding_offload && !rdev->forwarding_offloaded)
 			rswitch_change_l2_hw_offloading(rdev, true, false);
-		} else if (rdev->forwarding_offloaded) {
+		else if (!new_forwarding_offload && rdev->forwarding_offloaded)
 			rswitch_change_l2_hw_offloading(rdev, false, false);
-		}
 	}
 }
 

---
base-commit: f14faaf3a1fb3b9e4cf2e56269711fb85fba9458
change-id: 20260205-fix-offloading-statemachine-1d301630a08d

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


