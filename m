Return-Path: <linux-renesas-soc+bounces-15618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC4BA81A0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35DAD444EC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CB93E47B;
	Wed,  9 Apr 2025 00:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tilxT1P6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA00926AF5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159717; cv=none; b=X/012D0RfrPAaBgQujNdxMRHiDu0Vp1jjl9lat3T8sQfmXYVa26WTEMmBCymK+z4vvokctqhy95RprwTdYRu+Q8q4Tk611uR3C6atZupLlTruSUHZxeaS+2rH943XJT9FvDfHHO7ehpS/Rqaf2PyNt8hi7o7qv+vT4p0JRemtjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159717; c=relaxed/simple;
	bh=RhQjDP9NiMlgxkk8SJAQurEn/dAQxRcm7sDcvdDOlZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVXyz59EsoDxQK+oCFBYqREIQERCuSrvKGt97CXx/v1SM5w9LsoHDizaPsG4tOiDzD8a1v6tXl+Qe4Y/RAgGPTQi/r0Y9IfbdESZKwSvC3TD/l7SGJQ0m4jMHom3hOI6WERq3v4+RJreIbRXvUiETb29VX+Ifc4HrLpV3mh0Gok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tilxT1P6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C7C0EF2;
	Wed,  9 Apr 2025 02:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159594;
	bh=RhQjDP9NiMlgxkk8SJAQurEn/dAQxRcm7sDcvdDOlZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tilxT1P6p/ZVZAWOyT0m5xI/p7uup+S+2tsL04pfsHZK6STmITL/qJG5U7A9eER2d
	 61YXX2qH1OVnjVttt5OcwPI4RSd9ZH7QAKyUnvwhqJCmfyt+rJ4DsGj/BRp+cDVjcQ
	 Ny0qnkb4L50TOzXlJv8g5cyVxvOTBaZ9j8qSI02c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 06/16] gen-image: Split struct params into CSC and packing parameters
Date: Wed,  9 Apr 2025 03:47:48 +0300
Message-ID: <20250409004758.11014-7-laurent.pinchart@ideasonboard.com>
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

To prepare for improvements to the format conversion code, split the
struct params into CSC parameters and packing parameters.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 src/gen-image.c | 75 +++++++++++++++++++++++++------------------------
 1 file changed, 39 insertions(+), 36 deletions(-)

diff --git a/src/gen-image.c b/src/gen-image.c
index 50c10109289b..40773c8ef967 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -106,10 +106,13 @@ struct image {
 	void *data;
 };
 
