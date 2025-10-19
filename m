Return-Path: <linux-renesas-soc+bounces-23291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAA4BEEB25
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Oct 2025 20:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF1D3E3BF8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Oct 2025 18:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824D921578D;
	Sun, 19 Oct 2025 18:09:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D841354AF5;
	Sun, 19 Oct 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760897391; cv=none; b=en4bDw8u67fOR0Bppi0wXziIQSRa4NpuKR26hk3Y0xw0mxVfq1/Oc7KSNHlzfhT4zK4EH8P0zsaHpHLK3UuP+fn46NFZtTFygo80SLKtHTOwjfDJuXhX7mA2z9UW0t+sLBOd/EyXF7WiaMQqJQDvoR1F4bipI1Vw4aqMDO7L38k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760897391; c=relaxed/simple;
	bh=1s/E+4UuhXkmpiQSP7u/Fxy40AeWIe7gKB/kBft+5ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OuCzA2SMOoabQAwAo975rk15lLl9riW06tDOUQx3+1VJu5AVfAq6mZNjazGLIrroI4pFrSvbZ4803NFC3Qe9kORmgozjEe3+QCaKfFCw8wlCA61v/H3R8S/mGI8PGPmjeCS1XdwBcWZnPp/37Shv4g1eWnDw6OBT2R0aEjWzRHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: wkTttOjoScKQXhFD8jWnEQ==
X-CSE-MsgGUID: dVEc255bTBmKVO+lcYOyXA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 Oct 2025 03:09:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.26])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1F2D44040E4E;
	Mon, 20 Oct 2025 03:09:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] memory: renesas-rpc-if: Add suspend/resume support
Date: Sun, 19 Oct 2025 19:09:38 +0100
Message-ID: <20251019180940.157088-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RZ/G3E using PSCI, s2ram powers down the SoC. Add suspend/resume
callbacks to control spi/spix2 clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated spix2_clk and spi_clk to optional.
 * Dropped rpc->info->type from suspend/resume callbacks.
v1->v2:
 * Updated error messages in rpcif_resume().
---
 drivers/memory/renesas-rpc-if.c | 58 +++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 4a417b693080..58ccc1c02e90 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -67,6 +67,8 @@ struct rpcif_priv {
 	void __iomem *dirmap;
 	struct regmap *regmap;
 	struct reset_control *rstc;
+	struct clk *spi_clk;
+	struct clk *spix2_clk;
 	struct platform_device *vdev;
 	size_t size;
 	const struct rpcif_info *info;
@@ -1024,19 +1026,15 @@ static int rpcif_probe(struct platform_device *pdev)
 	 * flash write failure. So, enable these clocks during probe() and
 	 * disable it in remove().
 	 */
-	if (rpc->info->type == XSPI_RZ_G3E) {
-		struct clk *spi_clk;
-
-		spi_clk = devm_clk_get_enabled(dev, "spix2");
-		if (IS_ERR(spi_clk))
-			return dev_err_probe(dev, PTR_ERR(spi_clk),
-					     "cannot get enabled spix2 clk\n");
-
-		spi_clk = devm_clk_get_enabled(dev, "spi");
-		if (IS_ERR(spi_clk))
-			return dev_err_probe(dev, PTR_ERR(spi_clk),
-					     "cannot get enabled spi clk\n");
-	}
+	rpc->spix2_clk = devm_clk_get_optional_enabled(dev, "spix2");
+	if (IS_ERR(rpc->spix2_clk))
+		return dev_err_probe(dev, PTR_ERR(rpc->spix2_clk),
+				     "cannot get enabled spix2 clk\n");
+
+	rpc->spi_clk = devm_clk_get_optional_enabled(dev, "spi");
+	if (IS_ERR(rpc->spi_clk))
+		return dev_err_probe(dev, PTR_ERR(rpc->spi_clk),
+				     "cannot get enabled spi clk\n");
 
 	vdev = platform_device_alloc(name, pdev->id);
 	if (!vdev)
@@ -1063,6 +1061,37 @@ static void rpcif_remove(struct platform_device *pdev)
 	platform_device_unregister(rpc->vdev);
 }
 
+static int rpcif_suspend(struct device *dev)
+{
+	struct rpcif_priv *rpc = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(rpc->spi_clk);
+	clk_disable_unprepare(rpc->spix2_clk);
+
+	return 0;
+}
+
+static int rpcif_resume(struct device *dev)
+{
+	struct rpcif_priv *rpc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(rpc->spix2_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable spix2 clock: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	ret = clk_prepare_enable(rpc->spi_clk);
+	if (ret) {
+		clk_disable_unprepare(rpc->spix2_clk);
+		dev_err(dev, "failed to enable spi clock: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct rpcif_impl rpcif_impl = {
 	.hw_init = rpcif_hw_init_impl,
 	.prepare = rpcif_prepare_impl,
@@ -1125,12 +1154,15 @@ static const struct of_device_id rpcif_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rpcif_of_match);
 
+static DEFINE_SIMPLE_DEV_PM_OPS(rpcif_pm_ops, rpcif_suspend, rpcif_resume);
+
 static struct platform_driver rpcif_driver = {
 	.probe	= rpcif_probe,
 	.remove = rpcif_remove,
 	.driver = {
 		.name =	"rpc-if",
 		.of_match_table = rpcif_of_match,
+		.pm = pm_sleep_ptr(&rpcif_pm_ops),
 	},
 };
 module_platform_driver(rpcif_driver);
-- 
2.43.0


