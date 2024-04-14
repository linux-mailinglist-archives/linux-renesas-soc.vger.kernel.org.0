Return-Path: <linux-renesas-soc+bounces-4443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22689F236
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 14:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F08A2281CC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 12:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAB715F31F;
	Wed, 10 Apr 2024 12:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ldXdVDTk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D9E15EFCF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 12:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712752044; cv=none; b=VtylXUUyRF2UULfWDakDppCoxwemzJ4GcD0Yj570/xjFx5MRb4uh2Xz0gIjIV+/bMaKjCMfkKp0tfLp9UTleS5VeYXuQoSHF3K5+OXFN6JYTMKKQ2tfJJAzTQY/kggttaZnBerO4VRbenE+vAlOz29oZMxocezf8KkNfOhAWlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712752044; c=relaxed/simple;
	bh=6KPSD3CV6Jniy65UJWan4EwWxElAtg5Emo94UsSLQdo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LABVb4b3sgvqOtYfRsPiYWf4fNsGJCLDsacrspPoGxjmUSTdAyLOQWje10+f1g4do1XeHoRPBvQLxXFTerfyhRqoOaAyrO+BLyzQBko+Ir/Unj3sxgij5zVB4t/nV/dQHjjthbMBc6wtVmDpDnnruIGPDiLh8XecdWOqZXQ+BuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ldXdVDTk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4173f9e5d73so2888665e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 05:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712752041; x=1713356841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpA2RlMoyu0BqLSW07AvttVgRisVX81MzCveYc+do0o=;
        b=ldXdVDTkqJZCSdBcESAimnuog7zgmJSXVUvW0rKyCfuMwqUC/0ZfR8xerEr0hAdcfm
         PKncaIWAWsdJq29vgzfz3DYXjyhNyC0jlRe6QP7WwDJzMxcGifEIiqhRpVDpwACnv5mI
         wszlS07OO39iHnbfatzxqxD8IggbHjB/2naYsO77+xWKSPVGCEUbrYhXeakYHaYPfbSA
         4Bm5tOrtm+D1J/Ve6tnSsqkSvNw1iH4mJmo9RLVqSHiBP2P9cOonGd8K/lcysv6da8BB
         X5zqqKzfyuGaNgB2sHHl0YWVDX2jjMSV/qHrWsjWI3wREXIlJm01qG8OQSMUbFjMPEXr
         +SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712752041; x=1713356841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpA2RlMoyu0BqLSW07AvttVgRisVX81MzCveYc+do0o=;
        b=rCpgmIG0OymI4LMNMzK/vDaaT44rpiUePGg8h7QJ550mxZiOAqfURBkvbgDlKbhrku
         5bGKcGqX8QHFuL9Kvn2xo9n8MkV5N4wBGapGFemrRv42vuPEdWY3Ybi1RdrxzsafkGdQ
         cwzrbij/BQLDMojyrMNcMfsMRWzhhsnR80iprY+k/VtnM9b8RO5NN7QzDC4/QWcONYbR
         Z5B7PzfrfgvjJbFNSFRKyvBPAb2SYENeq7Mkk+iwFOGT1SAmd+dMiH5pqENcsXhuDODn
         pl3k1U5f1jek9QTG7CCcJJ9zmuSyVEotgCadOsqwOqv6MygDl2/R9vpgObBpx2SP4RjC
         00OQ==
X-Gm-Message-State: AOJu0YxVP80KbdUizpsZrLm/i2rQW5JkMxhUZw6ZdGOzWYdXS0lbY9iU
	Be/XCKQhHYLItBbV7mS9rCjQNvGr+fZJB0e0DEm1BiHlmKWcIF/2iZidZxGjuWY=
X-Google-Smtp-Source: AGHT+IEslhXRTyTTc/rViVOTHJZ2hE6b2gDX+SYshnhaAeHiTdfgXPeMyGD5fUCcBpyALSarmD9OIg==
X-Received: by 2002:a05:600c:54e5:b0:416:b8c9:e77a with SMTP id jb5-20020a05600c54e500b00416b8c9e77amr1740109wmb.16.1712752041353;
        Wed, 10 Apr 2024 05:27:21 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c3b0200b004171f151a5csm1679446wms.16.2024.04.10.05.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:27:20 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 7/9] clk: renesas: r9a08g045: Add support for power domains
