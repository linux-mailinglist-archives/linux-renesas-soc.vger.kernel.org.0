Return-Path: <linux-renesas-soc+bounces-2053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD7B8429BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 17:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04A4C1F263F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 16:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EABC12BF0A;
	Tue, 30 Jan 2024 16:41:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C0D12838B;
	Tue, 30 Jan 2024 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632901; cv=none; b=Rb0MZXi9joVh5ChQ45nNfNaWbY37GJC71Giqrb1t+sazNDpvO7JMpdk8MMTFVgrP6ltG0OUg2RxLAqu+lgzu+xr4eSxiISNfx2SenEADTRBScF9yoVfrgdulTEETp+e+65hwr2vTH0HWxbkOFmiE7678hAdcQb1YFHYjYLzLYx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632901; c=relaxed/simple;
	bh=pd+wp2JcKaucw1aDfoCbB66bI0HUCWmkn1HxtXG2nlE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tjg6Ou+HL4hVsv/tjxQ0h1jB6eWIhVHuHfOcjapGgSrsEIbeWsxjYBErkBVk6zA4vU8ymjgsbWRs+GtpfkwUas4CWO/5VJ3pzXutPe8GDE815tA/6VTJK9axJFqf1WsxCAihu/Ijt/4gvpnjcxWLLYpyDNMv3KI3ilkbOLrBQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,230,1701097200"; 
   d="scan'208";a="196171785"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jan 2024 01:41:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.244])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 73FA44002972;
	Wed, 31 Jan 2024 01:41:35 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 RESEND 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure clk handling
Date: Tue, 30 Jan 2024 16:41:15 +0000
Message-Id: <20240130164115.116613-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240130164115.116613-1-biju.das.jz@bp.renesas.com>
References: <20240130164115.116613-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
latest hardware manual (R01UH0914EJ0140 Rev.1.40) it is mentioned that
we need to supply all CRU clks and we need to disable the vclk before
enabling the LINK reception and enable the vclk after enabling the link
Reception. So restructure clk handling as per the HW manual.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped clk-provider.h and __clk_is_enabled() as consumer clk should
   not use it. Plan to send RFC for clk_disable_unprepare_sync() in ccf.
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 -
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 28 +++++---
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 15 +---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 69 ++++++++-----------
 4 files changed, 47 insertions(+), 68 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 811603f18af0..a5a99b004322 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -133,9 +133,6 @@ struct rzg2l_cru_dev {
 	struct v4l2_pix_format format;
 };
 
-void rzg2l_cru_vclk_unprepare(struct rzg2l_cru_dev *cru);
-int rzg2l_cru_vclk_prepare(struct rzg2l_cru_dev *cru);
-
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru);
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e00d9379dd2c..e68fcdaea207 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -108,6 +108,7 @@ struct rzg2l_csi2 {
 	struct reset_control *presetn;
 	struct reset_control *cmn_rstb;
 	struct clk *sysclk;
+	struct clk *vclk;
 	unsigned long vclk_rate;
 
 	struct v4l2_subdev subdev;
@@ -361,7 +362,7 @@ static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
 	return rzg2l_csi2_dphy_disable(csi2);
 }
 
-static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
+static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
 {
 	unsigned long vclk_rate = csi2->vclk_rate / HZ_PER_MHZ;
 	u32 frrskw, frrclk, frrskw_coeff, frrclk_coeff;
@@ -386,11 +387,15 @@ static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
 	rzg2l_csi2_write(csi2, CSI2nDTEL, 0xf778ff0f);
 	rzg2l_csi2_write(csi2, CSI2nDTEH, 0x00ffff1f);
 
+	clk_disable_unprepare(csi2->vclk);
+
 	/* Enable LINK reception */
 	rzg2l_csi2_write(csi2, CSI2nMCT3, CSI2nMCT3_RXEN);
+
+	return clk_prepare_enable(csi2->vclk);
 }
 
-static void rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
+static int rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
 {
 	unsigned int timeout = VSRSTS_RETRIES;
 
@@ -409,18 +414,21 @@ static void rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
 
 	if (!timeout)
 		dev_err(csi2->dev, "Clearing CSI2nRTST.VSRSTS timed out\n");
+
+	return 0;
 }
 
 static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
+	int ret;
 
 	if (on)
-		rzg2l_csi2_mipi_link_enable(csi2);
+		ret = rzg2l_csi2_mipi_link_enable(csi2);
 	else
-		rzg2l_csi2_mipi_link_disable(csi2);
+		ret = rzg2l_csi2_mipi_link_disable(csi2);
 
-	return 0;
+	return ret;
 }
 
 static int rzg2l_csi2_s_stream(struct v4l2_subdev *sd, int enable)
@@ -731,7 +739,6 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
 static int rzg2l_csi2_probe(struct platform_device *pdev)
 {
 	struct rzg2l_csi2 *csi2;
-	struct clk *vclk;
 	int ret;
 
 	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
@@ -757,12 +764,11 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
 				     "Failed to get system clk\n");
 
