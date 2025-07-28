Return-Path: <linux-renesas-soc+bounces-19720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52639B142DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 22:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A6EF3BFD55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 20:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF5927FB16;
	Mon, 28 Jul 2025 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHcjXrse"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3864F277C8C;
	Mon, 28 Jul 2025 20:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753733690; cv=none; b=OUWGW9u/kkiyYOdicziwS5wHSITV6cGq8T+uXGt9EUEwEEy2nyIoAfooFspBT2Hs6Iwr/1VmMM5hnr/brs2sSLBT9zBrTDocOJwt7S2G7JajGRZRXEAs8tx14ZVPYGmPqEKBNnYY8m9gIavKkP2ZbCrk0IaIC6LDm/Buq+fRX5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753733690; c=relaxed/simple;
	bh=m0C5AlXNdhcpYd+cWGwBkrpezffINSeH1cuO8xf9Ijs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMgqJPSmpvW/wjRUGLZY4u6NA00/ChOgzeSP6sTwYWLRsmaEJZHYolHkagQ4bCQxKZwHLXVoKFOHWAWrLAU6+T81eVAKkFZW0GUPnxi5hWXaHJCAQGOWPL7brfTMZBRTP9j+/VuvxyIIC8z2nXmdWiEpLgn9RNek5ovLWZCC068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHcjXrse; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-456108bf94bso27184525e9.0;
        Mon, 28 Jul 2025 13:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753733687; x=1754338487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tbleMf1YcaanwyQ0ZgIskyWLraEiO1X8rJYm191K6U=;
        b=kHcjXrse0xKv2CtbdEF8H3TeCjFSssqXl2/Pz98ONEDX8bZ7meDVDUJymxsp2N3V5e
         M1EejYAMi2hwAH+/XP4prANDD1pfmNRWVN424yWfyR4dOLjlxUI7Aojr5p01Cce3yXdJ
         k8JU5cpsqm7/P/IuAQL/LiojkvkSo0m/kCZOV0wHM6slsKzQqS/kXK4cmP8NwHZ3VG/I
         h1XnCdZNQbMTbbl8o+2mRYV13hxizryjPMwcxbXRMi3TpG1IV+jtJK7WmY8C5ZyON4D8
         2prISRW2zraXeLHcqQDuOhPbSyBpJFaCISH9nxUGQrJPDjGfzxgl8BAca6T7qGSjoU8t
         Zcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753733687; x=1754338487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tbleMf1YcaanwyQ0ZgIskyWLraEiO1X8rJYm191K6U=;
        b=eQIUUyTb1AC3FLazG8LsEDZ1EIMo7Ezr2SO6jIMMS3SOKliS5yzaN7p2CCrTIZTQuz
         ebABrP5OmhyZNI5vEsVHsLQwxYAhtB80tCn/2GzjHCV0vZdhuqOY7otP3Aq37WcHWXi2
         GKLOJqw80K2HIVHsDuAOfYHuqROFsfsrmkCeBP3EUnu9SYDzTrX3QiERKXbZtHF7C0l2
         5chq4cv6OdtKuvstfbepgZS8WxPDdaYaq73VXxbKN+vXgezecSIEotwpi9lPAPgzGVpt
         tPDsWdjByTzleZeDrm/GzLBl9d0UW7d3v96AlGsYIadnbvWk0WH/DHp6Tw0dSehN8+rR
         zvFw==
X-Forwarded-Encrypted: i=1; AJvYcCUyOT5rcfUs5z5ManiDAshVp1Va6svPJG3KyC3IHG0/PI0v17JhJO+1uOYsCLywFRrUe7MbMnQu8qRj@vger.kernel.org, AJvYcCVkE4QG+CS7DVzZu0X5T6i+UKtyDdcvjHHcJNWFtRefYPwL658dH7YeuRiOLOo+EqucWvv5J7zetaFusqzs@vger.kernel.org, AJvYcCXTmgOfZVBtuwoRgICZalb1S1giaNTAmgcbtQYD1aZuSAjNFURQRJJO1A6nsZ275mUabq21z1tFmEGWs/UV/+0bK2w=@vger.kernel.org, AJvYcCXmxcdndjZ8MSVrpJIVfs/ZmTzK612/3FnhvZnYviS9YxxfOuzq6g1dNPta/UQfrk1IWYsB5wsDy9xp@vger.kernel.org
X-Gm-Message-State: AOJu0Yya2xNB+4piFHKFMYB37gGORFBUSpVDut5SKfhiDOu7IoCwoutN
	XoqfU+SFBjvvO+SDs65p49kHpoeBGsihdUSUYTTt61nBfMq+SYbAAi27
