Return-Path: <linux-renesas-soc+bounces-22229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB41EB96846
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 17:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6F2618A15DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 15:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7562417D9;
	Tue, 23 Sep 2025 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5uD2LfT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1A31E0B9C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758640482; cv=none; b=BreJZt0D8E+hpbraIdsgIwx9uh8MudvbJQu2GKcuA+qRXa6AN9kq/4+8HYs0xasq0ZURPcq/Fl271rxd1uP1W4P0U43MvDxujOliJ9/A91jJiIlC7U8Ls3oXgo3d/GC44cceMhgRiudWZ+6Uw6J1yqiG5qU1IFKjsXAX/x5h3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758640482; c=relaxed/simple;
	bh=1KrVLh9i+3wagyFqRh2yb9A01gM5zJx1I7yzbRkVgqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hYn6eSkzUidQ01BIZrvcrvAxeOby2NLq/11RCi4UXBLrDxkKjL0HopEfYo9HTQfQ6Cv51JMV7EyR31LicySAqobsEpMymHmgzC2krMH9iATXgY3++HFnz8ieL0OSkOOyjEXZzeoGAQaHOwTw0UGlDI3OxIs2YBKQLNk52I1hdQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5uD2LfT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46cbdf513d7so26164555e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758640479; x=1759245279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bSzoRKv9D6242LbOslRZzX/vjvHi3jJdP3+X1xG4QfA=;
        b=Z5uD2LfT0UTWSxcCs+rmnha8QFyTy/f6KfE4wYo4tn2/NYP9iOVEv5icbx6BzurFKU
         cpD1oeJahgfXJYG3y0r+Og5krA90CefrUEbJdVgji+96baOEtSZG5qZ5Wt23ZOW+IOQk
         RYqTRhmXUkx8p4jfYartMf0uJHlIjU/0wL70EEQDoVG4RL1K28UuMTPrneKJz4qT/joj
         S5T0FBn4xwnWVCuWYa0/iKVlbw3Tq//l55N2tz7YXUDUZ3wpshJOzI9J3c2LJxT2+FbI
         hJ6q9fYTmaBYhI9wNa4EY7oCN0nI/AH6pFTx0NbPGk0d8NBcjez1PUA1Pyhd5HsbHztY
         /pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758640479; x=1759245279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSzoRKv9D6242LbOslRZzX/vjvHi3jJdP3+X1xG4QfA=;
        b=NDmlDdP9ZQwPHOBkTbz7zdWglvPowT0QKwpwXt7hALOmwIMcj137zSeMdiO6jbi/e1
         M3rO0kAJKxv4IgQ5nyJj+wLypMKHOmP1jsC/KAPlr6Q+apSmAvFOsZ73rBfCoO6ciFt7
         3j/gcQeVl8xxwGS4xImn3oORS0CR7sh4Pw37zf+t4rOlZh7zemcCxlPa9S3y3ciSGsjz
         nZQRDjWAckew8p22aPp/DUdDuAPiSSjEopYnodINwHa6xO+SBUMWA3pth7NGu8J0REiW
         +FqAiBbVc+/n6BV1Bu8NMevNxM5FcP85PSUbv71EOk8IPPv2wU3cutUlXVPaj4v8ZTu7
         92/A==
X-Forwarded-Encrypted: i=1; AJvYcCXH1lY1ZqL8XH0WY06euK9zy7BI6iAIuQI/Cg2pDG5KI7jfjXRTI5yEuq0JezVm4XbuxFJoOKBWvUyf8y8orvDCfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGY2V3W5utcDiZzbBQcbL140AVpb5x2mtoz8GG8lZmrh+MnQ+3
	i9C++EcSJouyrmcsqnHGXzwN7t4+4a+l8uY9hhLPUlz5ygwVniqU8qL+
X-Gm-Gg: ASbGncsbYVktz7NWjspnBW5CZz6GFCZ29VeJkefuSrj6Tx5Ef1g7rahufsvrxdzmacE
	m5Nn/L3nlYwzHJfzb4qsVdHO29CJg4sN8g6haj1DttShDwbwJE7UZRrfqQxj/jZLvl6qXIvoExx
	WHrFdx1zhO4jWQ3/r2S0yvJKHf0XLSV49X/UpjPsETicpu81GFz0eLsMbZvO051eKhMmyBIA6L7
	Ou1uX+E8CnUAVzZOSbtyvBDvzg7YnCX+0uV9dwUd+4AwdZd7YYmaNVEwU4Wr9ufFJOpd1lXNgnV
	cYAYdu0OwewyKGCKjKB4UaEDjFcsG5x9Z5l8h9aeu/zxkStFVdEyE1ETr2D2jSa3Rlls4/6FsdH
	dhKJbbJ9oOv3CjK1e6jfYVKagfOC2kkOU+fupj//wT/+rXeV6tODJlSqVMvUVjXnuVKOeLMIso8
	I47w==
X-Google-Smtp-Source: AGHT+IFni6TH8MGUWBWjCjHCYhHGXILklcn8cRu2vDbncMqxw2ouu3ZjMQL5xTbf+f9nA3Rt1w8R1w==
X-Received: by 2002:a05:600c:3145:b0:46e:1d01:11dd with SMTP id 5b1f17b1804b1-46e1d9745c1mr25739075e9.2.1758640479096;
        Tue, 23 Sep 2025 08:14:39 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e1ce10bacsm20913985e9.0.2025.09.23.08.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 08:14:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] memory: renesas-rpc-if: Add suspend/resume support
Date: Tue, 23 Sep 2025 16:14:33 +0100
Message-ID: <20250923151437.287721-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G3E using PSCI, s2ram powers down the SoC. Add suspend/resume
callbacks to control spi/spix2 clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated error messages in rpcif_resume().
---
 drivers/memory/renesas-rpc-if.c | 57 ++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 4a417b693080..2bcb05559ccb 100644
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
 
@@ -1063,6 +1063,44 @@ static void rpcif_remove(struct platform_device *pdev)
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
+		int ret;
+
+		ret = clk_prepare_enable(rpc->spix2_clk);
+		if (ret) {
+			dev_err(dev, "failed to enable spix2 clock: %pe\n",
+				ERR_PTR(ret));
+			return ret;
+		}
+
+		ret = clk_prepare_enable(rpc->spi_clk);
+		if (ret) {
+			clk_disable_unprepare(rpc->spix2_clk);
+			dev_err(dev, "failed to enable spi clock: %pe\n",
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
@@ -1125,12 +1163,15 @@ static const struct of_device_id rpcif_of_match[] = {
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


