Return-Path: <linux-renesas-soc+bounces-21152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A609DB3F18B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 02:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A11C97A3FBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB962C21C9;
	Tue,  2 Sep 2025 00:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN0UsaAM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E542C11D2;
	Tue,  2 Sep 2025 00:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756771994; cv=none; b=u4kzRHgd8wCB9HCyga21GZTL0fzVmW9bOE9j4ElkZJA5oNDhj/mX+GogWaQKcDqb+qSGFRMiWLrZWWB5msU03O4LOZtPA9AaQqbG9S/UHsY7B+zPB76IoyK79Jzk6TyjW9B5npT3xxNGC9oV7NZJnyXpwozhQcHUX2dGDB/QJbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756771994; c=relaxed/simple;
	bh=rYSJndT6hXCXD8jlYBfbdSRTF0KIs6xPzFEVUOaarJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTorBGgTwVy7q05zK+S1Z22XtWQx0jwDE/kA1AWVi/G4NSDnzUEMqA+SaG3LRi8v3OX46GETojWcSlluQZuYsbTl78Peg+GXuABEUD52Nn/szVGjW2X4yO5MeDORxAsrOXcKoQ+ckH6lPJ8B0rgGhJx0e4Z753ceNulWrzwNoeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN0UsaAM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b8b7ac427so9532315e9.2;
        Mon, 01 Sep 2025 17:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756771990; x=1757376790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYNmQYHvpUW9ygwaADrHIo+U++1cqaaqBXRIk4cWf5E=;
        b=gN0UsaAMCpIxfXQKYNsvpwI1rHEXHvwd+ej41+DQDW6uMC65H/B+DotWJ5jEGuV907
         f0tBE08q5BxgNPgkqBTq4iVIrf50/ENYLtFpGL8krHI9uDwqqGIG0ncVwKRFZVIlYMjR
         BdtoU/YufSkjezVdc46pLiBB0mkezOaf9qTYlXtV8BFThcp0bbQcsHZiQYdDEmGnG0w6
         HbOPHB5qILYtlv9gOG1Dkl7nXCwD7W+WhfJtAWNPyN0m+ZlKeOrXeye+79mHU4NQ/hDZ
         jbtQB9sxGF/HHuiX6ipy82DVJvB1qVynBhEOP0RFSFDfxiI0LF1a+kznA0vEcln0Xicj
         gZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756771990; x=1757376790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYNmQYHvpUW9ygwaADrHIo+U++1cqaaqBXRIk4cWf5E=;
        b=N5eSZeB9L3hEQwWmcq0S4YUustvciC2Od7e+Jq1+iJzzanlxwdOVNkXgYRcd2BIHH5
         tqKtBH4vuUfwzClrf+NLMUH7zgFTtZ1eLLIW+j+PEOzh6w56WXZ+R4/hn4hCHvNtilNy
         aF6vv7iGfcHzQ/E4cdy7wvOPBM9Orbfv4BzXPbN5TcQrLOUernLFUkKfeuT8dthzQZZm
         mpwR1Z9cLicEkTRZArvb2EFLB1d5okPxvjG28PDcLOOzgWaRVrIQlG0sGzMOEOFcoWG5
         c8T3UHms1lURVNcNudJVr6F/fEYQsKTRDzH5vpPO+Rwo6QiAFcLLN9MGHiGDQ+f2NtMP
         jOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYAy1yaZb319gsigJuPZjuEoxidBecLG6IhsygFbrkAWMxtOXqeuOl0b3VSrxGsRyK/EamM5Za@vger.kernel.org, AJvYcCUZpfIHO6inERwDpVVvKhHO3MUSmwqpoIUPPTudkwK74TOgf+saf4ZkRR25saLakmzdfW0T5MooWBV08PrN@vger.kernel.org, AJvYcCXjiYXuEHYD7y+0YKpziLoVtPLNYbKc6dIJdZxG2ReKsHJJ985j3Ip6p3z8vZgh6HVrAF1utr/MFCY3@vger.kernel.org
X-Gm-Message-State: AOJu0YzN9rhw0ZnwBixsA1zlc4D4ebg6Kj59zrOm3hJmpqCC8zW7Lpy1
	xZwVTvamoR6QGQYCJGgJItyB+rIzgFPOwq9YBKVhm5qM61M7TcyKKLTp
X-Gm-Gg: ASbGncsg/Ndwp7jJ9waHXi90s78YDMn81lVF86ZP7P3RcDG/gcpIlJu3ULTj5XzueEL
	5JN2iPpQZi4byk80ACRGk2XwghsDdbTsizbFwwB/izU28iMA8X54cGTH6SalrL7FteSEmtdC65q
	khBbOJhaVLtYV13yyHznzBpvoBCHZPKiqMUKVOJhDr6LVWqBPavVAJf+nfN3VNbcm6yh7+MjYpx
	4r8UbE14h1Wm7wjw/HWShlxzBgI7SQs8h9kS+ZDX5P+MJcGlXMCptNA/h6c4UaVWLbwAxOIO+Y8
	+H1v9aJhw0WrJ+TLoVFyOh7FezIelTGHlKBIlza93DlCu6g17EFIMTuCPJAS+3/hKPvBbrW/ZOy
	+aS/E1Ylfi5RpZOOLc8274Bx21OWFqXTbuK2HJVhIe5U+9Q==
X-Google-Smtp-Source: AGHT+IFGGuLbjih6Gj+w7x0wLgIFZo1ltt4HE5wOWmB54nwG1DjvGnz2BT6uviOKTC8YNommrrKJIQ==
X-Received: by 2002:a05:600c:4fcd:b0:45b:7185:9e5 with SMTP id 5b1f17b1804b1-45b85525cddmr83857055e9.5.1756771990377;
        Mon, 01 Sep 2025 17:13:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 17:13:09 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 4/4] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC
Date: Tue,  2 Sep 2025 01:13:02 +0100
Message-ID: <20250902001302.3823418-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e52..a01c83b109f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -136,6 +136,7 @@ config DWMAC_RENESAS_GBETH
 	tristate "Renesas RZ/V2H(P) GBETH support"
 	default ARCH_RENESAS
 	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
+	select PCS_RZN1_MIIC
 	help
 	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
 	  RZ/V2H(P) SoCs.
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index 022e595a9e1b..ad89f7b8f279 100644
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
@@ -149,6 +187,11 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 	plat_dat->init = renesas_gbeth_init;
 	plat_dat->exit = renesas_gbeth_exit;
 	plat_dat->flags |= gbeth->of_data->stmmac_flags;
+	if (of_data->has_pcs) {
+		plat_dat->pcs_init = renesas_gmac_pcs_init;
+		plat_dat->pcs_exit = renesas_gmac_pcs_exit;
+		plat_dat->select_pcs = renesas_gmac_select_pcs;
+	}
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
@@ -163,8 +206,17 @@ static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
 			STMMAC_FLAG_SPH_DISABLE,
 };
 
+static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
+	.clks = renesas_gmac_clks,
+	.num_clks = ARRAY_SIZE(renesas_gmac_clks),
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP,
+	.has_pcs = true,
+};
+
 static const struct of_device_id renesas_gbeth_match[] = {
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
+	{ .compatible = "renesas,rzt2h-gbeth", .data = &renesas_gmac_of_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
-- 
2.51.0


