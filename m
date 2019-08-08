Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 323E985783
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Aug 2019 03:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389612AbfHHBTy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Aug 2019 21:19:54 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:18022 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389611AbfHHBTy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 21:19:54 -0400
X-Halon-ID: 9a0f8c29-b97a-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 9a0f8c29-b97a-11e9-bdc3-005056917a89;
        Thu, 08 Aug 2019 03:19:44 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 5/6] rcar-vin: Add support for V4L2_FIELD_ALTERNATE
Date:   Thu,  8 Aug 2019 03:18:49 +0200
Message-Id: <20190808011850.21219-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The hardware is capable to passing V4L2_FIELD_ALTERNATE to user-space.
Allow users to request this field format but still default to using the
hardware interlacer if alternating is not explicitly requested.

Before this change a sensor providing data using alternate would be
always combined to an interlaced frame. After this change the user can
request to receive frames as alternate if the sensor provides it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c  | 43 +++++++++++++--------
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 31 +++++++--------
 2 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 6be1f33d44e2170c..56db239017d4a44b 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -529,12 +529,17 @@ static void rvin_set_coeff(struct rvin_dev *vin, unsigned short xs)
 
 static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
 {
+	unsigned int crop_height;
 	u32 xs, ys;
 
 	/* Set scaling coefficient */
+	crop_height = vin->crop.height;
+	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))
+		crop_height *= 2;
+
 	ys = 0;
-	if (vin->crop.height != vin->compose.height)
-		ys = (4096 * vin->crop.height) / vin->compose.height;
+	if (crop_height != vin->compose.height)
+		ys = (4096 * crop_height) / vin->compose.height;
 	rvin_write(vin, ys, VNYS_REG);
 
 	xs = 0;
@@ -575,21 +580,9 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 	/* Set Start/End Pixel/Line Pre-Clip */
 	rvin_write(vin, vin->crop.left, VNSPPRC_REG);
 	rvin_write(vin, vin->crop.left + vin->crop.width - 1, VNEPPRC_REG);
+	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
+	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
 
-	switch (vin->format.field) {
-	case V4L2_FIELD_INTERLACED:
-	case V4L2_FIELD_INTERLACED_TB:
-	case V4L2_FIELD_INTERLACED_BT:
-		rvin_write(vin, vin->crop.top / 2, VNSLPRC_REG);
-		rvin_write(vin, (vin->crop.top + vin->crop.height) / 2 - 1,
-			   VNELPRC_REG);
-		break;
-	default:
-		rvin_write(vin, vin->crop.top, VNSLPRC_REG);
-		rvin_write(vin, vin->crop.top + vin->crop.height - 1,
-			   VNELPRC_REG);
-		break;
-	}
 
 	/* TODO: Add support for the UDS scaler. */
 	if (vin->info->model != RCAR_GEN3)
@@ -634,6 +627,9 @@ static int rvin_setup(struct rvin_dev *vin)
 		vnmc = VNMC_IM_ODD_EVEN;
 		progressive = true;
 		break;
+	case V4L2_FIELD_ALTERNATE:
+		vnmc = VNMC_IM_ODD_EVEN;
+		break;
 	default:
 		vnmc = VNMC_IM_ODD;
 		break;
@@ -792,6 +788,18 @@ static bool rvin_capture_active(struct rvin_dev *vin)
 	return rvin_read(vin, VNMS_REG) & VNMS_CA;
 }
 
+static enum v4l2_field rvin_get_active_field(struct rvin_dev *vin, u32 vnms)
+{
+	if (vin->format.field == V4L2_FIELD_ALTERNATE) {
+		/* If FS is set it is an Even field. */
+		if (vnms & VNMS_FS)
+			return V4L2_FIELD_BOTTOM;
+		return V4L2_FIELD_TOP;
+	}
+
+	return vin->format.field;
+}
+
 static void rvin_set_slot_addr(struct rvin_dev *vin, int slot, dma_addr_t addr)
 {
 	const struct rvin_video_format *fmt;
@@ -941,7 +949,7 @@ static irqreturn_t rvin_irq(int irq, void *data)
 
 	/* Capture frame */
 	if (vin->queue_buf[slot]) {
-		vin->queue_buf[slot]->field = vin->format.field;
+		vin->queue_buf[slot]->field = rvin_get_active_field(vin, vnms);
 		vin->queue_buf[slot]->sequence = vin->sequence;
 		vin->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
 		vb2_buffer_done(&vin->queue_buf[slot]->vb2_buf,
@@ -1068,6 +1076,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 		case V4L2_FIELD_TOP:
 		case V4L2_FIELD_BOTTOM:
 		case V4L2_FIELD_NONE:
+		case V4L2_FIELD_ALTERNATE:
 			break;
 		case V4L2_FIELD_INTERLACED_TB:
 		case V4L2_FIELD_INTERLACED_BT:
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5dcd787a9cf96ac9..d9ee899144eba547 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -114,15 +114,7 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
 	case V4L2_FIELD_INTERLACED_TB:
 	case V4L2_FIELD_INTERLACED_BT:
 	case V4L2_FIELD_INTERLACED:
-		break;
 	case V4L2_FIELD_ALTERNATE:
-		/*
-		 * Driver does not (yet) support outputting ALTERNATE to a
-		 * userspace. It does support outputting INTERLACED so use
-		 * the VIN hardware to combine the two fields.
-		 */
-		pix->field = V4L2_FIELD_INTERLACED;
-		pix->height *= 2;
 		break;
 	default:
 		pix->field = RVIN_DEFAULT_FIELD;
@@ -161,15 +153,25 @@ static int rvin_reset_format(struct rvin_dev *vin)
 
 	v4l2_fill_pix_format(&vin->format, &fmt.format);
 
-	rvin_format_align(vin, &vin->format);
-
 	vin->src_rect.top = 0;
 	vin->src_rect.left = 0;
 	vin->src_rect.width = vin->format.width;
 	vin->src_rect.height = vin->format.height;
 
+	/*  Make use of the hardware interlacer by default. */
+	if (vin->format.field == V4L2_FIELD_ALTERNATE) {
+		vin->format.field = V4L2_FIELD_INTERLACED;
+		vin->format.height *= 2;
+	}
+
+	rvin_format_align(vin, &vin->format);
+
 	vin->crop = vin->src_rect;
-	vin->compose = vin->src_rect;
+
+	vin->compose.top = 0;
+	vin->compose.left = 0;
+	vin->compose.width = vin->format.width;
+	vin->compose.height = vin->format.height;
 
 	return 0;
 }
@@ -213,13 +215,6 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 		crop->left = 0;
 		crop->width = pix->width;
 		crop->height = pix->height;
-
-		/*
-		 * If source is ALTERNATE the driver will use the VIN hardware
-		 * to INTERLACE it. The crop height then needs to be doubled.
-		 */
-		if (pix->field == V4L2_FIELD_ALTERNATE)
-			crop->height *= 2;
 	}
 
 	if (field != V4L2_FIELD_ANY)
-- 
2.22.0

