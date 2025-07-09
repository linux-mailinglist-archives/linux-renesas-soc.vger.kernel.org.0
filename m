Return-Path: <linux-renesas-soc+bounces-19440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B45AFF0FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EDB95A5091
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 18:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6563E239E96;
	Wed,  9 Jul 2025 18:42:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482E6239E66;
	Wed,  9 Jul 2025 18:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086575; cv=none; b=eYOSvuZWM0Q9v2d8jLEI2D3aPYWCCBAkmWcyVEHHwB/Sc4nVguGA2NRZF5whrEGXZFZ2HezUgSX8wP9Ng6iqvve3yAkDV3ZP7Wim9uFa/n+HW7BGinA8JFSyITdyq/lLUK3P/xOPFBV2fZR3fO7vDdi1fdzA3ElskNp5hJbM+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086575; c=relaxed/simple;
	bh=c+Ii+cy4rY7I45Oe9IFyCtJ/fWJpZVQc3urqpazAaSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VtJKqMIDOQlniPE3BU/2iQJ4nI72jp+FGQTAuIsv0KuOiKwoBNQlnDl6oNkVGos8a1eObxjlIhU9XJ9MN9TUgD1sn0YqSmUW/zi1V80Y079U7CqNq4+H/o3g7/xaBCXh6Z5rm03gVfcEsKOVYvr93L9E/yzdHunBHgMIpcAMNHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E32FC4CEEF;
	Wed,  9 Jul 2025 18:42:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marek Vasut <marex@denx.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: rs9: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 20:42:49 +0200
Message-ID: <a7bc0f16c3592e5e0e8e6393bd4d06eb2e2487e4.1752086505.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas 9-series PCIe clock generator driver from
SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
This lets us drop the __maybe_unused annotations from its suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk-renesas-pcie.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 4c3a5e4eb77ac6a1..2bf15b2f5de3fc3e 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -354,7 +354,7 @@ static int rs9_probe(struct i2c_client *client)
 	return ret;
 }
 
-static int __maybe_unused rs9_suspend(struct device *dev)
+static int rs9_suspend(struct device *dev)
 {
 	struct rs9_driver_data *rs9 = dev_get_drvdata(dev);
 
@@ -364,7 +364,7 @@ static int __maybe_unused rs9_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rs9_resume(struct device *dev)
+static int rs9_resume(struct device *dev)
 {
 	struct rs9_driver_data *rs9 = dev_get_drvdata(dev);
 	int ret;
@@ -410,12 +410,12 @@ static const struct of_device_id clk_rs9_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
 
-static SIMPLE_DEV_PM_OPS(rs9_pm_ops, rs9_suspend, rs9_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rs9_pm_ops, rs9_suspend, rs9_resume);
 
 static struct i2c_driver rs9_driver = {
 	.driver = {
 		.name = "clk-renesas-pcie-9series",
-		.pm	= &rs9_pm_ops,
+		.pm	= pm_sleep_ptr(&rs9_pm_ops),
 		.of_match_table = clk_rs9_of_match,
 	},
 	.probe		= rs9_probe,
-- 
2.43.0


