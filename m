Return-Path: <linux-renesas-soc+bounces-10467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0014E9C50CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 09:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F311F22F7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 08:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D851920B808;
	Tue, 12 Nov 2024 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MCZI6DmB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE0C20D507
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731400560; cv=none; b=HjylcEKWQh1P7T3b7BdDfZMwWrdVsUE7urnoRmzQLiTiJk1+myRDbM98izT1xjrnfghIXWwmsYDNilQYGRcRtINvGUZphyJDiC88YonUCDs+WHzxgaCNMjlzfpvyPsednBCNYhDczlVuiuqzVNi6QSsY6tgvT4Xvyq+m+K0G1j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731400560; c=relaxed/simple;
	bh=Ogd04ibt1boR9D5geKyDS0rBfBdR3YmD0RQ58WcqbMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hbL+kRaY0vhVIPywopOrH1g8MsRMtBCIKq6V+FwhSg1rlRerawjQnhL4BrY55XrAkfhNJBYfWsecYpTnJou6Y+RV5d7EwpjkpNW/FoSSOqzA+CpLFg8na/X4YjwbXzNE9c14EAZWv+6XCT43vkezg2jRfZZdMb1Tn14bsBDOgUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MCZI6DmB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431ac30d379so46528195e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 00:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400557; x=1732005357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzBUP4IjhpgilYzc3QP5HxQ10f2Yq/2yZCvHZ4g8xvA=;
        b=MCZI6DmBCZWPXvq7fTh79CivdABB55wD4dEx9UxKtsQ+wxq9OGHt2y27+DDsQK6Qrh
         LcigIQ/zHZdHNp9f5tj0jx8xQyd1iO1YIhEAp3356ujYtYQxcyUo4bXsycDscxaU7zkK
         JN1T4Wyd0GGlcFjY0jitbCRNom5QX6LM8GjpRheg5O3i8AMRp/pfx78CeFMfBijWx/Z+
         FPrTYrI9SAl3MTQswO6KzxHyNVTkJZ9OrhrygmcLWl65uMrxtaWVkFJJ+NRt9JNEmLXb
         A8k08PUCC4d1cCtgUaDhZeuClKgBuSE7/Jz5IvkKL3ZzL863AAsL2PmewMPcz1kCythp
         bx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400557; x=1732005357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzBUP4IjhpgilYzc3QP5HxQ10f2Yq/2yZCvHZ4g8xvA=;
        b=lmiedKQo0zUhEh4VTVKZB4UAZaIX6Lv8geMa4F19m0VpjeybPvKGHQ0Qd7C487BQKf
         Sm0yTYpcxmCePSNbpidGhmsk3pYkbzlzKJO3wda/SpN6csOekj2cRqofOWKZEMTQazpV
         qr01HLv+QhwGhv2E0FgyuF+GyYh5dPiiahi3f5kwH5zOTnNtp6BrpF6CkNbwA8VMh8S1
         yOW0iFnosSfQ1XxZNaszKsZX9mN3cpWXqJJCDNHtwnl3SWk+XIpIci+1Scz60FAdVCXd
         UurPuYR3gWHX+5vhmMhbK5vQOMUg7Rcxw3k/W4hIn+fVLxgl+8qaT+3qUTXZKqTAAEbL
         e2mg==
X-Forwarded-Encrypted: i=1; AJvYcCVzEZV/PEYbXbRPtfKkay2aKikE9rSPJ1m5VySNQIDKVjVpx41RG6QVI6ZcncbHV2s/aeOyAPRmuSoCOH52SpGC5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfrehIeO4jvCCi3sDMhlj5Bd24S/72m6LmXc8IbTqBU72xZYxL
	THsz4I13StVdC9W/Q2bHZBE679R5GDOEnFNZo6IBhKLw0fPsR5x+ZyxFUQD48O4=
X-Google-Smtp-Source: AGHT+IHJ9ujCbbhIsj7TrIvtnmafDAChYmP23T6s6gb+JxDcqoE9J2hSsnZv1j2TrI4f4DKJmqsWhA==
X-Received: by 2002:a05:600c:19c8:b0:42f:7ed4:4c26 with SMTP id 5b1f17b1804b1-432b75002b7mr138902825e9.12.1731400557221;
        Tue, 12 Nov 2024 00:35:57 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa709ec7sm242209895e9.35.2024.11.12.00.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:35:56 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] regulator: Switch back to struct platform_driver::remove()
