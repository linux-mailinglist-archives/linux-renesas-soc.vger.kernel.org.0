Return-Path: <linux-renesas-soc+bounces-24211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F40C3B174
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B4664505C3B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE32C33291B;
	Thu,  6 Nov 2025 12:55:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A68930CDB7;
	Thu,  6 Nov 2025 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433754; cv=none; b=WMFfPa2SGSZ2QRW7EBspXLxNCBnW6ExaZ1kQKrC2vpYv8/It+kvGj14USCsOkS8d8UN3wCLd3mSggyjzXab6HUwM51P7yO+ZjZv6m8we1xCRoLkom/ckGqDpDDVrK8FWIAJzZn7weDMSHWaav/lzRnLTaWPd9iEufYRrRA8yM8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433754; c=relaxed/simple;
	bh=W9a/wG1xFa8Guzg0KCdk04bPgycscKPWY07VSlYYs0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLiVEVrk817eEIaFudP8wX5pTgB5Mtwu3N472VHLovqi4GxKGAlXYUZnepl/OGNxxPJmH+Ct/nhvpCTpRP18AZ8hlg/qNvJfhFTX7r06odTwPxkIiOXEZNX7pBfOG73QqkVnbJGw2LMcB2jDYq09kMY3ZHnv4eodPFPDpgFTPvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: twdN5D3oQs6Pe7DfkWKU/g==
X-CSE-MsgGUID: jtheX/HAQx2YzXRixVvCRw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2025 21:55:47 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CBC214006DE3;
	Thu,  6 Nov 2025 21:55:41 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 06 Nov 2025 13:55:25 +0100
Subject: [PATCH net-next 01/10] net: renesas: rswitch: cleanup MII settings
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-add_l3_routing-v1-1-dcbb8368ca54@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=1206;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=W9a/wG1xFa8Guzg0KCdk04bPgycscKPWY07VSlYYs0E=;
 b=XSFPRa1e7M01gc9BseX2v0CdA5fsOTGAOAxObbo6HbwqlnBOtqKwya01fbK7Uu6B69GSHCTWC
 IIc1zd3Ku88Dd5ysz3fRFFfdAmwzMgoK9/l6ZTsguOPjKuvlYFZfkKQ
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

Add Phy interface modes and link speeds.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index a1d4a877e5bd..8168c4cc83fe 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -732,15 +732,26 @@ enum rswitch_etha_mode {
 #define EAVCC_VEM_SC_TAG	(0x3 << 16)
 
 #define MPIC_PIS		GENMASK(2, 0)
-#define MPIC_PIS_GMII		2
-#define MPIC_PIS_XGMII		4
 #define MPIC_LSC		GENMASK(5, 3)
-#define MPIC_LSC_100M		1
-#define MPIC_LSC_1G		2
-#define MPIC_LSC_2_5G		3
+#define MPIC_PLSPP		BIT(10)
 #define MPIC_PSMCS		GENMASK(22, 16)
 #define MPIC_PSMHT		GENMASK(26, 24)
 
+enum phy_if_select {
+	MPIC_PIS_MII   =        0,
+	MPIC_PIS_GMII  =        2,
+	MPIC_PIS_XGMII =        4,
+};
+
+enum link_speed_conf {
+	MPIC_LSC_10M,
+	MPIC_LSC_100M,
+	MPIC_LSC_1G,
+	MPIC_LSC_2_5G,
+	MPIC_LSC_5G,
+	MPIC_LSC_10G,
+};
+
 #define MPSM_PSME		BIT(0)
 #define MPSM_MFF		BIT(2)
 #define MPSM_MMF_C22		0

-- 
2.43.0


