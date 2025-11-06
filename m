Return-Path: <linux-renesas-soc+bounces-24216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DCBC3B1AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C8C36506A80
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0313B3446A4;
	Thu,  6 Nov 2025 12:56:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0DD344049;
	Thu,  6 Nov 2025 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433780; cv=none; b=Jtzg3DpycWCrKbqw5e0pxKHzaH7LCd0k9+tBmAa9zWp4d+pF887kHgRpIi95emF2QdPELhsmTDNl6pt+D1PtGpNt+yCXzN3CDztJsxpr7UMPILv25ezOnlrmVZj9obaBBSYZMap9LbJHPHnRHfZ5Jpf0muR5OTAw6HhrZV4s4c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433780; c=relaxed/simple;
	bh=5pX66yzxcWs6wrzEB7mDEiE4YBJ9HaSHwf4zg7C1iFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ON9sgbarE/Q0LTsQptfDj9/hvWap9kgnXWzKmmQOgZrIKm+vAiJOcyLitGW29ZMJi7zWj8a2cJB1crZMJdECqNaxj+J9Uucnj3bOYMu6m1jW9rzbxKkM+ZMPyciFimZP8OMhVr9GnFjc5xUVKcgrjF4jYHQ7HlfYEnajBfWfZ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 0NNYNHY2R+Wx4z69UaB4hA==
X-CSE-MsgGUID: SWvDhVleQ22nb4pqxp/7TQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2025 21:56:16 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 37FF94006DE3;
	Thu,  6 Nov 2025 21:56:10 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 06 Nov 2025 13:55:30 +0100
Subject: [PATCH net-next 06/10] net: renesas: rswitch: add MAC address
 filtering
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-add_l3_routing-v1-6-dcbb8368ca54@renesas.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
In-Reply-To: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=2518;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=5pX66yzxcWs6wrzEB7mDEiE4YBJ9HaSHwf4zg7C1iFI=;
 b=Go80DP/cl/m5WR5xiIuatZGhniDv0uycIhMnBeAjd53STSp90iNKIQBcRNL9yuu6meZS0948E
 DSxwQR3MQCNCw0sYY0Clrrv92kQvPA7hKpz0LM50UT0BzGOfQtxFym4
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

Enable MAC address filtering in Rswitch HW.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      | 23 +++++++++++++++++++++++
 drivers/net/ethernet/renesas/rswitch_main.c |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index a65ba10ae435..ac32091b7991 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -767,6 +767,29 @@ enum link_speed_conf {
 
 #define MLVC_PLV		BIT(16)
 
+#define	MRAFC_MSRAREP		BIT(26)
+#define	MRAFC_NSAREP		BIT(25)
+#define	MRAFC_SDSFREP		BIT(24)
+#define	MRAFC_NDAREP		BIT(23)
+#define	MRAFC_BCACP		BIT(22)
+#define	MRAFC_MCACP		BIT(21)
+#define	MRAFC_BSTENP		BIT(20)
+#define	MRAFC_MSTENP		BIT(19)
+#define	MRAFC_BCENP		BIT(18)
+#define	MRAFC_MCENP		BIT(17)
+#define	MRAFC_UCENP		BIT(16)
+#define	MRAFC_MSAREE		BIT(10)
+#define	MRAFC_NSAREE		BIT(9)
+#define	MRAFC_SDSFREE		BIT(8)
+#define	MRAFC_NDAREE		BIT(7)
+#define	MRAFC_BCADE		BIT(6)
+#define	MRAFC_MCADE		BIT(5)
+#define	MRAFC_BSTENE		BIT(4)
+#define	MRAFC_MSTENE		BIT(3)
+#define	MRAFC_BCENE		BIT(2)
+#define	MRAFC_MCENE		BIT(1)
+#define	MRAFC_UCENE		BIT(0)
+
 /* GWCA */
 enum rswitch_gwca_mode {
 	GWMC_OPC_RESET,
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index dd9a0e7a9d74..d32d4d18606d 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1203,6 +1203,13 @@ static void rswitch_etha_enable_mii(struct rswitch_etha *etha)
 		       FIELD_PREP(MPIC_PLSPP, etha->link_pin));
 }
 
+static void rswitch_etha_set_MAC_addr_filter(struct rswitch_etha *etha)
+{
+	/* Enable broad-/multi-/uni-cast reception of eMAC and pMAC frames */
+	iowrite32(MRAFC_BCENE | MRAFC_MCENE | MRAFC_UCENE | MRAFC_BCENP |
+		  MRAFC_MCENP | MRAFC_UCENP, etha->addr + MRAFC);
+}
+
 static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
 {
 	int err;
@@ -1217,6 +1224,7 @@ static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
 	iowrite32(EAVCC_VEM_SC_TAG, etha->addr + EAVCC);
 	rswitch_rmac_setting(etha, mac);
 	rswitch_etha_enable_mii(etha);
+	rswitch_etha_set_MAC_addr_filter(etha);
 
 	err = rswitch_etha_wait_link_verification(etha);
 	if (err < 0)

-- 
2.43.0