X-Gm-Gg: ASbGnctOXQEf7/GfEgRcGcbL+tARCAVpAiSqK51qpiI9v4CD5/TPO5vfQt8LphaLBVg
	l6vrsOOPLFzeGMhdq2mkT6vHrz4jtk+WXWPb2+3ihJsNQinG67ogATCx1mXUrf4rfybp9ZdMu6M
	4ox9iEDFMeNfyBCnGgZNhU7ohMczEkBnpT95xWKHHr/+9nIDEnZSRCoyFnMGKm52dzc+1jJuUMi
	NwfItDwFs+dwRJRvX/i219oF42s7CIeX0fX5DBDsvvVgOKX2cTaropmPA2qyr2Mn/BxCsFc6Tt1
	AYMzedvkitJl/6PRazSaXieQUrwddDIFFOq90YSzZPWErBuSzVf8pMp0DpU/Bryj27/WG+LcGGf
	H9/kPUVk4cqAIddLfceCmE9DrjugJGh7NIGFn5I40OTXtLZmKC8p9LuJvoIlZrW/wtPaSCVaTe6
	klQqKxcqc=
X-Google-Smtp-Source: AGHT+IFTiwPkBzOjxX9YrEIqSU/mnzFZN/2+59E0JCxOIKZ748pgV31oU7FODR/WbqK+fabc5RcFBw==
X-Received: by 2002:a05:600c:4f05:b0:456:1e5a:885e with SMTP id 5b1f17b1804b1-45876303792mr123483445e9.3.1753733686540;
        Mon, 28 Jul 2025 13:14:46 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78889682bsm4317760f8f.77.2025.07.28.13.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:14:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 6/6] drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
Date: Mon, 28 Jul 2025 21:14:35 +0100
Message-ID: <20250728201435.3505594-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v6->v7:
- Used the new apis for calculating the PLLDSI
  parameters in the DSI driver.

v5->v6:
- Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
  PHYTCLKSETR_* and PHYTHSSETR_* macros.
- Replaced 10000000UL with 10 * MEGA
- Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
- Replaced `i -= 1;` with `i--;`
- Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
  RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
  RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
  RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.

v4->v5:
- No changes

v3->v4
- In rzv2h_dphy_find_ulpsexit() made the array static const.

v2->v3:
- Simplifed V2H DSI timings array to save space
- Switched to use fsleep() instead of udelay()

v1->v2:
- Dropped unused macros
- Added missing LPCLK flag to rzv2h info
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 2 files changed, 379 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 893a90c7a886..3b2f77665309 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk/renesas-rzv2h-cpg-pll.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -46,6 +47,11 @@ struct rzg2l_mipi_dsi_hw_info {
 			      u64 *hsfreq_millihz);
 	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
 					    unsigned long mode_freq);
+	struct {
+		const struct rzv2h_pll_limits **limits;
+		const u8 *table;
+		const u8 table_size;
+	} cpg_plldsi;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long min_dclk;
@@ -53,6 +59,11 @@ struct rzg2l_mipi_dsi_hw_info {
 	u8 features;
 };
 
+struct rzv2h_dsi_mode_calc {
+	unsigned long mode_freq_khz;
+	struct rzv2h_pll_pars dsi_parameters;
+};
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
@@ -75,11 +86,22 @@ struct rzg2l_mipi_dsi {
 	unsigned int lanes;
 	unsigned long mode_flags;
 
+	struct rzv2h_dsi_mode_calc mode_calc;
+
 	/* DCS buffer pointers when using external memory. */
 	dma_addr_t dcs_buf_phys;
 	u8 *dcs_buf_virt;
 };
 
