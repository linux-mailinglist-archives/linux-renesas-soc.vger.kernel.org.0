Return-Path: <linux-renesas-soc+bounces-15620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70553A81A10
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA9C3AD21E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2BC3595C;
	Wed,  9 Apr 2025 00:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KgDXntyw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A9A26AF5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159720; cv=none; b=F4g6xo/uLcqXMQXjnTlpQxEFUTvgQIeNQQv0hoKdk/IdFIhzxxWmstMrC5gkYkGCWKk0uetrS0A4T37v9AX6DvTvE8PAxNVL6uIScHwLV5TQVJ61PkUG5lT3t2ocO/2GG7PZei7RFIT2e30Ha5qTESnqR09EmMvnDuJZcuJJ1tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159720; c=relaxed/simple;
	bh=fXrQJESh0K1WyDnVjt0ZMYwQo6P5Vo7ptj4muMpf00U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXb6b2i3AOrfO0/T5VitCNVYIgQJ+Zzznq2MJjMMy1L6IMR0e8zn4h7vODqAK+fekdMtMQ8lTRw3erDOZ2vVRXH4y9G4jtcoRdc3eO0yALgTJ2lXbZoUhDrFUnEjPY/w2a6TetmwYpdyUiFSiY1mooc3NJXqIRxFTy0ebdhViBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KgDXntyw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BCB118E5;
	Wed,  9 Apr 2025 02:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159597;
	bh=fXrQJESh0K1WyDnVjt0ZMYwQo6P5Vo7ptj4muMpf00U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgDXntywvWPDY7UPqSV1Cr7buS6+bTSiEruHNN74RSYNvOOUrt+CrFtxsCqqLxixq
	 KZ9Qwz8vf1slg4FbwBvrkk2yDFV9R+cTfciF8keoSOEjdXO/VeuMwX4RSOKl833FAY
	 RBOtJ2Qb+eZ3Juy5KAiL7gWqHLyNVrZh8U3aat7U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 08/16] gen-image: Don't copy CSC conversion matrix
Date: Wed,  9 Apr 2025 03:47:50 +0300
Message-ID: <20250409004758.11014-9-laurent.pinchart@ideasonboard.com>
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

Merge the csc_matrix() function into image_convert_rgb_to_yuv() to avoid
unnecessary copies of the matrix.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 src/gen-image.c | 105 +++++++++++++++++++++---------------------------
 1 file changed, 46 insertions(+), 59 deletions(-)

diff --git a/src/gen-image.c b/src/gen-image.c
index d2d4870a699a..2f854634a986 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -758,9 +758,37 @@ static void image_convert_rgb_to_rgb(const struct image *input,
 }
 
 /* RGB to YUV */
