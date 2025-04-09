Return-Path: <linux-renesas-soc+bounces-15619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 024E6A81A0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1BF744507D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855704C80;
	Wed,  9 Apr 2025 00:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BO93LKRH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5662C190
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159719; cv=none; b=KHd8XduqeNsWhJsQuZenV0NeXEHWAPBV5P4EXy3Ot8LL2N7vNisNQ98Di1vbLzU8rVzqszrV+YT5zoJ4nxHlJxJvx1JFbtrraNk4aqbyXWT/PnAzp5wXTJg/Uw8VEwyG4UU20HIlCSOD8XDmDFNz7WNhE0DalOPymuRH7R7h9CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159719; c=relaxed/simple;
	bh=qtoMHXiEcJsgwwhTsFOSHqVpcGAbgCFPg/mPWpfQRGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umckCpcLErdjw/zmmqVjYqCcrma/bH8fK7A4YRvDkq4dch/S+Di+6ctxvvlDxERY4Dk8VfFF7bByTnLYQ1H+GXsSEYzYkn/pNGDJPqm9LketI9XRqNSgo3/aPfUMW/YR/OShwtUEjs0kt681E7ogG/6WiNDZzOXySdFzKoP1pGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BO93LKRH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B85ECA98;
	Wed,  9 Apr 2025 02:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159595;
	bh=qtoMHXiEcJsgwwhTsFOSHqVpcGAbgCFPg/mPWpfQRGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BO93LKRH+OWsNEG48RXBmjJrDSLoFFVdtsU8Bb3k66/h1c4AnIp5gRTqoZwPSdoiG
	 0THf0WjH/fHTXHj2pTzc4oTB+Koel+kIRsFaFlFWLnzqPc5YOz4/wezdJOyCg8++NZ
	 oOJgbptfvC0Fj+5Ywj3lXWJ2rpBt3OEATiMZum0U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 07/16] gen-image: Centralize format conversion code
Date: Wed,  9 Apr 2025 03:47:49 +0300
Message-ID: <20250409004758.11014-8-laurent.pinchart@ideasonboard.com>
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

Create an image_convert() function that encapsulates all format
conversion, and use it to replace direct calls to other converter
functions. This prepares for extending the supported conversions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 src/gen-image.c | 241 ++++++++++++++++++++++++++++++------------------
 1 file changed, 149 insertions(+), 92 deletions(-)

diff --git a/src/gen-image.c b/src/gen-image.c
index 40773c8ef967..d2d4870a699a 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -205,6 +205,25 @@ static const struct format_info *format_by_name(const char *name)
 	return NULL;
 }
 
+static const struct format_info *format_by_type(enum format_type type)
+{
+	const char *name = "";
+
+	switch (type) {
+	case FORMAT_RGB:
+		name = "RGB24";
+		break;
+	case FORMAT_YUV:
+		name = "YUV24";
+		break;
+	case FORMAT_HSV:
+		name = "HSV24";
+		break;
+	}
+
+	return format_by_name(name);
+}
+
 /* -----------------------------------------------------------------------------
  * File I/O
  */
@@ -309,6 +328,13 @@ static void image_delete(struct image *image)
 	free(image);
 }
 
+static void image_move(struct image *src, struct image *dst)
+{
+	free(dst->data);
+	*dst = *src;
+	free(src);
+}
+
 /* -----------------------------------------------------------------------------
  * Image read and write
  */
