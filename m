Return-Path: <linux-renesas-soc+bounces-12326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A440A18FF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 190B116568E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC481211706;
	Wed, 22 Jan 2025 10:40:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E761A21148E;
	Wed, 22 Jan 2025 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542411; cv=none; b=mi2r50cV8i+XXKzFdZdpjYNLUgUfeXMLZFohmZepIoZyUBmyUsQCFnzNDGW44Bciy8Lt7qA3D3WqsyG+cNjplde/9ceiqbp6Mn/6bSyCcIJV2Cqz9VdaKVMk37sB7Qrnijt+ntC0OMmYlNNepKTKhYz2F4m4ztshjBTS6qqzNXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542411; c=relaxed/simple;
	bh=9I5z8OXNHuxViVM4dS+iVMpmqS5I+ojp4NXslh4K3nA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hahHGEEcfcUSBBFZCa8cXN/OACy/HZNxu//4pBzua4I9ByXpfykkNScaKlCApdvNyITW6G2QMCYOPpltDMIHCu6BV+tXk9N/faByUmAj9GtG+b0u6mvMSwj10QD4F3JxfvZYOYkSvPDPFcovML/JsNxK8c742B5ipdFeNSrqeZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: qBfjSIxYRO2hT9e1ojLtFg==
X-CSE-MsgGUID: rT0GWZjRQq2r7YHlep41Cw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jan 2025 19:40:01 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.193])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E56E1400563D;
	Wed, 22 Jan 2025 19:39:41 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	robh@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	magnus.damm@gmail.com,
	john.madieu.xa@bp.renesas.com
Subject: [PATCH v3 0/9] soc: renesas: Add RZ/G3E SoC detection support
Date: Wed, 22 Jan 2025 11:39:02 +0100
Message-ID: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds SoC detection support for the RZ/G3E, RZ/V2H(P),
and the RZ/G2Si SoCs. While the previous series (v1 and v2) were adding
syscon support as well, this series drops it to get rid of not-merged
dependencies. Syscon support will be added when adding one of its user
(such as TSU, PCIe, or USB drivers). This led to change the subject of
the series.

This Soc detection series relies on the System Controller IP to detect
various SoC features like core count, NPU/GPU/ISP presence, and CA55 PLL
configuration.

Key features:
- Detection of SoC revision
- Detection of quad/dual core configuration
- Detection of Ethos-U55 NPU presence
- Validation of CA55 PLL frequency setting
- SoC-specific extended identification through callbacks

Changes in v3:
- Changed series subject
- Got rid of [1] and other not-merged dependencies
- Removed syscon/regmap support
- Added RZ/V2H SoC detection support

Changes in v2:
- Fixed code style issues in rz-sysc.c and r9a09g047-sysc.c
- Fixed device tree documentation, getting rid of syscon compatible string
- Handled non signal-aware readable/writeable regmap callback
- Consolidated common code between RZ/V2H and RZ/G3E drivers
- Moved SoC ID detection from the compatible string fix into a new patch

Tested:
- Example of SoC detection:
[    0.065608] renesas-rz-sysc 10430000.system-controller: Detected Renesas 
Quad Core RZ/G3E r9a09g047 Rev 0  with Ethos-U55

- Example of PLL misconfiguration warning:
[    0.065616] renesas-rz-sysc 10430000.system-controller: CA55 PLL is not 
set to 1.7GHz

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=912455

Claudiu Beznea (3):
  soc: renesas: Add SYSC driver for Renesas RZ family
  soc: renesas: rz-sysc: Move RZ/G3S SoC detection to the SYSC driver
  arm64: dts: renesas: r9a08g045: Enable the system controller

John Madieu (6):
  dt-bindings: soc: renesas: Add RZ/G3E variant SYS binding
  soc: renesas: rz-sysc: Add support for RZ/G3E family
  soc: renesas: rz-sysc: Move RZ/V2H SoC detection to the SYS driver
  soc: renesas: rzv2h: Add a callback to print SoC-specific extra
    features
  arm64: dts: renesas: r9a09g047: Add sys node
  arm64: dts: renesas: r9a09g057: Enable SYS node

 .../soc/renesas/renesas,r9a09g057-sys.yaml    |   5 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   1 -
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |   7 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   1 -
 drivers/soc/renesas/Kconfig                   |  17 +++
 drivers/soc/renesas/Makefile                  |   4 +
 drivers/soc/renesas/r9a08g045-sysc.c          |  28 ++++
 drivers/soc/renesas/r9a09g047-sys.c           |  57 ++++++++
 drivers/soc/renesas/r9a09g057-sys.c           |  55 ++++++++
 drivers/soc/renesas/renesas-soc.c             |  33 +----
 drivers/soc/renesas/rz-sysc.c                 | 133 ++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h                 |  46 ++++++
 drivers/soc/renesas/rzg3e-sys.h               |  28 ++++
 13 files changed, 380 insertions(+), 35 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a08g045-sysc.c
 create mode 100644 drivers/soc/renesas/r9a09g047-sys.c
 create mode 100644 drivers/soc/renesas/r9a09g057-sys.c
 create mode 100644 drivers/soc/renesas/rz-sysc.c
 create mode 100644 drivers/soc/renesas/rz-sysc.h
 create mode 100644 drivers/soc/renesas/rzg3e-sys.h

-- 
2.25.1


