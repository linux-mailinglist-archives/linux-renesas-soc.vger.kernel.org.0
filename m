Return-Path: <linux-renesas-soc+bounces-17007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3BCAB43EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AE2119E3DE0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DAD296D3B;
	Mon, 12 May 2025 18:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0Qp5Fos"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB48296D2D;
	Mon, 12 May 2025 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075407; cv=none; b=FPEcDhZfWvK/ju6G1WaSMZ06mrTZVquNEpEk+3WaoTE2Eie+sEsGAxObJzV+lQlxtCdxU0nOg+IBy5WjwaQKQ0CmDftWE5Fn4mx6WvmkE56fDTOqnIP6xA2ydKcbFRDa62V+9C6fc7P1cTQcTb1Vt4x+x9zJCAQk6CMtxrBpYxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075407; c=relaxed/simple;
	bh=iOWhQ1gfIdlOqCEvGbmppRbaWSJzvSygM3HH55B0M5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y79rtr0SJ7NpddtmCNzJpcU3n8zMaUPm9l5if/twmj+9jAE6GKrOTIorru4xAIxC5mR+n4vUlGJ5ax94XtG8tnj9JcBbBK9yMehmSQH8Mpvpn4yEbPm0fYudv8lTVRXgQadUmee4gQja8C/MiQLyunbplDHebmO58xz6exz2qMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0Qp5Fos; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54fd1650b83so2213577e87.2;
        Mon, 12 May 2025 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747075403; x=1747680203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKN8O9g4YT4hx1/KMQXIaxSmewpafidGEe6qa7pXTXw=;
        b=c0Qp5FospCsV6cXRMyxFboxbO/RLENs2b0ahc8wh9xBA5VCiFASdOOAcLOPbPxZ8Y3
         hswGSFtbUxSKb1SjkFoRvYnnLXsKFb8MI21s2FY91Ht04Ym9LNQk1SJDKfGG+4u9F42U
         ePpgz8HHWrJNkIgGLTewoWc7o7KbVrCXoNG3GFcxSV4kuwVu9M6EQtems3DQSW42m7p2
         yy4v/722GAOEOBVHsMnMU4v0A0c5niYRUgCWkehbg+77SSRmeX+aKTuniqB/ytXXbS83
         EtNEbA8j1UQx9TnWbjStPQIJmF/E9m8bWIv0MJiV1IDSFidrBK7sFzx+MOfL6A6waJLJ
         U7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747075403; x=1747680203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKN8O9g4YT4hx1/KMQXIaxSmewpafidGEe6qa7pXTXw=;
        b=JplP9bzIj9y1JHvZltO6v90wiIL6czgO7z3F06Y5MqklpyeCdXbKBoSfR/6kBNcDc2
         ifneb5laO99MlG8IBiqcgqUkDkwF+ZAha+gJu7bpLrlMYv/ERmsdHU2cTECrute2quBJ
         vdHfMfzfQpu2DUg0NLaevjyYNV/PgyzOQImelwMjpLDmWvPfa6UE6t4umGH5TpLFMM7D
         N37ay/FA6TwMQPtqiwcHaWiWHYh6ET7t+T8w4/7vPdLdTRewr4TKNB7g8KGIVoFjyg6N
         1raGwpinEz5JYhQ6kbLjcvq6rMxGyippF8PYayFhgTNrUrM6e9679k4RoRxPfv4fw/2y
         YogA==
X-Forwarded-Encrypted: i=1; AJvYcCVXmIlkQBlqK/2sxQW3XHJilDudR5y30GoeQW5CKm9O4h53i6snCr4E1T1DvGRXtf1J/0mMNXswk1naSIy2@vger.kernel.org, AJvYcCVtGGMEJLp1yF91IY/rEVHF6e1UvVmNEWtoMMZQGU+zNquM0683MbmBF+JOmpeghDFQpkeHnC+uFYos@vger.kernel.org, AJvYcCVytxFR11Gyq2W8yXhJf66krv8nqz8Js/ehwl0K3s9m4isntuxqFtZKQkA44QgAFo1eRuFn6rz52MVkxlBQYDf9R0I=@vger.kernel.org, AJvYcCXZL494fgvCzhYxC4MmNNrgLuL1TY0zDK8C2PmIHVmlAc8pqF/fQu4h6+vchQYCCFUqirQDL0HxwzR2@vger.kernel.org
X-Gm-Message-State: AOJu0YyxHrfRFMxcIudXl5zQbS5+irIoyyMzyglGV9DprmYCJWZRNPU0
	bnPGie3g4fA6L5Eq5EWo3xL+ecf0INhTSrxvNrhf1jC39bl8hQY/cFZeo7Yp
