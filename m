Return-Path: <linux-renesas-soc+bounces-17984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9341AD271F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 783B4189385E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 20:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91134219EA5;
	Mon,  9 Jun 2025 20:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cyyhig3d";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pP6nfX3o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF781F3BB0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jun 2025 20:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499391; cv=none; b=akOxx/aZKSthNsmAQ590BEAf1bF+i0UHJz4U5z4vuw5x8Fk0rD9YOc+iGuh3mZe9r16TvYkM3hHGHQndCBWrRaVeNvPJEARGskiQmKggzS1+W/ait4bxVRBSTKZ/Rp8LnkVsRnykpDu4XtMWikP3nxN+noi5O0+dPSSXhqxG7xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499391; c=relaxed/simple;
	bh=cS5+g8nmAT3LNE359jzJAQDEh1IVeis9yWnQKeTZRJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S8oJQD1C3lZZ5Qt3lbNgAInd10TFgCQLtLby6keqs9tP5w4up5aQR2+msuHKZi5lPxrrvCVmLmeIyAA2bWlcU0l7tYD5sRvHv1Grnqi7op01/6BgsD6Dsbd14Yf+XJPujWdimEsPm6R2AOKW/kSd/y0g7dvuoYL09R2Nbu66UIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cyyhig3d; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pP6nfX3o; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bGNBs2Zmlz9t5C;
	Mon,  9 Jun 2025 22:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749499381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s7FX6a6j2vVPuJvt3QATUkrzhJNfnfdpsHxwWwNuhKQ=;
	b=cyyhig3dyGVOMfbrt+Q6J4b9bMu3tfK/YfRAiUcy5biR9xHuMnq73Mj15DRhb/+qJNY5Jz
	C466H7u+466vT24rL5mlbkL0UadCQGXLL7WbdDhnKDZR1xv1cvTpkyA5xdduTVTwdTwsUr
	ZXMhmljOl70EhxCfnKz/x4IuKXBmxhyHqZdSgwFRl8OEYefbpocsdL92lbUEf84s7Jrvl1
	o4KzDpQrQlZ0o9x7h2HTG3yOZXCd2ObiuYS0a95SXLACWZ+/sgBcl+MZlBizpDmsAobiq4
	Gtlbgkatl24SzdVjxDDCjbm+/Jl8NvvvV5euvOhyGisXqKu/bGG4v0/SEFiIEg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749499379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s7FX6a6j2vVPuJvt3QATUkrzhJNfnfdpsHxwWwNuhKQ=;
	b=pP6nfX3oDeL6cz1oxMxJjaXCeAw87ShgOiwp9ZZDEZ/fYjLTPVHlHbdAo7P5+pRtKqfKQl
	6PrqtU0sMd81G5GvR792jO1clpFHTY/Amjog8nH+7O20j0yiuAyHsvfwLUdyHUBlxBgIlC
	pjg33Dh1Om2Jw77bc47Syn0rDRP14sMdOCFE1ciHY6MqS1bcb8x6HZHv/waHEBtqVJrtLd
	/4VG8ks1ZJ7bj6lmdSanvPlCoNAMtZKsug6BO+9Pmq3sbIkY5e7WalwWG5g4QryTfRdmoW
	Kf8CD70jPMGNsD32mpcU5tNzNcqft2rbw1kpioTUbmeSjvwrXAyPsaEwnrns4g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	kernel test robot <lkp@intel.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH] regulator: rpi-panel-v2: Add missing GPIOLIB dependency
Date: Mon,  9 Jun 2025 22:02:06 +0200
Message-ID: <20250609200242.31271-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: hr4y89zgfs8o5ckt38irad4xdgyf1bzw
X-MBO-RS-ID: 1575762181f3be4783f

Add missing GPIOLIB dependency reported by the LKP test robot.
This fixes the following report:

"
kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_REGMAP when selected by REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
   WARNING: unmet direct dependencies detected for GPIO_REGMAP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2 [=y] && REGULATOR [=y] && I2C [=y]
"

Fixes: d49305862fdc ("regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506092341.enbNKMOR-lkp@intel.com/
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
 drivers/regulator/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 21ad6d938e4d..9a3dc883ff40 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1155,6 +1155,7 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 
 config REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
 	tristate "Raspberry Pi 7-inch touchscreen panel V2 regulator"
+	depends on GPIOLIB
 	depends on I2C
 	select GPIO_REGMAP
 	select REGMAP_I2C
-- 
2.47.2


