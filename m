Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE34650CF4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Dec 2022 15:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbiLSOCa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Dec 2022 09:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbiLSOCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2022 09:02:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5AC10B46;
        Mon, 19 Dec 2022 06:02:21 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96A73127D;
        Mon, 19 Dec 2022 15:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671458538;
        bh=b85XpoD22W5N6aa7OSlGXgwHyo7D7RgnnvNmOiSI0TU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CZmn5/DpcbeT906jv6WAaFZmWEfACTgQP6SqMH0aPA8zcchViIjBM7nm4LsH1GQ+p
         snzAvOJAlIr/tmbIb06MVy0qEyVAOl49+AwEofc4t7Nb2GvDZp1aE4gOKqEU0sWbjf
         zZhFJBpntbNXBtzfjgN/GzNPkIbkXGTuT3gZjbgk=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 2/7] media: Add Y210, Y212 and Y216 formats
Date:   Mon, 19 Dec 2022 16:01:34 +0200
Message-Id: <20221219140139.294245-3-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add Y210, Y212 and Y216 formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../media/v4l/pixfmt-packed-yuv.rst           | 44 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  3 ++
 include/uapi/linux/videodev2.h                |  8 ++++
 3 files changed, 55 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index bf283a1b5581..3f193e5fd5cb 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -337,6 +337,50 @@ components horizontally by 2, storing 2 pixels in 4 bytes.
       - Y'\ :sub:`3`
       - Cb\ :sub:`2`
 
+The packed YUYV formats with more than 8 bits per component are stored as four
+16-bit little-endian words. Each word's most significat bits contain one
+component, and the least significant bits are zero padding.
+
+.. tabularcolumns:: |p{3.4cm}|p{1.2cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|
+
+.. flat-table:: Packed YUV 4:2:2 Formats in 64-bit container
+    :header-rows: 1
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      - Word 0
+      - Word 1
+      - Word 2
+      - Word 3
+    * .. _V4L2-PIX-FMT-Y210:
+
+      - ``V4L2_PIX_FMT_Y210``
+      - 'Y210'
+
+      - Y'\ :sub:`0` (bits 15-6)
+      - Cb\ :sub:`0` (bits 15-6)
+      - Y'\ :sub:`1` (bits 15-6)
+      - Cr\ :sub:`0` (bits 15-6)
+    * .. _V4L2-PIX-FMT-Y212:
+
+      - ``V4L2_PIX_FMT_Y212``
+      - 'Y212'
+
+      - Y'\ :sub:`0` (bits 15-4)
+      - Cb\ :sub:`0` (bits 15-4)
+      - Y'\ :sub:`1` (bits 15-4)
+      - Cr\ :sub:`0` (bits 15-4)
+    * .. _V4L2-PIX-FMT-Y216:
+
+      - ``V4L2_PIX_FMT_Y216``
+      - 'Y216'
+
+      - Y'\ :sub:`0` (bits 15-0)
+      - Cb\ :sub:`0` (bits 15-0)
+      - Y'\ :sub:`1` (bits 15-0)
+      - Cr\ :sub:`0` (bits 15-0)
+
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 964300deaf62..ba95389a59b5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1449,6 +1449,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_10BE_8L128:	descr = "10-bit NV12M (8x128 Linear, BE)"; break;
+	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
+	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
+	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 877fd61693b8..15b640d2da8a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -621,6 +621,14 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
 #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
 
+/*
+ * YCbCr packed format. For each Y2xx format, xx bits of valid data occupy the MSBs
+ * of the 16 bit components, and 16-xx bits of zero padding occupy the LSBs.
+ */
+#define V4L2_PIX_FMT_Y210    v4l2_fourcc('Y', '2', '1', '0') /* 32  YUYV 4:2:2 */
+#define V4L2_PIX_FMT_Y212    v4l2_fourcc('Y', '2', '1', '2') /* 32  YUYV 4:2:2 */
+#define V4L2_PIX_FMT_Y216    v4l2_fourcc('Y', '2', '1', '6') /* 32  YUYV 4:2:2 */
+
 /* two planes -- one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */
 #define V4L2_PIX_FMT_NV21    v4l2_fourcc('N', 'V', '2', '1') /* 12  Y/CrCb 4:2:0  */
-- 
2.34.1

