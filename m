Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A31E1A9A56
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 12:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405812AbgDOKYI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 06:24:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:35467 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2408508AbgDOKUI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 06:20:08 -0400
X-IronPort-AV: E=Sophos;i="5.72,386,1580742000"; 
   d="scan'208";a="44789385"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Apr 2020 19:19:26 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 924424007F4F;
        Wed, 15 Apr 2020 19:19:24 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/3] media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
Date:   Wed, 15 Apr 2020 11:19:07 +0100
Message-Id: <1586945948-11026-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586945948-11026-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1586945948-11026-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format in rcar-vin by setting
format type to RAW8 in VNMC register and appropriately setting the bpp
and bytesperline to enable V4L2_PIX_FMT_SRGGB8.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-dma.c  | 15 ++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 48bd9bfc3948..3e8e29573e6d 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -85,6 +85,7 @@
 #define VNMC_INF_YUV8_BT601	(1 << 16)
 #define VNMC_INF_YUV10_BT656	(2 << 16)
 #define VNMC_INF_YUV10_BT601	(3 << 16)
+#define VNMC_INF_RAW8		(4 << 16)
 #define VNMC_INF_YUV16		(5 << 16)
 #define VNMC_INF_RGB888		(6 << 16)
 #define VNMC_VUP		(1 << 10)
@@ -587,13 +588,19 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
 	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
 
-
 	/* TODO: Add support for the UDS scaler. */
 	if (vin->info->model != RCAR_GEN3)
 		rvin_crop_scale_comp_gen2(vin);
 
 	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
 	stride = vin->format.bytesperline / fmt->bpp;
+
+	/* For RAW8 format bpp is 1, but the hardware process RAW8
+	 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
+	 */
+	if (vin->format.pixelformat == V4L2_PIX_FMT_SRGGB8)
+		stride /= 2;
+
 	rvin_write(vin, stride, VNIS_REG);
 }
 
@@ -676,6 +683,9 @@ static int rvin_setup(struct rvin_dev *vin)
 
 		input_is_yuv = true;
 		break;
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		vnmc |= VNMC_INF_RAW8;
+		break;
 	default:
 		break;
 	}
@@ -737,6 +747,9 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_PIX_FMT_ABGR32:
 		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
 		break;
+	case V4L2_PIX_FMT_SRGGB8:
+		dmr = 0;
+		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
 			vin->format.pixelformat);
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5151a3cd8a6e..ca542219e8ae 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -66,6 +66,10 @@ static const struct rvin_video_format rvin_formats[] = {
 		.fourcc			= V4L2_PIX_FMT_ABGR32,
 		.bpp			= 4,
 	},
+	{
+		.fourcc			= V4L2_PIX_FMT_SRGGB8,
+		.bpp			= 1,
+	},
 };
 
 const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
-- 
2.20.1

