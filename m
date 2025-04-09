Return-Path: <linux-renesas-soc+bounces-15621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9A4A81A11
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFB76164984
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A00C4C80;
	Wed,  9 Apr 2025 00:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AKpeRDNL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EC12C190
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159722; cv=none; b=B8+PxIVOhC+Hnti1Cjvas5S+2yDj/b1+dxE8iDB4f++2Tpv/KIj8eeuy3h8xGOkBby1FvtSpdnGQP3wPirBIgjXHbSJIzdrw2op3HRpKadA25bBbJY13G+t55RQe7qYwTH1LmQLzQxrcdVrIpr/n3+XKwzStJkG9bAiIk5NmjJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159722; c=relaxed/simple;
	bh=PunNaulOMfclCNJB8h43c1bNp7/SXbVo+cgAyOTyhdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cg5lXk6u+t9wmWN8rnTdmnzib6s6+ZFSBeZudAxSq7uRkBitepvG1RrDHR3m5nW0Z6K/N8VBjHE3DU7Wl2k0YPJVyTgbPRIe5FjSEgggLAVeMUJgReSByKmHppIP3i/V2qH/vy35AvV0c1YzwD5wVlhf5NpAurIHRz/IXpEO1zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AKpeRDNL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD31982E;
	Wed,  9 Apr 2025 02:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159598;
	bh=PunNaulOMfclCNJB8h43c1bNp7/SXbVo+cgAyOTyhdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKpeRDNLzogzXGwPq9hFW+jCxq0mtx+fdxr3jNouxpxq7J58TquSezpLpCI22HCCP
	 JSyHSjV9gsR/2NQ6CpJXEVPNh7RTfX+g5a/ROFLLlPoT18xm8IEci9JJvvs8WSAFit
	 keLWffl/c3FzoElJy0b7CAFerZ12nMMUXZh5YS4I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 09/16] gen-image: Add support for YUV to RGB conversion
Date: Wed,  9 Apr 2025 03:47:51 +0300
Message-ID: <20250409004758.11014-10-laurent.pinchart@ideasonboard.com>
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

Support YUV to RGB conversion, to emulate the RPF and WPF CSC. As for
RGB to YUV conversion, the coefficients have been reverse-engineered.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 src/gen-image.c | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/src/gen-image.c b/src/gen-image.c
index 2f854634a986..cf6b6bc48745 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -979,6 +979,101 @@ static void image_convert_rgb_to_hsv(const struct image *input,
 	}
 }
 
+/* YUV ro RGB */
+static void csc_yuv_to_rgb(const int ccm[3][3], bool full_range,
+			   const uint8_t ycbcr[3], uint8_t rgb[3])
+{
+	int y_min = full_range ? 0 : 16;
+	int div = 1 << 11;
+	int y, cb, cr;
+	int r, g, b;
+
+	y = ycbcr[0] - y_min;
+	cb = ycbcr[1] - 128;
+	cr = ycbcr[2] - 128;
+
+	r = (ccm[0][0] * y + ccm[0][1] * cb + ccm[0][2] * cr + div / 2) / div;
+	g = (ccm[1][0] * y + ccm[1][1] * cb + ccm[1][2] * cr + div / 2) / div;
+	b = (ccm[2][0] * y + ccm[2][1] * cb + ccm[2][2] * cr + div / 2) / div;
+
+	rgb[0] = CLAMP(r, 0, 255);
+	rgb[1] = CLAMP(g, 0, 255);
+	rgb[2] = CLAMP(b, 0, 255);
+}
+
+static void image_convert_yuv_to_rgb(const struct image *input,
+				     struct image *output,
+				     const struct format_info *format,
+				     const struct csc_params *params)
+{
+	/*
+	 * The value of the coefficients has been reverse-engineered by
+	 * analyzing the VSP1 RGB output values for carefully crafted input YUV
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
+	 * coefficients differ more significantly. The first column of the
+	 * matrix matches the standard, but the second and third columns seem to
+	 * be divided by a factor equal to (240-16)/(235-16). The reason is not
+	 * currently understood, but the value of the factor strongly hints that
+	 * this isn't a random difference.
+	 */
+	static const int bt601[3][3] = {
+		{ 2384,  0,    3269 },
+		{ 2384, -803, -1665 },
+		{ 2384,  4131, 0    },
+	};
+	static const int bt601_full[3][3] = {
+		{ 2048,  0,    2871 },
+		{ 2048, -705, -1463 },
+		{ 2048,  3629, 0    },
+	};
+	static const int rec709[3][3] = {
+		{ 2385,  0,    3672 },
+		{ 2385, -437, -1092 },
+		{ 2385,  4326, 0    },
+	};
+	static const int rec709_full[3][3] = {
+		{ 2048,  0,    3153 },
+		{ 2048, -375, -937  },
+		{ 2048,  3715, 0    },
+	};
+
+	bool full_range = params->quantization == V4L2_QUANTIZATION_FULL_RANGE;
+	const int (*matrix)[3][3];
+	const uint8_t *idata = input->data;
+	uint8_t *odata = output->data;
+	unsigned int x;
+	unsigned int y;
+
+	switch (params->encoding) {
+	case V4L2_YCBCR_ENC_601:
+	default:
+		matrix = full_range ? &bt601_full : &bt601;
+		break;
+	case V4L2_YCBCR_ENC_709:
+		matrix = full_range ? &rec709_full : &rec709;
+		break;
+	}
+
+	for (y = 0; y < output->height; ++y) {
+		for (x = 0; x < output->width; ++x)
+			csc_yuv_to_rgb(*matrix, full_range,
+				       &idata[3*x], &odata[3*x]);
+
+		idata += 3 * output->width;
+		odata += 3 * output->width;
+	}
+}
+
 typedef void (*image_convert_func)(const struct image *input,
 				   struct image *output,
 				   const struct format_info *format,
@@ -994,6 +1089,7 @@ static const struct image_converter image_converters[] = {
 	{ FORMAT_RGB, FORMAT_HSV, image_convert_rgb_to_hsv },
 	{ FORMAT_RGB, FORMAT_RGB, image_convert_rgb_to_rgb },
 	{ FORMAT_RGB, FORMAT_YUV, image_convert_rgb_to_yuv },
+	{ FORMAT_YUV, FORMAT_RGB, image_convert_yuv_to_rgb },
 };
 
 static int image_convert(struct image *input, const struct format_info *format,
-- 
Regards,

Laurent Pinchart