-static void csc_matrix(enum v4l2_ycbcr_encoding encoding,
-		       enum v4l2_quantization quantization,
-		       int (*matrix)[3][3])
+static void csc_rgb_to_yuv(const int ccm[3][3], bool full_range,
+			   const uint8_t rgb[3], uint8_t ycbcr[3])
+{
+	int y_min = full_range ? 0 : 16;
+	int y_max = full_range ? 255 : 235;
+	int cbcr_min = full_range ? 0 : 16;
+	int cbcr_max = full_range ? 255 : 240;
+	int div = 1 << 11;
+	int r, g, b;
+	int y, cb, cr;
+
+	r = rgb[0];
+	g = rgb[1];
+	b = rgb[2];
+
+	y  = (ccm[0][0] * r + ccm[0][1] * g + ccm[0][2] * b + y_min * div + div / 2) / div;
+	cb = (ccm[1][0] * r + ccm[1][1] * g + ccm[1][2] * b + 128 * div + div / 2) / div;
+	cr = (ccm[2][0] * r + ccm[2][1] * g + ccm[2][2] * b + 128 * div + div / 2) / div;
+
+#define CLAMP(x, low, high) \
+	((x) < (low) ? (low) : ( (x) > (high) ? (high) : (x) ))
+
+	ycbcr[0] = CLAMP(y, y_min, y_max);
+	ycbcr[1] = CLAMP(cb, cbcr_min, cbcr_max);
+	ycbcr[2] = CLAMP(cr, cbcr_min, cbcr_max);
+}
+
+static void image_convert_rgb_to_yuv(const struct image *input,
+				     struct image *output,
+				     const struct format_info *format,
+				     const struct csc_params *params)
 {
 	/*
 	 * The value of the coefficients has been reverse-engineered by
@@ -802,76 +830,35 @@ static void csc_matrix(enum v4l2_ycbcr_encoding encoding,
 		{  1047, -951, -96   },
 	};
 
-	bool full = quantization == V4L2_QUANTIZATION_FULL_RANGE;
-	unsigned int i;
-	const int (*m)[3][3];
-
-	switch (encoding) {
-	case V4L2_YCBCR_ENC_601:
-	default:
-		m = full ? &bt601_full : &bt601;
-		break;
-	case V4L2_YCBCR_ENC_709:
-		m = full ? &rec709_full : &rec709;
-		break;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(*m); ++i)
-		memcpy((*matrix)[i], (*m)[i], sizeof((*m)[i]));
-}
-
-static void csc_rgb_to_yuv(int m[3][3], enum v4l2_quantization quantization,
-			   const uint8_t rgb[3], uint8_t ycbcr[3])
-{
-	bool full = quantization == V4L2_QUANTIZATION_FULL_RANGE;
-	int y_min = full ? 0 : 16;
-	int y_max = full ? 255 : 235;
-	int cbcr_min = full ? 0 : 16;
-	int cbcr_max = full ? 255 : 240;
-	int div = 1 << 11;
-	int r, g, b;
-	int y, cb, cr;
-
-	r = rgb[0];
-	g = rgb[1];
-	b = rgb[2];
-
-	y  = (m[0][0] * r + m[0][1] * g + m[0][2] * b + y_min * div + div / 2) / div;
-	cb = (m[1][0] * r + m[1][1] * g + m[1][2] * b + 128 * div + div / 2) / div;
-	cr = (m[2][0] * r + m[2][1] * g + m[2][2] * b + 128 * div + div / 2) / div;
-
-#define CLAMP(x, low, high) \
-	((x) < (low) ? (low) : ( (x) > (high) ? (high) : (x) ))
-
-	ycbcr[0] = CLAMP(y, y_min, y_max);
-	ycbcr[1] = CLAMP(cb, cbcr_min, cbcr_max);
-	ycbcr[2] = CLAMP(cr, cbcr_min, cbcr_max);
-}
-
-static void image_convert_rgb_to_yuv(const struct image *input,
-				     struct image *output,
-				     const struct format_info *format,
-				     const struct csc_params *params)
-{
-	int matrix[3][3];
+	bool full_range = params->quantization == V4L2_QUANTIZATION_FULL_RANGE;
+	const int (*matrix)[3][3];
 	const uint8_t *idata = input->data;
 	uint8_t *odata = output->data;
 	unsigned int x;
 	unsigned int y;
 
-	csc_matrix(params->encoding, params->quantization, &matrix);
+	switch (params->encoding) {
+	case V4L2_YCBCR_ENC_601:
+	default:
+		matrix = full_range ? &bt601_full : &bt601;
+		break;
+	case V4L2_YCBCR_ENC_709:
+		matrix = full_range ? &rec709_full : &rec709;
+		break;
+	}
 
 	for (y = 0; y < output->height; ++y) {
-		for (x = 0; x < output->width; ++x) {
-			csc_rgb_to_yuv(matrix, params->quantization,
+		for (x = 0; x < output->width; ++x)
+			csc_rgb_to_yuv(*matrix, full_range,
 				       &idata[3*x], &odata[3*x]);
-		}
+
 		if (format->yuv.xsub == 2) {
 			for (x = 1; x < output->width - 1; x += 2) {
 				odata[3*x + 1] = (odata[3*(x-1) + 1] + odata[3*(x+1) + 1]) / 2;
 				odata[3*x + 2] = (odata[3*(x-1) + 2] + odata[3*(x+1) + 2]) / 2;
 			}
 		}
+
 		idata += 3 * output->width;
 		odata += 3 * output->width;
 	}
-- 
Regards,

Laurent Pinchart


