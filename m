Return-Path: <linux-renesas-soc+bounces-21151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC1B3F188
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 02:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5F0D3BE43F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034BF2C11EC;
	Tue,  2 Sep 2025 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEKVNL3R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138D22C028B;
	Tue,  2 Sep 2025 00:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756771992; cv=none; b=EG9V3Bkx3ojv29y6MpNGWmWNugJZE01Q9dmm2+IkamF398xebbxdddQB7iyHsn5hI8dMhQWVVySmvqHLrgf+7hP/nuObUlJBH+68F3OhOCPJv/sEVF5Znyw55a2LuYnluc4ScZHl28Mlb3uu0q2wOIY65/H/Ugc1hzCOEdlIF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756771992; c=relaxed/simple;
	bh=zekx91f+hmWCWtRE0jqVktFYVvzjJ9zRlqXFKxYsR00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrETiM5Xfp7PnjTlvm4DFloPUo+g9lJTD4q1Vi3RtQ+XTLxUwabM/7URZ9OBdZJ5n3L4CFdAIeV1u1JzQrtpRbwHzMPWan5+a3jFg0rfLLCL1rRtoV37G+8ovD3PgUACfVDmDi6ZHHeJs8iOBZfeAFThI51cm8eCJfu0arXoZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEKVNL3R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so33048345e9.1;
        Mon, 01 Sep 2025 17:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756771989; x=1757376789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IW7wLUGlmaYQP6Tz0Pa2N3CEqKrBMcmhwzaDX5OOnZ8=;
        b=BEKVNL3Rd40vphF5jlsgvDjrr2GD1rc8q557k8xNWv5yWEd3d66EaIa58Wpf/pON2G
         Rfp0HAWr9CAimP3xVlbB7reyEZjyEVZMaUgU6V8LJw8EbImhB+hp2sBx1DgG8RW20qcM
         xnWYwn7dcCxAZmuZ6paaq9/MGPZb9zrVYGXJqMrEsoMbfF4ac2jMj5QcILuq+DkZQkh3
         DB0PJGghCUFkqQ3WIc0R5LelAaj5gHJvwgs7GDf5qBmkF5ublBB5t3leyeOCz7b0eqDy
         cmar6S6qe/XoVZ5U2QZjjuitRIt3nmAQtlSNAG+6f+6L2PK70r1gbNAwEdYxHWwcaGpY
         cd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756771989; x=1757376789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IW7wLUGlmaYQP6Tz0Pa2N3CEqKrBMcmhwzaDX5OOnZ8=;
        b=Bbed6sh2Ecv64ekuhfF/USC9FJKmtWC4FUa9eGqxBoHFzNOXH9L1FOaeEKzMJZge1Q
         DOBVhihCCNkkw48suJho9yMGFvUB7ANZ91h6sDV/uwW39G3DhHGoB6vbMuIyH0g0A+Kt
         7bA+UAjeLKywOVSVB03m/JReim03mkcQPh29c+TCM42wn7PjBLkn2QeH8jkNdTe4uaaD
         ZhwFJD62L2xRFcxap8hW7MkZdBGKLF3PFwtQaUPnotPjUMYY+zoawSNJb8gz1ywVFqUE
         9lKv+lzx8R6zMlkUQSoYYP88wllhr0MUaJq0GSQqXT1jHMvsA6cdTt2E0ickM2GP3t49
         aO8A==
X-Forwarded-Encrypted: i=1; AJvYcCUlpKUEwiVzVzgpWFPAp+o0nk0xBz2IQD4Q40PUuOAdjNQ84nDW8Y6rNGSuC8TYQEjp7b1amyQF@vger.kernel.org, AJvYcCVuDERu0lN8dcuC4REE/o01F1X0BgdQZ+zp8u2kKqavDRatGT+puW3xR2fBo7z5aEEf04wEEoMpmJVKi1EO@vger.kernel.org, AJvYcCWyLRUAPHu5X1qjulINBewc9jf3IkYiMLKoU7iPPiu9AhFnPjRxp/Oxe5d26UCmjNYiesOjwiDERjFI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/VaO+32M5jRcFPfhSs8c2NaxQJ9Mv5D9m6NyYWxIa9Sk7wD3
	o4oJnZavrVDezPop7CSiLxw4D0qTIvKyzF41VMZoDVZb9EmgdCtpFkvV
