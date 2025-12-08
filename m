Return-Path: <linux-renesas-soc+bounces-25662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB3DCAD937
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 16:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DA473064516
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 15:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA452FB965;
	Mon,  8 Dec 2025 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBadctRM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B072DF143
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207305; cv=none; b=TCYBMpP2bUUGO1ro9WKpKgKkC+xjX2slJpVTVYIth66zD/wckQ4JdYrHGROfRNxI8zIA4JBmOakFVhlprAZazNQoyc631Vt/Yd7kgt///+bTTOR047se8splx/Uzwsyd3oalXP3vJdAB43W58jV4/KQe3mlJhKeQOEzZjpR9nX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207305; c=relaxed/simple;
	bh=yXm/4YmON4ItbMvKkw1/c75Q/GHmL5fbLtW/K6gDKN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JP07QPcJ+HMVNovpeT38/XPq1uozQHhsIZZM5nuActdgJSj4swtArvle/r+pPJducR0NaYOpdY6OpmiyRxwyB7dEQL/gU4C8S7/M2oEP2B5RHBP2Tr4m3tdtGd+ywoSX4+6EX60+Z3iePJfVagBXZFD0/eo4F7I1RYZcGtJMXb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBadctRM; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso7568178a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 07:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765207300; x=1765812100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUOaOBzmat1IrbxWeXGOKr8YdTjnocfw3KD45UqcxkA=;
        b=FBadctRM14nBQGcblkvIPtIWHpdGYXRmAR8WhHzRJP81Ev3CFcFfmBc37sQW4Zo+hr
         MrIGL3vdtiFX/6bPeW4LuZayerU36JuzAEh5sdcTX8hsm53wFUwLeREXTvo4bMaexKBc
         NGjoP2JJL0/0dL82k48DtUOYPZfi7abQOacMJO4qf/7YA8vg7yE7p7IaQ4kHZBaVDO8y
         0SOr8NXmU5Qjp6uG3QS6ZpXNS2HZ3zL/oEREDUhVrXIF9hNqps/t9OHMWJY/CAMmJkru
         6zpLvAXkrIQx6FWQ7M9DqJMkvEjHpclvq/L1iJjADmE+3KiqYRD1IFvAA1U0/zV7nWPT
         UwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207300; x=1765812100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yUOaOBzmat1IrbxWeXGOKr8YdTjnocfw3KD45UqcxkA=;
        b=NVQpR2n/2sexw1bMgRKU+H7zBQ5xKwJofWro8kGZaA5KIzgE/CYqGeVevLwI/vJyJQ
         cOFgQPjqDzddwpOWVe1aR12B+JD4RePBrayU2cgloSZBHdnIO+Owzg27E2vZLYSio6jA
         cCDEEfTMtMUrWEcxIMMl7WGJlHJRE3ZMlw5WfgvI/Yskvc2onRNuRWL6+j1JMoeiM6nu
         40aQgAzC6LBkWNazXd8Ev5XAKlTC68irLypy5gCI9zSAqtYobxjpaEbyyInS3Ugb0rfP
         QXt6MAkDm9Xbwu6CdP6UGQPy1qh/aLqzhvBgF9KYpstM1t88L7Dh5ffsFghHGDtRFzjh
         5oJA==
X-Forwarded-Encrypted: i=1; AJvYcCVqrCGLjGohQ8/ZOEDs8n6WThxikYPJU5Uma6Ny/lIHyfii+Hj83ugFDDZ5OPuhYYcl0fK3IZS8ETYQcyfXfzRtGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwaIvtVlqu94VqY6UzVZxKGtrI31DB2xg5Bfwl0sLcEp/ojqDC
	O1Wf3oJExidRIAQCBV7niKlAX00FOmHYZrKQ6UKv+XL6zzfS0giAVqnc
X-Gm-Gg: ASbGncsmiIMT/04PmeyFnAKAY1B6Sn2Jh8bL18b0OmTuRwcPbyxxpPUSu6Pg5ozUJqw
	P/e1k2LVFdJEB3XBioVPR3Ookgrjf5hIMkq+WQM4llVVTugqmF9vam3zplpGFBS9KHUfeHuV2SX
	oBxAarv79ifVSceV01muXcAYpLI5WlqznbTOHwGMaclnHv+CMN64jjnpGBfpB1DAhbVJy/2KT1H
	OydAB4zlxjEo0YkxdH8pw59wMjCoIawvNBsq7HHDpsnl8G9Gq/DN/i5TKo5eXz+ezw2aDI2yVje
	aTGxNffbvMS75MH2K6Hz5XU93+VK2suRuOiBrvBHU1P8X6Owc+4uJDvwWptzmPycMsbA3+s9LOD
	xHpl2HVBNeh60V/SzVges5mtYBaicZrT4G9ZaoP5WxJEKM2qvi7mimKPRl9D7ttL3FTCENSiOlq
	4OAlQ0Tu3qmr2eVH722t9oc+TSDmRGzCmFq9CiAV6wrq3WqC1il6/iYqMTWQF1xYKGHW5RqWX2r
	o/zk6BMMPzPp1zu
