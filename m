Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D0F23D557
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgHFCSh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:18:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38264 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbgHFCSg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:18:36 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE7AAFD2;
        Thu,  6 Aug 2020 04:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680305;
        bh=W5olvUavvSeMVexVzIln5YL0f8dSeyyzDOb6gck9f9Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t6XZG62ZNDA9RpoRovDCEN8fPN/abAmywpJK0Mm6HMng3G8G+YqsRTv5uQZH7nSfI
         mB58LHyf+KfaVLsn6qGrsiiKTNrjcCnSOigpQv/lGQ5EKFXJsJc+gvf+9qtTRzh7ho
         UZlNGiqgQwCTXM9KwoO51cp5nmk7pOAIE4sycA4E=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/8] kms++: Add support for semiplanar YUV422 formats (NV16 and NV61)
Date:   Thu,  6 Aug 2020 05:18:04 +0300
Message-Id: <20200806021807.21863-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the NV16 and NV61 pixel formats to the PixelFormat
class, the Python API, and the drawing utilities.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 kms++/inc/kms++/pixelformats.h |  2 +
 kms++/src/pixelformats.cpp     |  2 +
 kms++util/src/drawing.cpp      | 68 +++++++++++++++++++++++++++++++---
 kms++util/src/testpat.cpp      |  7 ++--
 py/pykms/pykmsbase.cpp         |  2 +
 5 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/kms++/inc/kms++/pixelformats.h b/kms++/inc/kms++/pixelformats.h
index 4e73d5dddb18..f550f2fff4e0 100644
--- a/kms++/inc/kms++/pixelformats.h
+++ b/kms++/inc/kms++/pixelformats.h
@@ -17,6 +17,8 @@ enum class PixelFormat : uint32_t
 
 	NV12 = MakeFourCC("NV12"),
 	NV21 = MakeFourCC("NV21"),
+	NV16 = MakeFourCC("NV16"),
+	NV61 = MakeFourCC("NV61"),
 
 	UYVY = MakeFourCC("UYVY"),
 	YUYV = MakeFourCC("YUYV"),
diff --git a/kms++/src/pixelformats.cpp b/kms++/src/pixelformats.cpp
index ecca41d7fa00..d34df6435436 100644
--- a/kms++/src/pixelformats.cpp
+++ b/kms++/src/pixelformats.cpp
@@ -15,6 +15,8 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
 	/* YUV semi-planar */
 	{ PixelFormat::NV12, { PixelColorType::YUV, 2, { { 8, 1, 1, }, { 8, 2, 2 } }, } },
 	{ PixelFormat::NV21, { PixelColorType::YUV, 2, { { 8, 1, 1, }, { 8, 2, 2 } }, } },
+	{ PixelFormat::NV16, { PixelColorType::YUV, 2, { { 8, 1, 1, }, { 8, 2, 1 } }, } },
+	{ PixelFormat::NV61, { PixelColorType::YUV, 2, { { 8, 1, 1, }, { 8, 2, 1 } }, } },
 	/* RGB16 */
 	{ PixelFormat::RGB565, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
 	{ PixelFormat::BGR565, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
diff --git a/kms++util/src/drawing.cpp b/kms++util/src/drawing.cpp
index 194daf876586..a329b8362072 100644
--- a/kms++util/src/drawing.cpp
+++ b/kms++util/src/drawing.cpp
@@ -115,13 +115,9 @@ void draw_rgb_pixel(IFramebuffer& buf, unsigned x, unsigned y, RGB color)
 	}
 }
 
-void draw_yuv422_macropixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv1, YUV yuv2)
+static void draw_yuv422_packed_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
+					  YUV yuv1, YUV yuv2)
 {
-	if ((x + 1) >= buf.width() || y >= buf.height())
-		throw runtime_error("attempt to draw outside the buffer");
-
-	ASSERT((x & 1) == 0);
-
 	uint8_t *p = (uint8_t*)(buf.map(0) + buf.stride(0) * y + x * 2);
 
 	uint8_t y0 = yuv1.y;
@@ -163,6 +159,62 @@ void draw_yuv422_macropixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv1,
 	}
 }
 
