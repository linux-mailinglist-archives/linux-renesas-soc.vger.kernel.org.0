Return-Path: <linux-renesas-soc+bounces-2473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB70E84E10A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 13:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9400F28B1C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FF87BAE0;
	Thu,  8 Feb 2024 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aVskWnLB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEB87B3E1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396248; cv=none; b=hwXcqPuUjVPdXuotbLRzxzpXV+B/8MgkLmrtazVe1SaRTJh3oi8I3CfTTYXuz12VmdpqhKW1SJ4QKRTo6k00Gnedea8boYWgC/CDN/1kh0BqwciQJDG4MFL3jDtQHK6PureGebz/cpdn4yg8fycfLZG8pTN7xZ5XdWJq9AMgNho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396248; c=relaxed/simple;
	bh=/MlmcOyXoCfFZ4lv63XPpglVSMzow4LsfXUTpf+BCr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WwQRgQAGxWcRcmnXwo+u7sKSdpAxs7MHqRK/TXiAwjtRlRnd2rlcr7r8j2MsadXt6p8eePsQ3KLokKCa8W3qABz3DgilDmRLFw02WG7sz1pPw+boNa6sY28f5ID1bQrVjk2Cdd2EurtolDqSZGrr3dHwzv71Az0Zf4pj0x8FtAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aVskWnLB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41008ab427fso16155505e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 04:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396245; x=1708001045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rO5WdjuJmB2S7TQJ0EBDmOconefLyJTkDblhQ1H3b4=;
        b=aVskWnLBohnYJMeR2FIB2vDv2XMEZTnoJGQELgHQdimYuPbnjkAv6Xb26kITfcnXdQ
         F8kvGXRna4lCusomMtgS0nwJtQo3vVsvLJyscE+s8/TplO32gWpZetsHSM/k28QcLWo4
         a/LkVL8VD/ab6ws98S7jDn0meqtbEr6mj5iVUCZo1xrUHgOYfV37oL52M/iaQrD0VwpG
         wnmRwjV4G6/v6GrKcPmG8kSb3042NsPIHJp3xl3EmkiI6mC7VS7fE2/U5/V+w6YvFwnJ
         yxkq5blW+4CTLddSMEw0kcFJnSUSkZsNpN+p2lNdfIv3i5+kGAYa/k36wxqeD1ZVU8+u
         8xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396245; x=1708001045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rO5WdjuJmB2S7TQJ0EBDmOconefLyJTkDblhQ1H3b4=;
        b=heobSOJOleNFANMn4O/syp9lKfb0oEkxek8PlW5ke4EYEZ7adQeYBsAl5l2Wu4pcSf
         F71xe7xkFij0RjPiyLk+1s41t/9IIPV5WD5aZ7R8gSKeCWSH3+cez2QrTyWvluN5GY5B
         pzaPpq+zmZLwTLfCd6ea+AX2MWTIjQ5rn70PEtWg+Q5gBxw+JP07ywLSQkpu4xSe4Wx0
         5Rq9b/nFeQqLHEBBjTFNTWYc3T4uBKxkR1wQ/iAvz3CIAlhVuPFIBfK2xh/irsBh5oYu
         3F5ZVuM5bxXB8JWaFk2iWRsLZoYUnf1q1eX5+78NTbyeXIIcrsR2hN2ZkmHmWuhy34t8
         8Vow==
X-Gm-Message-State: AOJu0YwwcZjZ0sWrVrQH4T27UbS6olRsQ0yrRc1BMSWbc8EAX5k/roMs
	dA1K8cSY7qA9+3W4mrcwx0874Y/oaY//gszQWJiD7IG8L82YFwZ8emgr6lZnIWE=
