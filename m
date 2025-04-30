Return-Path: <linux-renesas-soc+bounces-16544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E5AA55DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EB874C6B97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEAE2D269A;
	Wed, 30 Apr 2025 20:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQcpRRKn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7053E2D1F42;
	Wed, 30 Apr 2025 20:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045693; cv=none; b=N25TVdlrlxg/RSiZSSB1d2Z9C9JAfs9jZFJTcTQVr/4Ta3EVHRGIESvB86V4i4X5t5GPAkQS+jwDK17+SJqKeRNheXh8AnnrIBf4oyrHGO7LuFGcBOKqOk6M0Uleb513GXpxUIcR78QI9iff5KC7OTcaqwbOvRsV6baDkhYks7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045693; c=relaxed/simple;
	bh=JkpsOE7X8o5qO22dmaMBGmVvdrdUHjIGbZoMegLrt7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBt0faSUxi5nRSBvm3LhgqWo8CEqhG/GpNCFecelvhpoZxguVZv+lEfyig78veU6ntwPCAqtr/YimizGwT7ev+WypPnwrMtT4xxoa6404ibWFGwPrp7uJcaxLwQcCkH31j52Zqx6IHeWTI67yTPtXRYQ9SqfBLiNxQJyzCWaeAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQcpRRKn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c266c1389so186533f8f.1;
        Wed, 30 Apr 2025 13:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045690; x=1746650490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjeGEHFhQrwReOhsdL4NgFWDff3mxawseiq2vCwBk4w=;
        b=MQcpRRKnuQDaJu/HjmQXPHLYZjh5LOG6rmrcl9db4/UNj2M6o7TZbLtQK7MkhIW6OC
         46Fn2TNJE5QJCzlhhCgLnIAF3d7n8PO7fwhkPDKfnJTtdOIyhcCUDA2nexWvyrmIRzZw
         qPKle8MkKit4WfTH3Om2ytUwhm33lw33YstZr/aBVkLh/BHUYUi1Masx6KF92VGQDQZv
         JUgq7NfARX7fSSESTjUmidLtDpuHV0LIZTXOZPazawOI4otlxl/aZOLdSMv4z5Qr8hhQ
         yT71a8SCbozGPx5uzh5Qdzy0NHkoEHXIJASF5VkdSf40rPRTVwbbw+gVGBsGgYwMRF2n
         oLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045690; x=1746650490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjeGEHFhQrwReOhsdL4NgFWDff3mxawseiq2vCwBk4w=;
        b=M7Uk24AQcb36Q9iruB7gzoFQpx3bxM4mA4bHkmYcmtarYs7tiBvMoA2mBfsVdC46HV
         qnRSO+WUctHpj1suW7IpuF/spTlvEmmc4Rvu2K0hL6Q4RbW2bZ3JXtjwfSHjRB9DByzt
         N17IEPeVujf6+Qjige/RAkfGCRkd1wlLb5LZZ435M0fyfzJXVLuTqMrqcD9pV6lwkMO5
         8frlgTPY04EczwGXppp6cC8OHxOnAkRiBDN+gWTdk34JrBKmNFuu6MP3mEGCYI+X4o8f
         3JqYyVRfseDdbs/N3BvtRZaFK7WUeChm04FX2R3FD6fBu3EVZAGW8L1Dtv/zKN11N+tz
         zrEQ==
X-Forwarded-Encrypted: i=1; AJvYcCURGuj3pG8a2ntnY4FByl5cIltXP9kYD0pz/4tBzU9g2N6EKt8Bn7azaT1a85A+Q6RbgIkvSsnE2ReC@vger.kernel.org, AJvYcCWg/tGdYdM23oSmUuiz9pds+WIDvfqV7BfgEdmL9RaMb5lNIEaAXS3ZzOgPk2Ui7srY/m3b3Ll14t8y@vger.kernel.org, AJvYcCXjPEvAaPmBQzp14sNBy7uTMctT6VUUVzRMywjqRQrvqewl1a5HByWCHFzzxX074frzJOKA4hbM6PI6n2YV@vger.kernel.org, AJvYcCXqwuEswkRGbf9N+KQU6QKKLlM5sNeRc5U8ZA+wYcAryoqiuNUvwGxKOVQjM17Odd+3yTSeGtncInfFLDEVbqDupUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/xQ+nQQ+n5JpwTtotHuq3TYSEKojlumRuvyTB/cBvdxGGDUE6
	+4dzZsM6+1cnbt3h4QGYPfmZcbscTQtagc/736D15nplX+tLUiB0
X-Gm-Gg: ASbGnculWm+IZn8Ifc1Twxi9NbI9d4DPGpLjknPl904/J0WDC9qFipL9oF39BpmipBo
	wXAzK21BKlzui7kQv7W+ZpHAK7ySJdxKyQh8Y4zY6LaEll4mQP4XYHiygn2voyDy5NpOh/qmnU5
	yXkhPGmdv9Pkzc1fN9Nslf2gDsJqz1VBDjycgVW28qAoquG/cFIrza5RyIJjDBbIHZy6mNFl5GY
	Lt5AeGLgBpCzwBlAdJgW9kztbu48TUVlL1SfQFKMn+uHmC8W6qXdRBe35JfoaBNDvNZDXCktHUN
	tCDLi7RAedpvIbiB0ZncH4qWHl6dVGhkP845RNERAe9lLQE1mRig3WNt9djhEmwIXoWD/PAhfyk
	=
X-Google-Smtp-Source: AGHT+IGqhYGb+EftLhll49pvj3i+SCNYO3DMsEER3+g1HHBc8aDZKCP96zTu6RJGkUAISRfoTnMojg==
X-Received: by 2002:a5d:64cb:0:b0:3a0:7a5d:bc01 with SMTP id ffacd0b85a97d-3a08f79d2demr4724264f8f.13.1746045689487;
        Wed, 30 Apr 2025 13:41:29 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:28 -0700 (PDT)
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
Subject: [PATCH v4 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency calculations
Date: Wed, 30 Apr 2025 21:41:07 +0100
Message-ID: <20250430204112.342123-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Used MILLI instead of KILO
- Made use of mul_u32_u32() for multiplication

v2->v3:
- Replaced `unsigned long long` with `u64`
- Replaced *_mhz with *_millihz` in functions

v1->v2:
- No changes
---
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ed259627f5e8..a4c0dbae4a46 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -33,7 +33,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    u64 hsfreq_millihz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	u64 hsfreq_millihz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	vclk_rate = clk_get_rate(dsi->vclk);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -778,7 +781,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


