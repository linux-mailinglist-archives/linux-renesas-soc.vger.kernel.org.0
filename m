Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5B623D55A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgHFCSn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:18:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38262 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbgHFCSi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:18:38 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18A34FDE;
        Thu,  6 Aug 2020 04:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680306;
        bh=ylsNSRYZHipcHNjDDT0xUogibatWcC4UTtCLTtiBZb4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C0WTAN+7kFzMTo3Z2/OQKf9BMe2fnq0pWD6D67FSzlD0HhOZHc1Nv1yGPqmYos7H8
         o757rJhR6YfuCeQKuc2XNtChssr5Gw5fpuYlOvIKjUsRsAPgPWfk5sQAq/WvP6kcUJ
         YUcnDgay028+0W6xxDGImC6p6AGY8sN7HzWbDNAM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 7/8] kms++: Add support for the planar YUV formats
Date:   Thu,  6 Aug 2020 05:18:05 +0300
Message-Id: <20200806021807.21863-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the 6 planar YUV formats (YUV and YVU, combined with
420, 422 or 444 subsampling) to the PixelFormat class, the Python API,
and the drawing utilities.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 kms++/inc/kms++/pixelformats.h      |   7 +
 kms++/src/pixelformats.cpp          |   7 +
 kms++util/inc/kms++util/kms++util.h |   1 +
 kms++util/src/drawing.cpp           | 203 ++++++++++++++++++++++++----
 kms++util/src/testpat.cpp           |   9 ++
 py/pykms/pykmsbase.cpp              |   7 +
 6 files changed, 208 insertions(+), 26 deletions(-)

diff --git a/kms++/inc/kms++/pixelformats.h b/kms++/inc/kms++/pixelformats.h
index f550f2fff4e0..746f9e2b8c5a 100644
--- a/kms++/inc/kms++/pixelformats.h
+++ b/kms++/inc/kms++/pixelformats.h
@@ -20,6 +20,13 @@ enum class PixelFormat : uint32_t
 	NV16 = MakeFourCC("NV16"),
 	NV61 = MakeFourCC("NV61"),
 
+	YUV420 = MakeFourCC("YU12"),
+	YVU420 = MakeFourCC("YV12"),
+	YUV422 = MakeFourCC("YU16"),
+	YVU422 = MakeFourCC("YV16"),
+	YUV444 = MakeFourCC("YU24"),
+	YVU444 = MakeFourCC("YV24"),
+
 	UYVY = MakeFourCC("UYVY"),
 	YUYV = MakeFourCC("YUYV"),
 	YVYU = MakeFourCC("YVYU"),
diff --git a/kms++/src/pixelformats.cpp b/kms++/src/pixelformats.cpp
index d34df6435436..fe86fca04cd8 100644
--- a/kms++/src/pixelformats.cpp
+++ b/kms++/src/pixelformats.cpp
@@ -17,6 +17,13 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
 	{ PixelFormat::NV21, { PixelColorType::YUV, 2, { { 8, 1, 1, }, { 8, 2, 2 } }, } },
 	{ PixelFormat::NV16, { PixelColorType::YUV, 2, { { 8, 1, 1, }, { 8, 2, 1 } }, } },
 	{ PixelFormat::NV61, { PixelColorType::YUV, 2, { { 8, 1, 1, }, { 8, 2, 1 } }, } },
+	/* YUV planar */
+	{ PixelFormat::YUV420, { PixelColorType::YUV, 3, { { 8, 1, 1, }, { 8, 2, 2 }, { 8, 2, 2 } }, } },
+	{ PixelFormat::YVU420, { PixelColorType::YUV, 3, { { 8, 1, 1, }, { 8, 2, 2 }, { 8, 2, 2 } }, } },
+	{ PixelFormat::YUV422, { PixelColorType::YUV, 3, { { 8, 1, 1, }, { 8, 2, 1 }, { 8, 2, 1 } }, } },
+	{ PixelFormat::YVU422, { PixelColorType::YUV, 3, { { 8, 1, 1, }, { 8, 2, 1 }, { 8, 2, 1 } }, } },
+	{ PixelFormat::YUV444, { PixelColorType::YUV, 3, { { 8, 1, 1, }, { 8, 1, 1 }, { 8, 1, 1 } }, } },
+	{ PixelFormat::YVU444, { PixelColorType::YUV, 3, { { 8, 1, 1, }, { 8, 1, 1 }, { 8, 1, 1 } }, } },
 	/* RGB16 */
 	{ PixelFormat::RGB565, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
 	{ PixelFormat::BGR565, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
diff --git a/kms++util/inc/kms++util/kms++util.h b/kms++util/inc/kms++util/kms++util.h
index 62ec663725eb..8fc6c8b81e48 100644
--- a/kms++util/inc/kms++util/kms++util.h
+++ b/kms++util/inc/kms++util/kms++util.h
@@ -18,6 +18,7 @@ namespace kms
 class IFramebuffer;
 
 void draw_rgb_pixel(IFramebuffer& buf, unsigned x, unsigned y, RGB color);
+void draw_yuv444_pixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv);
 void draw_yuv422_macropixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv1, YUV yuv2);
 void draw_yuv420_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
 				   YUV yuv1, YUV yuv2, YUV yuv3, YUV yuv4);
