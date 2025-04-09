Return-Path: <linux-renesas-soc+bounces-15617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B401A81A0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED65819E1256
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B054B4C80;
	Wed,  9 Apr 2025 00:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vP0Jhhuy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D572C190
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159715; cv=none; b=OZHhXpnq1r+4WP1cUTNEqOx6/TCr1jiq8tE2OKBQfMw2CkymBs68sX89tDjq2RU8oVGhnNo/jIGLV6ZAAt6o0yEgy76WhvX04e+733/KVE37alsea9X2llFMkAwLhmozIH0POQpJzPdzFhWhp263frDDZWHKoQmlR6V6yhTT530=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159715; c=relaxed/simple;
	bh=WRAH/Ti6Mv+ZMPeZY3PjoPgvXAmUGgJqv4ICKncEb8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRkRgc0hMhUCfCMbpDaA44hN/7YsYE+IssfetnTHtzaila54DV6CuvOc6giPgAaV4jCIuzKCmg7gDtq2CAgbb8Mb+JFJ8h9Jw9wzFK85TIBMJFEjZIKi19TZ9kK1tn6zTVKe9oczP8lXb+eVVJ+7bbD7wO7REZTQD8yd/Hrj+Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vP0Jhhuy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05A9783D;
	Wed,  9 Apr 2025 02:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159593;
	bh=WRAH/Ti6Mv+ZMPeZY3PjoPgvXAmUGgJqv4ICKncEb8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vP0JhhuyAQZBCext7Vz0I4VZ/ovHVORts1xBiLauRQQ80EpPEM/sMCffEr0NrfG3T
	 C/28Q6QP0OaG2wNm7e92JZDwN688MvPmRKoaOVofeH24vOrxyQAnz8RaOxnQ0Yl/JD
	 bRyAQjpYeZ6urluk1wg6BBDco+H1MDN67kK9pP8Y=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 05/16] gen-image: Update the RGB to YCbCr conversion to match VSP hardware
Date: Wed,  9 Apr 2025 03:47:47 +0300
Message-ID: <20250409004758.11014-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
References: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RGB to YCbCr conversion is only used at the moment to generate images
for test cases that run fully YUV pipelines. The exact value of the RGB
to YCbCr conversion matrices hasn't mattered much so far. However, this
will change with introduction of tests that perform RGB to YCbCr
conversion. To achieve pixel-perfect match between the reference and
hardware frames, reference images need to be generated with the exact
method used by the VSP.

Replace the current coefficients by values obtained from
reverse-engineering of the RGB to YCbCr conversion performed by the
VSP1. Remove support for SMPTE240 and BT.2020, as the VSP hardware
supports BT.601 and BT.709 only.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 src/gen-image.c | 114 +++++++++++++++++++++---------------------------
 1 file changed, 50 insertions(+), 64 deletions(-)

