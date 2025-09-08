Return-Path: <linux-renesas-soc+bounces-21559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434BB48AD3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 12:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 105A33AE221
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 10:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66082FB61F;
	Mon,  8 Sep 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cP1te8fB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E72EB86F;
	Mon,  8 Sep 2025 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329159; cv=none; b=J2vsT2qIMvyLK6fShz1b1ZhEIVEKhPSiaANH11MdHNRWDfDs4NE9qcb6UFebF/2364RWFWUL+RTJ0k+pUP0f3jDs9bniII2hY/Crv+zEXVnPR1pyXddJyUi0f1ChwuFoPvvsJAMDRw9mAXRp1caftpFy7a3hvXJhlFF4Z/t9t0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329159; c=relaxed/simple;
	bh=Q8ZmvH2dcnPSKkYNIQCMCNSaVbab0qTqP/gwu87zQs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oe8LNXoaLe9I5uULsTKlJK3BVVZfonF9/5Ie3Jvi2IlQO+hFpLhOZwBkGZilGdUZYkdlMG8h6+4Ffjf05uVCx7ajBocLkJP0KCnVe5GjaBiFOElctFeEt+gBM7lF/V1xBhIIu93fIs5SJCh10wrScVlxuWNiUrfO+40/oRsDB0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cP1te8fB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so25307495e9.0;
        Mon, 08 Sep 2025 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757329155; x=1757933955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf/M2p3yJHaMrS3IqSkuhZTHc2x/xMcbIpQDOhQMCBY=;
        b=cP1te8fBdIgPGaOLs0uVTtHKJXEOK2D49rGd4yNikyeg1PM+FLply68Oczw9jXS5BW
         uNVVCGKeLyaDRxKIjRZlTT3UpmkBhDp0PIfzG5DSI4y3uiSjJGZ2zSnWCtUxYSYG4v49
         UEaq0Odo1BNVzh52jvn5KOAp6FgD3qzotojcNrpw8EZuCpnlXI09cgcTkuHmvg0t7vuX
         VRied9PevdDaXCZiLW6KHKwGX0jWSLeI8EOh25d655Deu5B1l5pYdB4+zn6Enej4LOWl
         z76PR8p+yjge2D6vH/kyL5aKhr0iTyk+dZUowVoe3S8cMo1bD5ZR6BDxxfNOSlZgSXXY
         ymvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329155; x=1757933955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uf/M2p3yJHaMrS3IqSkuhZTHc2x/xMcbIpQDOhQMCBY=;
        b=TVPA3LxfMoLOXKg8uNS/DT9QN2K6dQMZCEXJML/0kZid4Emf43SWj+BttnQdE05aXw
         nKV4rBrP+u1Aetqlu9EanacYWAgk85zLJK0bn8tTV2kzXHTpIAza+X/RgyXV89iaYo4h
         FYnCvg5Wd3GQ+X96LhLNGWn0hoSX1uOUr0/Y8DPVOkGsOjmGhPFi/chD/1LPbnwtRq+l
         91YiyfNRWGtW9bOw7408cax/o47xZVpEmQlMIv35d/fk5RyVkwxi0X8jZW01RcapNSHn
         FFmyGxVKxLnWFfXGtRM28vOTe39vKf0aPEDcfur3d/IznE4g/xaf72QhbQxx5slx0uLc
         NaiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXi3CP1BHbw+GbGFgkL2Y7s2io/mbVH99dbCJLDhZr50TYCrmUJfCfVCBop6vdam30m7kRf7sphVCC7lDNCOfII5g=@vger.kernel.org, AJvYcCUZ3DGNjtcGlS4s0jihewR8KlhQW0zTZdmYYZ4Jof1TM/NPKbs1tgJZG0bj8NV7dI70wopRs7avFgPTE6Zp@vger.kernel.org, AJvYcCV9JkMPdI4EkNbakAh2CUKO5OEuK2LdfIJiJ3L/H3GZJH5ksSe5+wC16viOwzvWD6XMKGkTKjS8HBY4@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqmPfGkUeXqjSV0z1nopfmDO3MVHARxSE9uBkZJ/DCTayxS3y
	ddj6yMmxJilNp9UXLwQhhsQA0q4JiGf7bK8ca/5FDhIXh/00SEx/DppZ
X-Gm-Gg: ASbGncuMVq9IC84FoSPsacOeZ94yZB37pC1bW/O+ro9udZQTr+qHSF3N4NyMqu5niZG
	aHDzEKBHka8KRH1newm++v6CK5BOEUgOjNDac41ghzX+hSiI6gEljCcIayyWXDDMC8mf9Mh7JvX
	AzFpl8tTo3MGDNwx6NT2vm82CmD/RBQnQrjBV6pll1dti36wKGK9QyFGRH8VhX9rJoV7JuIJ1Eh
	MuGw+BQuGPjr/MBEHDhCQJEWkF+0up0sty/KwsewwnXMRnVPdhqQwG3/Mh6PvIO7eMOllt/Cws3
	Kjgm4iQoqtJNWbF8cgDka/KfDKVqoeFU4YrN5avEfcnvsF0wDupMVLHcGlXIveXhA6BPl4IAm9C
	wZyOPMRHdIRUfU3EmMVV6rYzJZfM3RODXWySaiHtNhCtnygNhHGlDTuBZWKeALJNFy30P
