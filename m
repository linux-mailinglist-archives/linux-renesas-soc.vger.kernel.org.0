Return-Path: <linux-renesas-soc+bounces-33222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GU5MFESF2pf3QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:48:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C880E5E72A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 372143032543
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 15:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1F33D9DB2;
	Wed, 27 May 2026 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CqqXXxIq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B72D3EE1C6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 15:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896595; cv=none; b=SVnox7fWe56FGpkrrNEVec11cFe9MdD+WvoGvYZtKJP/pAqSYK8Vz+Jw3hyrZ7uXIbCnribuBDNvJwVVhn6I/4UnTUX1B9IlPsgkqPMHBLuzyU2TKg2qB73y0YPOnUdseAz05rDEYK0gglPJ1DerfKEaqjt3hLoPKRIVLjd8ldw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896595; c=relaxed/simple;
	bh=zxufOePm3m/cQ1BwD/YssYqOfmlKAwWXvB70GTTrgYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jcNB7nvmbku2hVDtnqZnMU+M+J+xbb894rtm7uA8CHR00s9vOHWoqwyxIdSAC26GmEDrvfIXVWlmao3ufeMT3FjTrYNZ0ru/7g+Qb9YoaFNmQS8rmMD4FTdJSQE7VjG8nlf/xgAh9rDFHM4ekg1YQ2dDvIEvj0ZMtgv0CH5mvI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CqqXXxIq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ea19f412aso3855097f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779896592; x=1780501392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCLmj3BbnBpGyiyDXMBpXkRGxE8TpMpj8vapNuYlif4=;
        b=CqqXXxIqWKwLVSxTuGT/ihkckvXDmh/iRW+u8Rek0vMhWlySC+8xoY1KYzc2y5a8rK
         JHrIBpI6hi5YOF6GLuv9wWt6QUJMI3k0fOULpdwRmnpYvuKx8GqGsPi2HSF6vYVr2lgH
         K5RcFQcUbtnftkeKeexN4xzF9H2Km5Thj/FT9rNkSFi8/YVqkBvTo+7+CiD1ZX/nPmCB
         FPSPKY478F5eEKxgvpon7bxHtUDWDRNnhGb3fBn303UNUlSPXmu+WmDviRmIwM3S+mvj
         cgph/FrnqlkZbYtGL/NAs5kna2vMVeL1WXjnIA6+96aFg93OZiEdiMvgUnIUfQKvgRPo
         NV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896592; x=1780501392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OCLmj3BbnBpGyiyDXMBpXkRGxE8TpMpj8vapNuYlif4=;
        b=fbNCqy3FqHqbyz0yk7ccJGFhkYfQeJttaG4xGFWmeTZ4tR3vMzI8xiaBJ9pbbgkeAL
         mPePf4FXODEkUcO2ZcAwCRU4FLw7CCi5ijlAnUx7X5qt5T38L5s2GMnhiysnbtrrJ2nO
         fbdjNQA/5cG9gCfwHHCzW1nyCyLqkBNTrYcCQ4J3Ng2GP0NPIfAjJOQENNadMj7nnbMv
         teRuvZN4QafiWPEoFlt9kuJTAHFLHmDHiet46nnMJRBadjd2IL+ICnO0NAwxD/+D0Qol
         K1F+Xg5ePNAb3d09fixIW01YhKgmLRcv5zkGJETnylG0vcvgR+E8HMltZSsDfI8ES3wz
         U93A==
X-Forwarded-Encrypted: i=1; AFNElJ9113MUWCoGQLHoJACNQGGUeBhAtLGSSCaPXk51hT9nFoosKGYBccUaBahPci9eRBoC1IojoVP6eqOuuMA74vyv+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2cIjK/vhGq7eiJt0gjs8Wictrzs4PyxB/+0mZYF6cmkNY4nRF
	R0paVgrxAZ/OqF7naaMdcYoXYoimQimw9xfWftINYMjtx2BAuOWR9bAVCmRBYQMRzhU=
