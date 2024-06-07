Return-Path: <linux-renesas-soc+bounces-5955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A615B900252
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 13:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5548E1F26288
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 11:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2622818FDD3;
	Fri,  7 Jun 2024 11:38:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D75518F2CE;
	Fri,  7 Jun 2024 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760283; cv=none; b=VY0x22id3QD4dk/ZbVgjh9dP8kBwMWp+uwom4Z8pAAzxFaoqtwIcgtRFKUdjdI96FCiluDicnLmRyq2W1Y7OzhVe5gF84ibGWANsSsolPAxs+AgXWs0IUGC2+QTANU20Frutx32HNFnNafP2wbXn5rkQ+rqhKCye6juBouWv0fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760283; c=relaxed/simple;
	bh=UGZ5oEMZ9e4xXf3NhtkgCSOOT7Nya92+sWR8qP8kW18=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KbMJYzprqwT9f5UDWe39q1LNCygkBpWT2sjBKa10+FcVVRyO6V9Rga7fL3ttCE8XHHBjXFL6q09OLnHzLIO3O0aXCSDEEarssidXfA53PU2XsEe3xGSNqQbusBAFU7idcreFQneVXlEO2evqBY1kpea1v1tTGfN/xoHAIORyV9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,221,1712588400"; 
   d="scan'208";a="207084411"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Jun 2024 20:37:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0BC8D40071E8;
	Fri,  7 Jun 2024 20:37:47 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH RFC v2 0/4] Add USB VBUS regulator for RZ/G2L
Date: Fri,  7 Jun 2024 12:37:41 +0100
Message-Id: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per RZ/G2L HW manual, VBUSEN can be controlled by the VBOUT bit of the
VBUS Control Register(VBENCTL) register in the USBPHY Control. But this IP
is in the Reset block.

Reset driver exposes this register as regmap and instantiate the USB VBUS
regulator device. Consumers(phy device) can use regulator driver's regmap
to control VBUS as controlling is done in the atomic context.

Please provide your valuable inputs.

v1->v2:
 * Introduced a regulator driver to control VBUS

Biju Das (4):
  reset: renesas: Instantiate USB VBUS regulator device
  regulator: Add Renesas RZ/G2L USB VBUS regulator driver
  phy: renesas: phy-rcar-gen3-usb2: Control VBUSEN selection
  arm64: dts: renesas: rz-smarc: Replace fixed regulator for USB VBUS

 .../boot/dts/renesas/rz-smarc-common.dtsi     | 15 ++---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 17 ++++-
 drivers/regulator/Kconfig                     |  9 +++
 drivers/regulator/Makefile                    |  1 +
 .../regulator/renesas-usb-vbus-regulator.c    | 65 +++++++++++++++++++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 29 +++++++++
 6 files changed, 126 insertions(+), 10 deletions(-)
 create mode 100644 drivers/regulator/renesas-usb-vbus-regulator.c

-- 
2.25.1


