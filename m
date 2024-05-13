Return-Path: <linux-renesas-soc+bounces-5324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 059B18C3BE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 09:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F0C7B20B88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 07:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE551146A84;
	Mon, 13 May 2024 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WeTqcEJH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDF9146A67;
	Mon, 13 May 2024 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715585082; cv=none; b=Yp/vPfFlgRq5PC0iBRS+7gMBb6U6X0TKYmGnpMOracFwKBSGeSUd3ISUZR/BdEetJcZW09HUs19SO2y7lCIPiVfnD1Ei/DBIgQMgPcokGgPFzeJwC2p3elyp0EKY7Aa5lL420WIMPe5S7i9po3iVZOiCZhmmlzj5RUWCJ8kYz+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715585082; c=relaxed/simple;
	bh=ZXFdIBiRjDdx2nViooKJFY3balQZn5nQtmUZaVwuiOE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A7FeNwDKnjbSnKZrcCa0NQ43qAlW1GRGAh5+L2Tap9vFeZ7VI55JQYczIUYgliAIvoZAIDIfKsWWpO0Us4c9J23pIp6Od8rsuQAprwZ9fE9rjTAb9mpjfm9iGHr41jU2fN9eVsQv5WoSKozbg3qwDgtP/R1cgNUQQ0+XEJ2giKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WeTqcEJH; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 788902000E;
	Mon, 13 May 2024 07:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715585078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l7briKDXZUlZ4ihbmAD3jDG5eaCQTlrkO60KlQj+9HM=;
	b=WeTqcEJHjwKOo8R4WSwTL75V2yKbee+HmaMtjc9Qrbdypb4OlgWPrQ2L1tphQFmJfaDuY4
	U77LGD5+uZpbOWD5LEYbJ+7ohVE8oHiT2P9GDdXDsO70PSw6uBsXnevw6UC8Kmol64/tfy
	QBMj2bJ1nRLOTe/251p6SuJN5o8+VHKOlT6qqQtYgU8O2VZANhet2BTl4uOWuk6qbwxJa0
	R8E0GzqYGJSNIaYsocVF/apwxDeVFQNN6kEIXrGL5P4jcMeSFyvOk5qnct9ESux7jGLWiE
	JrzsKTT3RCXirlekxdV4s9kHjMRVERA64vlBDxedHvnwqqM96Nk1O8LY46gf9Q==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next v7 0/7] net: stmmac: Add support for RZN1 GMAC
 devices
Date: Mon, 13 May 2024 09:25:11 +0200
Message-Id: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFjAQWYC/23QQW7DIBAF0KtErEsFw4Chq96jygLwkCA1UNmWl
 TTy3Yu8qV13Ofp6/0vzZCMNmUb2dnqygeY85lra0b2cWLz6ciGe+3YzEIACBfDhu0h+ufkoubE
 6Jts51QtiDXwNlPJ9LftghSZe6D6xc0uueZzq8FhXZrnm/xXOkguuA0EA67C38T3UOn3m8hrrb
 S2aYYvdDkPDnYsedYIUO3fEaoOl3mHVsA8SEkREIfsjxg0G3GFs2GrwbTiSiOKI9QYrscO6YQP
 JaG8xobRHbH6xlntsGg5GOYRASuGfhy3L8gMDbkTA4QEAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com

Hello everyone,

This is version seven of my series that adds support for a Gigabit Ethernet
controller featured in the Renesas r9a06g032 SoC, of the RZ/N1 family. This
GMAC device is based on a Synopsys IP and is compatible with the stmmac driver.

My former colleague Clément Léger originally sent a series for this driver,
but an issue in bringing up the PCS clock had blocked the upstreaming
process. This issue has since been resolved by the following series:

https://lore.kernel.org/all/20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com/

This series consists of a devicetree binding describing the RZN1 GMAC
controller IP, a node for the GMAC1 device in the r9a06g032 SoC device
tree, and the GMAC driver itself which is a glue layer in stmmac.

There are also two patches by Russell that improve pcs initialization handling
in stmmac.

Best Regards,

Romain Gantois

---
Changes in v7:
- Fixed potential uninitialized use in stmmac_pcs_setup()
- Link to v6: https://lore.kernel.org/r/20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com

Changes in v6:
- Changed stmmac_pcs_clean() prototype to match stmmac_pcs_setup()
- Link to v5: https://lore.kernel.org/r/20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com

Changes in v5:
- Refactored the stmmac_xpcs_setup() function to group together XPCS and PCS
  setup logic.
- Added a stmmac_pcs_clean() function as a counterpart to stmmac_pcs_setup()
- Link to v4: https://lore.kernel.org/r/20240424-rzn1-gmac1-v4-0-852a5f2ce0c0@bootlin.com

Changes in v4:
- Removed the second parameters of the new pcs_init/exit() callbacks
- Removed unnecessary interrupt-parent reference in gmac1 device node
- Link to v3: https://lore.kernel.org/r/20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com

Changes in v3:
- Fixed a typo in the socfpga patch
- Link to v2: https://lore.kernel.org/r/20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com

Changes in v2:
- Add pcs_init/exit callbacks in stmmac to solve race condition
- Use pcs_init/exit callbacks in dwmac_socfpga glue layer
- Miscellaneous device tree binding corrections
- Link to v1: https://lore.kernel.org/r/20240402-rzn1-gmac1-v1-0-5be2b2894d8c@bootlin.com

---
Clément Léger (3):
      dt-bindings: net: renesas,rzn1-gmac: Document RZ/N1 GMAC support
      net: stmmac: add support for RZ/N1 GMAC
      ARM: dts: r9a06g032: describe GMAC1

Russell King (Oracle) (2):
      net: stmmac: introduce pcs_init/pcs_exit stmmac operations
      net: stmmac: dwmac-socfpga: use pcs_init/pcs_exit

Serge Semin (2):
      net: stmmac: Add dedicated XPCS cleanup method
      net: stmmac: Make stmmac_xpcs_setup() generic to all PCS devices

 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |  66 +++++++++++++
 MAINTAINERS                                        |   6 ++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  18 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  12 +++
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c   |  86 +++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 107 ++++++++++-----------
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  14 +--
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  |  52 +++++++---
 include/linux/stmmac.h                             |   2 +
 11 files changed, 290 insertions(+), 77 deletions(-)
---
base-commit: cddd2dc6390b90e62cec2768424d1d90f6d04161
change-id: 20240402-rzn1-gmac1-685cf8793d0e

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


