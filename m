Return-Path: <linux-renesas-soc+bounces-26236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9E8CED550
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAE3B3006AAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA442165EA;
	Thu,  1 Jan 2026 20:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HVVtud7B";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mbAzoHmD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D61427A;
	Thu,  1 Jan 2026 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300002; cv=none; b=mm7nNqLHCTr7IQDcqQc0s/CDdJzeuzUgjNabg6S5MydOjolZE12LAd27GDo/AlSBMit3YSiQp9AmgB3IVeCxWe0/EII/NzLwDgPxgwXMjBWlRW0f7IlFvOEksTXoM9uyJHP3ECYkJroU/vG29pls5WKHNu7gEwpPn+GoaH2FEoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300002; c=relaxed/simple;
	bh=kpTBa4IZTTxTd0NzD8g8GDtFgAB1/3kcPDIWboWwDNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kt6Z6lIFFyExsIHhMIcNA9lMF/iWThV8sfyvnML6gpcOAPh9nuM7Q0Fd5u7eQ4Kqq9ySTTuj+q4bsYhPPJ4TaGsyaoGbVv5NgBDBG/ifDjVf9W0tBNWyGOcqnxy72aTSk3jPStykmm0CGtp9sCBXUaQA36pTNDlXv/RXumKoe4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HVVtud7B; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mbAzoHmD; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dhzGJ6vKyz9slB;
	Thu,  1 Jan 2026 21:39:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SVW0D3VHQ/9UYMf1H6TYmbhWryKWzOQzD+QDECFAVCI=;
	b=HVVtud7Bpy/sLXqYXGgCGO8pIj7w55qFOc5IsQUvjS+S7IWOvJoIyc6D5e5o7yqJLjQmln
	7pxQIFxai6Q/O4mTYDSzMPemCLkD/RXHJWBFXnxZUQ6oMnR2D/YRtPr1fWXbjeh6C1izSa
	Fd3Ef/mAWS6hSbA+GkpAq3BGHrkWC/R3lHKqm+hv27JvgkSotzFTqRw4klOLPOgKcwdJj0
	uK5rAgBD7jyj8smpMsNuM5i9hvfmQiixlBdb8LliYhMflgX5IDRuPuxYW2UdfHUxZ0YC2o
	WICzAgzLHPX3C/nZoFh6h97I3d6tsrWwfPMLXf9k3UsS4kYfice2SHRj9otyLw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mbAzoHmD;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SVW0D3VHQ/9UYMf1H6TYmbhWryKWzOQzD+QDECFAVCI=;
	b=mbAzoHmDtSsvpOE0MXMScrn3TdZqdmt415JFUuUhiEfw5+KQ29vF9BlLiifFODiDwRe3SB
	J0rArQI373uKSSF/lrstCN7FXlRtQEPIqGafvak/JJ9JzsLV6YYXiTJIZ2g0+sHRp1HYm0
	g8yu8U2oSwp94AMRw7SBaetIZPkQDC57uylRQBToeFlNk2uUzkL3d9+1j4ies+S1cxq6es
	LajTyee8Le2e4CbKrRTgK0nNrApfLRJilmqoTdL2K3nqKNClS1JrwDt9Pvjk5TdUlrgrYa
	cadY3jNf/O2nGBni910yOeUJd7lBCynpy7qlyUFGfH/2GysjgT56xQmOLuAZ+g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/11] Describe PCIe/USB3.0 clock generator on R-Car Gen3
Date: Thu,  1 Jan 2026 21:35:47 +0100
Message-ID: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7pm6idxcp1gs3rc5wka53woapptag165
X-MBO-RS-ID: ed28d9c32f1f63fc69d
X-Rspamd-Queue-Id: 4dhzGJ6vKyz9slB

Describe the 9FGV0841 PCIe and USB3.0 clock generator present on various
R-Car Gen3 boards. The clock generator supplies 100 MHz differential clock
for PCIe ports, USB 3.0 PHY and SATA.

The series effectively has three parts, the first three patches are part 1,
which fills in the missing USB 3.0 PHY on R-Car E3 Ebisu and enables it,
thus aligning the Ebisu USB 3.0 support with the rest of the Gen3 boards.

The second part is description of PCIe root ports on R-Car Gen3 SoCs where
applicable, in this case that is H3/M3W/M3N/E3. The root port is used with
PCIe port power control to also control the PCIe port clock. This is needed
on Gen3 boards, because they often use separate clock output from the PCIe
clock generator 9FGV0841 to supply clock to the controller and to the PCIe
port.

The third part is enablement of the 9FGV0841 PCIe clock controller on the
R-Car Salvator-X/XS, ULCB and Ebisu boards. The boards use the PCIe clock
controller outputs in a slightly different manner, all use the outputs to
supply PCIe controllers and slots, as well as USB 3.0 SuperSpeed PHY. The
ULCB board also uses the 9FGV0841 to supply SATA IP, but this is not yet
described in DT, therefore it is also not part of this series.

Marek Vasut (11):
  dt-bindings: phy: renesas: usb3-phy: add r8a77990 support
  arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
  arm64: dts: renesas: ebisu: Enable USB 3.0 PHY
  arm64: dts: renesas: r8a77951: Describe PCIe root ports
  arm64: dts: renesas: r8a77960: Describe PCIe root ports
  arm64: dts: renesas: r8a77961: Describe PCIe root ports
  arm64: dts: renesas: r8a77965: Describe PCIe root ports
  arm64: dts: renesas: r8a77990: Describe PCIe root port
  arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock
    generator
  arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock
    generator
  arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator

 .../bindings/phy/renesas,usb3-phy.yaml        |  1 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi        | 43 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     | 29 +++++++++++++
 .../boot/dts/renesas/salvator-common.dtsi     | 26 +++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      | 21 +++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         | 13 ++++++
 10 files changed, 213 insertions(+)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.51.0


