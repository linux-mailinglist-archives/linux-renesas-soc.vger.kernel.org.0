Return-Path: <linux-renesas-soc+bounces-13422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16631A3DE78
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 16:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD3DD168F47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 15:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2021FCFF9;
	Thu, 20 Feb 2025 15:27:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFB61FCF6B;
	Thu, 20 Feb 2025 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065261; cv=none; b=ubIxvGoSJsqd90EJ0r85X3RrZu0k6KF6f3WwujUJFqDZtAw92cQJ1CIBJS50jfdgzRlSd6O9BqwZRT1ESXBS/wb9zB2jLphxbi5jqHbHF0AQVqwD4RXhIOJPJ531dxBNF/qfyiru0idBmfdvIzkIIIFQqTfWW/lP5Va/1fFLqlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065261; c=relaxed/simple;
	bh=+oGoxw2St+KAb0RzXyAAChRY7fZPyFzJUmlMrZyCNWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+u7eWtwrXvZ60Pg4fWZ12xdcNOkE/1HPB6gPwLNTHx/U5+CRxo8BJQxWeGnt4rhH77TLO3ZsBsxfIpPOvddJ/3iubJoKo2sr03yzd/UUyC/2wBPrO3lni1/8GBPHc8NHiXfZv/LgKukRVew/cVinV1VtyiBOfV4p+jpHvvxzUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: xpjqCMLHR0ajY3bA2LXALw==
X-CSE-MsgGUID: /L6eAmP/Ty+a+/dn3J48kw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Feb 2025 00:27:37 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.134])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7B31840436EB;
	Fri, 21 Feb 2025 00:27:31 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: mturquette@baylibre.com,
	magnus.damm@gmail.com,
	krzk+dt@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	robh@kernel.org,
	p.zabel@pengutronix.de
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 0/7] thermal: renesas: Add support fot RZ/G3E
Date: Thu, 20 Feb 2025 16:26:05 +0100
Message-ID: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series adds support for the temperature sensor unit (TSU) found on the
Renesas RZ/G3E SoC.

The series consists of 7 patches (some of which are not related to the thermal
framework) that progressively add TSU support as follows:
- patch 1/7:	adds syscon/regmap support for accessing system controller
		registers, enabling access to TSU calibration values
- patch 2/7:	adds clock and reset signals to the CPG driver

- patch 3/7:	adds dt-bindings
- patch 4/7:	adds the actual TSU driver for the RZ/G3E
- patch 5/6:	adds safety mechanism to make sure we we protect the chip in
		case of consecutive read failures
- patch 6-7/7:	add DT node and defconfig enablement

Regards,

John Madieu (7):
  soc: renesas: rz-sysc: add syscon/regmap support
  clk: renesas: r9a09g047: Add clock and reset signals for the TSU IP
  dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
  thermal: renesas: rzg3e: Add thermal driver for the Renesas RZ/G3E SoC
  thermal: renesas: rzg3e: Add safety check when reading temperature
  arm64: dts: renesas: r9a09g047: Add TSU node
  arm64: defconfig: Enable RZ/G3E thermal

 .../thermal/renesas,r9a09g047-tsu.yaml        | 123 +++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  49 ++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/r9a09g047-cpg.c           |   3 +
 drivers/soc/renesas/Kconfig                   |   1 +
 drivers/soc/renesas/r9a09g047-sys.c           |   1 +
 drivers/soc/renesas/rz-sysc.c                 |  30 +-
 drivers/soc/renesas/rz-sysc.h                 |   2 +
 drivers/thermal/renesas/Kconfig               |   7 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3e_thermal.c       | 479 ++++++++++++++++++
 12 files changed, 703 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3e_thermal.c

-- 
2.25.1


