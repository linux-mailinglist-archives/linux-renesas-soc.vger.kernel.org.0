Return-Path: <linux-renesas-soc+bounces-22118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EFFB8D9CC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Sep 2025 13:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBF5B189D4F5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Sep 2025 11:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CD91F78E6;
	Sun, 21 Sep 2025 11:19:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5599217C77;
	Sun, 21 Sep 2025 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758453545; cv=none; b=NKqlQM1GJM1lmAzj81PIeIz4iX+LNRqSBlWC6llzbIE2UnZw0ZTWr8xY3Bskn69eqglh3Dz9VZxjri03sLmh2Cl1h/v3Q4rxjyDB/bqwir3m8fR86QjjYniORDF5jVkCbOOUnMkEiLbgiS27NXfviYcMX2d4PbscY4dgnrwiPoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758453545; c=relaxed/simple;
	bh=+k1EK6R8XHlzTNlhK3lcLoKxPRU0a92elkKWdtsW4sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aY+a4XCf6fWUDWGqu0tSAkj7GETCFY91ux6cDnC57lwvLwFIJHPy0VlCltPuBCiy5IvTQo4cYBMhqNO7DK0+ZKiFx8Lz01Eh2toikWND3Tq8U1LzY2lpxHqC1E3DWuKx6sXzRXirrDBB2B1uvTXHKbuoQaOjStost83MdsKMvxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 0WVm7JRbTvaMOEkEriQlHA==
X-CSE-MsgGUID: z37TRNCaQTiGA39SFDxpqg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Sep 2025 20:19:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.3])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E53C6400091E;
	Sun, 21 Sep 2025 20:18:57 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] memory: renesas-rpc-if: Add suspend/resume support
Date: Sun, 21 Sep 2025 12:18:52 +0100
Message-ID: <20250921111855.103566-1-biju.das.jz@bp.renesas.com>
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
 drivers/memory/renesas-rpc-if.c | 56 ++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 4a417b693080..e1fba157982f 100644
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
@@ -1025,16 +1027,14 @@ static int rpcif_probe(struct platform_device *pdev)
 	 * disable it in remove().
 	 */
 	if (rpc->info->type == XSPI_RZ_G3E) {
-		struct clk *spi_clk;
-
-		spi_clk = devm_clk_get_enabled(dev, "spix2");
-		if (IS_ERR(spi_clk))
-			return dev_err_probe(dev, PTR_ERR(spi_clk),
+		rpc->spix2_clk = devm_clk_get_enabled(dev, "spix2");
+		if (IS_ERR(rpc->spix2_clk))
+			return dev_err_probe(dev, PTR_ERR(rpc->spix2_clk),
 					     "cannot get enabled spix2 clk\n");
 
-		spi_clk = devm_clk_get_enabled(dev, "spi");
-		if (IS_ERR(spi_clk))
-			return dev_err_probe(dev, PTR_ERR(spi_clk),
+		rpc->spi_clk = devm_clk_get_enabled(dev, "spi");
+		if (IS_ERR(rpc->spi_clk))
+			return dev_err_probe(dev, PTR_ERR(rpc->spi_clk),
 					     "cannot get enabled spi clk\n");
 	}
 
@@ -1063,6 +1063,43 @@ static void rpcif_remove(struct platform_device *pdev)
 	platform_device_unregister(rpc->vdev);
 }
 
+static int rpcif_suspend(struct device *dev)
+{
+	struct rpcif_priv *rpc = dev_get_drvdata(dev);
+
+	if (rpc->info->type == XSPI_RZ_G3E) {
+		clk_disable_unprepare(rpc->spi_clk);
+		clk_disable_unprepare(rpc->spix2_clk);
+	}
+
+	return 0;
+}
+
+static int rpcif_resume(struct device *dev)
+{
+	struct rpcif_priv *rpc = dev_get_drvdata(dev);
+
+	if (rpc->info->type == XSPI_RZ_G3E) {
+		int ret = clk_prepare_enable(rpc->spix2_clk);
+
+		if (ret) {
+			dev_err(dev, "failed to enable spi x2 clock: %pe\n",
+				ERR_PTR(ret));
+			return ret;
+		}
+
+		ret = clk_prepare_enable(rpc->spi_clk);
+		if (ret) {
+			clk_disable_unprepare(rpc->spix2_clk);
+			dev_err(dev, "failed to enable spi x2 clock: %pe\n",
+				ERR_PTR(ret));
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static const struct rpcif_impl rpcif_impl = {
 	.hw_init = rpcif_hw_init_impl,
 	.prepare = rpcif_prepare_impl,
@@ -1125,12 +1162,15 @@ static const struct of_device_id rpcif_of_match[] = {
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


