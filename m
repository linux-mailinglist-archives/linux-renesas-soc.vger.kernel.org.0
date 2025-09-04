Return-Path: <linux-renesas-soc+bounces-21394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BDFB44789
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 855893B9E8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB21286419;
	Thu,  4 Sep 2025 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ui0V2EkC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9B284686;
	Thu,  4 Sep 2025 20:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757018399; cv=none; b=frrWf8jduBKNixbTwUT8GYDePzCM36cR+/Z9Ri5yrhwle0cA5Dgx63WLtnZE7xzLhmZUiFEXwZoFPQ6/gGZjM0gsajGWLX9v+AC02aOpW5X9SXv2G1fjRV5N+s9l0B6h/u+bkGX03w+U266WnwjedqVncGJikZLzId+ZHKp2xAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757018399; c=relaxed/simple;
	bh=4bAKkh6BD6JmetgbkSB16uXZqYYxr163qG0AcTsPvNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzwBTRX+4l4+EJx+KSnmpWCu0XZkzgZ83RWlWg1+F+13+pAiEmFqqSXM7qqyKlvvahryITwwXI+6/t9d2qK5vREgGf9gu71RnK2I/z7ptJaCI7dX8w1WEBxGjRkqpHF/llrtrnPXLafdKvHami+SYpA06vHzuVvOXjTiNGAGNGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ui0V2EkC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b7722ea37so8005065e9.1;
        Thu, 04 Sep 2025 13:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757018396; x=1757623196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdIf5gVpTwGEVzWTa0+48WrGpkdmS6Z3zAuyAh9kXOw=;
        b=Ui0V2EkCIMvsEmjTr2+wp2lOMnT0qvl/ROFwkGw2YOenTKrqCFJ0HFWimVvk3Jp35t
         8p7yfVFRXjq6aHY8nd40k4xgs05skXg2/djTO7bx3mRutEvMuGPXlRrqluP/LAFOWDBU
         IbTPREmqgjCrmNqShbEwmSpoflt3k91gvxUterd+5QhSgiEKbf5OF0+j8DDB9HTWk0t+
         v0HwrnDCVdzqF7b+pL5+iGYJ42N1Qo8rLgTT1o5aya905FLV+25CkEp3K51Ppb2hVVyq
         Jr3ylgYHetiJ+vWwtzwbah82+BxBpRRbk/BYVYJzOb0ppl9cQJgdjkNZ9UZc4tI2wE0O
         zfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757018396; x=1757623196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdIf5gVpTwGEVzWTa0+48WrGpkdmS6Z3zAuyAh9kXOw=;
        b=Ji/DYzkRm6uaeXz3THPOFKoLSrEgJBPRjxItkCHqz8CSUYocu8MVdYDdhZyvgV5zUx
         n86sHua+qBkjMo4IHEoa4zU3TnJCYZX/Mey+671TvTp/isz/9/FjKtV4/OC2UjVdwaEZ
         TpXTVuSXzzAx6iN53EcT5AighRj/SgLbkYrP+uaI3RUvnsQ0g1b7kHunbGOqEL+k44Ep
         jgW6aSlkQ1kCRK/lYQWrsXca3CtsT0h86bWeOSwsBWs9/yRr2P1OipHtvxwDNs3o3pf6
         oYPLA9PAA7KkIs5RkMkomE34sQfYh0/Z6xcWF71AQLfgVflhhnqCJiim2AHVHAdlRzph
         I89Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgL4AMwy07xSMavrCt4hYtMHidoo72qzKQJwLeSP+8dvVCiRaJCF8RD/wfwPRIYYDhpR1arXLZ2Lc+g6n1CDp6LT0=@vger.kernel.org, AJvYcCWeUZ1HmfzlutiYvRSWHRtXpdeW4zTR6l8I8BGYocjkjjP3V109E3jfQJwUxbT+1vp/oXR6eWIzjW+V@vger.kernel.org, AJvYcCXwPf4yWYDbqG7XKkQP/ytOQ9ucmESmkdfJ8CsukMHW79KG1uPTBRs43WzMQ/Cuka0HjvBSaQgH+urqwnrU@vger.kernel.org
X-Gm-Message-State: AOJu0YwIyyBdA8z0OEziKB0GL8fN6tKse0faOzqvjVU2Yqq2Xi/cmaXS
	hK7fGokOtiXf9VFAOgcEW6RXwdLqbObLD9GjEWV8S2LqrL/Rs2DG0bAg
X-Gm-Gg: ASbGncsK7tsJZAnm+cznhp97sszwFoMEvoyYKW7VWBqT9375wi6BhJRSCVAZCK2kfNB
	6WmSoeaTq6zwe+MYGX+8MWbb1th/gtoeWzulGHzDdi5OJqcadJOxFkiCuJujWwLysLzyAJmRQPh
	O17UutEhW3TfquNKHOzrNnaC7I59hLrxSLokMe9Hx3p7JYsqYQaLkBSo8fuJQjx9jujswi+AESY
	YXdUg2pJvhwQuKbdkGDUQ8N7UX10SDy4RyRbxoj1RwNCSd4M26L5dRo3Pszte9hIp0PeSThoGcG
	sFq0TTJ6fe/vpJKLLRE4OqkVIQnDVVIDl1tgaMaTg5WyFlLZo6wKT8hTbGkih9ZZuJ9TmPEZU5T
	+A2kMBmo/9DwiuXvrzTAFmCdEpHvy+8dd/wDPxRy6t8XlpRZ9C4dfnjwuSw==
X-Google-Smtp-Source: AGHT+IHRTq0c9/U3clgYS/p+MF96IzAw4NdSVmzLuPTx5EY7YzBTRKNNSm4tAMGAq21gTWaRf+ycWg==
X-Received: by 2002:a05:600c:350e:b0:45b:47e1:ef7b with SMTP id 5b1f17b1804b1-45dd5b5f591mr9778465e9.17.1757018396031;
        Thu, 04 Sep 2025 13:39:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c93sm385528165e9.14.2025.09.04.13.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:39:55 -0700 (PDT)
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
Subject: [PATCH net-next v2 2/3] net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
Date: Thu,  4 Sep 2025 21:39:48 +0100
Message-ID: <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare for adding RZ/T2H SoC support by making the driver configuration
selectable via OF match data. While the RZ/V2H(P) and RZ/T2H use the same
version of the Synopsys DesignWare MAC (version 5.20), the hardware is
synthesized with different options. To accommodate these differences,
introduce a struct holding per-SoC configuration such as clock list,
number of clocks, TX clock rate control, and STMMAC flags, and retrieve
it from the device tree match entry during probe.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes
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


