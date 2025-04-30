Return-Path: <linux-renesas-soc+bounces-16549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F6AA55F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FDE64E469A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028E52D3F98;
	Wed, 30 Apr 2025 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUfEgsz7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD492D3A74;
	Wed, 30 Apr 2025 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045700; cv=none; b=bOBQeIw9ejBkrKwd59RtDTYYPsNth7ilIE+bkwImuwc83N2Olv4gQOl/k+s7QTY+fC8mFXlj9pKLNDm8efKmUJ2926KpK5vs+kuvw2r/th3bXu4DVzUGvoF668SYpQbq8JaDEpCUPrlA3Gc236KI5hCZ0QPujxxVESi8jv/NWNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045700; c=relaxed/simple;
	bh=EnTjnmHftkHm6H+Q8gGpHqx/S/sh/b2twjXC6gZ30Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSUwpEp7BODPC78ORhc2SHqOb0dH6uG+bBim6BsKx6LO4wlikoUnc0Ojo4Xq6nLnO6kB08UHjj4MjfPefQbFSuHnPvp2y0w12i07M2z+Ke6zN6dO2APG9RcGe1pNqrMdKrrJtI0uSzu3PiJcIpvkDfwZQPu3qCF6bTywBKGOieM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUfEgsz7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913d129c1aso230120f8f.0;
        Wed, 30 Apr 2025 13:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045697; x=1746650497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHSENBRba839dKZ5HLC9qv9Nui7oFbAenx3n9SP1y7Q=;
        b=ZUfEgsz77kEjq0dcugr3wUpegQCClNy2WVVw6qoTh/ozLVXukL4XoxmUNwZ+dmiCKM
         xmQlzCfI9gffUaN5FHxjhgie4uyPlIUzyjvUz8z6qJ1/Zln4qynYoWshNAcIvHDB7HAM
         4R8RKscgFGrKJ1ILS1eXyP6PdVWp3+NDnzrQ23IC+5GD+L4yKfWmBXQSeHrM7NlstbNv
         ZLaL4S4jcO60MFbiVECSuqvDhLykMrXtS4I27Cb3tJ8jen3Bjo+K1Qgpg21/a/8bMaVN
         vRyOKNVVPoPdrv8EpE8teiY3311BESDEATU4Ab4B303RLpzKL1dbvye1Cc1QnVyLJjGl
         Jbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045697; x=1746650497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHSENBRba839dKZ5HLC9qv9Nui7oFbAenx3n9SP1y7Q=;
        b=cn5DUIBPMGfipjIjLHtxsop0mshs4jTGGPvpBLWmty+WeExZ5VlVA2BfSHyUQSR5Hg
         Z2Eg/XjfiJ0tbNUADIVimIT9wveJ3dNSg7BH1vB0c/kB7oTSoyZppMGSYdsGVcVDftxd
         S3tlLs2A8qKE2kf+wi0mYyJK5vZ07PwBhlrfnf6xyzt+nMaDU9ABCsC+vvxTOgjHJbJ0
         xC9MAbJATvM72/j4jE2z/PAIJibNi3vqmnYSk5AGtRTnYPp/AZ0H34/51O26mb+X7l2a
         vJCN2n6HN+TjGKtnJMlPdrI6U95/dijwnEy1NyakS+VVKS3UT9Ly390ahr3SGt13i/EX
         XdGw==
