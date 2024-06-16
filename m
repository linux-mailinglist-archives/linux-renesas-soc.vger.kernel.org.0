Return-Path: <linux-renesas-soc+bounces-6298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4339909D0C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 12:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 714E5B20D0C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 10:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2679B178399;
	Sun, 16 Jun 2024 10:54:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4271DDC9;
	Sun, 16 Jun 2024 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718535259; cv=none; b=VLZexvGogwPnfnrlDn/qZsASWfRG9WiQOGx4rIxdjzU3A9b3JvcNcbZEY8e0aChHsRaEhLJBFfqFMrePt1230tgaEbI8Im8vU9vlggJVqjrTrtV62LMNILVlyOeB2Tc9wqwRJu2f/e8BDt3fQd/hh47esAdjBSnjeUx5pTvmbFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718535259; c=relaxed/simple;
	bh=ELyUVrr8396gyLhTS0YK84uuxkPGemBkOW+kECeKA3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISFnlPomtM2ATNaaA9CaI4IXyrd9kHpvWGLwKpmvQkntGU8zbmNVldLT6JfVAiNbHItOZzW/UASrHZ6hjbpeCHiKYG0dHFANm7m5BebFWiSEjcK1pGxLW8JdlR+R5d4OsIpNgR/UMLMrk6Me4twDCCs2lzhpBFpr9sc7q4iQZMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,242,1712588400"; 
   d="scan'208";a="212062378"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Jun 2024 19:54:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.60])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E1D9241FEF44;
	Sun, 16 Jun 2024 19:54:04 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/6] Add USB VBUS regulator for RZ/G2L
Date: Sun, 16 Jun 2024 11:53:52 +0100
Message-ID: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per RZ/G2L HW manual, VBUS enable can be controlled by the VBOUT bit of
the VBUS Control Register(VBENCTL) register in the USBPHY Control. But
this IP is in the Reset block.

Reset driver exposes this register as regmap and instantiate the USB VBUS
regulator device. Consumers(phy device) can use regulator APIs to control
VBUS as controlling is done in the atomic context.

We need to have merge strategy which subsytem will apply this patches
as it involves multiple subsystems Reset, Regulator, PHY, DT and Renesas
SoC??

v3->v4:
 * Fixed example indentation to 4 char spaces in patch#1
 * Dropped regulator-{min,max}-microvolt from example.
 * Updated commit header and description in patch#3
 * Replaced regulator_set_hardware_enable_register()->regulator_hardware_enable()
 * Updated documentation to "must use of regulator_get_exclusive() for consumers"
 * Enforced exclusive access in regulator_hardware_enable().
 * Added generic support regulator_hardware_enable().
 * Added check for of_get_child_by_name().
 * Released the resource by of_node_put()
 * Updated commit description with regulator_hardware_enable()
 * Used devm_regulator_get_exclusive() to get regulator handle.
 * Dropped regulator-{min,max}-microvolt.
v2->v3:
 * Documented regulator-vbus in the binding file.
 * Updated commit description and header for patch#2
 * Moved regulator device creation and instantiation at the end of probe().
 * Introduced new API regulator_set_hardware_enable_register() to enable/disable
   regulator in atomic context.
 * Dropped vbus_voltages table from patch#4
 * Added support for enabling/disabling regulator through regmap API's
 * Updated rzg2l_usb_vbus_rdesc with enable_{reg,mask}, fixed_uV and
   n_voltages
 * Updated of_node with child node of the parent device.
 * Replaced regulator's regmap API with newly introduced
   regulator_set_hardware_enable_register to enable/disable regulator
   in interrupt context in patch#5
 * Dropped using "usb_vbus-supply" in patch#5.
 * Upated vbus regulator label name in dts file.
 * Updated node and regulator name that matches with the binding documentation.
v1->v2:
 * Introduced a regulator driver to control VBUS

Biju Das (6):
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document USB VBUS
    regulator
  reset: renesas: Add USB VBUS regulator device as child
  regulator: core: Add helper for allow HW access to enable/disable
    regulator
  regulator: Add Renesas RZ/G2L USB VBUS regulator driver
  phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs
  arm64: dts: renesas: rz-smarc: Replace fixed regulator for USB VBUS

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 10 +++
 Documentation/power/regulator/consumer.rst    |  6 ++
 .../boot/dts/renesas/rz-smarc-common.dtsi     | 11 +--
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  8 +-
 drivers/regulator/Kconfig                     |  9 +++
 drivers/regulator/Makefile                    |  1 +
 drivers/regulator/core.c                      | 28 +++++++
 .../regulator/renesas-usb-vbus-regulator.c    | 74 +++++++++++++++++++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 37 ++++++++++
 include/linux/regulator/consumer.h            |  7 ++
 10 files changed, 182 insertions(+), 9 deletions(-)
 create mode 100644 drivers/regulator/renesas-usb-vbus-regulator.c

-- 
2.43.0


