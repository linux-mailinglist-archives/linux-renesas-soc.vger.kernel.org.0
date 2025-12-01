Return-Path: <linux-renesas-soc+bounces-25421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33488C96FF7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 12:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 89D9B346049
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 11:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8F7258EDB;
	Mon,  1 Dec 2025 11:30:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581E6184E;
	Mon,  1 Dec 2025 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764588630; cv=none; b=FR8JtEkjdkJ+JsZSzbzrRZQjtEQRePVBURPoskGCHUuzcNcFWqFTFeutpx+3MYxOqph648EcplbmOxZ8n+yuty8KKsWaghem+0dYNeDYzxsCCRYna8yAbICNPL5lp/UuXuEwXACYkv78lamJndCFFt0KzV06lSJDHu+pXgmeKgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764588630; c=relaxed/simple;
	bh=HF0r5GThIdP4HnUzJEO9soZpOQxov/fDxmiLhswcNS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W4utIcFn+qFrI1vKa9IP+9rtGQT6bzZOKhwj654EeDjHO6JT6oqmseadWyZa749kFMfowpvz1dl1s6tfZ6IpgTRvNdBs1dCjjMRJI+DQKMgpZ0h7czrzAYsq4h/XKV1Cv9jxvaCbOZb5Y7UjEFS1M/D2OarF43ZPcGhpKOchndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: JtrvAuD1TYmlnyPAV1/LBg==
X-CSE-MsgGUID: kCQf1BSTTGCbnTcWyc5W4g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Dec 2025 20:30:20 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.83])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 952E741F1B93;
	Mon,  1 Dec 2025 20:30:17 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/4] Add ICU support for RZ/T2H and RZ/N2H
Date: Mon,  1 Dec 2025 13:29:29 +0200
Message-ID: <20251201112933.488801-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/T2H and RZ/N2H SoCs have an Interrupt Control Unit (ICU)
that supports interrupts from external pins IRQ0 to IRQ15, DREQ and SEI.

V2:
 * move reg property after compatible
 * use 100 columns where necessary
 * move SEI comment above if
 * inline declarations of the same type
 * use scoped_guard() in rzt2h_icu_irq_set_type() to avoid keeping the
   guard across the irq_chip_set_type_parent() call
 * align struct irq_chip members initialization

Cosmin Tanislav (4):
  dt-bindings: interrupt-controller: document RZ/{T2H,N2H} ICU
  irqchip: add RZ/{T2H,N2H} Interrupt Controller (ICU) driver
  arm64: dts: renesas: r9a09g077: add ICU support
  arm64: dts: renesas: r9a09g087: add ICU support

 .../renesas,r9a09g077-icu.yaml                | 236 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  73 +++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  73 +++++
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rzt2h.c           | 283 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 include/linux/irqchip/irq-renesas-rzt2h.h     |  23 ++
 8 files changed, 698 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
 create mode 100644 drivers/irqchip/irq-renesas-rzt2h.c
 create mode 100644 include/linux/irqchip/irq-renesas-rzt2h.h

-- 
2.52.0


