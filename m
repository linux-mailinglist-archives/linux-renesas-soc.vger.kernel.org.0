Return-Path: <linux-renesas-soc+bounces-17997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66740AD295E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4967A3B1E59
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863711DE3D2;
	Mon,  9 Jun 2025 22:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UPprLgQT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QekqR9OZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6360B2868B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jun 2025 22:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749508240; cv=none; b=tigVNvgDXSwoQ3uRUY14RcXva88hfahyZ9KghLP7vNuTM7444tqCUbjn38e/lyjMJfM5dZ36PHZslsZ9Nc15rDUT/GNy+QNTC2B1VQaL6A8hdgkJ2sonstHjY4VLGEDUNgwPyQb0QL190kfSbnniLSHmK0zdtaUiENqznUhjIo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749508240; c=relaxed/simple;
	bh=LG1fcArhzalyb4XA27vcAgDvnznEnktgj4/juGPmk6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGn4jA2EqUhGbs1s/bSX0yohNEexHFZ6VbXwq/xIqPwxbzO91BZ18X+iNab8yBt8YB8QlMgSmf+E2h7Te/8LansIHCMwekFHDSTgpWVEWkzB9kIldVavnvwzi1g2wwr64GHpbff3Dge49OHHz7GZtmcrG3QFatCr56ABRZOIFbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UPprLgQT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QekqR9OZ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bGRT22xS3z9tGG;
	Tue, 10 Jun 2025 00:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749508230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vmNxAHTcAKYa4+tkKZ6yahAu+0AClxsWX7LSkn8ioaU=;
	b=UPprLgQT/oECTfkICeKjc9LWqXN+k1R+2p4+qiFGbCVitcA7GQh2m94W1yFuKufHmC462x
	sS3gVw7BC6Xhu4RvmpgNSKy5msqkH2HeNTRY/V60CSn12mASOwpIQwWhfscBAdF4p1zumL
	qxmuz5ORkLlJP/7ijVCuveu8LpOWzwlqw03XmKfkPVdN0UWUZu1qaf0kray6Eb4yOj6XIY
	sPGIse376rDG/KtR/vHX5DScK2vKwte+TbUoNLOIoS/Dk2+5pljCTLQgsys4FarL50z8UU
	Tm12k4z8pohSH2W0+t+OeVYAASyfomK1gpCAcCy7bsLI7bLs4xnCSLRo/l84oA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749508228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vmNxAHTcAKYa4+tkKZ6yahAu+0AClxsWX7LSkn8ioaU=;
	b=QekqR9OZ5KKbH8tJkJBjd+zj+ZlL4/A2hSmd1r/F/HuI/D15UIaG9wzwxGzBomxrs2KVUd
	oPPf3Zr1rU4f7SK/JM/XNLNSciSAtlIDRPN4kCUa0kgZEnr9ELonNVM0dty/EDBkE+fRWF
	NeSgrundz06LM9teRZUIIJJisjeJ76GWHF43kSjSHOXNyWiTgUpV+e9zCd1YLHAYlRNUMC
	O+ms/W4IItFI+xLF8QIKp4wBBzvytIK39s5C34T7E7bAcE1fyUfONQp6XsZnAGu0B5/SvX
	ekzbCrWIVp7XMvPXOcfwIgmxsKhLGyEs9vKteQtZFRpI3JHV2sq4qpQovqj8Dg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	kernel test robot <lkp@intel.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH] regulator: rpi-panel-v2: Fix missing OF dependency
Date: Tue, 10 Jun 2025 00:30:00 +0200
Message-ID: <20250609223012.87764-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: n4adzpkjoks7wk61tom9eaz8eq9mn7mz
X-MBO-RS-ID: 20a527d05fd7ff8970a
X-Rspamd-Queue-Id: 4bGRT22xS3z9tGG

Add missing OF dependency and drop of_match_ptr() use.
This fixes the following LKP report:

"
>> drivers/regulator/rpi-panel-v2-regulator.c:95:34: warning: 'rpi_panel_v2_dt_ids' defined but not used [-Wunused-const-variable=]
    static const struct of_device_id rpi_panel_v2_dt_ids[] = {
                                     ^~~~~~~~~~~~~~~~~~~
"

Fixes: d49305862fdc ("regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506100440.fyTGO7CG-lkp@intel.com/
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
---
 drivers/regulator/Kconfig                  | 2 +-
 drivers/regulator/rpi-panel-v2-regulator.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 9a3dc883ff40..7423954153b0 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1156,7 +1156,7 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 config REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
 	tristate "Raspberry Pi 7-inch touchscreen panel V2 regulator"
 	depends on GPIOLIB
-	depends on I2C
+	depends on I2C && OF
 	select GPIO_REGMAP
 	select REGMAP_I2C
 	help
diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index b77383584a3a..c506fd699d57 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -102,7 +102,7 @@ static struct i2c_driver rpi_panel_v2_regulator_driver = {
 	.driver = {
 		.name = "rpi_touchscreen_v2",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.of_match_table = of_match_ptr(rpi_panel_v2_dt_ids),
+		.of_match_table = rpi_panel_v2_dt_ids,
 	},
 	.probe = rpi_panel_v2_i2c_probe,
 };
-- 
2.47.2