X-Google-Smtp-Source: AGHT+IFWxOpl/SqNYQlDYaLcZyrs8SdhVxj6hJPcKfMPJshM2YPyvVvrOfoZMJpkZrDIKi+G2DyX+g==
X-Received: by 2002:a05:600c:3b97:b0:410:8f2:262a with SMTP id n23-20020a05600c3b9700b0041008f2262amr4272603wms.13.1707396245502;
        Thu, 08 Feb 2024 04:44:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7Lpay7FODh9fbZn3a01H8ZvmM2SiauhTcEP7H2iU5vuup9mMYT1+LGEIv3Cp9BD81U4vXRMCr/EOF9yA8rP3x2Y+AnhZaeVGXDbeReb1bgkWyFi1iPHI2XqMtH/j6BX470KlFbzpptyr3mTCkzGvtSvwH8+QdsLJgjGCLlm6VrR0hYSmhfQY0JfAdLkasF4N3lkfYv1ahZc8EAhd67oPU+eAVjbZxl+OAiGnfWtG1FjqbVRWrxRcQ33tu+sYQW9cK/tDYRgUAbGQvKckrJaz+domK+n/SGhw4+6nW/11h+pjlI3mUTt+lI87Qn//RPdf6BSsiN/p1KwI5TgwTZDDFuzqNAIueiRvSvzmxd3cOFMABK5GpDvMkVwfKJ3+fyrmjWz7UvH7RnRlldNB1GWdX3T7fL1I2vA5UXrLwVlbyso7UbjQ9ixUccrbcg1ZSCleoNZuImVzeDLgDRVua1i8sNgCYv4enjHmFQ6y0eEZS8I6QkNo3sEJQ9aMagG4wA8im8ZWKwW/TX5EyWjQ9i4eKp+0hvywPPy25Iw1SMamq9cM0A0Uh4xFkd4qpCfmDj8o=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:05 -0800 (PST)
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
Subject: [PATCH 10/17] clk: renesas: r9a08g045: Add support for power domains
Date: Thu,  8 Feb 2024 14:42:53 +0200
Message-Id: <20240208124300.2740313-11-claudiu.beznea.uj@bp.renesas.com>
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

Instantiate power domains for the currently enabled IPs of R9A08G045 SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index c3e6da2de197..b06d8e93707f 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -240,6 +240,28 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_DMAC_ACLK,
 };
 
+static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
+	DEF_PD("always-on",	R9A08G045_PD_ALWAYS_ON, 0, 0,
+				RZG2L_PD_F_PARENT | RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("gic",		R9A08G045_PD_GIC, MSTOP(ACPU, BIT(3)), PWRDN(IP1, 2),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("ia55",		R9A08G045_PD_IA55, MSTOP(PERI_CPU, BIT(13)), PWRDN(IP1, 3),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("dmac",		R9A08G045_PD_DMAC, MSTOP(REG1, GENMASK(3, 0)), 0,
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("ddr",		R9A08G045_PD_DDR, MSTOP(PERI_DDR, BIT(1)), PWRDN(IP2, 0),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("tzcddr",	R9A08G045_PD_TZCDDR, MSTOP(TZCDDR, GENMASK(2, 0)),
+				PWRDN(IP2, 1), RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("otfde_ddr",	R9A08G045_PD_OTFDE_DDR, 0, PWRDN(IP2, 2), RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("sdhi0",		R9A08G045_PD_SDHI0, MSTOP(PERI_COM, BIT(0)), PWRDN(IP1, 13), 0),
+	DEF_PD("sdhi1",		R9A08G045_PD_SDHI1, MSTOP(PERI_COM, BIT(1)), PWRDN(IP1, 14), 0),
+	DEF_PD("sdhi2",		R9A08G045_PD_SDHI2, MSTOP(PERI_COM, BIT(11)), PWRDN(IP1, 15), 0),
+	DEF_PD("eth0",		R9A08G045_PD_ETHER0, MSTOP(PERI_COM, BIT(2)), PWRDN(IP1, 11), 0),
+	DEF_PD("eth1",		R9A08G045_PD_ETHER1, MSTOP(PERI_COM, BIT(3)), PWRDN(IP1, 12), 0),
+	DEF_PD("scif0",		R9A08G045_PD_SCIF0, MSTOP(MCPU2, BIT(1)), 0, 0),
+};
+
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a08g045_core_clks,
@@ -260,5 +282,10 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
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


