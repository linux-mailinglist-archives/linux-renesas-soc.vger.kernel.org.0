Return-Path: <linux-renesas-soc+bounces-2472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CE884E108
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 13:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 854FD28AF30
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E90A7B3F4;
	Thu,  8 Feb 2024 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AmjGwtxG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134387AE53
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396248; cv=none; b=br4dShBzmNFKGt/R8a9AnzAUvSSsYeAYGxkV4VzxDSBKL8XBzs9qi7BpX49wrfQScEG9kvA2YTuAJIwch1xgjpK5pjwyUUcgrGQ7BRB63WCCJdMB6+P8e3OvSePE/wINMjloKcWqoYFyhdfazU7EYZ+FGT/DXD4F3JOsamBJpGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396248; c=relaxed/simple;
	bh=lPCpnHc2/bWjDH5RrgLUkYeG9HrcppQamRfQRheI0hU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mdMT7eyejPiUbPAzTrbvT20zN+nNJeBclI3+FNYYS89tDkZzsrvFtNuXQH6zN6We+45j6hLTT4sz4UFt30oS09kk8RC/aqO9XHgggl9m5w3uS8Ksd1ww2xxwAZDMcCACP79FfsA40fK+Nz+OxjJ46KThyT8u0A89m1f3TK5gOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AmjGwtxG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-410383da759so4169985e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 04:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396243; x=1708001043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM9XPRWyZyQTpDxwqoOKeZPHvqIal+M05hNhd5ZULcI=;
        b=AmjGwtxGaliA9qM0cg1k7pRfWThYX/+jHPAj4BKwvcMQhW56a1zVHH82nUVy2B7Pu9
         eRiXDTSAGE8mfz2t7taJmPoPtBD/luumoN8FOYnO8NZXNnFqP94AUFxbWBoH9i/ExJ0e
         oenvvS2XN65pbxv2ENtgSDhqt9wQ55VrbR7VY0LdLa3V7/7VFrwjM7TWamH8oNk7mWuk
         vqsEctmxZjoKrovZO/9/kMrz5j/lAGa24ZBSIAhORN41azzDdF4KZZnaHT8Dw4dUGbAb
         bD5cwtChhkHmLSQDqiJgHZFBybQOQifnIFhYctMeLqCCgOE1j+pjqGFRehJY5TT1vKZ0
         OBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396243; x=1708001043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oM9XPRWyZyQTpDxwqoOKeZPHvqIal+M05hNhd5ZULcI=;
        b=n6i9W5g/tE1gg1u8OeYgsdJ3Sj8aJkTubPsQ2bFhuGl4qycBrpu8TM6qXG4W/oNUfj
         mKHV7IEqguQ5gMMqIcqx/Oy4P3duvU3QbL/KNdmWncJMgl9fkGnqaGa163ZVkAqNWpWA
         3ymqXWej6t6DJh6qhfWPejqeVyGvmuO7FLfvwupX/fJtLJ+BqlPkPcspLNQap0eBd+gT
         j3gnFp4EugZi65fGESiJU0FXWzYCKmFmB39F1zzTBHYiVWlJpGpsaPDDH823C7xanoM5
         cUt515qkDTMsheb3RVR6uQbXPOKiMWew2ijSoLSjAI1euLjdcZteIVQ6KFMEhRhWud3i
         gQ+Q==
X-Gm-Message-State: AOJu0YxGKVwYo4Io1VN7p+9R83cr5fA/vxqCShJJbkOisShCK4o/75CT
	cvKMeIzE9aRuEMZ5gJf48M7ZvKP8xJcqwtWc05YLI+s47516bqnQAyjskaM84dU=
X-Google-Smtp-Source: AGHT+IG6q4gcNCxRmIgk0F+dAl3ZK1W+ZIIklXV91EUjVHFUCxB9Yjn+gAO0u0URCHz1eIaiGbJpGg==
X-Received: by 2002:a05:600c:4c9a:b0:40f:de44:5164 with SMTP id g26-20020a05600c4c9a00b0040fde445164mr6664373wmp.17.1707396243513;
        Thu, 08 Feb 2024 04:44:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEJWtOiAz9ykuqFwwxiz+go8BAqNKUg3++9Klovreyfajle+cQd76Qys5aUi/DKiFBZSpGFpdBkG3GqXpx5pYDW6ArnMr6o7FnO3bC/qwBd3T9rbxFnEDB5d4C9gGQ7Tp2heQXgostbRuWS3xWyiJSF2EYSizkPqp353/6ADLThdX60eRDJ3WS0l4tXyHPeciCGVNwwP847FqjLQDCeh0zQIb1c70ahRqDuV1LLaB7eFHNhqrwNMtuVhCIq4Mz3IKK8LRlZw7E5IMnHupvf1TYKTqPNNtPVzrZCqVKXzuBn9cImYNOqG56lszGRRMWBt4hupTIsxPlux2GEec8DpeFgDhG63Bk3vZ9bOG7S1xux2tfJihirISSOG5E81MisjvcTZ3N88wDm0ktNvHN1fDMwRdd0qR4G+zbC6oEtXLRUAcI8PVEjHXuqQpgyMqMYxp6zZ0vpJPP78mjdJqPVhCwOStAIqpqkrlrKFXtPWlRKt7NliSml0BH1sI+7nv1l0hSGDqHwKfz2kReEJFWQv59eKSaSY96K0AszHpLsihOa7csjlsfQTIi5m7KdLZTVV8=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:03 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 09/17] clk: renesas: r9a07g044: Add initial support for power domains
Date: Thu,  8 Feb 2024 14:42:52 +0200
Message-Id: <20240208124300.2740313-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Instantiate always-on power domain for R9A07G044 SoC. At the moment, all
the IPs are part of this domain.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 1047278c9079..3755e506fc65 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -443,6 +443,11 @@ static const unsigned int r9a07g044_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G044_CRU_VCLK,
 };
 
+static const struct rzg2l_cpg_pm_domain_init_data r9a07g044_pm_domains[] = {
+	DEF_PD("always-on",	R9A07G044_PD_ALWAYS_ON, 0, 0,
+				RZG2L_PD_F_PARENT | RZG2L_PD_F_ALWAYS_ON),
+};
+
 #ifdef CONFIG_CLK_R9A07G044
 const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	/* Core Clocks */
@@ -468,6 +473,10 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G044_TSU_PRESETN + 1, /* Last reset ID + 1 */
 
+	/* PM domains */
+	.pm_domains = r9a07g044_pm_domains,
+	.num_pm_domains = ARRAY_SIZE(r9a07g044_pm_domains),
+
 	.has_clk_mon_regs = true,
 };
 #endif
@@ -497,6 +506,10 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
 
+	/* PM domains */
+	.pm_domains = r9a07g044_pm_domains,
+	.num_pm_domains = ARRAY_SIZE(r9a07g044_pm_domains),
+
 	.has_clk_mon_regs = true,
 };
 #endif
-- 
2.39.2


