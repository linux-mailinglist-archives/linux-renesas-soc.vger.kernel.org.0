Return-Path: <linux-renesas-soc+bounces-6096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B97904CB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 09:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB0F1C23E65
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 07:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDB1768FD;
	Wed, 12 Jun 2024 07:23:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7E16C865
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718177004; cv=none; b=fWh3HzBpjKO+LC4FjcXvROxKBy732JKMEG9sppryfeQVFSCxRNyKH19E4Be+v97gBOuD7PW3I5ZDuuwekrKMUwacjHcA17JM0xTz56e6goo7kLWXx6OI0R9TZKVT+JPVsoRQ4HUgTtYmBAwOZn1fU7fbgxXQVFENbHNBloWZnPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718177004; c=relaxed/simple;
	bh=K7rDYSmQm0br0O/8nY7xeJ//jLo9Ur+c/jejdJai0Ts=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IBRLQNtvCZDFGLQP+AVBFS4wGApe/3She32PThH0tvuiHcAHLLS70XtdWRD08IGq6oa71Jb93hp41ngaZI0d83gh0thjx7/FEwac7mZZWR0anvVYrtIO6u8cVUrW7TaRLzHFrY6qEpOlY5vXORDSIGHeTnZOVz2ihLWLL0xI6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:170b:1b4a:247:a009])
	by laurent.telenet-ops.be with bizsmtp
	id aXPG2C00A3axqkY01XPGYN; Wed, 12 Jun 2024 09:23:19 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHIJ8-007OGF-Vs;
	Wed, 12 Jun 2024 09:23:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHIKC-00E9WZ-3I;
	Wed, 12 Jun 2024 09:23:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3] drm: renesas: shmobile: Call drm_atomic_helper_shutdown() at shutdown time
Date: Wed, 12 Jun 2024 09:23:13 +0200
Message-Id: <17c6a5a668e5975f871b77fb1fca6711a0799d9e.1718176895.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Douglas Anderson <dianders@chromium.org>

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown time.
This is important because drm_atomic_helper_shutdown() will cause
panels to get disabled cleanly which may be important for their power
sequencing.  Future changes will remove any custom powering off in
individual panel drivers so the DRM drivers need to start getting this
right.

The fact that we should call drm_atomic_helper_shutdown() in the case of
OS shutdown comes straight out of the kernel doc "driver instance
overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid
[geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
[geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
v3:
  - Add Reviewed-by,
  - Fix remaining references to drm_helper_force_disable_all(),

v2:
  - Add Reviewed-by.

Tested on Atmark Techno Armadillo-800-EVA.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index e83c3e52251dedf9..0250d5f00bf102dc 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -171,6 +171,13 @@ static void shmob_drm_remove(struct platform_device *pdev)
 	drm_kms_helper_poll_fini(ddev);
 }
 
+static void shmob_drm_shutdown(struct platform_device *pdev)
+{
+	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(&sdev->ddev);
+}
+
 static int shmob_drm_probe(struct platform_device *pdev)
 {
 	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
@@ -273,6 +280,7 @@ static const struct of_device_id shmob_drm_of_table[] __maybe_unused = {
 static struct platform_driver shmob_drm_platform_driver = {
 	.probe		= shmob_drm_probe,
 	.remove_new	= shmob_drm_remove,
+	.shutdown	= shmob_drm_shutdown,
 	.driver		= {
 		.name	= "shmob-drm",
 		.of_match_table = of_match_ptr(shmob_drm_of_table),
-- 
2.34.1