Date: Tue, 12 Nov 2024 09:35:21 +0100
Message-ID:  <ab85510f83fa901e44d5d563fe6e768054229bfe.1731398433.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6809; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Ogd04ibt1boR9D5geKyDS0rBfBdR3YmD0RQ58WcqbMs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnMxNbdHLjDOnU3k+1ISOuzbFCoPl7yMqU5CS7W aALrvuQhoSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZzMTWwAKCRCPgPtYfRL+ TsWYCACaD+qvsw1AJCAzT6ixsV4Mxdp3Z0Vy/Ye08kXC/NvejBKyAgZBh98uiHT1XNztZrRFSX6 1B3710YaALWB7SDDlHxXhY6E0HIVGrMAu3PkdmaxX0N6bUeGyn9qQVp9w6YD2oruut0akzt+V0W gssa5Pa9C3jwsgkHkKR82GkbeTVxK9Zk213tc9cvE5VQYu+tcxArPAHFZVgo2VZe8yLgPa/klLz /mbHEuK6R4IWJdHy+vMBAFPrOtPGDrR0UjkCiVqKQiHH/5CpHP6IiGunLTrHaXNtQfKMnQGm+CJ rMJj77T1fadlyr5CUG1HN7ZIaOnSPd0ErA1wUiZT18D1wohr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/regulator to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

A few whitespace changes are done en passant to make indention
consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/regulator. While I usually
prefer to do one logical change per patch, this seems to be
overengineering here as the individual changes are really trivial and
shouldn't be much in the way for stable backports. But I'll happily
split the patch if you prefer it split. Also if you object the
indentation stuff, I can rework that.