X-Gm-Gg: ASbGncs+0K4a0gUVSNZnZPd2JDQ6GdOIqvl3ffCxcEMH7nPXHX0xdY6NJK2bhjLz08a
	3856/RjL7O073g6Ffw2Crv8Jry/eptybjXxkOyf/tRZ2mPudqzqjAmr7woBWdTM3vtPKAk+6Z0P
	mPMOvSkizMBmAcmhSyFnuuqwRPt9ti72ZQ+rRbVhzj/wfTj6EZpgOJwtkkjzYrkjkKQB03ZuFhz
	4NtdKY/Hxf+nXjS7XgmShKHUwcu9Bm3T7sRwcQ9sbK/99N7JzNlsFZ+wjxW19rXp5hyG8wL4/JR
	wcth2mLef/A7MMS828bLdQvCX509Z+N7x8n43p+RR/0o5ysAyuZqgFfUL7zfB02jdKftFMgmxHw
	P
X-Google-Smtp-Source: AGHT+IHP5VBb4/ngcpbVzd5zX4uP65N8d3GjMzcV4+K5Ke+rrGU7rsqRtzmjGf1vpugQ2K4XlLKcxQ==
X-Received: by 2002:a05:6000:4006:b0:39e:f9e8:d07d with SMTP id ffacd0b85a97d-3a1f6437e6emr11973762f8f.20.1747075392260;
        Mon, 12 May 2025 11:43:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd53sm13309203f8f.1.2025.05.12.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:43:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 4/4] drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:43:02 +0100
Message-ID: <20250512184302.241417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add DSI support for Renesas RZ/V2H(P) SoC.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No changes

v3->v4
- In rzv2h_dphy_find_ulpsexit() made the array static const.

v2->v3:
- Simplifed V2H DSI timings array to save space
- Switched to use fsleep() instead of udelay()

v1->v2:
- Dropped unused macros
- Added missing LPCLK flag to rzvv2h info
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 343 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 2 files changed, 377 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 98d2f30ae79d..db662d6d85c8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2022 Renesas Electronics Corporation
  */
 #include <linux/clk.h>
+#include <linux/clk/renesas-rzv2h-dsi.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -30,6 +31,9 @@
 
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
 
+#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA	(80 * MEGA)
+#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA	(1500 * MEGA)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -40,6 +44,7 @@ struct rzg2l_mipi_dsi_hw_info {
 			      u64 *hsfreq_millihz);
 	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
 					    unsigned long mode_freq);
+	const struct rzv2h_pll_div_limits *cpg_dsi_limits;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long max_dclk;
@@ -47,6 +52,11 @@ struct rzg2l_mipi_dsi_hw_info {
 	u8 features;
 };
 
+struct rzv2h_dsi_mode_calc {
+	unsigned long mode_freq;
+	u64 mode_freq_hz;
+};
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
@@ -68,6 +78,18 @@ struct rzg2l_mipi_dsi {
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+
+	struct rzv2h_dsi_mode_calc mode_calc;
+	struct rzv2h_plldsi_parameters dsi_parameters;
+};
+
+static const struct rzv2h_pll_div_limits rzv2h_plldsi_div_limits = {
+	.fvco = { .min = 1050 * MEGA, .max = 2100 * MEGA },
+	.m = { .min = 64, .max = 1023 },
+	.p = { .min = 1, .max = 4 },
+	.s = { .min = 0, .max = 5 },
+	.k = { .min = -32768, .max = 32767 },
+	.csdiv = { .min = 1, .max = 1 },
 };
 
 static inline struct rzg2l_mipi_dsi *
@@ -184,6 +206,155 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 	},
 };
 