X-Forwarded-Encrypted: i=1; AJvYcCVWQfsXE6/iuj3HXOAYOlOiRw3XoAiYKGJhfES2XG8OYCpeKOE61PKX5q28LvFdLvE3SOWRqxJJTaDeJUGN@vger.kernel.org, AJvYcCVsYP0wgspfjX+BX5eFmjcxM0358mfYh0RA1XmQrNZ8a3bdgpSbS+h9mzADkWVJIhNohat3qpSnxuLI@vger.kernel.org, AJvYcCWpqH4q3YaaEhJB0E+2EcH0GhLALm1GmxUKXVnYj1c/47m4G8USKztemgY0OWEHjFyaRHVLhy8KfEm7@vger.kernel.org, AJvYcCXTERyuLSsvBYVh1WwjaqDaBxdyJBvDZo1i6tiJxBDXMnI5KU26M48Qt1mFVqc4ofPq1QlodF7NX5WDLIRzkm3C5/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwskKVUhxTWRP1CEcqXGOu/Afi73H8PKM5rYiFpe1rRrTPG+gFM
	gabyP591QS0pBdS54aP340PCS4I6ZBJEAmfPTa1a2yKaFl2MQ8L2
X-Gm-Gg: ASbGncu+X4cE3z6NRcFYtEmk4S5r6wnlSn8soLyfENw4TOhyzjgBl8lj1F+HeZQ7bhV
	EKokXxX9hqHSy/VwwwltQgwPgBb6sHoFD8XOBShlwX1rSz/FA6ZY/ZC1a4v7nk/zQQUmhYUFQFq
	c9pzKdiQ5A1ccL0Q7+c1s7uPQ4nuT0eGjuAyZ1Qf9TKcPDqxchjMqILQPadalcik44YtCfNXSo0
	Gr85r4UeKklsCwMndnLaRK7iGmHDnLoJ+yB/9odUzRkL93hgwaCcVzDznGYnfjmmELjJX6+JudZ
	6dejRweJEdpex4usaWO6d6vJ/zCUjza6K7fClM/FzvW6rxebME+KKSpruYn1zkB6TUddw99UT5Q
	=
X-Google-Smtp-Source: AGHT+IE73Q9oFzikeNr6aktsW+t4EAvTbiy5T3YhrYhEeD3rnBgssIzFCnuAb+9Z3EGLGt144zQsBg==
X-Received: by 2002:a05:6000:2a9:b0:39c:1258:d12c with SMTP id ffacd0b85a97d-3a092d096d1mr690384f8f.28.1746045696801;
        Wed, 30 Apr 2025 13:41:36 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 15/15] drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
Date: Wed, 30 Apr 2025 21:41:12 +0100
Message-ID: <20250430204112.342123-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4
- In rzv2h_dphy_find_ulpsexit() made the array static const.
 
v2->v3:
- Simplifed V2H DSI timings array to save space
- Switched to use fsleep() instead of udelay()

v1->v2:
- Dropped unused macros
- Added missing LPCLK flag to rzvv2h info
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 344 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 2 files changed, 378 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 22a386ca8ae3..b75dddfe0e94 100644
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
@@ -32,6 +33,9 @@
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
 #define RZ_MIPI_DSI_FEATURE_LPCLK	BIT(2)
 
+#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA	(80 * MEGA)
+#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA	(1500 * MEGA)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -42,6 +46,7 @@ struct rzg2l_mipi_dsi_hw_info {
 			      u64 *hsfreq_millihz);
 	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
 					    unsigned long mode_freq);
+	const struct rzv2h_pll_div_limits *cpg_dsi_limits;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long max_dclk;
@@ -49,6 +54,11 @@ struct rzg2l_mipi_dsi_hw_info {
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
@@ -70,6 +80,18 @@ struct rzg2l_mipi_dsi {
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
@@ -186,6 +208,155 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
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
@@ -307,6 +478,158 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
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
@@ -409,6 +732,9 @@ static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
 	case 18:
 		vich1ppsetr = VICH1PPSETR_DT_RGB18;
 		break;
+	case 16:
+		vich1ppsetr = VICH1PPSETR_DT_RGB16;
+		break;
 	}
 
 	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
@@ -864,6 +1190,23 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
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
+	.features = RZ_MIPI_DSI_FEATURE_16BPP |
+		    RZ_MIPI_DSI_FEATURE_LPCLK,
+};
+
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
@@ -875,6 +1218,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
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


