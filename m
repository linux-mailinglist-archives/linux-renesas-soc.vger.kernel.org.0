Return-Path: <linux-renesas-soc+bounces-17192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1697DABBD6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 14:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A97A0189CAE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 12:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F23277817;
	Mon, 19 May 2025 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OfS3hmmp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92481714B3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656928; cv=none; b=LHf2PfYEvozH+4rdqcHtkzAy6q58QRA6BueY2aEH5jCB/WsbaggZY39J67LrRIVgoP5gtBRroeM5aPloAYlTZkMiK1UzmPsaY1D/FyeYEKIhJGMPIIqKvCwqiTjx1Kd9zZdgBJnCC1X7YxEBy6DX21sKVO9tWAmdzn5zDG84AlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656928; c=relaxed/simple;
	bh=UxLPMqI+hbxHffo6UB0YLTd8Ghw64v4QP8WAymsijqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OCyDFU3csRecXEyrmX8dPQ135isPCtVyJ/wnPcrE0drcdY9mEcaQBp6bMOPJoXLkJBZx/0zLtZz2YMYnF2kA9cZDpq8o/+oaCTilQMyJFVhYzCiFCnL3Q0ucqzLQ6NOmUEUsKrnKW+0EmNYFezIW5IqToLdzoip5xU46ILul2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OfS3hmmp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=zix02Rf2UN8dkt
	KxUMJpGTMpr0tknfsIvIDaFLjGkBU=; b=OfS3hmmpN6YsEPr8bsgpBis3TabWtE
	Xz/ybh6VGsKWv91v0TKP/cHNcNALo1ydU97CoAEkgWD563P0wjx5riAOZdaVmAcm
	BicbYuqL0M4G8fM6KBh9oBbNydZAJocW8ZlBFHG5UlqDj1zrR4ivKoYWb3jDhz2m
	lX0pKomIaHk6Wm+jjzPW+gV2D4g9y/bspoXU4NHwZwHKVmaJrXXkzVcbtn2Rmzg/
	NSbp3LvZSyloZgdID/TcuIMkZZ5VWLpYydIEtmWR8A96yl5Hv/ieUlW1rQKhp7NW
	Ak2OhjdYeLAQ+IF762FNdG2omfeAA4c9A5kTi5hr2F/A+j4VuD7ppGSg==
Received: (qmail 2474961 invoked from network); 19 May 2025 14:15:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:21 +0200
X-UD-Smtp-Session: l3s3148p1@y0H0FXw1CJpZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH 0/7] archs: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:00 +0200
Message-ID: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A lot of boards across various archs have a superfluous '-' in their
node name for GPIO based I2C busses. 'dtbs_check' complains, so fix
them.

Based on linux-next as of 20250516. Build bots are happy. ARM patches
depend on another cleanup series[1], the rest has no dependencies. I
suggest that patches go via their subsystem trees.

Tested on Calao USB boards using AT91 chipsets and a Renesas Lager board
using R-Car H2.

[1] "[PATCH 0/4] ARM: dts: use recent scl/sda gpio bindings"
    https://lore.kernel.org/r/20250519112107.2980-1-wsa+renesas@sang-engineering.com

Wolfram Sang (7):
  arm64: dts: exynos: use proper node names for GPIO based I2C busses
  arm64: dts: mediatek: use proper node names for GPIO based I2C busses
  ARM: dts: microchip: use proper node names for GPIO based I2C busses
  ARM: dts: samsung: use proper node names for GPIO based I2C busses
  ARM: dts: stm32: use proper node names for GPIO based I2C busses
  LoongArch: dts: use proper node names for GPIO based I2C busses
  riscv: dts: allwinner: use proper node names for GPIO based I2C busses

 arch/arm/boot/dts/microchip/at91-foxg20.dts      |  2 +-
 arch/arm/boot/dts/microchip/at91-qil_a9260.dts   |  2 +-
 arch/arm/boot/dts/microchip/at91-sam9_l9260.dts  |  2 +-
 arch/arm/boot/dts/microchip/at91rm9200.dtsi      |  2 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi     |  2 +-
 arch/arm/boot/dts/microchip/at91sam9260ek.dts    |  2 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi     |  2 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi     |  2 +-
 arch/arm/boot/dts/microchip/at91sam9263ek.dts    |  2 +-
 .../boot/dts/microchip/at91sam9g20ek_common.dtsi |  2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi     |  2 +-
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi     |  2 +-
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi      |  4 ++--
 arch/arm/boot/dts/microchip/at91sam9rlek.dts     |  4 ++--
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi      |  6 +++---
 arch/arm/boot/dts/microchip/ethernut5.dts        |  2 +-
 arch/arm/boot/dts/microchip/evk-pro3.dts         |  2 +-
 arch/arm/boot/dts/microchip/mpa1600.dts          |  2 +-
 arch/arm/boot/dts/microchip/tny_a9263.dts        |  2 +-
 .../arm/boot/dts/microchip/usb_a9260_common.dtsi |  2 +-
 arch/arm/boot/dts/microchip/usb_a9263.dts        |  2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts    |  2 +-
 arch/arm/boot/dts/samsung/exynos3250-monk.dts    |  2 +-
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts  |  2 +-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts   |  6 +++---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi   | 10 +++++-----
 .../boot/dts/samsung/exynos4412-galaxy-s3.dtsi   |  4 ++--
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi  |  6 +++---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi |  8 ++++----
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi     | 16 ++++++++--------
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts    |  2 +-
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-codina.dts |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-gavini.dts | 12 ++++++------
 .../arm/boot/dts/st/ste-ux500-samsung-golden.dts |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-janice.dts | 16 ++++++++--------
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts  |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-skomer.dts |  8 ++++----
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi   |  2 +-
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts     |  4 ++--
 arch/loongarch/boot/dts/loongson-2k1000.dtsi     |  4 ++--
 .../dts/allwinner/sun20i-d1-devterm-v3.14.dts    |  2 +-
 42 files changed, 94 insertions(+), 94 deletions(-)

-- 
2.47.2