+struct rzv2h_mipi_dsi_timings {
+	const u8 *hsfreq;
+	u8 len;
+	u8 start_index;
+};
+
+enum {
+	TCLKPRPRCTL,
+	TCLKZEROCTL,
+	TCLKPOSTCTL,
+	TCLKTRAILCTL,
+	THSPRPRCTL,
+	THSZEROCTL,
+	THSTRAILCTL,
+	TLPXCTL,
+	THSEXITCTL,
+};
+
+static const u8 tclkprprctl[] = {
+	15, 26, 37, 47, 58, 69, 79, 90, 101, 111, 122, 133, 143, 150,
+};
+
+static const u8 tclkzeroctl[] = {
+	9, 11, 13, 15, 18, 21, 23, 24, 25, 27, 29, 31, 34, 36, 38,
+	41, 43, 45, 47, 50, 52, 54, 57, 59, 61, 63, 66, 68, 70, 73,
+	75, 77, 79, 82, 84, 86, 89, 91, 93, 95, 98, 100, 102, 105,
+	107, 109, 111, 114, 116, 118, 121, 123, 125, 127, 130, 132,
+	134, 137, 139, 141, 143, 146, 148, 150,
+};
+
+static const u8 tclkpostctl[] = {
+	8, 21, 34, 48, 61, 74, 88, 101, 114, 128, 141, 150,
+};
+
+static const u8 tclktrailctl[] = {
+	14, 25, 37, 48, 59, 71, 82, 94, 105, 117, 128, 139, 150,
+};
+
+static const u8 thsprprctl[] = {
+	11, 19, 29, 40, 50, 61, 72, 82, 93, 103, 114, 125, 135, 146, 150,
+};
+
+static const u8 thszeroctl[] = {
+	18, 24, 29, 35, 40, 46, 51, 57, 62, 68, 73, 79, 84, 90,
+	95, 101, 106, 112, 117, 123, 128, 134, 139, 145, 150,
+};
+
+static const u8 thstrailctl[] = {
+	10, 21, 32, 42, 53, 64, 75, 85, 96, 107, 118, 128, 139, 150,
+};
+
+static const u8 tlpxctl[] = {
+	13, 26, 39, 53, 66, 79, 93, 106, 119, 133, 146,	150,
+};
+
+static const u8 thsexitctl[] = {
+	15, 23, 31, 39, 47, 55, 63, 71, 79, 87,
+	95, 103, 111, 119, 127, 135, 143, 150,
+};
+
+static const struct rzv2h_mipi_dsi_timings rzv2h_dsi_timings_tables[] = {
+	[TCLKPRPRCTL] = {
+		.hsfreq = tclkprprctl,
+		.len = ARRAY_SIZE(tclkprprctl),
+		.start_index = 0,
+	},
+	[TCLKZEROCTL] = {
+		.hsfreq = tclkzeroctl,
+		.len = ARRAY_SIZE(tclkzeroctl),
+		.start_index = 2,
+	},
+	[TCLKPOSTCTL] = {
+		.hsfreq = tclkpostctl,
+		.len = ARRAY_SIZE(tclkpostctl),
+		.start_index = 6,
+	},
+	[TCLKTRAILCTL] = {
+		.hsfreq = tclktrailctl,
+		.len = ARRAY_SIZE(tclktrailctl),
+		.start_index = 1,
+	},
+	[THSPRPRCTL] = {
+		.hsfreq = thsprprctl,
+		.len = ARRAY_SIZE(thsprprctl),
+		.start_index = 0,
+	},
+	[THSZEROCTL] = {
+		.hsfreq = thszeroctl,
+		.len = ARRAY_SIZE(thszeroctl),
+		.start_index = 0,
+	},
+	[THSTRAILCTL] = {
+		.hsfreq = thstrailctl,
+		.len = ARRAY_SIZE(thstrailctl),
+		.start_index = 3,
+	},
+	[TLPXCTL] = {
+		.hsfreq = tlpxctl,
+		.len = ARRAY_SIZE(tlpxctl),
+		.start_index = 0,
+	},
+	[THSEXITCTL] = {
+		.hsfreq = thsexitctl,
+		.len = ARRAY_SIZE(thsexitctl),
+		.start_index = 1,
+	},
+};
+
+static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq)
+{
+	static const unsigned long hsfreq[] = {
+		1953125UL,
+		3906250UL,
+		7812500UL,
+		15625000UL,
+	};
+	static const u16 ulpsexit[] = {49, 98, 195, 391};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(hsfreq); i++) {
+		if (freq <= hsfreq[i])
+			break;
+	}
+
+	if (i == ARRAY_SIZE(hsfreq))
+		i -= 1;
+
+	return ulpsexit[i];
+}
+
+static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index)
+{
+	const struct rzv2h_mipi_dsi_timings *timings;
+	u16 i;
+
+	timings = &rzv2h_dsi_timings_tables[index];
+	for (i = 0; i < timings->len; i++) {
+		unsigned long hsfreq = timings->hsfreq[i] * 10000000UL;
+
+		if (freq <= hsfreq)
+			break;
+	}
+
+	if (i == timings->len)
+		i -= 1;
+
+	return timings->start_index + i;
+};
+
 static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
 {
 	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
@@ -308,6 +479,158 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	return 0;
 }
 