diff --git a/src/gen-image.c b/src/gen-image.c
index d053d7906159..50c10109289b 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -700,56 +700,51 @@ static void image_format_yuv_planar(const struct image *input, struct image *out
 }
 
 /* -----------------------------------------------------------------------------
- * Colorspace handling
- *
- * The code is inspired by the v4l2-tpg Linux kernel driver.
+ * Format conversion (as performed by the Renesas VSP HST, HSI, RPF and WPF)
  */
 
 static void colorspace_matrix(enum v4l2_ycbcr_encoding encoding,
 			      enum v4l2_quantization quantization,
 			      int (*matrix)[3][3])
 {
-#define COEFF(v, r) ((int)(0.5 + (v) * (r) * 256.0))
-
+	/*
+	 * The value of the coefficients has been reverse-engineered by
+	 * analyzing the VSP1 YUV output values for carefully crafted input RGB
+	 * data. The hardware precision of the coefficients appears to be Q1.11.
+	 *
+	 * The exact way to derive those fixed-point coefficients from the
+	 * BT.601 and BT.709 standard values is not know, none of the tested
+	 * rounding methods (rounding down, rounding up, rounding to the closest
+	 * integer, or rounding to minimum the error on the sum of each line)
+	 * produce the fixed-point values used by the hardware.
+	 *
+	 * While the coefficients for BT.601 in both ranges, and BT.709 in
+	 * limited range, differ from the values listed in the respective
+	 * standards by at most a single unit, some of the BT.709 full range
+	 * coefficients differ more significantly. The first line of the matrix
+	 * matches the standard, but the second and third lines seem to be
+	 * multiplied a factor approximately equal to 1.072. The reason is not
+	 * currently understood.
+	 */
 	static const int bt601[3][3] = {
-		{ COEFF(0.299, 219),  COEFF(0.587, 219),  COEFF(0.114, 219)  },
-		{ COEFF(-0.169, 224), COEFF(-0.331, 224), COEFF(0.5, 224)    },
-		{ COEFF(0.5, 224),    COEFF(-0.419, 224), COEFF(-0.081, 224) },
+		{  526,  1033,  201 },
+		{ -304, -596,   900 },
+		{  900, -753,  -146 },
 	};
 	static const int bt601_full[3][3] = {
-		{ COEFF(0.299, 255),  COEFF(0.587, 255),  COEFF(0.114, 255)  },
-		{ COEFF(-0.169, 255), COEFF(-0.331, 255), COEFF(0.5, 255)    },
-		{ COEFF(0.5, 255),    COEFF(-0.419, 255), COEFF(-0.081, 255) },
+		{  612,   1202, 233  },
+		{ -346,  -678,  1024 },
+		{  1024, -857, -167  },
 	};
 	static const int rec709[3][3] = {
-		{ COEFF(0.2126, 219),  COEFF(0.7152, 219),  COEFF(0.0722, 219)  },
-		{ COEFF(-0.1146, 224), COEFF(-0.3854, 224), COEFF(0.5, 224)     },
-		{ COEFF(0.5, 224),     COEFF(-0.4542, 224), COEFF(-0.0458, 224) },
+		{  374,  1258, 127 },
+		{ -206, -693,  899 },
+		{  899, -817, -83  },
 	};
 	static const int rec709_full[3][3] = {
-		{ COEFF(0.2126, 255),  COEFF(0.7152, 255),  COEFF(0.0722, 255)  },
-		{ COEFF(-0.1146, 255), COEFF(-0.3854, 255), COEFF(0.5, 255)     },
-		{ COEFF(0.5, 255),     COEFF(-0.4542, 255), COEFF(-0.0458, 255) },
-	};
-	static const int smpte240m[3][3] = {
-		{ COEFF(0.212, 219),  COEFF(0.701, 219),  COEFF(0.087, 219)  },
-		{ COEFF(-0.116, 224), COEFF(-0.384, 224), COEFF(0.5, 224)    },
-		{ COEFF(0.5, 224),    COEFF(-0.445, 224), COEFF(-0.055, 224) },
-	};
-	static const int smpte240m_full[3][3] = {
-		{ COEFF(0.212, 255),  COEFF(0.701, 255),  COEFF(0.087, 255)  },
-		{ COEFF(-0.116, 255), COEFF(-0.384, 255), COEFF(0.5, 255)    },
-		{ COEFF(0.5, 255),    COEFF(-0.445, 255), COEFF(-0.055, 255) },
-	};
-	static const int bt2020[3][3] = {
-		{ COEFF(0.2627, 219),  COEFF(0.6780, 219),  COEFF(0.0593, 219)  },
-		{ COEFF(-0.1396, 224), COEFF(-0.3604, 224), COEFF(0.5, 224)     },
-		{ COEFF(0.5, 224),     COEFF(-0.4598, 224), COEFF(-0.0402, 224) },
-	};
-	static const int bt2020_full[3][3] = {
-		{ COEFF(0.2627, 255),  COEFF(0.6780, 255),  COEFF(0.0593, 255)  },
-		{ COEFF(-0.1396, 255), COEFF(-0.3604, 255), COEFF(0.5, 255)     },
-		{ COEFF(0.5, 255),     COEFF(-0.4698, 255), COEFF(-0.0402, 255) },
+		{  435,   1465, 148  },
+		{ -240,  -807,  1047 },
+		{  1047, -951, -96   },
 	};
 
 	bool full = quantization == V4L2_QUANTIZATION_FULL_RANGE;
@@ -764,12 +759,6 @@ static void colorspace_matrix(enum v4l2_ycbcr_encoding encoding,
 	case V4L2_YCBCR_ENC_709:
 		m = full ? &rec709_full : &rec709;
 		break;
-	case V4L2_YCBCR_ENC_BT2020:
-		m = full ? &bt2020_full : &bt2020;
-		break;
-	case V4L2_YCBCR_ENC_SMPTE240M:
-		m = full ? &smpte240m_full : &smpte240m;
-		break;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(*m); ++i)
@@ -781,23 +770,28 @@ static void colorspace_rgb2ycbcr(int m[3][3],
 				 const uint8_t rgb[3], uint8_t ycbcr[3])
 {
 	bool full = quantization == V4L2_QUANTIZATION_FULL_RANGE;
-	unsigned int y_offset = full ? 0 : 16;
+	int y_min = full ? 0 : 16;
+	int y_max = full ? 255 : 235;
+	int cbcr_min = full ? 0 : 16;
+	int cbcr_max = full ? 255 : 240;
+	int div = 1 << 11;
 	int r, g, b;
 	int y, cb, cr;
-	int div;
 
-	r = rgb[0] << 4;
-	g = rgb[1] << 4;
-	b = rgb[2] << 4;
+	r = rgb[0];
+	g = rgb[1];
+	b = rgb[2];
 
-	div = (1 << (8 + 4)) * 255;
-	y  = (m[0][0] * r + m[0][1] * g + m[0][2] * b + y_offset * div) / div;
-	cb = (m[1][0] * r + m[1][1] * g + m[1][2] * b + 128 * div) / div;
-	cr = (m[2][0] * r + m[2][1] * g + m[2][2] * b + 128 * div) / div;
+	y  = (m[0][0] * r + m[0][1] * g + m[0][2] * b + y_min * div + div / 2) / div;
+	cb = (m[1][0] * r + m[1][1] * g + m[1][2] * b + 128 * div + div / 2) / div;
+	cr = (m[2][0] * r + m[2][1] * g + m[2][2] * b + 128 * div + div / 2) / div;
 
-	ycbcr[0] = y;
-	ycbcr[1] = cb;
-	ycbcr[2] = cr;
+#define CLAMP(x, low, high) \
+	((x) < (low) ? (low) : ( (x) > (high) ? (high) : (x) ))
+
+	ycbcr[0] = CLAMP(y, y_min, y_max);
+	ycbcr[1] = CLAMP(cb, cbcr_min, cbcr_max);
+	ycbcr[2] = CLAMP(cr, cbcr_min, cbcr_max);
 }
 
 static void image_colorspace_rgb_to_yuv(const struct image *input,
@@ -851,10 +845,6 @@ static void image_convert_rgb_to_rgb(const struct image *input,
 	}
 }
 
-/* -----------------------------------------------------------------------------
- * RGB to HSV conversion (as performed by the Renesas VSP HST)
- */
-
 #define K 4
 static uint8_t hst_calc_h(uint8_t r, uint8_t g, uint8_t b)
 {
@@ -1828,7 +1818,7 @@ static void usage(const char *argv0)
 	printf("-C, --no-chroma-average		Disable chroma averaging for odd pixels on output\n");
 	printf("    --crop (X,Y)/WxH		Crop the input image\n");
 	printf("-e, --encoding enc		Set the YCbCr encoding method. Valid values are\n");
-	printf("				BT.601, REC.709, BT.2020 and SMPTE240M\n");
+	printf("				BT.601 and REC.709\n");
 	printf("-f, --format format		Set the output image format\n");
 	printf("				Defaults to RGB24 if not specified\n");
 	printf("				Use -f help to list the supported formats\n");
@@ -2062,10 +2052,6 @@ static int parse_args(struct options *options, int argc, char *argv[])
 				options->params.encoding = V4L2_YCBCR_ENC_601;
 			} else if (!strcmp(optarg, "REC.709")) {
 				options->params.encoding = V4L2_YCBCR_ENC_709;
-			} else if (!strcmp(optarg, "BT.2020")) {
-				options->params.encoding = V4L2_YCBCR_ENC_BT2020;
-			} else if (!strcmp(optarg, "SMPTE240M")) {
-				options->params.encoding = V4L2_YCBCR_ENC_SMPTE240M;
 			} else {
 				printf("Invalid encoding value '%s'\n", optarg);
 				return 1;
-- 
Regards,

Laurent Pinchart


