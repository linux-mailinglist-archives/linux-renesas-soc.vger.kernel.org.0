Return-Path: <linux-renesas-soc+bounces-9637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 210499978DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 01:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EB5FB21A9A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 23:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E211E2313;
	Wed,  9 Oct 2024 23:08:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749B51917C0;
	Wed,  9 Oct 2024 23:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728515316; cv=none; b=AElgn/BcKM3VC0HANLHk/tkSiZFDijl9syjqHmH85xFK0VR6Wlxf9Z/XEvz/sc6ZIYIZvBOYnAV6FTPhU5anrIywvRd/sVXWqyZPMEjHtkY+ybc8ZZnEJhn5aPaiVNSNcInoC+qbydjX4ZjmLRTDtW/cA9Y+XpwQr6UphO3g9oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728515316; c=relaxed/simple;
	bh=GDfVTBFIhyeQ+7H1jMwn9Z+F3POa0oFuRw1iCtP0j5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BoHi/MwTSPmhha+fCPnP/Uw6WlFuvopUnPQPqZ5vdQ9yWTQ2dhLp3bc4wFlhR4Db4CVXd9XZ38crPqZ4bjx2+/XQE7uCJr3CNMuldtQaY88LXS1IfuFNFDqocS2zJ5nQni2r33AmLRIz3m/xhtWpG7rL2VkEItASCo4l8CylE5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.11,191,1725289200"; 
   d="scan'208";a="225463317"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Oct 2024 08:08:32 +0900
Received: from mulinux.home (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EAC704004483;
	Thu, 10 Oct 2024 08:08:20 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/3] Add support for the RZ/V2H Interrupt Control Unit
Date: Thu, 10 Oct 2024 00:08:14 +0100
Message-Id: <20241009230817.798582-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear All,

This series adds whatever is required for supporting NMI, IRQ, and
TINT interrupts to the Renesas RZ/V2H SoC.

v2->v3:
* The clock patch and the pinctrl patch have been queued up for v6.13,
  therefore they have been removed from this series.
* The dt-bindings patch has been improved as per Geert's comments, with
  ramifications on the SoC specific dtsi patch, which has been modified
  accordingly.
* The driver patch has been reworked as per Thomas comments.

Fabrizio Castro (3):
  dt-bindings: interrupt-controller: Add Renesas RZ/V2H(P) Interrupt
    Controller
  irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU) driver
  arm64: dts: renesas: r9a09g057: Add ICU node

 .../renesas,rzv2h-icu.yaml                    | 278 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  90 +++
 drivers/irqchip/Kconfig                       |   7 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rzv2h.c           | 513 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 6 files changed, 890 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
 create mode 100644 drivers/irqchip/irq-renesas-rzv2h.c

-- 
2.34.1


