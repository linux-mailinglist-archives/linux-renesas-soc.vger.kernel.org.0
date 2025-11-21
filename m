Return-Path: <linux-renesas-soc+bounces-24915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AADC78BB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 045393646C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FDB34321A;
	Fri, 21 Nov 2025 11:15:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5BC33890A;
	Fri, 21 Nov 2025 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723719; cv=none; b=NeEZAVuxUnRvOskwDWcfTf4GWbnagDY95RJSHnFBpSr0Gw+HO8NZw82+kbhvpct5sMZO1LmsQSmH3RvlaaOhxBxVWUpzQgFeXy/rKuELWlfOj85zAC/yBd9Uo9AFPhcPrjAm/8T3uHyVacjQDzqTI5vs9ee+bpJWd5ASCpPjlSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723719; c=relaxed/simple;
	bh=2GN/rBq+GkZfPvAVLsBhXEdmaJotKHqNSdkIvgIbuKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=USmUnfCdV2hNzC22ASX3tuz8ABl4AJQTSn5qYCf8DxVzm+e0yDzxIow+r9axM0P7SlhCGOuovf+da2YOTe9q9Uz7eBDflDMLPSs1iCZgOaWzFHLCtY33WeM2rHSnq4VXioWaGY9hiE4dvOQS/dOUY5vwycB7zBnPfJYtvAUktvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Mh0PM8d/R4qKIQldpJkibg==
X-CSE-MsgGUID: dtKOUSuxSgCJO+0H1LFoNw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2025 20:15:08 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4409C430ED4F;
	Fri, 21 Nov 2025 20:15:03 +0900 (JST)
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
Subject: [PATCH 0/4] Add ICU support for RZ/T2H and RZ/N2H
Date: Fri, 21 Nov 2025 13:14:19 +0200
Message-ID: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
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

Cosmin Tanislav (4):
  dt-bindings: interrupt-controller: document RZ/{T2H,N2H} ICU
  irqchip: add RZ/{T2H,N2H} Interrupt Controller (ICU) driver
  arm64: dts: renesas: r9a09g077: add ICU support
  arm64: dts: renesas: r9a09g087: add ICU support

 .../renesas,r9a09g077-icu.yaml                | 236 ++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  73 +++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  73 +++++
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rzt2h.c           | 288 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 include/linux/irqchip/irq-renesas-rzt2h.h     |  23 ++
 8 files changed, 703 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
 create mode 100644 drivers/irqchip/irq-renesas-rzt2h.c
 create mode 100644 include/linux/irqchip/irq-renesas-rzt2h.h

-- 
2.52.0


