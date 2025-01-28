Return-Path: <linux-renesas-soc+bounces-12606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AF0A2033E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 04:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A131886B63
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 03:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D4F13D52E;
	Tue, 28 Jan 2025 03:14:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94014D529;
	Tue, 28 Jan 2025 03:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738034050; cv=none; b=uR/ZTNvZ43XPRbuvxHSmRQeZpnti4xuhqPBhUFBpUanBqJ+0eBOgZ0fyCmSlD7gvTOGwe/5FWLxupmOtaHeczXCNlqM+NrA/rAGTlmdi5AHb6hyDDr/zLeSivySYigqEGzxKF6tIsDWD67GN3gfWpzDWgxnv1OAtQxs8hhgj328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738034050; c=relaxed/simple;
	bh=auROUYfcev3XniModWNSegsmITiEo6hjq44p50v2hnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBdIWRJ6v7EjMifVZLGj3YCTL0HLVs4gCaFUGDFy69sF98ip2ektnpF0Mp8IEjOUHZ9lJGkFAhlqYjhKefYDCS6rRZioHQwsfLdsufnnxhrtAQOD3HAHPlVxfKfQYvRv2juTywbyzZd1AZAgATw/NZb+94wP/G2Pwnt+g6zw7O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: d5/478ZATgSm3ERuFKPHtg==
X-CSE-MsgGUID: nZMp/4/wTCWil0GUJClGYg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jan 2025 12:14:00 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A016F412CB9B;
	Tue, 28 Jan 2025 12:13:46 +0900 (JST)
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
Subject: [PATCH v5 0/5] soc: renesas: Add RZ/G3E SoC detection support
Date: Tue, 28 Jan 2025 04:13:37 +0100
Message-ID: <20250128031342.52675-1-john.madieu.xa@bp.renesas.com>
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

Changes in v5:
- Use proper hex values for SoC-specific register offset and mask and avoid using common
  included file
- Added some sanity check while grabbing SoC ID compatible string
- Fixed some minor typos
- Styled code as recommanded by Geert

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


Claudiu Beznea (2):
  soc: renesas: Add SYSC driver for Renesas RZ family
  soc: renesas: rz-sysc: Move RZ/G3S SoC detection to the SYSC driver

John Madieu (3):
  soc: renesas: rz-sysc: Add support for RZ/G3E family
  soc: renesas: rz-sysc: Move RZ/V2H SoC detection to the SYS driver
  soc: renesas: rzv2h: Add a callback to print SoC-specific extra
    features

 drivers/soc/renesas/Kconfig          |  18 ++++
 drivers/soc/renesas/Makefile         |   4 +
 drivers/soc/renesas/r9a08g045-sysc.c |  23 +++++
 drivers/soc/renesas/r9a09g047-sys.c  |  66 +++++++++++++
 drivers/soc/renesas/r9a09g057-sys.c  |  66 +++++++++++++
 drivers/soc/renesas/renesas-soc.c    |  33 +------
 drivers/soc/renesas/rz-sysc.c        | 136 +++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h        |  46 +++++++++
 8 files changed, 360 insertions(+), 32 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a08g045-sysc.c
 create mode 100644 drivers/soc/renesas/r9a09g047-sys.c
 create mode 100644 drivers/soc/renesas/r9a09g057-sys.c
 create mode 100644 drivers/soc/renesas/rz-sysc.c
 create mode 100644 drivers/soc/renesas/rz-sysc.h

-- 
2.25.1


