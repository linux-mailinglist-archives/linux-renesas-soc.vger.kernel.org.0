Return-Path: <linux-renesas-soc+bounces-16700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB262AAB25E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 06:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F41171B47
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 04:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A844B3379C1;
	Tue,  6 May 2025 00:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAs1wMe1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA83E278756;
	Mon,  5 May 2025 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485749; cv=none; b=fHAMB2m2l5H/ssSdDZ+FRbGXfQo+V6EuR0MuJyvWiQePR/6mNQhLlJ9i7B1IUCT6ApVqB2zM87VJBBeewBns4jgQaeBnOn4zqPWMHUIbzUuECcZCO0bZqXK3KOGWvES9MCw4zrVQu6AKb9GQErM1hA54TlSm4cgQsC1a4FbqioA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485749; c=relaxed/simple;
	bh=0BuTBr0C59E9qlzxwKYDLEEcHNLFQ4OLcJ9A0iAYOI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gXrdzWmuz6OgHXiRULBAS1eSRXZBhezvWek4vtRVS3cxeIL89pQCrnpxGkUEVE+s5eKojSBZX6Epz3oOtgfk5Ae4TBIRWZgtwgnixcU86HH/8dIOya9GEaXrmMzaTbspSPFq7Z+Lz9glX/r1E8Z+Svh/hSSWWYAH1hlRluMICNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAs1wMe1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92BB9C4CEE4;
	Mon,  5 May 2025 22:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485749;
	bh=0BuTBr0C59E9qlzxwKYDLEEcHNLFQ4OLcJ9A0iAYOI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OAs1wMe1RBSwoSX1Lj6ue1TLg0ipnuFd1V/XAgJNF0MHWj01hxcwRapnW9+xDNh+v
	 9paFKNu0GWERa1bTMC0YAncxGiMJPPRa4uBAKyuvux3Z9NhmspjktpO18FZEY06PGS
	 RTNYRosQD82C/f6TXmwrbEku1RHrHoB9Zv9+3WcSVCNWT/A43u9nMkB84mhVhQCsvw
	 Ky+tdqQ2qG3ani/tYOWjOe10Iy8QFUnDWeOKEUtvEEUp+/4qp6z+Vfvm0ad7GggSiP
	 WybpI6C2lLl9FMP8wEwAirHmTaSaJfqGVC4O/kRTQvfFOfqb8TnOVGpHhmTkRRVdaX
	 r+tCoXatg8dpw==
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
Subject: [PATCH AUTOSEL 6.12 461/486] clk: renesas: rzg2l-cpg: Refactor Runtime PM clock validation
Date: Mon,  5 May 2025 18:38:57 -0400
Message-Id: <20250505223922.2682012-461-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 229f4540b219e..97d42328fa81a 100644
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


