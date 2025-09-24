Return-Path: <linux-renesas-soc+bounces-22329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF252B9A03B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF75B2A43D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487AA2DF126;
	Wed, 24 Sep 2025 13:20:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3003022069E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758720038; cv=none; b=tz4HtWr6AjBVgo568FCcKCFttWYh6Yg1qf4fP7WUhKcmZjwOFd8SfWWAfc+xkGjgp1uYZ8Z/zR0waLCL7rFjXCr0HMPwrdr2uajJekMxYlz2lGQmQOYFk3e5rSI5FHqk52jjEWctt40GhImJNBCGc32eSN9bWY73XXKDnblmpWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758720038; c=relaxed/simple;
	bh=AppEkqoEDTCVorztpnXVqb3RGurzcRqssTLsYWCO5Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTJmXdnzT8B62r3HngyRxpvpUZ7D1GhuNTuLjfQWlOF4ysGJWG2DQAlP4W1VU2p5ugTgyoKfM0ttW5Est+/zthlsGPLoLHkKWXafdupIVeTlXwsPgI9p0M/7OuiUqY3xE4/lQ6EGZ3zWSwxR6lHG7XqE/yLOLU0835rFgYT8EZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E48C4CEF7;
	Wed, 24 Sep 2025 13:20:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] phy: renesas: Remove unneeded semicolons
Date: Wed, 24 Sep 2025 15:20:31 +0200
Message-ID: <a8807dafa87fcc3abcafd34a1895e4c722c39793.1758719985.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Semicolons after end of function braces are not needed, remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/phy/renesas/phy-rcar-gen3-pcie.c | 2 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 2 +-
 drivers/phy/renesas/phy-rcar-gen3-usb3.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-pcie.c b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
index feca4cb2ff4d1e9e..c0e5a4ac82de2cfb 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-pcie.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
@@ -128,7 +128,7 @@ static int rcar_gen3_phy_pcie_probe(struct platform_device *pdev)
 static void rcar_gen3_phy_pcie_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-};
+}
 
 static struct platform_driver rcar_gen3_phy_driver = {
 	.driver = {
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 3f6b480e10922950..6671616b26cec7c2 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -926,7 +926,7 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 
 	reset_control_assert(channel->rstc);
 	pm_runtime_disable(&pdev->dev);
-};
+}
 
 static struct platform_driver rcar_gen3_phy_usb2_driver = {
 	.driver = {
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb3.c b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
index 5c267d148c90bef9..0420f5b283ce4233 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb3.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
@@ -202,7 +202,7 @@ static int rcar_gen3_phy_usb3_probe(struct platform_device *pdev)
 static void rcar_gen3_phy_usb3_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-};
+}
 
 static struct platform_driver rcar_gen3_phy_usb3_driver = {
 	.driver = {
-- 
2.43.0