X-Google-Smtp-Source: AGHT+IHEk7KHXPUAwS4Qo1SgQkiwq/e6w1gAGwCl62JsI2TcE4euezbVC0dRrZ8dqKv0mZlj5bm1CQ==
X-Received: by 2002:a05:6402:2809:b0:641:1d64:8dce with SMTP id 4fb4d7f45d1cf-6491a43297dmr7011492a12.17.1765207300101;
        Mon, 08 Dec 2025 07:21:40 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412deddsm11547484a12.31.2025.12.08.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 07:21:39 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v4 6/9] pwm: rzg2l-gpt: Add RZ/G3E support
Date: Mon,  8 Dec 2025 15:21:23 +0000
Message-ID: <20251208152133.269316-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208152133.269316-1-biju.das.jz@bp.renesas.com>
References: <20251208152133.269316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E GPT support. It has multiple clocks and resets compared to
RZ/G2L. Also prescale field width and factor for calculating prescale
are different.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Added RZG3E_GTCR_TPCS bit definition for RZ/G3E and added to
   rzg3e_data.
v2->v3:
 * No change.
v1->v2:
 * Added link to hardware manual
 * Updated limitation section
 * Collected tag 
---
 drivers/pwm/pwm-rzg2l-gpt.c | 47 +++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 791900f6de3d..79ee59271d24 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -6,15 +6,21 @@
  *
  * Hardware manual for this IP can be found here
  * https://www.renesas.com/eu/en/document/mah/rzg2l-group-rzg2lc-group-users-manual-hardware-0?language=en
+ * https://www.renesas.com/en/document/mah/rzg3e-group-users-manual-hardware
  *
  * Limitations:
  * - Counter must be stopped before modifying Mode and Prescaler.
  * - When PWM is disabled, the output is driven to inactive.
  * - While the hardware supports both polarities, the driver (for now)
  *   only handles normal polarity.
- * - General PWM Timer (GPT) has 8 HW channels for PWM operations and
- *   each HW channel have 2 IOs.
+ * - For RZ/G2L, the General PWM Timer (GPT) has 8 HW channels for PWM
+     operations and each HW channel have 2 IOs (GTIOCn{A, B}).
  * - Each IO is modelled as an independent PWM channel.
+ * - For RZ/G3E, the General PWM Timer (GPT) has 16 HW channels for PWM
+     operations (GPT0: 8 channels, GPT1: 8 Channels) and each HW channel
+     have 4 IOs (GTIOCn{A,AN,B,BN}). The 2 extra IOs GTIOCnAN and GTIOCnBN
+     in RZ/G3E are anti-phase signals of GTIOCnA and GTIOCnB. The
+     anti-phase signals of RZ/G3E are not modelled as PWM channel.
  * - When both channels are used, disabling the channel on one stops the
  *   other.
  * - When both channels are used, the period of both IOs in the HW channel
@@ -47,6 +53,7 @@
 #define RZG2L_GTCR_CST		BIT(0)
 #define RZG2L_GTCR_MD		GENMASK(18, 16)
 #define RZG2L_GTCR_TPCS		GENMASK(26, 24)
+#define RZG3E_GTCR_TPCS		GENMASK(26, 23)
 
 #define RZG2L_GTCR_MD_SAW_WAVE_PWM_MODE	FIELD_PREP(RZG2L_GTCR_MD, 0)
 
@@ -146,6 +153,27 @@ static u8 rzg2l_gpt_calculate_prescale(u64 period_ticks)
 	return prescale;
 }
 
+static u8 rzg3e_gpt_calculate_prescale(u64 period_ticks)
+{
+	u32 prescaled_period_ticks;
+	u8 prescale;
+
+	prescaled_period_ticks = period_ticks >> 32;
+	if (prescaled_period_ticks >= 64 && prescaled_period_ticks < 256) {
+		prescale = 6;
+	} else if (prescaled_period_ticks >= 256 && prescaled_period_ticks < 1024) {
+		prescale = 8;
+	} else if (prescaled_period_ticks >= 1024) {
+		prescale = 10;
+	} else {
+		prescale = fls(prescaled_period_ticks);
+		if (prescale > 1)
+			prescale -= 1;
+	}
+
+	return prescale;
+}
+
 static int rzg2l_gpt_request(struct pwm_chip *chip, struct pwm_device *pwm)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
@@ -455,6 +483,14 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
 
+	rstc = devm_reset_control_get_optional_exclusive_deasserted(dev, "rst_s");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert rst_s reset\n");
+
+	clk = devm_clk_get_optional_enabled(dev, "bus");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Cannot get bus clock\n");
+
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "Cannot get clock\n");
@@ -493,6 +529,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rzg2l_gpt_info rzg3e_data = {
+	.calculate_prescale = rzg3e_gpt_calculate_prescale,
+	.gtcr_tpcs = RZG3E_GTCR_TPCS,
+	.prescale_mult = 1,
+};
+
 static const struct rzg2l_gpt_info rzg2l_data = {
 	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
@@ -500,6 +542,7 @@ static const struct rzg2l_gpt_info rzg2l_data = {
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-gpt", .data = &rzg3e_data },
 	{ .compatible = "renesas,rzg2l-gpt", .data = &rzg2l_data },
 	{ /* Sentinel */ }
 };
-- 
2.43.0


