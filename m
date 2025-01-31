Return-Path: <linux-renesas-soc+bounces-12783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A582BA23CD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 12:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 335E7188740E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 11:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1FD1BFE03;
	Fri, 31 Jan 2025 11:24:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F9A1BEF76;
	Fri, 31 Jan 2025 11:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322681; cv=none; b=TFOj2GKvq54PcXOHrj6BN8H9ViMoI8U1FUJ9kyw4aUNjgzuYKXqHR8lJQ0bYmqpJsmZ3VLPNDyvRM88hr1jNYDphTncg40BcJszd0XtHFubdb/hlQgM/cuycohNQjSO6tpFbZgC8Ci0qGYgEdA+ReBwoC2i8khemTi+VtfgbZnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322681; c=relaxed/simple;
	bh=Sj4t5fRgIb5ZaiNWIY/URGjgf5gzl5XqYdNvYx+QV2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bGr/ZvxXL7YVyuzOlH0N5MFlyulFRUq9ZHvBNIIBVcEB8ECxc+pQksEu0MWoHy2Mo2bU6s/8IHNfAxFYTF+SmNd+J+ige3d8yruUSsKNlEJK/wVyDkxqZAAzGjRb46CTRGMJceDI/Bu585TEEffe6F0XDmaOCGMoxdT8TuR+mGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 5zf9B5YbSQ2OW8BgCbMgkg==
X-CSE-MsgGUID: zr5LKEGcSm6aBCApGUOSEQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jan 2025 20:24:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B24E4017BBB;
	Fri, 31 Jan 2025 20:24:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/8] Add RZ/G3E SDHI support
Date: Fri, 31 Jan 2025 11:24:15 +0000
Message-ID: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that
of the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
use SD_STATUS register to control voltage and power enable (internal
regulator).

For SD1 and SD2 channel we can either use gpio regulator or internal
regulator (using SD_STATUS register) for voltage switching.

For SD0, fixed voltage(eMMC) uses fixed regulator and non-fixed voltage
(SD) uses internal regulator.

v1->v2:
 * Collected tags.
 * Documented internal regulator as optional property for both RZ/G3E and
   RZ/V2H SoCs.
 * Updated commit description for regulator used in SD0 fixed and
   non-fixed voltage case in patch#3.
 * As the node enabling of internal regulator is controlled through status,
   added a check for device availability.
 * Status of internal regulator is disabled in the SoC .dtsi. Override
   the status in the board DTS when needed.
 * Added support for enabling SDHI internal regulator in RZ/V2H
 * Added missing header file gpio.h
 * Used fixed regulator for eMMC on SD0 and dropped sd0-iovs pins for
   eMMC.
 * Sorted pinctrl nodes for sd2
 * Enabled internal regulator for SD2.
 * Added support for enabling SD on SDHI0
 * Replaced the regulator usd_vdd_3p3v->reg_3p3v.
 * Renamed the gpio-hog node sd1-pwr-en->sd1-pwr-en-hog.
 * Sorted sd1 pin ctrl nodes.

Biju Das (8):
  dt-bindings: mmc: renesas,sdhi: Document RZ/G3E support
  mmc: renesas_sdhi: Arrange local variables in reverse xmas tree order
  mmc: renesas_sdhi: Add support for RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
  arm64: dts: renesas: r9a09g057: Add support for enabling SDHI internal
    regulator
  arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
  arm64: dts: renesas: rzg3e-smarc-som: Add support for enable SD on
    SDHI0
  arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1

 .../devicetree/bindings/mmc/renesas,sdhi.yaml |  16 ++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  60 +++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  49 ++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  21 +++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   4 +-
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  18 ++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 158 ++++++++++++++++++
 drivers/mmc/host/renesas_sdhi.h               |   1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 136 ++++++++++++++-
 drivers/mmc/host/tmio_mmc.h                   |   5 +
 10 files changed, 465 insertions(+), 3 deletions(-)

-- 
2.43.0


