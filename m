Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD87E23D55B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgHFCSn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:18:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38264 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgHFCSj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:18:39 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86242FE0;
        Thu,  6 Aug 2020 04:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680306;
        bh=Ut/D8l9qJnI3sUFBbHY+0dlSPb4lTH1hwdVPhsQxa5s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qi87dCJtZi+wNwUFHpI45OYhLFppuU82ho5sAuSKXPr7icDu0P8BHOYmjgxTE7yn2
         RaZO4/xJ6aCDFkliYeHY+3OQCR7DRCHdB/RGgd6Cw4MHrUC2YnwN87jIcxgNKBWKsE
         4O0EpvLsmhNXbeTPRKOX7AC+L2HFANL7+ipXColo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 8/8] kms++: Add support for missing 8 -and 16-bit RGB formats
Date:   Thu,  6 Aug 2020 05:18:06 +0300
Message-Id: <20200806021807.21863-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the RGB332, XRGB1555 and XRGB4444 formats to the
PixelFormat class, the Python API, and the drawing utilities.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 kms++/inc/kms++/pixelformats.h  |  5 +++++
 kms++/src/pixelformats.cpp      |  9 ++++++---
 kms++util/inc/kms++util/color.h |  1 +
 kms++util/src/color.cpp         |  5 +++++
 kms++util/src/drawing.cpp       | 14 ++++++++++++++
 py/pykms/pykmsbase.cpp          |  5 +++++
 6 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/kms++/inc/kms++/pixelformats.h b/kms++/inc/kms++/pixelformats.h
index 746f9e2b8c5a..4e453a2f594d 100644
--- a/kms++/inc/kms++/pixelformats.h
+++ b/kms++/inc/kms++/pixelformats.h
@@ -45,9 +45,14 @@ enum class PixelFormat : uint32_t
 	RGB888 = MakeFourCC("RG24"),
 	BGR888 = MakeFourCC("BG24"),
 
+	RGB332 = MakeFourCC("RGB8"),
+
 	RGB565 = MakeFourCC("RG16"),
 	BGR565 = MakeFourCC("BG16"),
 
+	XRGB4444 = MakeFourCC("XR12"),
+	XRGB1555 = MakeFourCC("XR15"),
+
 	ARGB4444 = MakeFourCC("AR12"),
 	ARGB1555 = MakeFourCC("AR15"),
 
diff --git a/kms++/src/pixelformats.cpp b/kms++/src/pixelformats.cpp
index fe86fca04cd8..2c60c1e673f3 100644
--- a/kms++/src/pixelformats.cpp
+++ b/kms++/src/pixelformats.cpp
@@ -24,9 +24,15 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
 	{ PixelFormat::YVU422, { PixelColorType::YUV, 3, { { 8, 1, 1, }, { 8, 2, 1 }, { 8, 2, 1 } }, } },
 	{ PixelFormat::YUV444, { PixelColorType::YUV, 3, { { 8, 1, 1, }, { 8, 1, 1 }, { 8, 1, 1 } }, } },
 	{ PixelFormat::YVU444, { PixelColorType::YUV, 3, { { 8, 1, 1, }, { 8, 1, 1 }, { 8, 1, 1 } }, } },
