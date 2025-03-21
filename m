Return-Path: <linux-renesas-soc+bounces-14726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C7A6C13D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Mar 2025 18:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E59B17883B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Mar 2025 17:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D478022D7AD;
	Fri, 21 Mar 2025 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZPVq7b25"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA51E492D;
	Fri, 21 Mar 2025 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577753; cv=none; b=S3E1bNnORV5Uek+/zfnnZkDa5Dj1Jx41ngabaEAJ5ovSnIp53GudkErVgVJP/ZfFYiR8PWewIINnsBPjXtztz5pB1qrfr5ox59zg5aFK4rfzyButuiECRV35BNcabKsG0QnOT0qlJ1HkVG/pYUCbQk68EXca8fpc5XlhZoCBaCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577753; c=relaxed/simple;
	bh=9yJe3cG2BOMYrflBr3vW78WFW6QZDL9eRuM8AXZ6BHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R1sdUGkvhrNrQqMGOUb5/GdE2V64/x0gndCDc8TJQF+3sdXoIZVIVO/PYLD++eEvqD977NUC9zh4UHvnFvXplt1CgnxlkRht1S0fpZKeZClv3W6hx9Yi862TA64x1Da1T1FKpvcYMy3RI2NSP5JrC5Jax0OZHeSMU0js35F7m84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZPVq7b25; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from Monstersaurus.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1A362C5;
	Fri, 21 Mar 2025 18:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742577645;
	bh=9yJe3cG2BOMYrflBr3vW78WFW6QZDL9eRuM8AXZ6BHA=;
	h=From:To:Cc:Subject:Date:From;
	b=ZPVq7b25iHFHI1bJLl64Df/ufCNyMX+TxYhSjvG+SuxGn8P0p8R7fFKjR404ePuCv
	 9zf+Rdi1JwerF2cLxjqQJ9xwhJFSE21Ut+BIefwTZHnKWiY4+x3CLkRQTrSrApQHgW
	 TM77fWs4iCWVGfzXTt4aKzpL0slNZje3rFeSOCVM=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
Date: Fri, 21 Mar 2025 17:22:19 +0000
Message-ID: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The RZ/G2L driver utilises the VSPD to read data from input sources.

The rzg2l_du_kms component lists a restricted subset of the capabilities
of the VSPd which prevents additional formats from being used for
display planes.

The supported display plane formats are mapped in rzg2l_du_vsp_formats[].

Extend the rzg2l_du_format_infos[] table with the corresponding mappings
between the supported DRM formats and the formats exposed by the VSP in
rzg2l_du_vsp_formats, maintaining the same ordering in both tables.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 141 ++++++++++++++++++-
 1 file changed, 136 insertions(+), 5 deletions(-)

Prior to this patch, kmstest reports all of these formats as supported
by the Planes, but using them fails during rzg2l_du_fb_create() as the
corresponding format isn't found in rzg2l_du_format_info.

This patch now lets me capture and render pixelformats from the Mali-C55
direct to an attached DSI panel on the Kakip board.

Patch tested with kms-tests:

PYTHONPATH=/usr/lib/aarch64-linux-gnu/python3.11/site-packages ./tests/kms-test-formats.py 
Testing plane formats: SUCCESS

admin@kakip:~/kms-tests$ cat FormatsTest.log 
U [66.967523] Testing plane formats
U [66.975763] Testing connector DSI-1, CRTC 36, mode 720x1280
U [66.978480] Testing format PixelFormat.RGB332
U [70.143998] Testing format PixelFormat.ARGB4444
U [73.357056] Testing format PixelFormat.XRGB4444
U [76.574944] Testing format PixelFormat.ARGB1555
U [79.805636] Testing format PixelFormat.XRGB1555
U [83.016599] Testing format PixelFormat.RGB565
U [86.230362] Testing format PixelFormat.BGR888
U [89.444673] Testing format PixelFormat.RGB888
U [92.677093] Testing format PixelFormat.BGRA8888
U [95.904745] Testing format PixelFormat.BGRX8888
U [99.119926] Testing format PixelFormat.ARGB8888
U [102.350298] Testing format PixelFormat.XRGB8888
U [105.579499] Testing format PixelFormat.UYVY
U [108.878654] Testing format PixelFormat.YUYV
U [112.176515] Testing format PixelFormat.YVYU
U [115.470090] Testing format PixelFormat.NV12
U [118.767513] Testing format PixelFormat.NV21
U [122.065851] Testing format PixelFormat.NV16
U [125.364001] Testing format PixelFormat.NV61
U [128.662145] Testing format PixelFormat.YUV420
U [131.978102] Testing format PixelFormat.YVU420
U [135.292284] Testing format PixelFormat.YUV422
U [138.623485] Testing format PixelFormat.YVU422
U [141.955083] Testing format PixelFormat.YUV444
U [145.336759] Testing format PixelFormat.YVU444
U [148.761832] Test completed successfully


diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index b1266fbd9598..a5e96f863172 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -36,8 +36,61 @@
 
 static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
 	{
-		.fourcc = DRM_FORMAT_XRGB8888,
-		.v4l2 = V4L2_PIX_FMT_XBGR32,
+		.fourcc = DRM_FORMAT_RGB332,
+		.v4l2 = V4L2_PIX_FMT_RGB332,
+		.bpp = 8,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB4444,
+		.v4l2 = V4L2_PIX_FMT_ARGB444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB4444,
+		.v4l2 = V4L2_PIX_FMT_XRGB444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB1555,
+		.v4l2 = V4L2_PIX_FMT_ARGB555,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB1555,
+		.v4l2 = V4L2_PIX_FMT_XRGB555,
+		.bpp = 16,
+		.planes = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGB565,
+		.v4l2 = V4L2_PIX_FMT_RGB565,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGR888,
+		.v4l2 = V4L2_PIX_FMT_RGB24,
+		.bpp = 24,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGB888,
+		.v4l2 = V4L2_PIX_FMT_BGR24,
+		.bpp = 24,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRA8888,
+		.v4l2 = V4L2_PIX_FMT_ARGB32,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRX8888,
+		.v4l2 = V4L2_PIX_FMT_XRGB32,
 		.bpp = 32,
 		.planes = 1,
 		.hsub = 1,
@@ -48,11 +101,89 @@ static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
 		.planes = 1,
 		.hsub = 1,
 	}, {
-		.fourcc = DRM_FORMAT_RGB888,
-		.v4l2 = V4L2_PIX_FMT_BGR24,
-		.bpp = 24,
+		.fourcc = DRM_FORMAT_XRGB8888,
+		.v4l2 = V4L2_PIX_FMT_XBGR32,
+		.bpp = 32,
 		.planes = 1,
 		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_UYVY,
+		.v4l2 = V4L2_PIX_FMT_UYVY,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUYV,
+		.v4l2 = V4L2_PIX_FMT_YUYV,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YVYU,
+		.v4l2 = V4L2_PIX_FMT_YVYU,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_NV12,
+		.v4l2 = V4L2_PIX_FMT_NV12M,
+		.bpp = 12,
+		.planes = 2,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_NV21,
+		.v4l2 = V4L2_PIX_FMT_NV21M,
+		.bpp = 12,
+		.planes = 2,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_NV16,
+		.v4l2 = V4L2_PIX_FMT_NV16M,
+		.bpp = 16,
+		.planes = 2,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_NV61,
+		.v4l2 = V4L2_PIX_FMT_NV61M,
+		.bpp = 16,
+		.planes = 2,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUV420,
+		.v4l2 = V4L2_PIX_FMT_YUV420M,
+		.bpp = 12,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YVU420,
+		.v4l2 = V4L2_PIX_FMT_YVU420M,
+		.bpp = 12,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUV422,
+		.v4l2 = V4L2_PIX_FMT_YUV422M,
+		.bpp = 16,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YVU422,
+		.v4l2 = V4L2_PIX_FMT_YVU422M,
+		.bpp = 16,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUV444,
+		.v4l2 = V4L2_PIX_FMT_YUV444M,
+		.bpp = 24,
+		.planes = 3,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_YVU444,
+		.v4l2 = V4L2_PIX_FMT_YVU444M,
+		.bpp = 24,
+		.planes = 3,
+		.hsub = 1,
 	}
 };
 
-- 
2.48.1