X-Gm-Gg: Acq92OFXOofxREwD9mcYE9AS19zQXr0pLRXONeszwnXAzrNhiavmMlMPyIJLA8/btL4
	vfmz0zveqZls4hENsG5jDxkHglBf3nzm9p+nwxn3A4OqLfO0EWIMpfhjgLWORjdJAo9A3A7jxCX
	qcAxnz8Ysqcf2iZpJJz3IuJgbdZE4S3tfbmcrTYjgRhj3hCubUm9m/15Bdq1AfDinC+awNRLWoT
	V7TOZY/emZcHYvyBZXD1+ljvUj8r+oxh05LwZvqayE80VSgItZGrKx+RZy8uzWyK56uxe3taQSi
	lDIju7gBP3LcbG9b751jlC468OZHwlINO3IkVmPvypwZyKtP7mTzcShljwcHySH3IASn1De4MT0
	EDSx/h4PMWeBmDGacAAUi9BmuwAzAmAkWsfJGrSai/LoLaDI6N89CxwT+3g2mQt/QRaOwhXg3r8
	Ys6/JEYUSXQTFml23+hk4xbMZcXrbGXZwRAtSWQhGsalq2A8/HeJ4EGF3c3dH+rH7JGaynlbLWp
	AgJOJ+GvtmVDvI=
X-Received: by 2002:a05:600c:6207:b0:490:538a:9c0b with SMTP id 5b1f17b1804b1-4907dae371fmr87011865e9.2.1779896591782;
        Wed, 27 May 2026 08:43:11 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490454ac6a6sm416474495e9.12.2026.05.27.08.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:43:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 1/2] pinctrl: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 17:43:00 +0200