This is based on yesterday's next, if conflicts arise when you apply it
at some later time and don't want to resolve them, feel free to just
drop the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/regulator/arizona-ldo1.c        | 12 ++++++------
 drivers/regulator/bd9571mwv-regulator.c |  2 +-
 drivers/regulator/db8500-prcmu.c        |  2 +-
 drivers/regulator/stm32-vrefbuf.c       |  2 +-
 drivers/regulator/uniphier-regulator.c  |  2 +-
 drivers/regulator/userspace-consumer.c  |  2 +-
 drivers/regulator/virtual.c             |  2 +-
 drivers/regulator/wm8350-regulator.c    |  6 +++---
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/arizona-ldo1.c b/drivers/regulator/arizona-ldo1.c
index 4b54068d4f59..501843996faa 100644
--- a/drivers/regulator/arizona-ldo1.c
+++ b/drivers/regulator/arizona-ldo1.c
@@ -375,18 +375,18 @@ static int madera_ldo1_probe(struct platform_device *pdev)
 
 static struct platform_driver arizona_ldo1_driver = {
 	.probe = arizona_ldo1_probe,
-	.remove_new = arizona_ldo1_remove,
-	.driver		= {
-		.name	= "arizona-ldo1",
+	.remove = arizona_ldo1_remove,
+	.driver = {
+		.name = "arizona-ldo1",
 		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 };
 
 static struct platform_driver madera_ldo1_driver = {
 	.probe = madera_ldo1_probe,
-	.remove_new = arizona_ldo1_remove,
-	.driver		= {
-		.name	= "madera-ldo1",
+	.remove = arizona_ldo1_remove,
+	.driver = {
+		.name = "madera-ldo1",
 		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 };
diff --git a/drivers/regulator/bd9571mwv-regulator.c b/drivers/regulator/bd9571mwv-regulator.c
index c7ceba56e7dc..209beabb5c37 100644
--- a/drivers/regulator/bd9571mwv-regulator.c
+++ b/drivers/regulator/bd9571mwv-regulator.c
@@ -356,7 +356,7 @@ static struct platform_driver bd9571mwv_regulator_driver = {
 		.pm = DEV_PM_OPS,
 	},
 	.probe = bd9571mwv_regulator_probe,
-	.remove_new = bd9571mwv_regulator_remove,
+	.remove = bd9571mwv_regulator_remove,
 	.id_table = bd9571mwv_regulator_id_table,
 };
 module_platform_driver(bd9571mwv_regulator_driver);
diff --git a/drivers/regulator/db8500-prcmu.c b/drivers/regulator/db8500-prcmu.c
index 1e2d54da1b9a..1ec2e1348891 100644
--- a/drivers/regulator/db8500-prcmu.c
+++ b/drivers/regulator/db8500-prcmu.c
@@ -480,7 +480,7 @@ static struct platform_driver db8500_regulator_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = db8500_regulator_probe,
-	.remove_new = db8500_regulator_remove,
+	.remove = db8500_regulator_remove,
 };
 
 static int __init db8500_regulator_init(void)
diff --git a/drivers/regulator/stm32-vrefbuf.c b/drivers/regulator/stm32-vrefbuf.c
index 40855105dd33..a85ea94f0673 100644
--- a/drivers/regulator/stm32-vrefbuf.c
+++ b/drivers/regulator/stm32-vrefbuf.c
@@ -280,7 +280,7 @@ MODULE_DEVICE_TABLE(of, stm32_vrefbuf_of_match);
 
 static struct platform_driver stm32_vrefbuf_driver = {
 	.probe = stm32_vrefbuf_probe,
-	.remove_new = stm32_vrefbuf_remove,
+	.remove = stm32_vrefbuf_remove,
 	.driver = {
 		.name  = "stm32-vrefbuf",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
diff --git a/drivers/regulator/uniphier-regulator.c b/drivers/regulator/uniphier-regulator.c
index 5f868042392f..74939b7fcd81 100644
--- a/drivers/regulator/uniphier-regulator.c
+++ b/drivers/regulator/uniphier-regulator.c
@@ -207,7 +207,7 @@ MODULE_DEVICE_TABLE(of, uniphier_regulator_match);
 
 static struct platform_driver uniphier_regulator_driver = {
 	.probe = uniphier_regulator_probe,
-	.remove_new = uniphier_regulator_remove,
+	.remove = uniphier_regulator_remove,
 	.driver = {
 		.name  = "uniphier-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
diff --git a/drivers/regulator/userspace-consumer.c b/drivers/regulator/userspace-consumer.c
index 6153d0295b6d..72bb5ffb49a8 100644
--- a/drivers/regulator/userspace-consumer.c
+++ b/drivers/regulator/userspace-consumer.c
@@ -210,7 +210,7 @@ MODULE_DEVICE_TABLE(of, regulator_userspace_consumer_of_match);
 
 static struct platform_driver regulator_userspace_consumer_driver = {
 	.probe		= regulator_userspace_consumer_probe,
-	.remove_new	= regulator_userspace_consumer_remove,
+	.remove		= regulator_userspace_consumer_remove,
 	.driver		= {
 		.name		= "reg-userspace-consumer",
 		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
diff --git a/drivers/regulator/virtual.c b/drivers/regulator/virtual.c
index 0a0ee186c6af..218a0d66a152 100644
--- a/drivers/regulator/virtual.c
+++ b/drivers/regulator/virtual.c
@@ -357,7 +357,7 @@ static void regulator_virtual_remove(struct platform_device *pdev)
 
 static struct platform_driver regulator_virtual_consumer_driver = {
 	.probe		= regulator_virtual_probe,
-	.remove_new	= regulator_virtual_remove,
+	.remove		= regulator_virtual_remove,
 	.driver		= {
 		.name		= "reg-virt-consumer",
 		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
diff --git a/drivers/regulator/wm8350-regulator.c b/drivers/regulator/wm8350-regulator.c
index 9939a5d2cbec..d09864bae5ef 100644
--- a/drivers/regulator/wm8350-regulator.c
+++ b/drivers/regulator/wm8350-regulator.c
@@ -1304,9 +1304,9 @@ EXPORT_SYMBOL_GPL(wm8350_register_led);
 
 static struct platform_driver wm8350_regulator_driver = {
 	.probe = wm8350_regulator_probe,
-	.remove_new = wm8350_regulator_remove,
-	.driver		= {
-		.name	= "wm8350-regulator",
+	.remove = wm8350_regulator_remove,
+	.driver = {
+		.name = "wm8350-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };

base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.45.2


