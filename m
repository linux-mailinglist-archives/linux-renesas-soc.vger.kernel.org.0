Return-Path: <linux-renesas-soc+bounces-12419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC93A1A867
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B62743A2A92
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809F48615A;
	Thu, 23 Jan 2025 17:05:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCE614A604;
	Thu, 23 Jan 2025 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651931; cv=none; b=d3kIu+db/Gc3iEMIrwI/SbTnnbCYkFjDIYtBf2yVLEtJAaCCOefyC+oNieRLnhnN26N9NCNNEKm9qYPiu/AMhyURDnL6mdPQICUX1wUHKm0hWqG+FGlpP+PtNCK1tRHLTSUQjo7tBzrnY+JLvG2d5hAYNreHQK0PE9KD1ulgX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651931; c=relaxed/simple;
	bh=gtYc4F2Jlv42m494XvJ4R/j+STtpn6urWbSjQNDINPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q6cD+eHu+XEUJAnw1yNPIXQPTQWlp9mcLp9AkQf2as6mEjugq+ZSeuSJ63lfbiDdBBcT9SQ+FrmQvO4aBD0Oc7XFwtzDX/mqBN9km6VKldm4KCgo0c2zfvT9+O4o+EYvZ+fcJPcJ5mKZMgk7K2Z/pbsarAwUxirMD3TY4RG2cd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 8zYOllVfQxK8mysLKa6xzg==
X-CSE-MsgGUID: Gob8a4sjT0OUisWMCst0mg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jan 2025 02:05:21 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.50])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 58926402BEC5;
	Fri, 24 Jan 2025 02:05:13 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com
Subject: [PATCH v4 0/9] soc: renesas: Add RZ/G3E SoC detection support
Date: Thu, 23 Jan 2025 18:04:59 +0100
Message-ID: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
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
(such as TSU, PCIe, or USB drivers).
                                                                                                                                               
This Soc detection series relies on the System Controller IP to detect
various SoC features like core count, NPU/GPU/ISP presence, and CA55 PLL
configuration.

Key features:                                          
- Detection of SoC revision                          
- Detection of quad/dual core configuration                          
- Detection of Ethos-U55 NPU presence                         
- Validation of CA55 PLL frequency setting
- SoC-specific extended identification through callbacks

Changes in v4:
- Fixed typo in commit message
- Restored Rob's Rb tag

Changes in v3:                                        
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


