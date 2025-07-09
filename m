Return-Path: <linux-renesas-soc+bounces-19441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47701AFF101
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9819B176AF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 18:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9860239E95;
	Wed,  9 Jul 2025 18:43:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D197921B8FE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Jul 2025 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086612; cv=none; b=Tdc7xzJfKAyt0hbiVlhlkl1f3H9Y0hc4eRGhHeVZ2VoktNgSllJ7OkXNwa+qUKW49KNvRKTKd3Xo5Xk4Zc/0DIG2/rjuvKTex3BK/X72qs/3uhDaBE3DDpiS6vWpBMFa1LFDyO6CCxRfDu9CUmBWyO2w2Uwa0PngR9JWBjcFZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086612; c=relaxed/simple;
	bh=Y/wT4ZYcx2D26jZlMMCt66WIadzihDxZEXzmgKsjQ3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tl/fGG6A+bIT4xPZS3F1nfcr77SpiFf7fwYWeSuF7vS/kDDB823+j7R78SNNwVxJvWDyOT5Jy94kb6WffWGeX/RDoDK4MmttA9h0WU9zEt8KxwTML7v7lIW8z5na99Iplsjc/lBfD1b1iBfyHW9j2wGTwEUiwdJQfZmrfAeoGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DDFBC4CEEF;
	Wed,  9 Jul 2025 18:43:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to RUNTIME_PM_OPS()
Date: Wed,  9 Jul 2025 20:43:25 +0200
Message-ID: <cdfc1b8ec9e62553654639b9e9026bfed8dd07d1.1752086582.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas RZ/G2L MIPI DSI Encoder driver from
SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS() and pm_ptr().  This lets us
drop the __maybe_unused annotations from its runtime suspend and resume
callbacks, and reduces kernel size in case CONFIG_PM is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f87337c3cbb54559..3b52dfc0ea1e04e6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -913,7 +913,7 @@ static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops = {
  * Power Management
  */
 
-static int __maybe_unused rzg2l_mipi_pm_runtime_suspend(struct device *dev)
+static int rzg2l_mipi_pm_runtime_suspend(struct device *dev)
 {
 	struct rzg2l_mipi_dsi *dsi = dev_get_drvdata(dev);
 
@@ -923,7 +923,7 @@ static int __maybe_unused rzg2l_mipi_pm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rzg2l_mipi_pm_runtime_resume(struct device *dev)
+static int rzg2l_mipi_pm_runtime_resume(struct device *dev)
 {
 	struct rzg2l_mipi_dsi *dsi = dev_get_drvdata(dev);
 	int ret;
@@ -940,7 +940,7 @@ static int __maybe_unused rzg2l_mipi_pm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rzg2l_mipi_pm_ops = {
-	SET_RUNTIME_PM_OPS(rzg2l_mipi_pm_runtime_suspend, rzg2l_mipi_pm_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rzg2l_mipi_pm_runtime_suspend, rzg2l_mipi_pm_runtime_resume, NULL)
 };
 
 /* -----------------------------------------------------------------------------
@@ -1072,7 +1072,7 @@ static struct platform_driver rzg2l_mipi_dsi_platform_driver = {
 	.remove = rzg2l_mipi_dsi_remove,
 	.driver	= {
 		.name = "rzg2l-mipi-dsi",
-		.pm = &rzg2l_mipi_pm_ops,
+		.pm = pm_ptr(&rzg2l_mipi_pm_ops),
 		.of_match_table = rzg2l_mipi_dsi_of_table,
 	},
 };
-- 
2.43.0