diff --git a/kms++util/src/drawing.cpp b/kms++util/src/drawing.cpp
index a329b8362072..c1c639a8b3a5 100644
--- a/kms++util/src/drawing.cpp
+++ b/kms++util/src/drawing.cpp
@@ -115,6 +115,33 @@ void draw_rgb_pixel(IFramebuffer& buf, unsigned x, unsigned y, RGB color)
 	}
 }
 
+void draw_yuv444_pixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv)
+{
+	if (x >= buf.width() || y >= buf.height())
+		throw runtime_error("attempt to draw outside the buffer");
+
+	uint8_t *py = (uint8_t*)(buf.map(0) + buf.stride(0) * y + x);
+	uint8_t *pu = (uint8_t*)(buf.map(1) + buf.stride(1) * y + x);
+	uint8_t *pv = (uint8_t*)(buf.map(2) + buf.stride(2) * y + x);
+
+	switch (buf.format()) {
+	case PixelFormat::YUV444:
+		py[0] = yuv.y;
+		pu[0] = yuv.u;
+		pv[0] = yuv.v;
+		break;
+
+	case PixelFormat::YVU444:
+		py[0] = yuv.y;
+		pu[0] = yuv.v;
+		pv[0] = yuv.u;
+		break;
+
+	default:
+		throw std::invalid_argument("invalid pixelformat");
+	}
+}
+
 static void draw_yuv422_packed_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
 					  YUV yuv1, YUV yuv2)
 {
@@ -190,6 +217,38 @@ static void draw_yuv422_semiplanar_macropixel(IFramebuffer& buf, unsigned x, uns
 	}
 }
 