+static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
+					      unsigned long mode_freq)
+{
+	struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
+	u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
+	struct rzv2h_plldsi_parameters cpg_dsi_parameters;
+	unsigned int bpp, i;
+
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+
+	for (i = 0; i < 10; i += 1) {
+		unsigned long hsfreq;
+		bool parameters_found;
+
+		mode_freq_hz = mode_freq * MILLI + i;
+		mode_freq_millihz = mode_freq_hz * MILLI * 1ULL;
+		parameters_found = rzv2h_dsi_get_pll_parameters_values(dsi->info->cpg_dsi_limits,
+								       &cpg_dsi_parameters,
+								       mode_freq_millihz);
+		if (!parameters_found)
+			continue;
+
+		hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.freq_millihz * bpp,
+						       dsi->lanes);
+		parameters_found = rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
+								       dsi_parameters,
+								       hsfreq_millihz);
+		if (!parameters_found)
+			continue;
+
+		if (abs(dsi_parameters->error_millihz) >= 500)
+			continue;
+
+		hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
+		if (hsfreq >= RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA &&
+		    hsfreq <= RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA) {
+			dsi->mode_calc.mode_freq_hz = mode_freq_hz;
+			dsi->mode_calc.mode_freq = mode_freq;
+			return MODE_OK;
+		}
+	}
+
+	return MODE_CLOCK_RANGE;
+}
+
+static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				u64 *hsfreq_millihz)
+{
+	struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
+	unsigned long status;
+
+	if (dsi->mode_calc.mode_freq != mode_freq) {
+		status = rzv2h_dphy_mode_clk_check(dsi, mode_freq);
+		if (status != MODE_OK) {
+			dev_err(dsi->dev, "No PLL parameters found for mode clk %lu\n",
+				mode_freq);
+			return -EINVAL;
+		}
+	}
+
+	clk_set_rate(dsi->vclk, dsi->mode_calc.mode_freq_hz);
+	*hsfreq_millihz = dsi_parameters->freq_millihz;
+
+	return 0;
+}
+
+static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
+				    u64 hsfreq_millihz)
+{
+	struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
+	unsigned long lpclk_rate = clk_get_rate(dsi->lpclk);
+	u32 phytclksetr, phythssetr, phytlpxsetr, phycr;
+	struct rzg2l_mipi_dsi_timings dphy_timings;
+	u16 ulpsexit;
+	u64 hsfreq;
+
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
+
+	if (dsi_parameters->freq_millihz == hsfreq_millihz)
+		goto parameters_found;
+
+	if (rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
+						dsi_parameters, hsfreq_millihz))
+		goto parameters_found;
+
+	dev_err(dsi->dev, "No PLL parameters found for HSFREQ %lluHz\n", hsfreq);
+	return -EINVAL;
+
+parameters_found:
+	dphy_timings.tclk_trail =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKTRAILCTL);
+	dphy_timings.tclk_post =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKPOSTCTL);
+	dphy_timings.tclk_zero =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKZEROCTL);
+	dphy_timings.tclk_prepare =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKPRPRCTL);
+	dphy_timings.ths_exit =
+		rzv2h_dphy_find_timings_val(hsfreq, THSEXITCTL);
+	dphy_timings.ths_trail =
+		rzv2h_dphy_find_timings_val(hsfreq, THSTRAILCTL);
+	dphy_timings.ths_zero =
+		rzv2h_dphy_find_timings_val(hsfreq, THSZEROCTL);
+	dphy_timings.ths_prepare =
+		rzv2h_dphy_find_timings_val(hsfreq, THSPRPRCTL);
+	dphy_timings.tlpx =
+		rzv2h_dphy_find_timings_val(hsfreq, TLPXCTL);
+	ulpsexit = rzv2h_dphy_find_ulpsexit(lpclk_rate);
+
+	phytclksetr = PHYTCLKSETR_TCLKTRAILCTL(dphy_timings.tclk_trail) |
+		      PHYTCLKSETR_TCLKPOSTCTL(dphy_timings.tclk_post) |
+		      PHYTCLKSETR_TCLKZEROCTL(dphy_timings.tclk_zero) |
+		      PHYTCLKSETR_TCLKPRPRCTL(dphy_timings.tclk_prepare);
+	phythssetr = PHYTHSSETR_THSEXITCTL(dphy_timings.ths_exit) |
+		     PHYTHSSETR_THSTRAILCTL(dphy_timings.ths_trail) |
+		     PHYTHSSETR_THSZEROCTL(dphy_timings.ths_zero) |
+		     PHYTHSSETR_THSPRPRCTL(dphy_timings.ths_prepare);
+	phytlpxsetr = rzg2l_mipi_dsi_phy_read(dsi, PHYTLPXSETR) & ~GENMASK(7, 0);
+	phytlpxsetr |= PHYTLPXSETR_TLPXCTL(dphy_timings.tlpx);
+	phycr = rzg2l_mipi_dsi_phy_read(dsi, PHYCR) & ~GENMASK(9, 0);
+	phycr |= PHYCR_ULPSEXIT(ulpsexit);
+
+	/* Setting all D-PHY Timings Registers */
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTCLKSETR, phytclksetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTHSSETR, phythssetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTLPXSETR, phytlpxsetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYCR, phycr);
+
+	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET0R,
+				 PLLCLKSET0R_PLL_S(dsi_parameters->s) |
+				 PLLCLKSET0R_PLL_P(dsi_parameters->p) |
+				 PLLCLKSET0R_PLL_M(dsi_parameters->m));
+	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R, PLLCLKSET1R_PLL_K(dsi_parameters->k));
+	fsleep(20);
+
+	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, PLLENR_PLLEN);
+	fsleep(500);
+
+	return 0;
+}
+
+static void rzv2h_mipi_dsi_dphy_late_init(struct rzg2l_mipi_dsi *dsi)
+{
+	fsleep(220);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYRSTR, PHYRSTR_PHYMRSTN);
+}
+
+static void rzv2h_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
+{
+	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, 0);
+}
+
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
@@ -410,6 +733,9 @@ static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
 	case 18:
 		vich1ppsetr = VICH1PPSETR_DT_RGB18;
 		break;