+static const struct rzv2h_pll_limits rzv2h_plldsi_div_limits = {
+	.fout = { .min = 80 * MEGA, .max = 1500 * MEGA },
+	.fvco = { .min = 1050 * MEGA, .max = 2100 * MEGA },
+	.m = { .min = 64, .max = 1023 },
+	.p = { .min = 1, .max = 4 },
+	.s = { .min = 0, .max = 5 },
+	.k = { .min = -32768, .max = 32767 },
+};
+
 static inline struct rzg2l_mipi_dsi *
 bridge_to_rzg2l_mipi_dsi(struct drm_bridge *bridge)
 {
@@ -194,6 +216,155 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
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
+		i--;
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
+		unsigned long hsfreq = timings->hsfreq[i] * 10 * MEGA;
+
+		if (freq <= hsfreq)
+			break;
+	}
+
+	if (i == timings->len)
+		i--;
+
+	return timings->start_index + i;
+};
+
 static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
 {
 	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
@@ -318,6 +489,150 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	return 0;
 }
 
+static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
+					      unsigned long mode_freq)
+{
+	u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
+	struct rzv2h_pll_div_pars cpg_dsi_parameters;
+	struct rzv2h_pll_pars dsi_parameters;
+	bool parameters_found;
+	unsigned int bpp;
+
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	mode_freq_hz = mul_u32_u32(mode_freq, KILO);
+	mode_freq_millihz = mode_freq_hz * MILLI;
+	parameters_found =
+		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
+					&cpg_dsi_parameters,
+					dsi->info->cpg_plldsi.table,
+					dsi->info->cpg_plldsi.table_size,
+					mode_freq_millihz);
+	if (!parameters_found)
+		return MODE_CLOCK_RANGE;
+
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.div.freq_millihz * bpp,
+					       dsi->lanes);
+	parameters_found = rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits,
+					      &dsi_parameters, hsfreq_millihz);
+	if (!parameters_found)
+		return MODE_CLOCK_RANGE;
+
+	if (abs(dsi_parameters.error_millihz) >= 500)
+		return MODE_CLOCK_RANGE;
+
+	memcpy(&dsi->mode_calc.dsi_parameters, &dsi_parameters, sizeof(dsi_parameters));
+	dsi->mode_calc.mode_freq_khz = mode_freq;
+
+	return MODE_OK;
+}
+
+static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				u64 *hsfreq_millihz)
+{
+	struct rzv2h_pll_pars *dsi_parameters = &dsi->mode_calc.dsi_parameters;
+	unsigned long status;
+
+	if (dsi->mode_calc.mode_freq_khz != mode_freq) {
+		status = rzv2h_dphy_mode_clk_check(dsi, mode_freq);
+		if (status != MODE_OK) {
+			dev_err(dsi->dev, "No PLL parameters found for mode clk %lu\n",
+				mode_freq);
+			return -EINVAL;
+		}
+	}
+
+	*hsfreq_millihz = dsi_parameters->freq_millihz;
+
+	return 0;
+}
+
+static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
+				    u64 hsfreq_millihz)
+{
+	struct rzv2h_pll_pars *dsi_parameters = &dsi->mode_calc.dsi_parameters;
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
+	if (rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits,
+			       dsi_parameters, hsfreq_millihz))
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
+	phytclksetr = FIELD_PREP(PHYTCLKSETR_TCLKTRAILCTL, dphy_timings.tclk_trail) |
+		      FIELD_PREP(PHYTCLKSETR_TCLKPOSTCTL, dphy_timings.tclk_post) |
+		      FIELD_PREP(PHYTCLKSETR_TCLKZEROCTL, dphy_timings.tclk_zero) |
+		      FIELD_PREP(PHYTCLKSETR_TCLKPRPRCTL, dphy_timings.tclk_prepare);
+	phythssetr = FIELD_PREP(PHYTHSSETR_THSEXITCTL, dphy_timings.ths_exit) |
+		     FIELD_PREP(PHYTHSSETR_THSTRAILCTL, dphy_timings.ths_trail) |
+		     FIELD_PREP(PHYTHSSETR_THSZEROCTL, dphy_timings.ths_zero) |
+		     FIELD_PREP(PHYTHSSETR_THSPRPRCTL, dphy_timings.ths_prepare);
+	phytlpxsetr = rzg2l_mipi_dsi_phy_read(dsi, PHYTLPXSETR) & ~PHYTLPXSETR_TLPXCTL;
+	phytlpxsetr |= FIELD_PREP(PHYTLPXSETR_TLPXCTL, dphy_timings.tlpx);
+	phycr = rzg2l_mipi_dsi_phy_read(dsi, PHYCR) & ~GENMASK(9, 0);
+	phycr |= FIELD_PREP(PHYCR_ULPSEXIT, ulpsexit);
+
+	/* Setting all D-PHY Timings Registers */
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTCLKSETR, phytclksetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTHSSETR, phythssetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTLPXSETR, phytlpxsetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYCR, phycr);
+
+	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET0R,
+				 FIELD_PREP(PLLCLKSET0R_PLL_S, dsi_parameters->s) |
+				 FIELD_PREP(PLLCLKSET0R_PLL_P, dsi_parameters->p) |
+				 FIELD_PREP(PLLCLKSET0R_PLL_M, dsi_parameters->m));
+	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R,
+				 FIELD_PREP(PLLCLKSET1R_PLL_K, dsi_parameters->k));
+	fsleep(20);
+
+	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, PLLENR_PLLEN);
+	fsleep(500);
+
+	return 0;
+}
+
+static void rzv2h_mipi_dsi_dphy_startup_late_init(struct rzg2l_mipi_dsi *dsi)
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
@@ -430,6 +745,9 @@ static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
 	case 18:
 		vich1ppsetr = VICH1PPSETR_DT_RGB18;
 		break;