X-Google-Smtp-Source: AGHT+IHblMi4stag0oLrxcrHSFQ7OdUQZDLXbmXDrAdQ2fS9UVrhh42Zym0Zb20SR1y+8nRSsXcmEg==
X-Received: by 2002:a05:600c:1d24:b0:456:fdd:6030 with SMTP id 5b1f17b1804b1-45dea83f76bmr8307965e9.19.1757329154791;
        Mon, 08 Sep 2025 03:59:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:59:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 3/3] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC
Date: Mon,  8 Sep 2025 11:59:01 +0100
Message-ID: <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the Renesas GBETH stmmac glue driver to support the RZ/T2H SoC,
where the GMAC is connected through a MIIC PCS. Introduce a new
`has_pcs` flag in `struct renesas_gbeth_of_data` to indicate when PCS
handling is required.

When enabled, the driver parses the `pcs-handle` phandle, creates a PCS
instance with `miic_create()`, and wires it into phylink. Proper cleanup
is done with `miic_destroy()`. New init/exit/select hooks are added to
`plat_stmmacenet_data` for PCS integration.

Update Kconfig to select `PCS_RZN1_MIIC` when building the Renesas GBETH
driver so the PCS support is always available.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Dropped passing STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag in stmmac_flags
  as it is always set for all the SoCs.
- Updated Kconfig to include RZ/T2H and RZ/N2H.

v1->v2:
- No changes.
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   | 12 +++--
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 51 +++++++++++++++++++
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e52..91d9a14362bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -133,15 +133,17 @@ config DWMAC_QCOM_ETHQOS
 	  stmmac device driver.
 
 config DWMAC_RENESAS_GBETH
-	tristate "Renesas RZ/V2H(P) GBETH support"
+	tristate "Renesas RZ/V2H(P) GBETH and RZ/T2H, RZ/N2H GMAC support"
 	default ARCH_RENESAS
 	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
+	select PCS_RZN1_MIIC
 	help
-	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
-	  RZ/V2H(P) SoCs.
+	  Support for Gigabit Ethernet Interface (GBETH)/ Ethernet MAC (GMAC)
+	  on Renesas SoCs.
 
-	  This selects the Renesas RZ/V2H(P) Soc specific glue layer support
-	  for the stmmac device driver.
+	  This selects Renesas SoC glue layer support for the stmmac device
+	  driver. This driver is used for the RZ/V2H(P) family, RZ/T2H and
+	  RZ/N2H SoCs.
 
 config DWMAC_ROCKCHIP
 	tristate "Rockchip dwmac support"
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index 50be944ee37b..bc7bb975803c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pcs-rzn1-miic.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/types.h>
@@ -33,6 +34,7 @@
  *                handled by the glue driver or core driver.
  * @set_clk_tx_rate: Flag to indicate if Tx clock is fixed or
  *                   set_clk_tx_rate is needed.
+ * @has_pcs: Flag to indicate if the MAC has a PCS
  */
 struct renesas_gbeth_of_data {
 	const char * const *clks;
@@ -40,6 +42,7 @@ struct renesas_gbeth_of_data {
 	u32 stmmac_flags;
 	bool handle_reset;
 	bool set_clk_tx_rate;
+	bool has_pcs;
 };
 
 struct renesas_gbeth {
@@ -53,6 +56,41 @@ static const char *const renesas_gbeth_clks[] = {
 	"tx", "tx-180", "rx", "rx-180",
 };
 
+static const char *const renesas_gmac_clks[] = {
+	"tx",
+};
+
+static int renesas_gmac_pcs_init(struct stmmac_priv *priv)
+{
+	struct device_node *np = priv->device->of_node;
+	struct device_node *pcs_node;
+	struct phylink_pcs *pcs;
+
+	pcs_node = of_parse_phandle(np, "pcs-handle", 0);
+	if (pcs_node) {
+		pcs = miic_create(priv->device, pcs_node);
+		of_node_put(pcs_node);
+		if (IS_ERR(pcs))
+			return PTR_ERR(pcs);
+
+		priv->hw->phylink_pcs = pcs;
+	}
+
+	return 0;
+}
+
+static void renesas_gmac_pcs_exit(struct stmmac_priv *priv)
+{
+	if (priv->hw->phylink_pcs)
+		miic_destroy(priv->hw->phylink_pcs);
+}
+
+static struct phylink_pcs *renesas_gmac_select_pcs(struct stmmac_priv *priv,
+						   phy_interface_t interface)
+{
+	return priv->hw->phylink_pcs;
+}
+
 static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -150,6 +188,11 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 	plat_dat->exit = renesas_gbeth_exit;
 	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
 			   gbeth->of_data->stmmac_flags;
+	if (of_data->has_pcs) {
+		plat_dat->pcs_init = renesas_gmac_pcs_init;
+		plat_dat->pcs_exit = renesas_gmac_pcs_exit;
+		plat_dat->select_pcs = renesas_gmac_select_pcs;
+	}
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
@@ -163,7 +206,15 @@ static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
 			STMMAC_FLAG_SPH_DISABLE,
 };
 
+static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
+	.clks = renesas_gmac_clks,
+	.num_clks = ARRAY_SIZE(renesas_gmac_clks),
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY,
+	.has_pcs = true,
+};
+
 static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,r9a09g077-gbeth", .data = &renesas_gmac_of_data },
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
 };
-- 
2.51.0