+	/* RGB8 */
+	{ PixelFormat::RGB332, { PixelColorType::RGB, 1, { { 8, 1, 1 } }, } },
 	/* RGB16 */
 	{ PixelFormat::RGB565, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
 	{ PixelFormat::BGR565, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
+	{ PixelFormat::XRGB4444, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
+	{ PixelFormat::XRGB1555, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
+	{ PixelFormat::ARGB4444, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
+	{ PixelFormat::ARGB1555, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
 	/* RGB24 */
 	{ PixelFormat::RGB888, { PixelColorType::RGB, 1, { { 24, 1, 1 } }, } },
 	{ PixelFormat::BGR888, { PixelColorType::RGB, 1, { { 24, 1, 1 } }, } },
@@ -50,9 +56,6 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
 	{ PixelFormat::ABGR2101010, { PixelColorType::RGB, 1, { { 32, 1, 1 } }, } },
 	{ PixelFormat::RGBA1010102, { PixelColorType::RGB, 1, { { 32, 1, 1 } }, } },
 	{ PixelFormat::BGRA1010102, { PixelColorType::RGB, 1, { { 32, 1, 1 } }, } },
-
-	{ PixelFormat::ARGB4444, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
-	{ PixelFormat::ARGB1555, { PixelColorType::RGB, 1, { { 16, 1, 1 } }, } },
 };
 
 const struct PixelFormatInfo& get_pixel_format_info(PixelFormat format)
diff --git a/kms++util/inc/kms++util/color.h b/kms++util/inc/kms++util/color.h
index 2bf6e66315a4..fa05fbcc1982 100644
--- a/kms++util/inc/kms++util/color.h
+++ b/kms++util/inc/kms++util/color.h
@@ -34,6 +34,7 @@ struct RGB
 	uint32_t rgba1010102() const;
 	uint32_t bgra1010102() const;
 
+	uint8_t rgb332() const;
 	uint16_t rgb565() const;
 	uint16_t bgr565() const;
 	uint16_t argb4444() const;
diff --git a/kms++util/src/color.cpp b/kms++util/src/color.cpp
index 80e486668298..2d45eff5d70b 100644
--- a/kms++util/src/color.cpp
+++ b/kms++util/src/color.cpp
@@ -79,6 +79,11 @@ uint32_t RGB::bgra1010102() const
 	return (b << 24) | (g << 14) | (r << 4) | (a >> 6);
 }
 
+uint8_t RGB::rgb332() const
+{
+	return ((r >> 5) << 5) | ((g >> 5) << 2) | ((b >> 6) << 0);
+}
+
 uint16_t RGB::rgb565() const
 {
 	return ((r >> 3) << 11) | ((g >> 2) << 5) | ((b >> 3) << 0);
diff --git a/kms++util/src/drawing.cpp b/kms++util/src/drawing.cpp
index c1c639a8b3a5..3752f94695e0 100644
--- a/kms++util/src/drawing.cpp
+++ b/kms++util/src/drawing.cpp
@@ -86,6 +86,12 @@ void draw_rgb_pixel(IFramebuffer& buf, unsigned x, unsigned y, RGB color)
 		p[2] = color.b;
 		break;
 	}
+	case PixelFormat::RGB332:
+	{
+		uint8_t *p = (uint8_t*)(buf.map(0) + buf.stride(0) * y + x);
+		*p = color.rgb332();
+		break;
+	}
 	case PixelFormat::RGB565:
 	{
 		uint16_t *p = (uint16_t*)(buf.map(0) + buf.stride(0) * y + x * 2);
@@ -98,12 +104,14 @@ void draw_rgb_pixel(IFramebuffer& buf, unsigned x, unsigned y, RGB color)
 		*p = color.bgr565();
 		break;
 	}
+	case PixelFormat::XRGB4444:
 	case PixelFormat::ARGB4444:
 	{
 		uint16_t *p = (uint16_t*)(buf.map(0) + buf.stride(0) * y + x * 2);
 		*p = color.argb4444();
 		break;
 	}
+	case PixelFormat::XRGB1555:
 	case PixelFormat::ARGB1555:
 	{
 		uint16_t *p = (uint16_t*)(buf.map(0) + buf.stride(0) * y + x * 2);
@@ -397,8 +405,11 @@ void draw_rect(IFramebuffer &fb, uint32_t x, uint32_t y, uint32_t w, uint32_t h,
 	case PixelFormat::BGR888:
 	case PixelFormat::RGB565:
 	case PixelFormat::BGR565:
+	case PixelFormat::XRGB4444:
+	case PixelFormat::XRGB1555:
 	case PixelFormat::ARGB4444:
 	case PixelFormat::ARGB1555:
+	case PixelFormat::RGB332:
 		for (j = 0; j < h; j++) {
 			for (i = 0; i < w; i++) {
 				draw_rgb_pixel(fb, x + i, y + j, color);
@@ -486,8 +497,11 @@ static void draw_char(IFramebuffer& buf, uint32_t xpos, uint32_t ypos, char c, R
 	case PixelFormat::BGR888:
 	case PixelFormat::RGB565:
 	case PixelFormat::BGR565:
+	case PixelFormat::XRGB4444:
+	case PixelFormat::XRGB1555:
 	case PixelFormat::ARGB4444:
 	case PixelFormat::ARGB1555:
+	case PixelFormat::RGB332:
 		for (y = 0; y < 8; y++) {
 			for (x = 0; x < 8; x++) {
 				bool b = get_char_pixel(c, x, y);
diff --git a/py/pykms/pykmsbase.cpp b/py/pykms/pykmsbase.cpp
index 3e6defc88def..0448e0264ded 100644
--- a/py/pykms/pykmsbase.cpp
+++ b/py/pykms/pykmsbase.cpp
@@ -206,9 +206,14 @@ void init_pykmsbase(py::module &m)
 			.value("RGB888", PixelFormat::RGB888)
 			.value("BGR888", PixelFormat::BGR888)
 
+			.value("RGB332", PixelFormat::RGB332)
+
 			.value("RGB565", PixelFormat::RGB565)
 			.value("BGR565", PixelFormat::BGR565)
 
+			.value("XRGB4444", PixelFormat::XRGB4444)
+			.value("XRGB1555", PixelFormat::XRGB1555)
+
 			.value("ARGB4444", PixelFormat::ARGB4444)
 			.value("ARGB1555", PixelFormat::ARGB1555)
 
-- 
Regards,

Laurent Pinchart

