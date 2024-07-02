Return-Path: <linux-renesas-soc+bounces-7000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6B69246C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 20:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E8E286460
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 18:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CC91BD01F;
	Tue,  2 Jul 2024 18:00:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7651448E1;
	Tue,  2 Jul 2024 18:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943244; cv=none; b=hljtWunf9HPHet9QiHsbpW9NUqY7R3UYW6LO8/3Qfi6z109eViNthFn069paq3xhysGgAoBjSd07qq8fq4bR+Lu5B/JXYobIJDf3Bx0x+U4Ir5Z9urw1isWViDzdpT9mDKF7PCShen/n9weCIC5e69JZItta6DucVLZwOxDNefA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943244; c=relaxed/simple;
	bh=U5fdK5vP7fM0lxDPtIHxzDFZIIXYkzmNkbI+gHHkurE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PCR9oKcZ2Of/WG3VBnjyI2pp1uz9OWN2WCTbZ8xJazI1SpJEXQCcsANMw4VElHh23IUkw7At4LyfEYsLTc9v5GGhtHt5pxB8a5V9ZglACv2ubJpfvlq24PoB9S7rljHFIihDV/ZlRM5Fu0eAGJdHIxHkAZt3pykEueHtFZi5b98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,178,1716217200"; 
   d="scan'208";a="210052532"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Jul 2024 03:00:40 +0900
Received: from localhost.localdomain (unknown [10.226.93.72])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9B4F84006CD0;
	Wed,  3 Jul 2024 03:00:35 +0900 (JST)
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
Subject: [PATCH v5 0/4] Add USB VBUS regulator for RZ/G2L
Date: Tue,  2 Jul 2024 19:00:14 +0100
Message-ID: <20240702180032.207275-1-biju.das.jz@bp.renesas.com>
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

Looks like this patch series can be taken via reset tree, once Geeert
provides Ack for board dtsi patch??

v4->v5:
 * Dropped regulator Patches #3 and #4 as patch#3 is going to be
   applied in Linux 6.10-rc5 and patch#4 is already in regulator/next
   tree.
 * Added Rb tag from Krzysztof for the binding patch.
 * Rebased and fixed the merge conflicts for patch#2(rzg2l-usbphy-ctrl).
 * Added Ack from Vinod for phy driver patch#5.
 * Updated commit description for board dtsi patch.
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

Biju Das (4):
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document USB VBUS
    regulator
  reset: renesas: Add USB VBUS regulator device as child
  phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs
  arm64: dts: renesas: rz-smarc: Replace fixed regulator for USB VBUS

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 10 ++++++
 .../boot/dts/renesas/rz-smarc-common.dtsi     | 11 ++-----
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  8 ++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 31 +++++++++++++++++++
 4 files changed, 51 insertions(+), 9 deletions(-)

-- 
2.43.0


