Return-Path: <linux-renesas-soc+bounces-12905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 246FFA2AA24
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 14:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28E3D188344E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 13:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107761EA7F7;
	Thu,  6 Feb 2025 13:41:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803781EA7C2;
	Thu,  6 Feb 2025 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849276; cv=none; b=kSgqNSmekKOL/4OdhYFZV+1Skqnddcs8LuW+vvlbMtKRGqu/G+C+jx5ZpdBpZ4ijOVJJBxVMrDK9k9lkUDrJfCcG0PC6h45BeIeqW/khd6A1qqQaDK9GLsGsle1Sar/8Fx6szxOtuNPO395AkCUn8x2cdrOyusL2srhVuxsN4T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849276; c=relaxed/simple;
	bh=l457DxiD69dovlm/aCrEv30GIyaW5ETmIGHo4eyQSVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVTyY4eju8+KKtwkZvU5WDB1xB2y9ffrBpGkAc7CvcHGIL0txXZDU7le8368Tm1TGKvsO7L4koYyVrTQoNwJ8zq2KuVwVnTXCtDhOhUn7VDLeACQcSzU2B571NwbI+YkTwGcEoaQHnxNIWPJ+6dV8ljjD5H9i4k1Nd6n+nAeDeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: zAi6ZPeMSoCGqS0t+kjydg==
X-CSE-MsgGUID: VDgi4AdxQFONXLMFBkBTHA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Feb 2025 22:41:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E689F4017F2F;
	Thu,  6 Feb 2025 22:40:49 +0900 (JST)
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
Subject: [PATCH v3 0/8] Add RZ/G3E SDHI support
Date: Thu,  6 Feb 2025 13:40:24 +0000
Message-ID: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
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
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  18 ++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 154 ++++++++++++++++++
 drivers/mmc/host/renesas_sdhi.h               |   1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 136 +++++++++++++++-
 drivers/mmc/host/tmio_mmc.h                   |   5 +
 9 files changed, 459 insertions(+), 1 deletion(-)

-- 
2.43.0


