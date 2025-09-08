Return-Path: <linux-renesas-soc+bounces-21557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BEBB48ACC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 12:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1EAF17187F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 10:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD2D2F7AB4;
	Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYsYxd4q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF96D229B38;
	Mon,  8 Sep 2025 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329158; cv=none; b=USBtzSo67AMVpBTeQ/XnNFld7zNEgxKVx++c+HDc0wmkKtknftUC5HdkjDlqOIBQSw3TtYeucbgWAuX2/kxnIbI/NqMl4+wHgLdmwjkhx9ngbP2uFm+nkJzqNDukrS1EzKIVn5c+5y6fLjqSIQt4Keg7BlOG2cVsqYwTwVWlodw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329158; c=relaxed/simple;
	bh=RRXKpyB1zyA0Tn5B4rSFnxVyQ1oz/YOJj+2tt8M50xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLlbhapKQfTNkWL3XvGR54n0dQYEXuyigAQYsd2hQDzWFaFxBo6Dr53qsoOoC0dk1/P2g3scYhnnxJxCLGAwo+Rc1dvPy9XXQlI8IPeuJsiSy/8TokKwskuUDrhwusTMfqvQctu8gjqur2Kx/WazOKDQbySXivqTlaxNZ5TWoTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYsYxd4q; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso2596826f8f.0;
        Mon, 08 Sep 2025 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757329154; x=1757933954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peDufwHvetmPOFt3DEDwzaxtxNLiJvPrin9RtvRg8KU=;
        b=XYsYxd4qp4y7i1ySs+Z9JYnXjg6AqFw0DZCkJEiXihldnWLOdf/6gqSeoxo1KjjVoT
         Jta5vkwFv0X1Xp2gwrsbvdlvQPdYrxNquvQGk2L3wtlnJsMCXm8zAmZn6/Gd8NvUdai6
         iKfoIve/NTeZyGps5NfgtgVdq0tJmT1mAVMgYgGxYeq1r0uRRU6MMOMecet55l3LGbO/
         QJNyvglgY5FdNMoxvDB3hAHhuDpNS3KRilRnjr/C4lyGvUrWyK1Uoq5LsVRoLozz6hJk
         tdl2jaKn6ubG0TTw4iZJgUArafEASAuLUzr+ow1hUeDlvIgcFedb66oR5SV381GLsRxn
         FwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329154; x=1757933954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peDufwHvetmPOFt3DEDwzaxtxNLiJvPrin9RtvRg8KU=;
        b=dRRzd9rXIx18ot4oTBZ39newwd7DK5uZ3XimG3Gc9jXowMFY7xaWZIF7euQd6t4twa
         9gQOJ/YnKq1rFY6it356118EFDT2c1NGvTJeqZD6nq43ruGwyprogevruncEua4MaSbM
         1+eBNW7D6G6uJsMIpstdsCGnJj86qEDvhSqafl0mtSKQDYkfIDb6mGzFeBF3OUEKRMZM
         L4mZSo15sOWBPTT8wZxQW//84YtKjzEh9OQIW6ae2Z5ep7LHcvVnEzFQwBLjbFApFOaG
         WWWI9omcq58MAy7wy/9cK+ajQyviPPswt7H7BJTuyc8RWl16///X8vYS1edadMQqHKaS
         N/gA==
X-Forwarded-Encrypted: i=1; AJvYcCU+pMpGL+8T7kishsqvJxui3Hhzb291Swp+ViZcwbryOt5I9IoRbR5reBTs4oCilQfA/6asG23/N/S6SMXqonMsWV0=@vger.kernel.org, AJvYcCU1vqlhgNgg0ZZTtpl31pRlrqlJHJn7kFQ8THbsb2Nvd6X79/eEhkOFKrgKBVuDdRMhh2vvK+yXKECQ@vger.kernel.org, AJvYcCW9zXnXq1sHBPRPwO9k00U6LF4TzdJFE7us6UHyejgffs2LZM2AZHSS2yF+/lzyMTG08+I5ork9NG3VgOyY@vger.kernel.org
X-Gm-Message-State: AOJu0YyhSIf79MMm8iunmns950XtDI8JmF0rI75yNVrIynLpOQNZu0jU
	TUeC/Hpi/uBK24tiy3iAw14NqXzTuwlzVduceTFP0ZM/qkxvoJno4VKS
X-Gm-Gg: ASbGncudWzAqBtNnMWMmvQfxUlY6159ijW6MlKr2oLvYwv4+5a4lW3CRKvyMTYJiwxY
	/8IDQphn7gz6tRxbN3g2k8vJ3FLb2rKxjolHwTaFCf/7YvKtuxqdv/vW05wdDwVVTmr256Et8HR
	Tv1U+AAKQN8PzQYMIw/Ocp9EXzC8rfMUjU67uNMMVyw1xtsgSH6y6lw2fHJO1y4QE1hzx3I+rnA
	fs4GJhwppq+eL4aVbSbK00Ou8+gPKj68KvJWEwn4NFA2mZouehvaNbk7wiJftuf7RNoGHOeQTK5
	YNLyE/Q93CcXY9h6dx/ABvHV/QP2vV4L7efhGW8CszFaWqeVur76mJrXWTYRUsu2NYLGWlP8hmV
	LZIPHJ5zDw0DwPdgomMvia6fz9/BfLKgCJsSJlKn+F+DISZFVQB+Hc6zm7w==
X-Google-Smtp-Source: AGHT+IELTgxCxxMFlkSEsgovlmb0CJQVYUnnXHGxbgqoK5YwfTIppZeS9BA8X3YNorpanLJ1ufvAzA==
X-Received: by 2002:a05:6000:2c0e:b0:3d7:94bb:cb9d with SMTP id ffacd0b85a97d-3e636d8f2ecmr5327019f8f.3.1757329153628;
        Mon, 08 Sep 2025 03:59:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:59:13 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/3] net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
Date: Mon,  8 Sep 2025 11:59:00 +0100
Message-ID: <20250908105901.3198975-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare for adding RZ/T2H SoC support by making the driver configuration
selectable via OF match data. While the RZ/V2H(P) and RZ/T2H use the same
version of the Synopsys DesignWare MAC (version 5.20), the hardware is
synthesized with different options. To accommodate these differences,
introduce a struct holding per-SoC configuration such as clock list,
number of clocks, TX clock rate control, and STMMAC flags, and retrieve
it from the device tree match entry during probe.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Made sure STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is
  always set for all the SoCs.

v1->v2:
- No changes.
---
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 57 +++++++++++++++----
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index df4ca897a60c..50be944ee37b 100644
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
+	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			   gbeth->of_data->stmmac_flags;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
+	.clks = renesas_gbeth_clks,
+	.num_clks = ARRAY_SIZE(renesas_gbeth_clks),
+	.handle_reset = true,
+	.set_clk_tx_rate = true,
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
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