-struct params {
-	unsigned int alpha;
+struct csc_params {
 	enum v4l2_ycbcr_encoding encoding;
 	enum v4l2_quantization quantization;
+};
+
+struct pack_params {
+	unsigned int alpha;
 	bool no_chroma_average;
 };
 
@@ -134,7 +137,8 @@ struct options {
 	bool vflip;
 	bool rotate;
 	unsigned int compose;
-	struct params params;
+	struct csc_params csc_params;
+	struct pack_params pack_params;
 	bool crop;
 	struct image_rect inputcrop;
 	enum histogram_type histo_type;
@@ -461,7 +465,7 @@ static int image_write(const struct image *image, const char *filename)
  */
 
 static void image_format_rgb8(const struct image *input, struct image *output,
-			      const struct params *params)
+			      const struct pack_params *params)
 {
 	const uint8_t *idata = input->data;
 	uint8_t *odata = output->data;
@@ -484,7 +488,7 @@ static void image_format_rgb8(const struct image *input, struct image *output,
 }
 
 static void image_format_rgb16(const struct image *input, struct image *output,
-			       const struct params *params)
+			       const struct pack_params *params)
 {
 	const struct format_info *format = output->format;
 	const uint8_t *idata = input->data;
@@ -508,7 +512,7 @@ static void image_format_rgb16(const struct image *input, struct image *output,
 }
 
 static void image_format_rgb24(const struct image *input, struct image *output,
-			       const struct params *params)
+			       const struct pack_params *params)
 {
 	struct color_rgb24 {
 		unsigned int value:24;
@@ -540,7 +544,7 @@ static void image_format_rgb24(const struct image *input, struct image *output,
 }
 
 static void image_format_rgb32(const struct image *input, struct image *output,
-			       const struct params *params)
+			       const struct pack_params *params)
 {
 	const struct format_info *format = output->format;
 	const uint8_t *idata = input->data;
@@ -564,13 +568,13 @@ static void image_format_rgb32(const struct image *input, struct image *output,
 }
 
 static void image_format_hsv24(const struct image *input, struct image *output,
-			       const struct params *params)
+			       const struct pack_params *params)
 {
 	memcpy(output->data, input->data, input->width * input->height * 3);
 }
 
 static void image_format_hsv32(const struct image *input, struct image *output,
-			       const struct params *params)
+			       const struct pack_params *params)
 {
 	const struct format_info *format = output->format;
 	const uint8_t *idata = input->data;
@@ -598,7 +602,7 @@ static void image_format_hsv32(const struct image *input, struct image *output,
  * chroma components of the two pixels to match the hardware behaviour.
  */
 static void image_format_yuv_packed(const struct image *input, struct image *output,
-				    const struct params *params)
+				    const struct pack_params *params)
 {
 	const struct format_info *format = output->format;
 	const uint8_t *idata = input->data;
@@ -637,7 +641,7 @@ static void image_format_yuv_packed(const struct image *input, struct image *out
 }
 
 static void image_format_yuv_planar(const struct image *input, struct image *output,
-				    const struct params *params)
+				    const struct pack_params *params)
 {
 	const struct format_info *format = output->format;
 	const uint8_t *idata;
@@ -797,7 +801,7 @@ static void colorspace_rgb2ycbcr(int m[3][3],
 static void image_colorspace_rgb_to_yuv(const struct image *input,
 					struct image *output,
 					const struct format_info *format,
-					const struct params *params)
+					const struct csc_params *params)
 {
 	int matrix[3][3];
 	const uint8_t *idata = input->data;
@@ -942,7 +946,7 @@ static void hst_rgb_to_hsv(const uint8_t rgb[3], uint8_t hsv[3])
 
 static void image_rgb_to_hsv(const struct image *input,
 			     struct image *output,
-			     const struct params *params)
+			     const struct csc_params *params)
 {
 	const uint8_t *idata = input->data;
 	uint8_t *odata = output->data;
@@ -999,8 +1003,7 @@ static void image_scale_bilinear(const struct image *input, struct image *output
 #undef _C2
 }
 
-static void image_scale(const struct image *input, struct image *output,
-			const struct params *params)
+static void image_scale(const struct image *input, struct image *output)
 {
 	image_scale_bilinear(input, output);
 }
@@ -1564,7 +1567,7 @@ static int process(const struct options *options)
 		}
 
 		image_colorspace_rgb_to_yuv(input, yuv, options->input_format,
-					    &options->params);
+					    &options->csc_params);
 		image_delete(input);
 		input = yuv;
 	} else if (options->input_format->rgb.bpp < 24) {
@@ -1604,7 +1607,7 @@ static int process(const struct options *options)
 			goto done;
 		}
 
-		image_scale(input, scaled, &options->params);
+		image_scale(input, scaled);
 		image_delete(input);
 		input = scaled;
 	}
@@ -1715,9 +1718,9 @@ static int process(const struct options *options)
 
 		if (options->output_format->type == FORMAT_YUV)
 			image_colorspace_rgb_to_yuv(input, converted, format,
-						    &options->params);
+						    &options->csc_params);
 		else
-			image_rgb_to_hsv(input, converted, &options->params);
+			image_rgb_to_hsv(input, converted, &options->csc_params);
 
 		image_delete(input);
 		input = converted;