@@ -707,9 +733,34 @@ static void image_format_yuv_planar(const struct image *input, struct image *out
  * Format conversion (as performed by the Renesas VSP HST, HSI, RPF and WPF)
  */
 
-static void colorspace_matrix(enum v4l2_ycbcr_encoding encoding,
-			      enum v4l2_quantization quantization,
-			      int (*matrix)[3][3])
+/* RGB to RGB (downsampling only) */
+static void image_convert_rgb_to_rgb(const struct image *input,
+				     struct image *output,
+				     const struct format_info *format,
+				     const struct csc_params *params)
+{
+	const uint8_t *idata = input->data;
+	uint8_t *odata = output->data;
+	unsigned int x;
+	unsigned int y;
+	uint8_t r, g, b;
+
+	for (y = 0; y < output->height; ++y) {
+		for (x = 0; x < output->width; ++x) {
+			r = *idata++ & (0xff << (8 - format->rgb.red.length));
+			g = *idata++ & (0xff << (8 - format->rgb.green.length));
+			b = *idata++ & (0xff << (8 - format->rgb.blue.length));
+			*odata++ = r;
+			*odata++ = g;
+			*odata++ = b;
+		}
+	}
+}
+
+/* RGB to YUV */
+static void csc_matrix(enum v4l2_ycbcr_encoding encoding,
+		       enum v4l2_quantization quantization,
+		       int (*matrix)[3][3])
 {
 	/*
 	 * The value of the coefficients has been reverse-engineered by
@@ -769,9 +820,8 @@ static void colorspace_matrix(enum v4l2_ycbcr_encoding encoding,
 		memcpy((*matrix)[i], (*m)[i], sizeof((*m)[i]));
 }
 
-static void colorspace_rgb2ycbcr(int m[3][3],
-				 enum v4l2_quantization quantization,
-				 const uint8_t rgb[3], uint8_t ycbcr[3])
+static void csc_rgb_to_yuv(int m[3][3], enum v4l2_quantization quantization,
+			   const uint8_t rgb[3], uint8_t ycbcr[3])
 {
 	bool full = quantization == V4L2_QUANTIZATION_FULL_RANGE;
 	int y_min = full ? 0 : 16;
@@ -798,10 +848,10 @@ static void colorspace_rgb2ycbcr(int m[3][3],
 	ycbcr[2] = CLAMP(cr, cbcr_min, cbcr_max);
 }
 
-static void image_colorspace_rgb_to_yuv(const struct image *input,
-					struct image *output,
-					const struct format_info *format,
-					const struct csc_params *params)
+static void image_convert_rgb_to_yuv(const struct image *input,
+				     struct image *output,
+				     const struct format_info *format,
+				     const struct csc_params *params)
 {
 	int matrix[3][3];
 	const uint8_t *idata = input->data;
@@ -809,12 +859,12 @@ static void image_colorspace_rgb_to_yuv(const struct image *input,
 	unsigned int x;
 	unsigned int y;
 
-	colorspace_matrix(params->encoding, params->quantization, &matrix);
+	csc_matrix(params->encoding, params->quantization, &matrix);
 
 	for (y = 0; y < output->height; ++y) {
 		for (x = 0; x < output->width; ++x) {
-			colorspace_rgb2ycbcr(matrix, params->quantization,
-					     &idata[3*x], &odata[3*x]);
+			csc_rgb_to_yuv(matrix, params->quantization,
+				       &idata[3*x], &odata[3*x]);
 		}
 		if (format->yuv.xsub == 2) {
 			for (x = 1; x < output->width - 1; x += 2) {
@@ -827,28 +877,7 @@ static void image_colorspace_rgb_to_yuv(const struct image *input,
 	}
 }
 
-static void image_convert_rgb_to_rgb(const struct image *input,
-				     struct image *output,
-				     const struct format_info *format)
-{
-	const uint8_t *idata = input->data;
-	uint8_t *odata = output->data;
-	unsigned int x;
-	unsigned int y;
-	uint8_t r, g, b;
-
-	for (y = 0; y < output->height; ++y) {
-		for (x = 0; x < output->width; ++x) {
-			r = *idata++ & (0xff << (8 - format->rgb.red.length));
-			g = *idata++ & (0xff << (8 - format->rgb.green.length));
-			b = *idata++ & (0xff << (8 - format->rgb.blue.length));
-			*odata++ = r;
-			*odata++ = g;
-			*odata++ = b;
-		}
-	}
-}
-
+/* RGB to HSV */
 #define K 4
 static uint8_t hst_calc_h(uint8_t r, uint8_t g, uint8_t b)
 {
@@ -944,9 +973,10 @@ static void hst_rgb_to_hsv(const uint8_t rgb[3], uint8_t hsv[3])
 	hsv[2] = hst_calc_v(rgb[0], rgb[1], rgb[2]);
 }
 
-static void image_rgb_to_hsv(const struct image *input,
-			     struct image *output,
-			     const struct csc_params *params)
+static void image_convert_rgb_to_hsv(const struct image *input,
+				     struct image *output,
+				     const struct format_info *format,
+				     const struct csc_params *params)
 {
 	const uint8_t *idata = input->data;
 	uint8_t *odata = output->data;
@@ -962,6 +992,78 @@ static void image_rgb_to_hsv(const struct image *input,
 	}
 }
 
+typedef void (*image_convert_func)(const struct image *input,
+				   struct image *output,
+				   const struct format_info *format,
+				   const struct csc_params *params);
+
+struct image_converter {
+	enum format_type input;
+	enum format_type output;
+	image_convert_func convert;
+};
+
+static const struct image_converter image_converters[] = {
+	{ FORMAT_RGB, FORMAT_HSV, image_convert_rgb_to_hsv },
+	{ FORMAT_RGB, FORMAT_RGB, image_convert_rgb_to_rgb },
+	{ FORMAT_RGB, FORMAT_YUV, image_convert_rgb_to_yuv },
+};
+
+static int image_convert(struct image *input, const struct format_info *format,
+			 const struct csc_params *params)
+{
+	const struct image_converter *converter;
+	const struct format_info *image_format;
+	struct image *output;
+	unsigned int i;
+
+	/*
+	 * Converters combines two tasks: they convert between 24-bit RGB, YUV
+	 * and HSV formats (as done by the VSP RPF and WPF CSC blocks for RGB
+	 * <-> YUV conversion, and the HSI and HST blocks for RGB <-> HSV
+	 * conversion), and they emulate the effects of reading downsampled
+	 * formats (RGB with less than 24bpp, or subsampled YUV). Combining
+	 * those operations makes the converter suitable to efficiently emulate
+	 *
+	 * - RPF unpacking
+	 * - RPF color space conversion
+	 * - HST and HSI
+	 * - WPF color space conversion
+	 *
+	 * The input image must be in a 24-bit format. The output format
+	 * parameter can be either a 24-bit format (when emulating RPF/WPF CSC,
+	 * HST or HSI), or a downsampled RGB or YUV format (when emulating RPF
+	 * unpacking). In all cases, the converter image will be in a 24-bit
+	 * format.
+	 */
+	image_format = format_by_type(format->type);
+
+	/* Find an appropriate converter. */
+	for (i = 0; i < ARRAY_SIZE(image_converters); ++i) {
+		converter = &image_converters[i];
+
+		if (converter->input == input->format->type &&
+		    converter->output == format->type)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(image_converters)) {
+		printf("Conversion from %s to %s is not supported\n",
+		       input->format->name, format->name);
+		return -EINVAL;
+	}
+
+	output = image_new(image_format, input->width, input->height);
+	if (!output)
+		return -ENOMEM;
+
+	converter->convert(input, output, format, params);
+
+	image_move(output, input);
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Image scaling
  */
@@ -1555,34 +1657,12 @@ static int process(const struct options *options)
 		input = cropped;
 	}
 
-	/* Convert colorspace */
-	if (options->input_format->type == FORMAT_YUV) {
-		struct image *yuv;
-
-		yuv = image_new(format_by_name("YUV24"), input->width,
-				input->height);
-		if (!yuv) {
-			ret = -ENOMEM;
+	/* Convert to the input format */
+	if (options->input_format != input->format) {
+		ret = image_convert(input, options->input_format,
+				    &options->csc_params);
+		if (ret)
 			goto done;
-		}
-
-		image_colorspace_rgb_to_yuv(input, yuv, options->input_format,
-					    &options->csc_params);
-		image_delete(input);
-		input = yuv;
-	} else if (options->input_format->rgb.bpp < 24) {
-		struct image *rgb;
-
-		rgb = image_new(format_by_name("RGB24"), input->width,
-				input->height);
-		if (!rgb) {
-			ret = -ENOMEM;
-			goto done;
-		}
-
-		image_convert_rgb_to_rgb(input, rgb, options->input_format);
-		image_delete(input);
-		input = rgb;
 	}
 
 	/* Scale */
@@ -1694,36 +1774,13 @@ static int process(const struct options *options)
 	}
 
 	/* Format the output */
-	if (input->format->type != options->output_format->type &&
-	    input->format->type != FORMAT_RGB) {
-		printf("Format conversion with non-RGB input not supported\n");
-		ret = -EINVAL;
-		goto done;
-	}
-
 	if (input->format->type != options->output_format->type) {
-		const struct format_info *format;
-		struct image *converted;
+		const struct format_info *format =
+			format_by_type(options->output_format->type);
 
-		if (options->output_format->type == FORMAT_YUV)
-			format = format_by_name("YUV24");
-		else
-			format = format_by_name("HSV24");
-
-		converted = image_new(format, input->width, input->height);
-		if (!converted) {
-			ret = -ENOMEM;
+		ret = image_convert(input, format, &options->csc_params);
+		if (ret)
 			goto done;
-		}
-
-		if (options->output_format->type == FORMAT_YUV)
-			image_colorspace_rgb_to_yuv(input, converted, format,
-						    &options->csc_params);
-		else
-			image_rgb_to_hsv(input, converted, &options->csc_params);
-
-		image_delete(input);
-		input = converted;
 	}
 
 	output = image_new(options->output_format, input->width, input->height);
-- 
Regards,

Laurent Pinchart


