Return-Path: <linux-renesas-soc+bounces-11758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D519FF495
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 17:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C289D16177B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 16:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C2C1E231F;
	Wed,  1 Jan 2025 16:39:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D489163D;
	Wed,  1 Jan 2025 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735749566; cv=none; b=QiCM4hTMSSXtJrB+9+DvL0mjZdhBxQKq4t/xK2EVDuI2vxak7/REJFClQXrJUTsgAh+YrL4NfeBV4V8vMFxlwb/+fe3XW74WXZCS2JyBxtjChUIxxPrbPbRJ13bJ4n0RZchz0M/s4mTvw0AtXZcdDZVNotw/tqNjuHFkJ9FxwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735749566; c=relaxed/simple;
	bh=SZPWdvjzSR5Gjrhdof7jrAfgyq9F7GKZ3srx+60M37w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tne4at+JcFZ9QwS9ZuqBdxWb/Vo6JL+CSGMSiNUJakB/AAZy0ODUFTFDuUI6rO05r5r9lT+vJmMxLRz7OiBepG3+PHM70MMBjzLwk12HPIADB1/JwdrSifrlv3jmiVFAz30OPVCA10jIr1NXffzM4G4tCqYabk5moRQbgLEChpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: aSrp/3oQRDyTPHdOSOeH+A==
X-CSE-MsgGUID: 3ML1KrSJTuujTV76CI1fNA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jan 2025 01:34:13 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.21])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D94244026B15;
	Thu,  2 Jan 2025 01:34:02 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	robh@kernel.org
Subject: [PATCH v2 0/4] soc: renesas: Add system controller support for RZ/G3E SoC
Date: Wed,  1 Jan 2025 17:33:40 +0100
Message-ID: <20250101163344.128139-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the RZ/G3E system controller and extends
the existing RZ/V2H(P) system controller to support syscon. The RZ/G3E
system controller allows detecting various SoC features like core count,
NPU availability, and CA55 PLL configuration.

Changes in v2:
- Fixed code style issues in rz-sysc.c and r9a09g047-sysc.c
- Fixed device tree documentation, getting rid of syscon compatible string
- Handled non signal-aware readable/writeable regmap callback
- Consolidated common code between RZ/V2H and RZ/G3E drivers
- Moved SoC ID detection from the compatible string fix into a new patch

Key features:
- Syscon support for both RZ/V2H and RZ/G3E system controllers
- Detection of quad/dual core configuration
- Detection of Ethos-U55 NPU presence
- Validation of CA55 PLL frequency setting
- SoC-specific extended identification through callbacks

This patch series depends upon [1], [2], and [3].

Tested:
- Example of SoC detection:
[    0.065608] renesas-rz-sysc 10430000.system-controller: Detected Renesas 
Quad Core RZ/G3E r9a09g047 Rev 0  with Ethos-U55

- Example of PLL misconfiguration warning:
[    0.065616] renesas-rz-sysc 10430000.system-controller: CA55 PLL is not 
set to 1.7GHz

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914097
[2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=912455
[3] https://lore.kernel.org/lkml/Z2HTAJmBeIUlWysh@google.com/T/

John Madieu (4):
  dt-bindings: soc: renesas: Add RZ/G3E variant SYS bindings
  soc: renesas: rz-sysc: Fix SoC ID string extraction
  soc: renesas: rz-sysc: Add support for RZ/G3E family
  arm64: dts: renesas: r9a09g047: add sys node

 .../soc/renesas/renesas,r9a09g057-sys.yaml    |  5 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  7 ++
 drivers/soc/renesas/Kconfig                   |  6 ++
 drivers/soc/renesas/Makefile                  |  1 +
 drivers/soc/renesas/r9a09g047-sysc.c          | 73 +++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c                 | 24 +++++-
 drivers/soc/renesas/rz-sysc.h                 |  6 ++
 7 files changed, 118 insertions(+), 4 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a09g047-sysc.c

-- 
2.25.1


