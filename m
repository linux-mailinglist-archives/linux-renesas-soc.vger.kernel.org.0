Return-Path: <linux-renesas-soc+bounces-24212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7B0C3B259
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9F46565012
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54939333731;
	Thu,  6 Nov 2025 12:55:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D63E332904;
	Thu,  6 Nov 2025 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433756; cv=none; b=Fq7bJnRtR8Y1EVMeGuejPzJSSym6FtKFgFdOIQnlJ12CqnVQ+di2y7HvsEPV2ZAPnP4Sdbcrzk4HZCbCND/stBRqyp7IsEIPEBEC4aAHIRh6axSuzNOdOeQlqeb+gQtmgb0mSjsvlpFOy0H2FGzW62eVqoFtKWsTZV+2UxXAPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433756; c=relaxed/simple;
	bh=P5ykCsS4neKkHcse8At/FgJZGg++oPtsWxyb/EcxV0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmlgsOx0bDIfNGbuUZkSkl6bb6ln8O4K/ucGKpwP85EqD3/77lpsYQj0XYwoGT5l3u8L7qsIiJAgZvGpDDa5cws/fIcXHelN6iV6LooSx50kBDGl5QrbzrXRJuxMGM+7pcJMEazf1b2WVYRwlPEvA6VCd8jUpE9CiCiSriiYl14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: SYYgdZdVRBKGMqg+AuNxDA==
X-CSE-MsgGUID: 2MNJV6XMTzeN9igS/RzZpw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Nov 2025 21:55:53 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AD68D4006DE3;
	Thu,  6 Nov 2025 21:55:47 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 06 Nov 2025 13:55:26 +0100
Subject: [PATCH net-next 02/10] net: renesas: rswitch: enable Phy link
 status pin
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-add_l3_routing-v1-2-dcbb8368ca54@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=2181;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=P5ykCsS4neKkHcse8At/FgJZGg++oPtsWxyb/EcxV0w=;
 b=kupTc1dcqo7Gscg/7hWgN9ofgE3oaGVTwphqPjOIdAJtRlsz3t9p/dpDjjbHkqb9nR7gWMR/d
 SyqK7vk23o8CaHtOMlZIcBQdNciQbFA0YJo4s4QPu3jlSvUi3T1jRik
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

Enable Phy link status pin for boards which support this feature.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  1 +
 drivers/net/ethernet/renesas/rswitch_main.c | 12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 8168c4cc83fe..a65ba10ae435 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -960,6 +960,7 @@ struct rswitch_etha {
 	u8 mac_addr[MAX_ADDR_LEN];
 	int link;
 	int speed;
+	bool link_pin;
 
 	/* This hardware could not be initialized twice so that marked
 	 * this flag to avoid multiple initialization.
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 8d8acc2124b8..dd9a0e7a9d74 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1192,9 +1192,15 @@ static void rswitch_rmac_setting(struct rswitch_etha *etha, const u8 *mac)
 
 static void rswitch_etha_enable_mii(struct rswitch_etha *etha)
 {
-	rswitch_modify(etha->addr, MPIC, MPIC_PSMCS | MPIC_PSMHT,
+	/* PSMCT: PHY station Management capture adjustment in clk cycles */
+	/* PSMHT: PHY Station Management Hold Time adjustment in clk cycles */
+	/* PSMCS: PHY Station Management Clock selection (clk divider) */
+	/* PLSPP: PHY Link Status Pin Plugged */
+
+	rswitch_modify(etha->addr, MPIC, MPIC_PSMCS | MPIC_PSMHT | MPIC_PLSPP,
 		       FIELD_PREP(MPIC_PSMCS, etha->psmcs) |
-		       FIELD_PREP(MPIC_PSMHT, 0x06));
+		       FIELD_PREP(MPIC_PSMHT, 0x06) |
+		       FIELD_PREP(MPIC_PLSPP, etha->link_pin));
 }
 
 static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
@@ -1338,6 +1344,8 @@ static int rswitch_etha_get_params(struct rswitch_device *rdev)
 	if (err)
 		return err;
 
+	rdev->etha->link_pin = of_property_read_bool(rdev->np_port, "link-pin");
+
 	err = of_property_read_u32(rdev->np_port, "max-speed", &max_speed);
 	if (!err) {
 		rdev->etha->speed = max_speed;

-- 
2.43.0