+	case 16:
+		vich1ppsetr = VICH1PPSETR_DT_RGB16;
+		break;
 	}
 
 	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
@@ -1056,6 +1374,32 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
+
+static const struct rzv2h_pll_limits *rzv2h_plldsi_limits[] = {
+	&rzv2h_cpg_pll_dsi_limits,
+};
+
+static const u8 rzv2h_cpg_div_table[] = {
+	2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32,
+};
+
+static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
+	.dphy_init = rzv2h_mipi_dsi_dphy_init,
+	.dphy_startup_late_init = rzv2h_mipi_dsi_dphy_startup_late_init,
+	.dphy_exit = rzv2h_mipi_dsi_dphy_exit,
+	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
+	.dphy_conf_clks = rzv2h_dphy_conf_clks,
+	.cpg_plldsi.limits = rzv2h_plldsi_limits,
+	.cpg_plldsi.table = rzv2h_cpg_div_table,
+	.cpg_plldsi.table_size = ARRAY_SIZE(rzv2h_cpg_div_table),
+	.phy_reg_offset = 0x10000,
+	.link_reg_offset = 0,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP,
+};
+
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
@@ -1066,6 +1410,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
 };
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index d8082a87d874..2bef20566648 100644
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
+#define PLLCLKSET0R_PLL_S		GENMASK(2, 0)
+#define PLLCLKSET0R_PLL_P		GENMASK(13, 8)
+#define PLLCLKSET0R_PLL_M		GENMASK(25, 16)
+
+#define PLLCLKSET1R			0x014
+#define PLLCLKSET1R_PLL_K		GENMASK(15, 0)
+
+#define PHYTCLKSETR			0x020
+#define PHYTCLKSETR_TCLKTRAILCTL        GENMASK(7, 0)
+#define PHYTCLKSETR_TCLKPOSTCTL         GENMASK(15, 8)
+#define PHYTCLKSETR_TCLKZEROCTL         GENMASK(23, 16)
+#define PHYTCLKSETR_TCLKPRPRCTL         GENMASK(31, 24)
+
+#define PHYTHSSETR			0x024
+#define PHYTHSSETR_THSEXITCTL           GENMASK(7, 0)
+#define PHYTHSSETR_THSTRAILCTL          GENMASK(15, 8)
+#define PHYTHSSETR_THSZEROCTL           GENMASK(23, 16)
+#define PHYTHSSETR_THSPRPRCTL           GENMASK(31, 24)
+
+#define PHYTLPXSETR			0x028
+#define PHYTLPXSETR_TLPXCTL             GENMASK(7, 0)
+
+#define PHYCR				0x030
+#define PHYCR_ULPSEXIT                  GENMASK(9, 0)
+
 /* --------------------------------------------------------*/
 
 /* Link Status Register */
@@ -130,6 +163,7 @@
 
 /* Video-Input Channel 1 Pixel Packet Set Register */
 #define VICH1PPSETR			0x420
+#define VICH1PPSETR_DT_RGB16		(0x0e << 16)
 #define VICH1PPSETR_DT_RGB18		(0x1e << 16)
 #define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
 #define VICH1PPSETR_DT_RGB24		(0x3e << 16)
-- 
2.50.1