@@ -1733,16 +1736,16 @@ static int process(const struct options *options)
 	case FORMAT_RGB:
 		switch (output->format->rgb.bpp) {
 		case 8:
-			image_format_rgb8(input, output, &options->params);
+			image_format_rgb8(input, output, &options->pack_params);
 			break;
 		case 16:
-			image_format_rgb16(input, output, &options->params);
+			image_format_rgb16(input, output, &options->pack_params);
 			break;
 		case 24:
-			image_format_rgb24(input, output, &options->params);
+			image_format_rgb24(input, output, &options->pack_params);
 			break;
 		case 32:
-			image_format_rgb32(input, output, &options->params);
+			image_format_rgb32(input, output, &options->pack_params);
 			break;
 		default:
 			ret = -EINVAL;
@@ -1753,10 +1756,10 @@ static int process(const struct options *options)
 	case FORMAT_HSV:
 		switch (output->format->hsv.bpp) {
 		case 24:
-			image_format_hsv24(input, output, &options->params);
+			image_format_hsv24(input, output, &options->pack_params);
 			break;
 		case 32:
-			image_format_hsv32(input, output, &options->params);
+			image_format_hsv32(input, output, &options->pack_params);
 			break;
 		default:
 			ret = -EINVAL;
@@ -1767,11 +1770,11 @@ static int process(const struct options *options)
 	case FORMAT_YUV:
 		switch (output->format->yuv.num_planes) {
 		case 1:
-			image_format_yuv_packed(input, output, &options->params);
+			image_format_yuv_packed(input, output, &options->pack_params);
 			break;
 		case 2:
 		case 3:
-			image_format_yuv_planar(input, output, &options->params);
+			image_format_yuv_planar(input, output, &options->pack_params);
 			break;
 		default:
 			ret = -EINVAL;
@@ -2002,9 +2005,9 @@ static int parse_args(struct options *options, int argc, char *argv[])
 	memset(options, 0, sizeof(*options));
 	options->input_format = format_by_name("RGB24");
 	options->output_format = format_by_name("RGB24");
-	options->params.alpha = 255;
-	options->params.encoding = V4L2_YCBCR_ENC_601;
-	options->params.quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	options->pack_params.alpha = 255;
+	options->csc_params.encoding = V4L2_YCBCR_ENC_601;
+	options->csc_params.quantization = V4L2_QUANTIZATION_LIM_RANGE;
 	options->histo_type = HISTOGRAM_HGO;
 
 	opterr = 0;
@@ -2031,7 +2034,7 @@ static int parse_args(struct options *options, int argc, char *argv[])
 				return 1;
 			}
 
-			options->params.alpha = alpha;
+			options->pack_params.alpha = alpha;
 			break;
 		}
 
@@ -2044,14 +2047,14 @@ static int parse_args(struct options *options, int argc, char *argv[])
 			  break;
 
 		case 'C':
-			  options->params.no_chroma_average = true;
+			  options->pack_params.no_chroma_average = true;
 			  break;
 
 		case 'e':
 			if (!strcmp(optarg, "BT.601")) {
-				options->params.encoding = V4L2_YCBCR_ENC_601;
+				options->csc_params.encoding = V4L2_YCBCR_ENC_601;
 			} else if (!strcmp(optarg, "REC.709")) {
-				options->params.encoding = V4L2_YCBCR_ENC_709;
+				options->csc_params.encoding = V4L2_YCBCR_ENC_709;
 			} else {
 				printf("Invalid encoding value '%s'\n", optarg);
 				return 1;
@@ -2108,9 +2111,9 @@ static int parse_args(struct options *options, int argc, char *argv[])
 
 		case 'q':
 			if (!strcmp(optarg, "limited")) {
-				options->params.quantization = V4L2_QUANTIZATION_LIM_RANGE;
+				options->csc_params.quantization = V4L2_QUANTIZATION_LIM_RANGE;
 			} else if (!strcmp(optarg, "full")) {
-				options->params.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+				options->csc_params.quantization = V4L2_QUANTIZATION_FULL_RANGE;
 			} else {
 				printf("Invalid quantization value '%s'\n", optarg);
 				return 1;
-- 
Regards,

Laurent Pinchart