-	vclk = clk_get(&pdev->dev, "video");
-	if (IS_ERR(vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(vclk),
+	csi2->vclk = devm_clk_get(&pdev->dev, "video");
+	if (IS_ERR(csi2->vclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
 				     "Failed to get video clock\n");
-	csi2->vclk_rate = clk_get_rate(vclk);
-	clk_put(vclk);
+	csi2->vclk_rate = clk_get_rate(csi2->vclk);
 
 	csi2->dev = &pdev->dev;
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 8466b4e55909..2d22c373588b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -80,20 +80,9 @@ static int rzg2l_cru_ip_s_stream(struct v4l2_subdev *sd, int enable)
 			return ret;
 		}
 
-		rzg2l_cru_vclk_unprepare(cru);
-
 		ret = v4l2_subdev_call(cru->ip.remote, video, s_stream, enable);
-		if (ret == -ENOIOCTLCMD)
-			ret = 0;
-		if (!ret) {
-			ret = rzg2l_cru_vclk_prepare(cru);
-			if (!ret)
-				return 0;
-		} else {
-			/* enable back vclk so that s_stream in error path disables it */
-			if (rzg2l_cru_vclk_prepare(cru))
-				dev_err(cru->dev, "Failed to enable vclk\n");
-		}
+		if (!ret || (ret == -ENOIOCTLCMD))
+			return 0;
 
 		s_stream_ret = ret;
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a7d6fe831d54..b16b8af6e8f8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -461,16 +461,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	return 0;
 }
 
-void rzg2l_cru_vclk_unprepare(struct rzg2l_cru_dev *cru)
-{
-	clk_disable_unprepare(cru->vclk);
-}
-
-int rzg2l_cru_vclk_prepare(struct rzg2l_cru_dev *cru)
-{
-	return clk_prepare_enable(cru->vclk);
-}
-
 static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 {
 	struct media_pipeline *pipe;
@@ -499,39 +489,24 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 
 		video_device_pipeline_stop(&cru->vdev);
 
-		pm_runtime_put_sync(cru->dev);
-		clk_disable_unprepare(cru->vclk);
-
 		return stream_off_ret;
 	}
 
-	ret = pm_runtime_resume_and_get(cru->dev);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(cru->vclk);
-	if (ret)
-		goto err_pm_put;
-
 	ret = rzg2l_cru_mc_validate_format(cru, sd, pad);
 	if (ret)
-		goto err_vclk_disable;
+		return ret;
 
 	pipe = media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
 	ret = video_device_pipeline_start(&cru->vdev, pipe);
 	if (ret)
-		goto err_vclk_disable;
+		return ret;
 
 	ret = v4l2_subdev_call(sd, video, pre_streamon, 0);
-	if (ret == -ENOIOCTLCMD)
-		ret = 0;
-	if (ret)
+	if (ret && ret != -ENOIOCTLCMD)
 		goto pipe_line_stop;
 
 	ret = v4l2_subdev_call(sd, video, s_stream, 1);
-	if (ret == -ENOIOCTLCMD)
-		ret = 0;
-	if (ret)
+	if (ret && ret != -ENOIOCTLCMD)
 		goto err_s_stream;
 
 	return 0;
@@ -542,12 +517,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 pipe_line_stop:
 	video_device_pipeline_stop(&cru->vdev);
 
-err_vclk_disable:
-	clk_disable_unprepare(cru->vclk);
-
-err_pm_put:
-	pm_runtime_put_sync(cru->dev);
-
 	return ret;
 }
 
@@ -646,25 +615,33 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
 	int ret;
 
+	ret = pm_runtime_resume_and_get(cru->dev);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(cru->vclk);
+	if (ret)
+		goto err_pm_put;
+
 	/* Release reset state */
 	ret = reset_control_deassert(cru->aresetn);
 	if (ret) {
 		dev_err(cru->dev, "failed to deassert aresetn\n");
-		return ret;
+		goto err_vclk_disable;
 	}
 
 	ret = reset_control_deassert(cru->presetn);
 	if (ret) {
 		reset_control_assert(cru->aresetn);
 		dev_err(cru->dev, "failed to deassert presetn\n");
-		return ret;
+		goto assert_aresetn;
 	}
 
 	ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
 			  IRQF_SHARED, KBUILD_MODNAME, cru);
 	if (ret) {
 		dev_err(cru->dev, "failed to request irq\n");
-		goto assert_resets;
+		goto assert_presetn;
 	}
 
 	/* Allocate scratch buffer. */
@@ -696,10 +673,18 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 free_image_conv_irq:
 	free_irq(cru->image_conv_irq, cru);
 
-assert_resets:
+assert_presetn:
 	reset_control_assert(cru->presetn);
+
+assert_aresetn:
 	reset_control_assert(cru->aresetn);
 
+err_vclk_disable:
+	clk_disable_unprepare(cru->vclk);
+
+err_pm_put:
+	pm_runtime_put_sync(cru->dev);
+
 	return ret;
 }
 
@@ -714,9 +699,11 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
 			  cru->scratch, cru->scratch_phys);
 
 	free_irq(cru->image_conv_irq, cru);
-	reset_control_assert(cru->presetn);
-
 	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
+
+	reset_control_assert(cru->presetn);
+	clk_disable_unprepare(cru->vclk);
+	pm_runtime_put_sync(cru->dev);
 }
 
 static const struct vb2_ops rzg2l_cru_qops = {
-- 
2.25.1


