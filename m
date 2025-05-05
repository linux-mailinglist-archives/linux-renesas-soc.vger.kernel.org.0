Return-Path: <linux-renesas-soc+bounces-16698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F082AAA79D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 02:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09AC21899317
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 00:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2A62989C0;
	Mon,  5 May 2025 22:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7Y0RWab"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AC729375D;
	Mon,  5 May 2025 22:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484653; cv=none; b=QS05fsYwRWdZ2EvifVS+NNUWs9dc+O3M4+qxDm+TWQnfyFPdR8w4kAqG559Z95df4kQ0/isaIGoLm82bA/ZNh+OnU9lV4dtxQTghwk7JV8noPEC3Zj7eL+HGc0ZXq2G9o4qBrBvVVEshvFOeYZVXLNd15MQaRhYfHrkavriE930=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484653; c=relaxed/simple;
	bh=eoIQoM66ncPr3cCGzotQUKBoAFuCUA2XUUoSQhH1K6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WMtsfouXIV7dV7OlV9JVjEJc6g9YVAc9Pe3lrsHl+ESRNLKXTpjLIxDexKQcTIppeFEaLRsvlw7YEHC/Gpo97df+ODA4gLDawQ+TQSgH9Uko6+7P4TI1uQF2rQzeGHa3bHLgXZPoW5Anc0AtyqgTUOzecZLR/fK2g2CzyRra0Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7Y0RWab; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80660C4CEE4;
	Mon,  5 May 2025 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484652;
	bh=eoIQoM66ncPr3cCGzotQUKBoAFuCUA2XUUoSQhH1K6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7Y0RWabhTpwbLHEankzebxXzvdugPgtLM/ArYaeuaMg66QE7GFUSUAi7a8ikrGuW
	 60C7RFhONDVDXeKhSyJI4Xtqo18zRogRRzrl52XJHkzxwcTWUPr9VBmqUs/mPSN5BY
	 GKqDENuwYQltiGhjaBm2X8aTi+a1NX59dRECx8Ql6ujyQCAVleulNd/n2OG0n7Oe8n
	 oy+fSCb/gIivGBsG46Y9AMLFJz/Q60y+An5j12fOCr7ZkhlY7Gs17zi2qqYYjwy6NN
	 2cfedqrq1iUHEan18temOS0Td8GzXE990P5kjIQkI6jqNhys/kzbytRHmRRuP4EQko
	 W7YXTwzVywAtQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 585/642] clk: renesas: rzg2l-cpg: Refactor Runtime PM clock validation
Date: Mon,  5 May 2025 18:13:21 -0400
Message-Id: <20250505221419.2672473-585-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

[ Upstream commit f6f73b891bf6beff069fcacc7b4a796e1009bf26 ]

Refactor rzg2l_cpg_attach_dev to delegate clock validation for Runtime PM
to the updated rzg2l_cpg_is_pm_clk function. Ensure validation of clocks
associated with the power domain while excluding external and core clocks.
Prevent incorrect Runtime PM management for clocks outside the domain's
scope.

Update rzg2l_cpg_is_pm_clk to operate on a per-power-domain basis. Verify
clkspec.np against the domain's device node, check argument validity, and
validate clock type (CPG_MOD). Use the no_pm_mod_clks array to exclude
specific clocks from PM management.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/20241216210201.239855-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/renesas/rzg2l-cpg.c | 102 +++++++++++++++++---------------
 1 file changed, 54 insertions(+), 48 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 4bd8862dc82be..91928db411dcd 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1549,28 +1549,6 @@ static int rzg2l_cpg_reset_controller_register(struct rzg2l_cpg_priv *priv)
 	return devm_reset_controller_register(priv->dev, &priv->rcdev);
 }
 
-static bool rzg2l_cpg_is_pm_clk(struct rzg2l_cpg_priv *priv,
-				const struct of_phandle_args *clkspec)
-{
-	const struct rzg2l_cpg_info *info = priv->info;
-	unsigned int id;
-	unsigned int i;
-
-	if (clkspec->args_count != 2)
-		return false;
-
-	if (clkspec->args[0] != CPG_MOD)
-		return false;
-
-	id = clkspec->args[1] + info->num_total_core_clks;
-	for (i = 0; i < info->num_no_pm_mod_clks; i++) {
-		if (info->no_pm_mod_clks[i] == id)
-			return false;
-	}
-
-	return true;
-}
-
 /**
  * struct rzg2l_cpg_pm_domains - RZ/G2L PM domains data structure
  * @onecell_data: cell data
@@ -1595,45 +1573,73 @@ struct rzg2l_cpg_pd {
 	u16 id;
 };
 
+static bool rzg2l_cpg_is_pm_clk(struct rzg2l_cpg_pd *pd,
+				const struct of_phandle_args *clkspec)
+{
+	if (clkspec->np != pd->genpd.dev.of_node || clkspec->args_count != 2)
+		return false;
+
+	switch (clkspec->args[0]) {
+	case CPG_MOD: {
+		struct rzg2l_cpg_priv *priv = pd->priv;
+		const struct rzg2l_cpg_info *info = priv->info;
+		unsigned int id = clkspec->args[1];
+
+		if (id >= priv->num_mod_clks)
+			return false;
+
+		id += info->num_total_core_clks;
+
+		for (unsigned int i = 0; i < info->num_no_pm_mod_clks; i++) {
+			if (info->no_pm_mod_clks[i] == id)
+				return false;
+		}
+
+		return true;
+	}
+
+	case CPG_CORE:
+	default:
+		return false;
+	}
+}
+
 static int rzg2l_cpg_attach_dev(struct generic_pm_domain *domain, struct device *dev)
 {
 	struct rzg2l_cpg_pd *pd = container_of(domain, struct rzg2l_cpg_pd, genpd);
-	struct rzg2l_cpg_priv *priv = pd->priv;
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args clkspec;
 	bool once = true;
 	struct clk *clk;
+	unsigned int i;
 	int error;
-	int i = 0;
-
-	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
-					   &clkspec)) {
-		if (rzg2l_cpg_is_pm_clk(priv, &clkspec)) {
-			if (once) {
-				once = false;
-				error = pm_clk_create(dev);
-				if (error) {
-					of_node_put(clkspec.np);
-					goto err;
-				}
-			}
-			clk = of_clk_get_from_provider(&clkspec);
+
+	for (i = 0; !of_parse_phandle_with_args(np, "clocks", "#clock-cells", i, &clkspec); i++) {
+		if (!rzg2l_cpg_is_pm_clk(pd, &clkspec)) {
 			of_node_put(clkspec.np);
-			if (IS_ERR(clk)) {
-				error = PTR_ERR(clk);
-				goto fail_destroy;
-			}
+			continue;
+		}
 
-			error = pm_clk_add_clk(dev, clk);
+		if (once) {
+			once = false;
+			error = pm_clk_create(dev);
 			if (error) {
-				dev_err(dev, "pm_clk_add_clk failed %d\n",
-					error);
-				goto fail_put;
+				of_node_put(clkspec.np);
+				goto err;
 			}
-		} else {
-			of_node_put(clkspec.np);
 		}
-		i++;
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (IS_ERR(clk)) {
+			error = PTR_ERR(clk);
+			goto fail_destroy;
+		}
+
+		error = pm_clk_add_clk(dev, clk);
+		if (error) {
+			dev_err(dev, "pm_clk_add_clk failed %d\n", error);
+			goto fail_put;
+		}
 	}
 
 	return 0;
-- 
2.39.5


