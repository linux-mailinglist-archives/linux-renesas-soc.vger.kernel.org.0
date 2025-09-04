Return-Path: <linux-renesas-soc+bounces-21350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB9BB440AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE05E4838ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4E62045B6;
	Thu,  4 Sep 2025 15:31:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20AC1FBE8B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999865; cv=none; b=FtcLY9ho9ZNezL0ArX49jmuF6zKX+CxIzbAwX2mENpghAWakeuC8LgWVHkZSdE7k4EnnEezTtvoJkE5SoRbOGFFFaYY9IVXpR1nt3o67io4D8TyqIv4l8xrjZ/uKIc8aMvN9tJgePv14E8Yv0EMXoUhblNim3ISHpWqIFegBZ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999865; c=relaxed/simple;
	bh=n5iHJOnI0j1eRe6tMY0PgAEoRRJ5RVQC5W1wPTVEJZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rJqWK08n+qvNj9w4m9Qzr0QrBkNIqS/6D2b//7cnON1X1kgZOlxWb1FKSc/x0AzLqZgDucNJaq8puHesbrN0cy+DCi8atRwvCr/zu9i66Md4j9yMYsDLnF1R3vI1sOR3jzFC4kHXmDYRoKCQVV7C3AXFrg7IS4lbBbYANe/Zp9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9192CC4CEF0;
	Thu,  4 Sep 2025 15:31:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: rcar-du: lvds: Convert to RUNTIME_PM_OPS()
Date: Thu,  4 Sep 2025 17:31:00 +0200
Message-ID: <2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas R-Car Display Unit LVDS driver from
SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS(), and pm_ptr().  This reduces
kernel size in case CONFIG_PM is disabled.  While DRM_RCAR_LVDS depends
on PM, the code may still serve as an example for new drivers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 4dcb36dc0bff6e53..6d44238c4078a425 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -1013,7 +1013,7 @@ static int rcar_lvds_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rcar_lvds_pm_ops = {
-	SET_RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
 };
 
 static struct platform_driver rcar_lvds_platform_driver = {
@@ -1021,7 +1021,7 @@ static struct platform_driver rcar_lvds_platform_driver = {
 	.remove		= rcar_lvds_remove,
 	.driver		= {
 		.name	= "rcar-lvds",
-		.pm	= &rcar_lvds_pm_ops,
+		.pm	= pm_ptr(&rcar_lvds_pm_ops),
 		.of_match_table = rcar_lvds_of_table,
 	},
 };
-- 
2.43.0


