Return-Path: <linux-renesas-soc+bounces-34693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z15oJT/USGpDuQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:37:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0C4707496
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:37:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="m/viaZ/n";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77B7F303A934
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7773A8FEE;
	Sat,  4 Jul 2026 09:34:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF1A3A6F17
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157683; cv=none; b=o91WiEsHPWVqsExGA91arMZtydJ2MTsBR1HeE2qzXGkdSc3jSNoUEqyxnd5nWcSgjmwEpLVQ04HipOS1L7uIVPoEEYpEn3aqBScuZZDHSQxr/DzckgX5yNiWjU9fPxl0nY2iBLeGRdxbNP1IWlLh38Ka+ESpn9/Eixks/QHv5j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157683; c=relaxed/simple;
	bh=jRA1/ArLdLqhbTNAt77/U31uxI0FD/HiOH5W3qWONLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/lWd9q+Ik3TWwmWasO5V093fppRdTLrcSEYCpuC82kRmuILjsgy+2PH/LBafmOGxCCaRT4iaxSxX8S63r8vGCL60dhMAeooNyC2gfK2+FQz7YPz76+45dJY9Rxo01RVlI1D/UJDPEhFmvrElfdznndCaS/xxpS2SbJUuiiea4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/viaZ/n; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso7545555e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157679; x=1783762479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBc2uiELVda9BWyrE7kxnlr1R11N6flK1V2UNIs9oz4=;
        b=m/viaZ/noQH0p/eOzPOVoV4Zj949PcGl6qKKwDxJO9sACAWhn8MWFwO4+rLcVXBVfF
         gVLOAiPmi2Mca5BvllO08HX2uBB+Fezd7XsORETJ6IW+Zm30Cg4yIsXm8WXkBkL7dyke
         MpfgXdbEsqAvth4QJCdkuTnRnZ+nbK1DJPcoi7l/8cKwaLlbLEFsHAngknxoLxJ/BSmQ
         c5U+xyhVfEX4rW4eOBuGZaiApXDQfmNgNMxuHGWyfeMvr2+RVElH8lea4Q0JyZlYi97n
         HS2Yw2LutzJ5S5H01TdAfjGbfEiJYuZq+RXHbysrOsweY4Yjz7IrP1Cp2Suflbvut7LY
         BHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157679; x=1783762479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBc2uiELVda9BWyrE7kxnlr1R11N6flK1V2UNIs9oz4=;
        b=rP4VwABtAald6pz21faN+5+QZnEJoVPvtNhBvUlERlpVJkjbqomOjvSHkNAng0nAhS
         kYsIfBZznwRPyPxVVAoF47WrMQucdiNqn+V4qqznI4ppCojrGXOd22hvTQv+9I2y8ypa
         XVwbp3SvryUgJ2m1rne/ausnAFtGp5J1Vm63pwkpcX6j7GPm/w3coC5xAlOWJw7bf+JE
         wb6DhOmeHJjjDNqtIlxvL+twjYcS0JfznEz8o+rgvbKz6bvctAIONaXAsLBdaY/EqV4t
         pU6B76xVusVwtg9COtVkgA91iM0VablvVivLQDaNJWdkG7mN3Q0FgGaoKm9/TnTF4ith
         CqPg==
X-Forwarded-Encrypted: i=1; AFNElJ/k3YxEQ77ySYYhVyQcwclZ5DlD7uqBaBN1jdO8afpQj8wEmh/KV6Msjz1CFey/QzIHQICdCdo60y0uy3WY8yIVAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQRWmX2Id9N5IAnVkkOgd8LMUYdbGbWzfkq/t6McMWy7fkDHwU
	SVUUMddNzqwvy7fHSdBwR1+t+S2moZKhvz5+AZFIgg+40z4ZcWQtqwjK
