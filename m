Return-Path: <linux-renesas-soc+bounces-6046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC0903969
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 12:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB221282B02
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 10:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C493917A920;
	Tue, 11 Jun 2024 10:59:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6720C1791FC;
	Tue, 11 Jun 2024 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718103574; cv=none; b=cOrMi96wzAtGxRh0jOfpM7rCu/WV/ieHAgQj4wl5L8e71seUyxDT5UdxGoQhQKUIn1QYGegLhc5hCrarjOCI2FHbX4qYWAu2fPcuAS/uoAzy1Y2rqGkzoJN6uien9GiD9tr2zS6oT9hZumtM3Xhs7TtkHEdfS+ziEkmOcLDcVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718103574; c=relaxed/simple;
	bh=98t87dKRpoXqlqHCWIsVHZ6TKkxUFPKEghc3gOXev78=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cLT+F62ebMP6ntG2TUEgQU+98sYXk+ujCO4dZxd6TPo8KHtzjHZ+3zwB/C3ImiWVtlGmrE+KS4YuV8sQoq8Qauqa8NthUKasj1TCS1iHbI9Ph5Kr70s7eUOYNk5jmcxDRvFiKIVHIC4Cj1cHbUXEkgA0g+9kfDlWGm6v5PYuFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,229,1712588400"; 
   d="scan'208";a="211445797"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2024 19:59:25 +0900
Received: from localhost.localdomain (unknown [10.226.93.49])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 93E0240078D0;
	Tue, 11 Jun 2024 19:59:20 +0900 (JST)
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
Subject: [PATCH v3 0/6] Add support for USB VBUS control for RZ/G2L SoCs
Date: Tue, 11 Jun 2024 11:59:11 +0100
Message-Id: <20240611105917.57872-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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

Reset driver exposes this register as regmap and instantiate the
USB VBUS regulator device. Consumers(phy device) can use regulator
driver's regmap to control VBUS as controlling is done in the atomic
context.

We need to have merge strategy which subsytem will apply this patches
as it involves multiple subsystems Reset, Regulator, PHY, DT and Renesas SoC??

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
  regulator: core: Add helper for allow access to enable register
  regulator: Add Renesas RZ/G2L USB VBUS regulator driver
  phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs
  arm64: dts: renesas: rz-smarc: Replace fixed regulator for USB VBUS

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 12 ++++
 Documentation/power/regulator/consumer.rst    |  5 ++
 .../boot/dts/renesas/rz-smarc-common.dtsi     | 13 ++--
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  3 +
 drivers/regulator/Kconfig                     |  9 +++
 drivers/regulator/Makefile                    |  1 +
 drivers/regulator/core.c                      | 32 +++++++++
 .../regulator/renesas-usb-vbus-regulator.c    | 67 +++++++++++++++++++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 37 ++++++++++
 include/linux/regulator/consumer.h            |  8 +++
 10 files changed, 179 insertions(+), 8 deletions(-)
 create mode 100644 drivers/regulator/renesas-usb-vbus-regulator.c

-- 
2.25.1