+static void draw_yuv422_semiplanar_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
+					      YUV yuv1, YUV yuv2)
+{
+	uint8_t *py = (uint8_t*)(buf.map(0) + buf.stride(0) * y + x);
+	uint8_t *puv = (uint8_t*)(buf.map(1) + buf.stride(1) * y + x);
+
+	uint8_t y0 = yuv1.y;
+	uint8_t y1 = yuv2.y;
+	uint8_t u = (yuv1.u + yuv2.u) / 2;
+	uint8_t v = (yuv1.v + yuv2.v) / 2;
+
+	switch (buf.format()) {
+	case PixelFormat::NV16:
+		py[0] = y0;
+		py[1] = y1;
+		puv[0] = u;
+		puv[1] = v;
+		break;
+
+	case PixelFormat::NV61:
+		py[0] = y0;
+		py[1] = y1;
+		puv[0] = v;
+		puv[1] = u;
+		break;
+
+	default:
+		throw std::invalid_argument("invalid pixelformat");
+	}
+}
+
+void draw_yuv422_macropixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv1, YUV yuv2)
+{
+	if ((x + 1) >= buf.width() || y >= buf.height())
+		throw runtime_error("attempt to draw outside the buffer");
+
+	ASSERT((x & 1) == 0);
+
+	switch (buf.format()) {
+	case PixelFormat::UYVY:
+	case PixelFormat::YUYV:
+	case PixelFormat::YVYU:
+	case PixelFormat::VYUY:
+		draw_yuv422_packed_macropixel(buf, x, y, yuv1, yuv2);
+		break;
+
+	case PixelFormat::NV16:
+	case PixelFormat::NV61:
+		draw_yuv422_semiplanar_macropixel(buf, x, y, yuv1, yuv2);
+		break;
+
+	default:
+		throw std::invalid_argument("invalid pixelformat");
+	}
+}
+
 void draw_yuv420_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
 			    YUV yuv1, YUV yuv2, YUV yuv3, YUV yuv4)
 {
@@ -235,6 +287,8 @@ void draw_rect(IFramebuffer &fb, uint32_t x, uint32_t y, uint32_t w, uint32_t h,
 	case PixelFormat::YUYV:
 	case PixelFormat::YVYU:
 	case PixelFormat::VYUY:
+	case PixelFormat::NV16:
+	case PixelFormat::NV61:
 		for (j = 0; j < h; j++) {
 			for (i = 0; i < w; i += 2) {
 				draw_yuv422_macropixel(fb, x + i, y + j, yuvcolor, yuvcolor);
@@ -311,6 +365,8 @@ static void draw_char(IFramebuffer& buf, uint32_t xpos, uint32_t ypos, char c, R
 	case PixelFormat::YUYV:
 	case PixelFormat::YVYU:
 	case PixelFormat::VYUY:
+	case PixelFormat::NV16:
+	case PixelFormat::NV61:
 		for (y = 0; y < 8; y++) {
 			for (x = 0; x < 8; x += 2) {
 				bool b0 = get_char_pixel(c, x, y);
diff --git a/kms++util/src/testpat.cpp b/kms++util/src/testpat.cpp
index f9a3c8a025cd..c120de34a101 100644
--- a/kms++util/src/testpat.cpp
+++ b/kms++util/src/testpat.cpp
@@ -106,6 +106,7 @@ static void draw_test_pattern_part(IFramebuffer& fb, unsigned start_y, unsigned
 	unsigned w = fb.width();
 
 	const PixelFormatInfo& format_info = get_pixel_format_info(fb.format());
+	const PixelFormatPlaneInfo& plane_info = format_info.planes[format_info.num_planes - 1];
 
 	switch (format_info.type) {
 	case PixelColorType::RGB:
@@ -118,8 +119,8 @@ static void draw_test_pattern_part(IFramebuffer& fb, unsigned start_y, unsigned
 		break;
 
 	case PixelColorType::YUV:
-		switch (format_info.num_planes) {
-		case 1:
+		switch (plane_info.xsub + plane_info.ysub) {
+		case 3:
 			for (y = start_y; y < end_y; y++) {
 				for (x = 0; x < w; x += 2) {
 					RGB pixel1 = get_test_pattern_pixel(fb, x, y);
@@ -129,7 +130,7 @@ static void draw_test_pattern_part(IFramebuffer& fb, unsigned start_y, unsigned
 			}
 			break;
 
-		case 2:
+		case 4:
 			for (y = start_y; y < end_y; y += 2) {
 				for (x = 0; x < w; x += 2) {
 					RGB pixel00 = get_test_pattern_pixel(fb, x, y);
diff --git a/py/pykms/pykmsbase.cpp b/py/pykms/pykmsbase.cpp
index 407b9485f556..003ad3c1a0b2 100644
--- a/py/pykms/pykmsbase.cpp
+++ b/py/pykms/pykmsbase.cpp
@@ -178,6 +178,8 @@ void init_pykmsbase(py::module &m)
 
 			.value("NV12", PixelFormat::NV12)
 			.value("NV21", PixelFormat::NV21)
+			.value("NV16", PixelFormat::NV16)
+			.value("NV61", PixelFormat::NV61)
 
 			.value("UYVY", PixelFormat::UYVY)
 			.value("YUYV", PixelFormat::YUYV)
-- 
Regards,

Laurent Pinchart