Date: Wed, 10 Apr 2024 15:26:55 +0300
Message-Id: <20240410122657.2051132-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Instantiate power domains for the currently enabled IPs of R9A08G045 SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Change in v2:
- used DEF_REG_CONF() to describe register offests and bits
- updated MSTOP bitmask for ddr domain
- updated MSTOP config for oftde_ddr
- kept the same description for gic as the CPG_BUS_ACPU_MSTOP register
  documentation in the latest HW manual version is wrong and it will be
  fixed; proper description for GIC is located in "Registers for Module
  Standby Mode" table
- haven't added watchdog domain (was missing in v1, too, by mistake) as
  the watchdog restart handler will fail w/o patch [1]; with this pm domain
  support the watchdog will fail to probe; not sure what is the best
  option until [1] will be integrated

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240228083253.2640997-10-claudiu.beznea.uj@bp.renesas.com

 drivers/clk/renesas/r9a08g045-cpg.c | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index c3e6da2de197..c64769082f5b 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -240,6 +240,62 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_DMAC_ACLK,
 };
 
+static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
+	/* Keep always-on domain on the first position for proper domains registration. */
+	DEF_PD("always-on",	R9A08G045_PD_ALWAYS_ON,
+				DEF_REG_CONF(0, 0),
+				DEF_REG_CONF(0, 0),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("gic",		R9A08G045_PD_GIC,
+				DEF_REG_CONF(CPG_BUS_ACPU_MSTOP, BIT(3)),
+				DEF_REG_CONF(CPG_PWRDN_IP1, BIT(2)),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("ia55",		R9A08G045_PD_IA55,
+				DEF_REG_CONF(CPG_BUS_PERI_CPU_MSTOP, BIT(13)),
+				DEF_REG_CONF(CPG_PWRDN_IP1, BIT(3)),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("dmac",		R9A08G045_PD_DMAC,
+				DEF_REG_CONF(CPG_BUS_REG1_MSTOP, GENMASK(3, 0)),
+				DEF_REG_CONF(0, 0),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("ddr",		R9A08G045_PD_DDR,
+				DEF_REG_CONF(CPG_BUS_PERI_DDR_MSTOP, GENMASK(1, 0)),
+				DEF_REG_CONF(CPG_PWRDN_IP2, BIT(0)),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("tzcddr",	R9A08G045_PD_TZCDDR,
+				DEF_REG_CONF(CPG_BUS_TZCDDR_MSTOP, GENMASK(2, 0)),
+				DEF_REG_CONF(CPG_PWRDN_IP2, BIT(1)),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("otfde_ddr",	R9A08G045_PD_OTFDE_DDR,
+				DEF_REG_CONF(CPG_BUS_PERI_CPU2_MSTOP, BIT(2)),
+				DEF_REG_CONF(CPG_PWRDN_IP2, BIT(2)),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("sdhi0",		R9A08G045_PD_SDHI0,
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(0)),
+				DEF_REG_CONF(CPG_PWRDN_IP1, BIT(13)),
+				RZG2L_PD_F_NONE),
+	DEF_PD("sdhi1",		R9A08G045_PD_SDHI1,
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(1)),
+				DEF_REG_CONF(CPG_PWRDN_IP1, BIT(14)),
+				RZG2L_PD_F_NONE),
+	DEF_PD("sdhi2",		R9A08G045_PD_SDHI2,
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(11)),
+				DEF_REG_CONF(CPG_PWRDN_IP1, BIT(15)),
+				RZG2L_PD_F_NONE),
+	DEF_PD("eth0",		R9A08G045_PD_ETHER0,
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(2)),
+				DEF_REG_CONF(CPG_PWRDN_IP1, BIT(11)),
+				RZG2L_PD_F_NONE),
+	DEF_PD("eth1",		R9A08G045_PD_ETHER1,
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(3)),
+				DEF_REG_CONF(CPG_PWRDN_IP1, BIT(12)),
+				RZG2L_PD_F_NONE),
+	DEF_PD("scif0",		R9A08G045_PD_SCIF0,
+				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(1)),
+				DEF_REG_CONF(0, 0),
+				RZG2L_PD_F_NONE),
+};
+
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a08g045_core_clks,
@@ -260,5 +316,10 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	.resets = r9a08g045_resets,
 	.num_resets = R9A08G045_VBAT_BRESETN + 1, /* Last reset ID + 1 */
 
+	/* Power domains */
+	.pm_domains = r9a08g045_pm_domains,
+	.num_pm_domains = ARRAY_SIZE(r9a08g045_pm_domains),
+	.pm_domain_pwrdn_mstop = true,
+
 	.has_clk_mon_regs = true,
 };
-- 
2.39.2