+static void draw_yuv422_planar_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
+					  YUV yuv1, YUV yuv2)
+{
+	uint8_t *py = (uint8_t*)(buf.map(0) + buf.stride(0) * y + x);
+	uint8_t *pu = (uint8_t*)(buf.map(1) + buf.stride(1) * y + x / 2);
+	uint8_t *pv = (uint8_t*)(buf.map(2) + buf.stride(2) * y + x / 2);
+
+	uint8_t y0 = yuv1.y;
+	uint8_t y1 = yuv2.y;
+	uint8_t u = (yuv1.u + yuv2.u) / 2;
+	uint8_t v = (yuv1.v + yuv2.v) / 2;
+
+	switch (buf.format()) {
+	case PixelFormat::YUV422:
+		py[0] = y0;
+		py[1] = y1;
+		pu[0] = u;
+		pv[0] = v;
+		break;
+
+	case PixelFormat::YVU422:
+		py[0] = y0;
+		py[1] = y1;
+		pu[0] = v;
+		pv[0] = u;
+		break;
+
+	default:
+		throw std::invalid_argument("invalid pixelformat");
+	}
+}
+
 void draw_yuv422_macropixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv1, YUV yuv2)
 {
 	if ((x + 1) >= buf.width() || y >= buf.height())
@@ -210,6 +269,90 @@ void draw_yuv422_macropixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv1,
 		draw_yuv422_semiplanar_macropixel(buf, x, y, yuv1, yuv2);
 		break;
 
+	case PixelFormat::YUV422:
+	case PixelFormat::YVU422:
+		draw_yuv422_planar_macropixel(buf, x, y, yuv1, yuv2);
+		break;
+
+	default:
+		throw std::invalid_argument("invalid pixelformat");
+	}
+}
+
+static void draw_yuv420_semiplanar_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
+					      YUV yuv1, YUV yuv2, YUV yuv3, YUV yuv4)
+{
+	uint8_t *py1 = (uint8_t*)(buf.map(0) + buf.stride(0) * (y + 0) + x);
+	uint8_t *py2 = (uint8_t*)(buf.map(0) + buf.stride(0) * (y + 1) + x);
+
+	uint8_t *puv = (uint8_t*)(buf.map(1) + buf.stride(1) * (y / 2) + x);
+
+	uint8_t y0 = yuv1.y;
+	uint8_t y1 = yuv2.y;
+	uint8_t y2 = yuv3.y;
+	uint8_t y3 = yuv4.y;
+	uint8_t u = (yuv1.u + yuv2.u + yuv3.u + yuv4.u) / 4;
+	uint8_t v = (yuv1.v + yuv2.v + yuv3.v + yuv4.v) / 4;
+
+	switch (buf.format()) {
+	case PixelFormat::NV12:
+		py1[0] = y0;
+		py1[1] = y1;
+		py2[0] = y2;
+		py2[1] = y3;
+		puv[0] = u;
+		puv[1] = v;
+		break;
+
+	case PixelFormat::NV21:
+		py1[0] = y0;
+		py1[1] = y1;
+		py2[0] = y2;
+		py2[1] = y3;
+		puv[0] = v;
+		puv[1] = u;
+		break;
+
+	default:
+		throw std::invalid_argument("invalid pixelformat");
+	}
+}
+
+static void draw_yuv420_planar_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
+					  YUV yuv1, YUV yuv2, YUV yuv3, YUV yuv4)
+{
+	uint8_t *py1 = (uint8_t*)(buf.map(0) + buf.stride(0) * (y + 0) + x);
+	uint8_t *py2 = (uint8_t*)(buf.map(0) + buf.stride(0) * (y + 1) + x);
+
+	uint8_t *pu = (uint8_t*)(buf.map(1) + buf.stride(1) * (y / 2) + x / 2);
+	uint8_t *pv = (uint8_t*)(buf.map(2) + buf.stride(2) * (y / 2) + x / 2);
+
+	uint8_t y0 = yuv1.y;
+	uint8_t y1 = yuv2.y;
+	uint8_t y2 = yuv3.y;
+	uint8_t y3 = yuv4.y;
+	uint8_t u = (yuv1.u + yuv2.u + yuv3.u + yuv4.u) / 4;
+	uint8_t v = (yuv1.v + yuv2.v + yuv3.v + yuv4.v) / 4;
+
+	switch (buf.format()) {
+	case PixelFormat::YUV420:
+		py1[0] = y0;
+		py1[1] = y1;
+		py2[0] = y2;
+		py2[1] = y3;
+		pu[0] = u;
+		pv[0] = v;
+		break;
+
+	case PixelFormat::YVU420:
+		py1[0] = y0;
+		py1[1] = y1;
+		py2[0] = y2;
+		py2[1] = y3;
+		pu[0] = v;
+		pv[0] = u;
+		break;
+
 	default:
 		throw std::invalid_argument("invalid pixelformat");
 	}
@@ -224,35 +367,15 @@ void draw_yuv420_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
 	ASSERT((x & 1) == 0);
 	ASSERT((y & 1) == 0);
 
-	uint8_t *py1 = (uint8_t*)(buf.map(0) + buf.stride(0) * (y + 0) + x);
-	uint8_t *py2 = (uint8_t*)(buf.map(0) + buf.stride(0) * (y + 1) + x);
-
-	uint8_t *puv = (uint8_t*)(buf.map(1) + buf.stride(1) * (y / 2) + x);
-
-	uint8_t y0 = yuv1.y;
-	uint8_t y1 = yuv2.y;
-	uint8_t y2 = yuv3.y;
-	uint8_t y3 = yuv4.y;
-	uint8_t u = (yuv1.u + yuv2.u + yuv3.u + yuv4.u) / 4;
-	uint8_t v = (yuv1.v + yuv2.v + yuv3.v + yuv4.v) / 4;
-
 	switch (buf.format()) {
 	case PixelFormat::NV12:
-		py1[0] = y0;
-		py1[1] = y1;
-		py2[0] = y2;
-		py2[1] = y3;
-		puv[0] = u;
-		puv[1] = v;
-		break;
-
 	case PixelFormat::NV21:
-		py1[0] = y0;
-		py1[1] = y1;
-		py2[0] = y2;
-		py2[1] = y3;
-		puv[0] = v;
-		puv[1] = u;
+		draw_yuv420_semiplanar_macropixel(buf, x, y, yuv1, yuv2, yuv3, yuv4);
+		break;
+
+	case PixelFormat::YUV420:
+	case PixelFormat::YVU420:
+		draw_yuv420_planar_macropixel(buf, x, y, yuv1, yuv2, yuv3, yuv4);
 		break;
 
 	default:
@@ -283,12 +406,23 @@ void draw_rect(IFramebuffer &fb, uint32_t x, uint32_t y, uint32_t w, uint32_t h,
 		}
 		break;
 
+	case PixelFormat::YUV444:
+	case PixelFormat::YVU444:
+		for (j = 0; j < h; j++) {
+			for (i = 0; i < w; i++) {
+				draw_yuv444_pixel(fb, x + i, y + j, yuvcolor);
+			}
+		}
+		break;
+
 	case PixelFormat::UYVY:
 	case PixelFormat::YUYV:
 	case PixelFormat::YVYU:
 	case PixelFormat::VYUY:
 	case PixelFormat::NV16:
 	case PixelFormat::NV61:
+	case PixelFormat::YUV422:
+	case PixelFormat::YVU422:
 		for (j = 0; j < h; j++) {
 			for (i = 0; i < w; i += 2) {
 				draw_yuv422_macropixel(fb, x + i, y + j, yuvcolor, yuvcolor);
@@ -298,6 +432,8 @@ void draw_rect(IFramebuffer &fb, uint32_t x, uint32_t y, uint32_t w, uint32_t h,
 
 	case PixelFormat::NV12:
 	case PixelFormat::NV21:
+	case PixelFormat::YUV420:
+	case PixelFormat::YVU420:
 		for (j = 0; j < h; j += 2) {
 			for (i = 0; i < w; i += 2) {
 				draw_yuv420_macropixel(fb, x + i, y + j,
@@ -361,12 +497,25 @@ static void draw_char(IFramebuffer& buf, uint32_t xpos, uint32_t ypos, char c, R
 		}
 		break;
 
+	case PixelFormat::YUV444:
+	case PixelFormat::YVU444:
+		for (y = 0; y < 8; y++) {
+			for (x = 0; x < 8; x++) {
+				bool b = get_char_pixel(c, x, y);
+
+				draw_yuv444_pixel(buf, xpos + x, ypos + y, b ? yuvcolor : YUV(RGB()));
+			}
+		}
+		break;
+
 	case PixelFormat::UYVY:
 	case PixelFormat::YUYV:
 	case PixelFormat::YVYU:
 	case PixelFormat::VYUY:
 	case PixelFormat::NV16:
 	case PixelFormat::NV61:
+	case PixelFormat::YUV422:
+	case PixelFormat::YVU422:
 		for (y = 0; y < 8; y++) {
 			for (x = 0; x < 8; x += 2) {
 				bool b0 = get_char_pixel(c, x, y);
@@ -380,6 +529,8 @@ static void draw_char(IFramebuffer& buf, uint32_t xpos, uint32_t ypos, char c, R
 
 	case PixelFormat::NV12:
 	case PixelFormat::NV21:
+	case PixelFormat::YUV420:
+	case PixelFormat::YVU420:
 		for (y = 0; y < 8; y += 2) {
 			for (x = 0; x < 8; x += 2) {
 				bool b00 = get_char_pixel(c, x, y);
diff --git a/kms++util/src/testpat.cpp b/kms++util/src/testpat.cpp
index c120de34a101..ac386737b7cd 100644
--- a/kms++util/src/testpat.cpp
+++ b/kms++util/src/testpat.cpp
@@ -120,6 +120,15 @@ static void draw_test_pattern_part(IFramebuffer& fb, unsigned start_y, unsigned
 
 	case PixelColorType::YUV:
 		switch (plane_info.xsub + plane_info.ysub) {
+		case 2:
+			for (y = start_y; y < end_y; y++) {
+				for (x = 0; x < w; x++) {
+					RGB pixel = get_test_pattern_pixel(fb, x, y);
+					draw_yuv444_pixel(fb, x, y, pixel.yuv(yuvt));
+				}
+			}
+			break;
+
 		case 3:
 			for (y = start_y; y < end_y; y++) {
 				for (x = 0; x < w; x += 2) {
diff --git a/py/pykms/pykmsbase.cpp b/py/pykms/pykmsbase.cpp
index 003ad3c1a0b2..3e6defc88def 100644
--- a/py/pykms/pykmsbase.cpp
+++ b/py/pykms/pykmsbase.cpp
@@ -181,6 +181,13 @@ void init_pykmsbase(py::module &m)
 			.value("NV16", PixelFormat::NV16)
 			.value("NV61", PixelFormat::NV61)
 
+			.value("YUV420", PixelFormat::YUV420)
+			.value("YVU420", PixelFormat::YVU420)
+			.value("YUV422", PixelFormat::YUV422)
+			.value("YVU422", PixelFormat::YVU422)
+			.value("YUV444", PixelFormat::YUV444)
+			.value("YVU444", PixelFormat::YVU444)
+
 			.value("UYVY", PixelFormat::UYVY)
 			.value("YUYV", PixelFormat::YUYV)
 			.value("YVYU", PixelFormat::YVYU)
-- 
Regards,

Laurent Pinchart

