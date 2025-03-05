Return-Path: <linux-renesas-soc+bounces-13988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF67A4FA0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 10:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB43416EECE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 09:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAB1204C24;
	Wed,  5 Mar 2025 09:30:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC9F2E338B;
	Wed,  5 Mar 2025 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167009; cv=none; b=QT4kuUzHAQvxQ1jzg59vCLPLroBtHNeARz29XYDnO9KBwc6+Uvn40nzfuiJnHNY+BEc2WkbLGacZr7Oq6NIa37H8stzlFBoJt4/eTmTtHaPUOBoy3Xntqta/NozZe3U0JQbUgBu3MDEdIMsNj/vL4mFFl0AJ1c1pyFKp2qPqA0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167009; c=relaxed/simple;
	bh=MrGkpKrquMTPeSOb8uEVtL40WPXsEm/bCJQkaaJsrI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BQx1OfJ09Pb7CNfD+Y2TmyU1aFwCdUYvXPsMl+ZWqvJzJYJaxOhh3P6nu1s8QbktZ3IvibedRwQG6Gp/MpDPFurCVY+9197CSIEQ8FMKQwYEMa/OFp/HPIuenPFVBjWQFiYjb6aQOXo64WUpI6KOyxY2ksxj0eSltvM1DMEp5Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: jPoFaVfGTK2QZNVBqyCd3Q==
X-CSE-MsgGUID: krVBVJARRjyzhQw/9YfZtg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Mar 2025 18:30:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.226])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D4864401E50A;
	Wed,  5 Mar 2025 18:30:00 +0900 (JST)
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
Subject: [PATCH v6 0/2] Add RZ/G3E SDHI support
Date: Wed,  5 Mar 2025 09:29:50 +0000
Message-ID: <20250305092958.21865-1-biju.das.jz@bp.renesas.com>
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

v5->v6:
 * Added const for renesas_sdhi_vqmmc_regulator.
 * Added Rb tag from Wolfram for driver changes.
v4->v5:
 * Collected tag from Wolfram Sang.
 * Dropped redundant struct renesas_sdhi_vqmmc_regulator initialization.
 * Added one space before '=' in the struct initializer.
v3->v4:
 * Dropped dts patches as it is deferred for queuing.
 * Arranged variables of same types close to each other in probe() and
   dropped patch#2.
 * Added sd_ctrl_read32().
 * Replaced sd_ctrl_read32_rep()->sd_ctrl_read32().
v2->v3:
 * Collected tags
 * Renamed internal regulator labels vqmmc_sdhi{0..2}->sdhi{0..2}_vqmmc.
 * Updated regulator phandles on SoM/Board dts.
 * Dropped renaming the gpio regulator label vqmmc_sdhi1->vqmmc_sdhi1_gpio.
 * Renamed node sd0emmc->sd0-emmc
 * Renamed sd0-emmc-{ctrl,data,rst}->sd0-{ctrl,data,rst}
 * Moved header file gpio.h from patch#6 to patch#8.
 * Dropped overriding internal regulator name.
 * Dropped #if guard in pinctrl node for SDHI0
 * Renamed the label/node sdhi0_pins: sd0->sdhi0_usd_pins: sd0-usd.
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

Biju Das (2):
  dt-bindings: mmc: renesas,sdhi: Document RZ/G3E support
  mmc: renesas_sdhi: Add support for RZ/G3E SoC

 .../devicetree/bindings/mmc/renesas,sdhi.yaml |  16 +++
 drivers/mmc/host/renesas_sdhi.h               |   1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 130 ++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h                   |  10 ++
 4 files changed, 157 insertions(+)

-- 
2.43.0


