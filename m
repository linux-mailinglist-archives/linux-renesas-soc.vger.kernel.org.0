Return-Path: <linux-renesas-soc+bounces-21395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A699B4478B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADC511CC1067
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F60F287507;
	Thu,  4 Sep 2025 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ao5/uwlj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477CB2857E0;
	Thu,  4 Sep 2025 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757018401; cv=none; b=Qw54Q5JaahnNIvFI58RxpaSX8d66NbvFY3snvsi7FlI+Ivx2iafz8EFt8Qb2Svjp//dm91pnwCcyeGXnZdEQBOfN89/Fn8gVyFhIybu1TRP+ZJnYcqcBVUNRAXQVeVRnc/ouUOUM3OqVx8FlwXSflImeFpj/pyZdbKhv+3jHvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757018401; c=relaxed/simple;
	bh=5rVAO1b+rFZd27BiDRBWI1x2fCIeQsIzD1TFaLcjjhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ok/B4p3bZg/gKSrobLpJ7+nKn3QOCoJZQcz8fCPu3dv2eZZBtJfTGZXQ4WAGyRJa5k22wXQITcVUPXDm8J9R8k+DuDksDXApjZvmv4ffiYHuioSThAmkq4OLuYjbKpKKk5sS8yEogHXxOmPTi+nR77BYzvlzDKKUmP9j04ELi7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ao5/uwlj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b8b2712d8so13550415e9.3;
        Thu, 04 Sep 2025 13:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757018397; x=1757623197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HWs5BM/Zczfcib8xW5oddFZsmYZHDcxWDdtx5r08Kk=;
        b=Ao5/uwlj+wc5D44huPVey3MFyQkEiSXY+g1ywlN4JJtrTQg2jJWIOOncC4K6ATvR0e
         5QDuTRovcnz1Jw7G+49rE4AV2tszNcItW3aL9x9dEUpyq2QiXn8J21q98ttIB9OiPvij
         ccAu4YxDO6nwqm0kcMfGlexns1Lix9liXUpbAq4hhNeo4hZVruHIVsAvXIXCIwM/rQ1C
         Uh2d0yEgJN0XzZIAmhBPISVncpK/r6V7on78PeRH1NojYztsVB5tFZPsakgb1rrBNDwU
         AbGOBQdQDfm71N7nigH4d1O/D09ydGio8ZIv0RWfpQbDBfMhQheg4SWizHW6ZvlrflYI
         SaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757018397; x=1757623197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HWs5BM/Zczfcib8xW5oddFZsmYZHDcxWDdtx5r08Kk=;
        b=QF+mnVXzanIygeiX1xRbarD246/0Aar7CsisazCyA49botu99WuIw3qxzSg6wZElC7
         rhxvWB+WnXXix0yIRIsQi9tjfkvrjKlsuLbmQRvCnhbqPJ61WqAPfcMlf0fVE35m0gul
         FMmxZTjCUSu1/eaBga/C0WhpiZrkkwy3egr/FqlXpfwEBGevJxnaIzzfw6Bv8uTHAyFw
         l3XwOsbo5I6PpzTfOoVcak8BBJIF+PHsZP9KWgJA0vnBynjWuNRCvkx7aQaZSdoBxx17
         sieApBXzirrlJpD3fPhWPTYilixTUB5Jz4bo9UJJv3gaZQgdZRqOf0qMqh2W2pKCkPgs
         BxLg==
X-Forwarded-Encrypted: i=1; AJvYcCWrgNc6RXTczl8moJ5ji+uLlZVZelrOx5PN5IFlrrhxeRryb0cluuOhKjsc0zRtc9Nx/IsALIZfQtoUJ1Hh0EQ0VQQ=@vger.kernel.org, AJvYcCX66IXj2X/n+1grP9kj2klcN+gv7OeVdraByBGL1i0Cf94IvlVh5nbooaSAFucchbOnPU+F7nYLPllE@vger.kernel.org, AJvYcCXYWDKhByp9ZWJ271AEDujB8gmxuQ3Gxcdntv+0Pq7VsSwO5Nlk+pLC2A688GjVpssqadSpCgT1Zwuz/iS0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjmut1wlUNZDaXapOcLfNFAAtE4UWX6GVAbL5eqh+577PTJFba
	l+klUvktVw6JVcQPVGyO04CaEArO4U7wIZrVt9M8Id1U+2MKq15ND8yc
X-Gm-Gg: ASbGncvdW+q+lvQwgTqE6y9YXGSwX1cOaC2eQnkqKpHQP5w1zfC91NU02rk0jiobIzf
	z85QcfwYX3TnJidXFrlBXpM4gd8CBzHBOpvd9jl1Fgl5AVmtv33r9kHg4CvpIJdxfZAEVHVPyKF
	cAH2q/QA5soDewUudwoa9RdsDCd/PEmQhx+UioIhjso4R0wouxtwwtdxKI6lBLAL4oqGaM6X8Cs
	/z+Ky/dS958E3WOI2hrh2byowq5YzTl0gRfL4BYAO2hQaMy+unIrlZ+HCfj4CQLYTHPAmKaXryU
	v7KxulPXd0T0lgAQCyyT+vNBB5jqbArsakQQTZRKuCqD895+Me+YQ/v8gm+GOIwI/f6DDwrkpon
	EIoJKooVi0zbDEJMeUE46y1AD2hinHKSFJbWJT5DOrA7HlYmMktwSBfWcfg==
X-Google-Smtp-Source: AGHT+IHL1oc02XZbGobYDQotXvvBze1vwYgK+kccWNcOGisk96waxJM71NYowbvY/REwkkmrpI/Nag==
X-Received: by 2002:a05:600c:a04:b0:45b:7d24:beac with SMTP id 5b1f17b1804b1-45b8553335amr189504555e9.10.1757018397490;
        Thu, 04 Sep 2025 13:39:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c93sm385528165e9.14.2025.09.04.13.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:39:56 -0700 (PDT)
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
Subject: [PATCH net-next v2 3/3] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC
Date: Thu,  4 Sep 2025 21:39:49 +0100
Message-ID: <20250904203949.292066-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- Switched using "renesas,r9a09g077-gbeth" compatible string for RZ/T2H
  instead of "renesas,rzt2h-gbeth".
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
index 022e595a9e1b..129543c37a5e 100644
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
@@ -163,7 +206,16 @@ static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
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
+	{ .compatible = "renesas,r9a09g077-gbeth", .data = &renesas_gmac_of_data },
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
 };
-- 
2.51.0


