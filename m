Return-Path: <linux-renesas-soc+bounces-3432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA6486FF8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 11:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E4F21F26B7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 10:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A4B25760;
	Mon,  4 Mar 2024 10:53:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D55E20B27
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Mar 2024 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709549638; cv=none; b=LNB5TEwcRWpic5eXE8I5GXo15tYITRAq43BywoBRJ89s4SajVmcQpoRXKA41SyVHOW8iFf3acS+mPhE/beNAVOs+ITbrqEhUehbGwR6Hb8S7wSWF1aZooLGY6mNO/LiifEG+Vw1hl3c+hT43ljzLs0A7dRukK0gexIEAudNpYWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709549638; c=relaxed/simple;
	bh=eVDo0scHX+ju6vk6cbGt8O+ROvXBZOsg/rCenGp8xk0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TdxPoG0eyr+hJP9hDoohMCjHhUPEjcnHGBUL2BQiboQPq3lRni8zmkYN8js46IESUPd2/orje2fmPIaQSoaDP4HzW74lVkTPlzRNU3Fa3iPBy/xXYXjxsIWOlXtfEEyTP+/Qjr+G1HaB29AZ0CfVH6cxkdoQf6RlkuTBj7gty5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2716:1247:52e8:4f90])
	by laurent.telenet-ops.be with bizsmtp
	id uato2B0022qflky01atorT; Mon, 04 Mar 2024 11:53:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rh5wu-002I6P-FA;
	Mon, 04 Mar 2024 11:53:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rh5x6-007NMp-4r;
	Mon, 04 Mar 2024 11:53:48 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Maxime Ripard <mripard@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] drm: renesas: shmobile: Call drm_helper_force_disable_all() at shutdown time
Date: Mon,  4 Mar 2024 11:53:45 +0100
Message-Id: <4f9a459629dc4b6435ae6b90808464d6ca2eb469.1709549579.git.geert+renesas@glider.be>
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
This is important because drm_helper_force_disable_all() will cause
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
---
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