+	case 16:
+		vich1ppsetr = VICH1PPSETR_DT_RGB16;
+		break;
 	}
 
 	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
@@ -861,6 +1187,22 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
+
+static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
+	.dphy_init = rzv2h_mipi_dsi_dphy_init,
+	.dphy_late_init = rzv2h_mipi_dsi_dphy_late_init,
+	.dphy_exit = rzv2h_mipi_dsi_dphy_exit,
+	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
+	.dphy_conf_clks = rzv2h_dphy_conf_clks,
+	.cpg_dsi_limits = &rzv2h_cpg_pll_dsi_limits,
+	.phy_reg_offset = 0x10000,
+	.link_reg_offset = 0,
+	.max_dclk = 187500,
+	.min_dclk = 5440,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP,
+};
+
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
@@ -871,6 +1213,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
 };
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 16efe4dc59f4..68165395d61c 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -40,6 +40,39 @@
 #define DSIDPHYTIM3_THS_TRAIL(x)	((x) << 8)
 #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
 
+/* RZ/V2H DPHY Registers */
+#define PLLENR				0x000
+#define PLLENR_PLLEN			BIT(0)
+
+#define PHYRSTR				0x004
+#define PHYRSTR_PHYMRSTN		BIT(0)
+
+#define PLLCLKSET0R			0x010
+#define PLLCLKSET0R_PLL_S(x)		((x) << 0)
+#define PLLCLKSET0R_PLL_P(x)		((x) << 8)
+#define PLLCLKSET0R_PLL_M(x)		((x) << 16)
+
+#define PLLCLKSET1R			0x014
+#define PLLCLKSET1R_PLL_K(x)		((x) << 0)
+
+#define PHYTCLKSETR			0x020
+#define PHYTCLKSETR_TCLKTRAILCTL(x)	((x) << 0)
+#define PHYTCLKSETR_TCLKPOSTCTL(x)	((x) << 8)
+#define PHYTCLKSETR_TCLKZEROCTL(x)	((x) << 16)
+#define PHYTCLKSETR_TCLKPRPRCTL(x)	((x) << 24)
+
+#define PHYTHSSETR			0x024
+#define PHYTHSSETR_THSEXITCTL(x)	((x) << 0)
+#define PHYTHSSETR_THSTRAILCTL(x)	((x) << 8)
+#define PHYTHSSETR_THSZEROCTL(x)	((x) << 16)
+#define PHYTHSSETR_THSPRPRCTL(x)	((x) << 24)
+
+#define PHYTLPXSETR			0x028
+#define PHYTLPXSETR_TLPXCTL(x)		((x) << 0)
+
+#define PHYCR				0x030
+#define PHYCR_ULPSEXIT(x)		((x) << 0)
+
 /* --------------------------------------------------------*/
 
 /* Link Status Register */
@@ -116,6 +149,7 @@
 
 /* Video-Input Channel 1 Pixel Packet Set Register */
 #define VICH1PPSETR			0x420
+#define VICH1PPSETR_DT_RGB16		(0x0e << 16)
 #define VICH1PPSETR_DT_RGB18		(0x1e << 16)
 #define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
 #define VICH1PPSETR_DT_RGB24		(0x3e << 16)
-- 
2.49.0