X-Gm-Gg: ASbGncvtgrH5nfgQCb4gQVlb6tbbFZx4dQZ5VPQHpZoTNwErp2Rv6G9vNuR6GYTaMQC
	NmhbT/nvu3LKQFbyIf4gXdngII5uFh8UTfdcr2ehBp1lEfUhRJLKsxBGB1eOYuB7nLlXRVNuHrB
	xfTfftOWsJy0TWm6c3cDj4wMet0hmno69y7pPUbc6/lCvx0l5oeAgylNq3NsofEVv424D67lFA2
	VcQZfrcEWJ+0xcQhDmyjF7ws3+bwnXj1z4iLWlCjRmcokq8y6ihiA2YrrT6iYA5CE5k9WKmaSrk
	sepMhUDiyCVYeVDAwMtRUE7hq7jFfi+B1C8ShqvNJygHjp3y2WgM3gOxkWw+hVvfXjiUyvAg77j
	jHDX2R8Pap8B+oG4LARoeKnCoILY6ghLdeUp5U5SxtFe1kr7TbdLTlrrl
X-Google-Smtp-Source: AGHT+IHuS7QRUr21Kdtxu2CuDcnTrvddR0z5zY3NevQTs8JFkmoZuliR3bAbwjIkq43ebLCLnjTS7Q==
X-Received: by 2002:a05:600c:a0a:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45b855aeb67mr71158435e9.32.1756771989248;
        Mon, 01 Sep 2025 17:13:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 17:13:08 -0700 (PDT)
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
Subject: [PATCH net-next 3/4] net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
Date: Tue,  2 Sep 2025 01:13:01 +0100
Message-ID: <20250902001302.3823418-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare for adding RZ/T2H SoC support by making the driver configuration
selectable via OF match data. While the RZ/V2H(P) and RZ/T2H use the same
version of the Synopsys DesignWare MAC (version 5.20), the hardware is
synthesized with different options. To accommodate these differences,
introduce a struct holding per-SoC configuration such as clock list,
number of clocks, TX clock rate control, and STMMAC flags, and retrieve
it from the device tree match entry during probe.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 57 +++++++++++++++----
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index df4ca897a60c..022e595a9e1b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -16,12 +16,34 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/types.h>
 
 #include "stmmac_platform.h"
 
+/**
+ * struct renesas_gbeth_of_data - OF data for Renesas GBETH
+ *
+ * @clks: Array of clock names
+ * @num_clks: Number of clocks
+ * @stmmac_flags: Flags for the stmmac driver
+ * @handle_reset: Flag to indicate if reset control is
+ *                handled by the glue driver or core driver.
+ * @set_clk_tx_rate: Flag to indicate if Tx clock is fixed or
+ *                   set_clk_tx_rate is needed.
+ */
+struct renesas_gbeth_of_data {
+	const char * const *clks;
+	u8 num_clks;
+	u32 stmmac_flags;
+	bool handle_reset;
+	bool set_clk_tx_rate;
+};
+
 struct renesas_gbeth {
+	const struct renesas_gbeth_of_data *of_data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct reset_control *rstc;
 	struct device *dev;
@@ -70,6 +92,7 @@ static void renesas_gbeth_exit(struct platform_device *pdev, void *priv)
 
 static int renesas_gbeth_probe(struct platform_device *pdev)
 {
+	const struct renesas_gbeth_of_data *of_data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -91,14 +114,17 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 	if (!gbeth)
 		return -ENOMEM;
 
-	plat_dat->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
+	of_data = of_device_get_match_data(&pdev->dev);
+	gbeth->of_data = of_data;
+
+	plat_dat->num_clks = of_data->num_clks;
 	plat_dat->clks = devm_kcalloc(dev, plat_dat->num_clks,
 				      sizeof(*plat_dat->clks), GFP_KERNEL);
 	if (!plat_dat->clks)
 		return -ENOMEM;
 
 	for (i = 0; i < plat_dat->num_clks; i++)
-		plat_dat->clks[i].id = renesas_gbeth_clks[i];
+		plat_dat->clks[i].id = of_data->clks[i];
 
 	err = devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks);
 	if (err < 0)
@@ -109,25 +135,36 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL,
 				     "error finding tx clock\n");
 
-	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(gbeth->rstc))
-		return PTR_ERR(gbeth->rstc);
+	if (of_data->handle_reset) {
+		gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
+		if (IS_ERR(gbeth->rstc))
+			return PTR_ERR(gbeth->rstc);
+	}
 
 	gbeth->dev = dev;
 	gbeth->plat_dat = plat_dat;
 	plat_dat->bsp_priv = gbeth;
-	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	if (of_data->set_clk_tx_rate)
+		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 	plat_dat->init = renesas_gbeth_init;
 	plat_dat->exit = renesas_gbeth_exit;
-	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
-			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
-			   STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->flags |= gbeth->of_data->stmmac_flags;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
+	.clks = renesas_gbeth_clks,
+	.num_clks = ARRAY_SIZE(renesas_gbeth_clks),
+	.handle_reset = true,
+	.set_clk_tx_rate = true,
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			STMMAC_FLAG_SPH_DISABLE,
+};
+
 static const struct of_device_id renesas_gbeth_match[] = {
-	{ .compatible = "renesas,rzv2h-gbeth", },
+	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
-- 
2.51.0