Message-ID:  <fbe2d29f785798b3e0b7c1b5707e917035a0b442.1779896151.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779896151.git.u.kleine-koenig@baylibre.com>
References: <cover.1779896151.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5807; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zxufOePm3m/cQ1BwD/YssYqOfmlKAwWXvB70GTTrgYs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhixxQfaSLSfuKi1yjX10d+9BCe/OIwcscrl2G7mExPM5a VqqmnJ0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCR24fZ/xdtXOD3eG/t4jcM 22W1NI7JKT0vfv9OUteufWnNm55oHovVx+bINetsqzF/83j19Zg83rt2h1LfV62L0tjz+DJbeHT b9elRa+JFn2Q3rL/DmvK68YNFr5II22EL/TKRw6H/fvq2sv1/xRcZbreXT8tr+RG2lcGmNkUctl eebf8bf3pRa50kd1IHS2Msc91WloehiyzkU+bN6ZAOb+It9MypbSpTSVQ67/Kb0zpPU8hoft/3s +faXxl6aPKXL9ix5XcV/8mI0qjZRVcvPos7t6rk+662vTevfphZupRbo0cxVWy5/v6fsU3PF3c7 BtSLnzkmnzqVmz9Ay/vgrsJPfvy17+vsV/XEzdxabnEUAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33222-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C880E5E72A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous unit.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c  |  4 ++--
 drivers/pinctrl/intel/pinctrl-broxton.c   |  4 ++--
 drivers/pinctrl/intel/pinctrl-denverton.c |  2 +-
 drivers/pinctrl/pinctrl-tps6594.c         |  4 ++--
 drivers/pinctrl/renesas/core.c            | 24 +++++++++++------------
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 227c37c360e1..d9d3d1d3263d 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -604,8 +604,8 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cs42l43_pin_id_table[] = {
-	{ "cs42l43-pinctrl", },
-	{}
+	{ .name = "cs42l43-pinctrl" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cs42l43_pin_id_table);
 
diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index 3d3c1706928a..a33100f28488 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -995,8 +995,8 @@ static const struct acpi_device_id bxt_pinctrl_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, bxt_pinctrl_acpi_match);
 
 static const struct platform_device_id bxt_pinctrl_platform_ids[] = {
-	{ "apollolake-pinctrl", (kernel_ulong_t)apl_pinctrl_soc_data },
-	{ "broxton-pinctrl", (kernel_ulong_t)bxt_pinctrl_soc_data },
+	{ .name = "apollolake-pinctrl", .driver_data = (kernel_ulong_t)apl_pinctrl_soc_data },
+	{ .name = "broxton-pinctrl", .driver_data = (kernel_ulong_t)bxt_pinctrl_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bxt_pinctrl_platform_ids);
diff --git a/drivers/pinctrl/intel/pinctrl-denverton.c b/drivers/pinctrl/intel/pinctrl-denverton.c
index 4a1d346fb30c..09aee90dee82 100644
--- a/drivers/pinctrl/intel/pinctrl-denverton.c
+++ b/drivers/pinctrl/intel/pinctrl-denverton.c
@@ -250,7 +250,7 @@ static const struct acpi_device_id dnv_pinctrl_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, dnv_pinctrl_acpi_match);
 
 static const struct platform_device_id dnv_pinctrl_platform_ids[] = {
-	{ "denverton-pinctrl", (kernel_ulong_t)&dnv_soc_data },
+	{ .name = "denverton-pinctrl", .driver_data = (kernel_ulong_t)&dnv_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, dnv_pinctrl_platform_ids);
diff --git a/drivers/pinctrl/pinctrl-tps6594.c b/drivers/pinctrl/pinctrl-tps6594.c
index 6726853110d1..55dfa843e35e 100644
--- a/drivers/pinctrl/pinctrl-tps6594.c
+++ b/drivers/pinctrl/pinctrl-tps6594.c
@@ -562,8 +562,8 @@ static int tps6594_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps6594_pinctrl_id_table[] = {
-	{ "tps6594-pinctrl", },
-	{}
+	{ .name = "tps6594-pinctrl" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, tps6594_pinctrl_id_table);
 
diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 0840668638d9..a466ebf99593 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -1380,40 +1380,40 @@ static int sh_pfc_probe(struct platform_device *pdev)
 
 static const struct platform_device_id sh_pfc_id_table[] = {
 #ifdef CONFIG_PINCTRL_PFC_SH7203
-	{ "pfc-sh7203", (kernel_ulong_t)&sh7203_pinmux_info },
+	{ .name = "pfc-sh7203", .driver_data = (kernel_ulong_t)&sh7203_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7264
-	{ "pfc-sh7264", (kernel_ulong_t)&sh7264_pinmux_info },
+	{ .name = "pfc-sh7264", .driver_data = (kernel_ulong_t)&sh7264_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7269
-	{ "pfc-sh7269", (kernel_ulong_t)&sh7269_pinmux_info },
+	{ .name = "pfc-sh7269", .driver_data = (kernel_ulong_t)&sh7269_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7720
-	{ "pfc-sh7720", (kernel_ulong_t)&sh7720_pinmux_info },
+	{ .name = "pfc-sh7720", .driver_data = (kernel_ulong_t)&sh7720_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7722
-	{ "pfc-sh7722", (kernel_ulong_t)&sh7722_pinmux_info },
+	{ .name = "pfc-sh7722", .driver_data = (kernel_ulong_t)&sh7722_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7723
-	{ "pfc-sh7723", (kernel_ulong_t)&sh7723_pinmux_info },
+	{ .name = "pfc-sh7723", .driver_data = (kernel_ulong_t)&sh7723_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7724
-	{ "pfc-sh7724", (kernel_ulong_t)&sh7724_pinmux_info },
+	{ .name = "pfc-sh7724", .driver_data = (kernel_ulong_t)&sh7724_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7734
-	{ "pfc-sh7734", (kernel_ulong_t)&sh7734_pinmux_info },
+	{ .name = "pfc-sh7734", .driver_data = (kernel_ulong_t)&sh7734_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7757
-	{ "pfc-sh7757", (kernel_ulong_t)&sh7757_pinmux_info },
+	{ .name = "pfc-sh7757", .driver_data = (kernel_ulong_t)&sh7757_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7785
-	{ "pfc-sh7785", (kernel_ulong_t)&sh7785_pinmux_info },
+	{ .name = "pfc-sh7785", .driver_data = (kernel_ulong_t)&sh7785_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SH7786
-	{ "pfc-sh7786", (kernel_ulong_t)&sh7786_pinmux_info },
+	{ .name = "pfc-sh7786", .driver_data = (kernel_ulong_t)&sh7786_pinmux_info },
 #endif
 #ifdef CONFIG_PINCTRL_PFC_SHX3
-	{ "pfc-shx3", (kernel_ulong_t)&shx3_pinmux_info },
+	{ .name = "pfc-shx3", .driver_data = (kernel_ulong_t)&shx3_pinmux_info },
 #endif
 	{ /* sentinel */ }
 };
-- 
2.47.3