X-Gm-Gg: AfdE7clEiYVRBRVG21B94gSeSd1uJT7nhEfkHj9bOEig4x0maknUTZ1FWwULc2gK6PF
	Qp3PD1onH4Gujma8KMKr88mDd9SLfQT0WfHoUuJ0QjxP6fA8JERKLon4UvuOLfDyp5yLcKPMCYt
	58UkHcS0syWNi4+abhv1VIZCxy+I6IOTI4RSOc7iTlEm8OVXdS4seLI0lchAm1Q49rKvWmHfE9f
	Ktv49nMo1uuZF+Xz5njOynRnyw4939lyzHcpbAB5YzH+NiPDIl2TNtZ1fT0Z8cxHGs38wqs78N8
	1k35uWB8ljAXWrYsvmwRjWuCdj4E776TzFiBVfnZGV4yabh28GfnbOr7p+nadjYohKIEGLkVqhh
	4qQ+scuE+JgY/CjeuuiArzM0g/xXoePzfKVmiUh80ZLxaQhKrCGRyUWlHHI80g8lqfikgEBOCvq
	XgvJc+VOeNaYX6G/kZ5Z/OnYu7xmoO02Q=
X-Received: by 2002:a05:600c:3e0b:b0:492:41c9:886b with SMTP id 5b1f17b1804b1-493d11d9d69mr26648055e9.14.1783157678929;
        Sat, 04 Jul 2026 02:34:38 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 06/16] drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
Date: Sat,  4 Jul 2026 10:34:16 +0100
Message-ID: <20260704093433.273672-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34693-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,bp.renesas.com,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B0C4707496

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the MIPI DSI controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The D-PHY global timing table of RZ/G3L SoC different
compared to the other SoCs. Introduce a dedicated D-PHY global timing
table rzg3l_mipi_dsi_global_timings and wire it up via a new
rzg3l_mipi_dsi_info hw_info variant for RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 129 +++++++++++++++++-
 1 file changed, 128 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 8bd664aa69ac..25f7602397dc 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -227,6 +227,107 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 	},
 };
 
+static const struct rzg2l_mipi_dsi_timings rzg3l_mipi_dsi_global_timings[] = {
+	{
+		.hsfreq_max = 100000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 18,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 94,
+		.tclk_trail = 10,
+		.ths_zero = 16,
+		.ths_trail = 22,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 150000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 16,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 94,
+		.tclk_trail = 10,
+		.ths_zero = 16,
+		.ths_trail = 15,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 250000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 13,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 58,
+		.tclk_trail = 8,
+		.ths_zero = 16,
+		.ths_trail = 10,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 400000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 12,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 58,
+		.tclk_trail = 7,
+		.ths_zero = 16,
+		.ths_trail = 9,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 600000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 5,
+		.ths_zero = 16,
+		.ths_trail = 6,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 1000000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 5,
+		.ths_zero = 16,
+		.ths_trail = 6,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 1500000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 4,
+		.ths_zero = 16,
+		.ths_trail = 5,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+};
+
 /**
  * struct rzv2h_mipi_dsi_timings - Timing parameter table structure
  *
@@ -1132,6 +1233,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 				      struct mipi_dsi_device *device)
 {
 	struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
+	struct clk *clk_parent;
 	int bpp;
 	int ret;
 
@@ -1186,7 +1288,10 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	 */
 	rzg2l_cpg_dsi_div_set_divider(bpp * 2 / dsi->lanes, PLL5_TARGET_DSI);
 
-	return 0;
+	/* DSI has symmetric 50% duty cycle */
+	clk_parent = clk_get_parent(dsi->vclk);
+
+	return clk_set_duty_cycle(clk_parent, 1, 2);
 }
 
 static int rzg2l_mipi_dsi_host_detach(struct mipi_dsi_host *host,
@@ -1600,7 +1705,29 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.activation_dly = 1000,
 };
 
+static const struct reg_field rzg3l_pwrrdy_reg_field = {
+	.reg = 0xd70,
+	.lsb = 0,
+	.msb = 1,
+};
+
+static const struct rzg2l_mipi_dsi_hw_info rzg3l_mipi_dsi_info = {
+	.dphy_init = rzg2l_mipi_dsi_dphy_init,
+	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
+	.syscon_field = &rzg3l_pwrrdy_reg_field,
+	.dsi_global_timings = rzg3l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg3l_mipi_dsi_global_timings),
+	.link_reg_offset = 0x10000,
+	.dphyctrl0_init_val = DSIDPHYCTRL0_CMN_MASTER_EN | DSIDPHYCTRL0_EN_BGR,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.activation_dly = 100,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP,
+};
+
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a08g046-mipi-dsi", .data = &rzg3l_mipi_dsi_info, },
 	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
-- 
2.43.0


