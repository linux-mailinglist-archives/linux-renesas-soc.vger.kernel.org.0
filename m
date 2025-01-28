Return-Path: <linux-renesas-soc+bounces-12631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 295DEA208D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 712CF188462D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD01D19ADB0;
	Tue, 28 Jan 2025 10:47:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B4559B71;
	Tue, 28 Jan 2025 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061254; cv=none; b=RPJjfk2mf62zflgySOLn6OnK+mkADz9dO+UJsDbFM+jhCWFtEvSMTcYvOGpixtZZYeenV886UXs9YRZ4BGCd1QTOYJ3LL8k6DGOsbqB7ccdOt8CwC82zPjdbYHGFMLDfEkk56tRDRm8XPlSoViiC9LUwdzSwrvkMrBQITh35lQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061254; c=relaxed/simple;
	bh=yDcgSQKbuXkgLp2LGOPczjDQbvsY3KS/9sJtFbMQe3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i8W9nqb6I7+ZL6RXoZviH/FpVB3t0d1MI7L7hKhOPEgHHTxzasQP762HBRsaDyuYLwqV18frA0sWguyd5lhf4AzZ4kvE1j2Fu/MfPLrUTe1tdpOHIL8Fxux4e3cnMtbrWnZfktwCaGbTYeup5YEbIO7zCYB2wtAccXAzt48F4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: KEzutDPGQ5ec/DohuiTDyg==
X-CSE-MsgGUID: 0Wko9OqLTcuJ5KWW5KSsIQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jan 2025 19:47:27 +0900
Received: from localhost.localdomain (unknown [10.226.93.131])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E3C2741FB5AB;
	Tue, 28 Jan 2025 19:47:16 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 00/13] Add Support for RZ/G3E ICU
Date: Tue, 28 Jan 2025 10:46:50 +0000
Message-ID: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ICU block on the RZ/G3E SoC is almost identical to the one found on
the RZ/V2H SoC, with the following differences:
 - The TINT register offset is 0x830 compared to 0x30 on RZ/V2H.
 - The number of supported GPIO interrupts for TINT selection is 141
   instead of 86.
 - The pin index and TINT selection index are not in the 1:1 map
 - The number of TSSR registers is 15 instead of 8
 - Each TSSR register can program 2 TINTs instead of 4 TINTs

Add support for the RZ/G3E ICU driver.

v2->v3:
 * Added a new patch for cleanup using devm_add_action_or_reset() for
   calling put_device() in error path of rzv2h_icu_init() to simplify
   the code by using recently added devm_*helpers.
 * Replaced 'goto put_dev' by 'return xxx' as put_dev() called by
   devm_add_action_or_reset()
v1->v2:
 * Collected tags
 * Split the simplification patch into two.
 * Updated commit header and description for patch#4.
 * Replaced devm_reset_control_get_optional_exclusive_deasserted()->
   devm_reset_control_get_exclusive_deasserted().
 * Moved simplification using devm_pm_runtime_enable() to patch#5.
 * Aligned kernel doc, struct members and struct initializers in
   a tabular fashion.
 * Renamed the macro ICU_PB5_TINT->ICU_RZV2H_TSSEL_MAX_VAL.
 * Replaced hexa decimal constant with ICU_RZV2H_TSSEL_MAX_VAL in struct
   rzv2h_hw_params.
 * Introduced ICU_RZG3E_{TSSEL_MAX_VAL,TINT_OFFSET} macros and used these
   macros in struct rzv2h_hw_params rather than using the hex constants.

Biju Das (13):
  dt-bindings: interrupt-controller: renesas,rzv2h-icu: Document RZ/G3E
    SoC
  clk: renesas: r9a09g047: Add ICU clock/reset
  irqchip/renesas-rzv2h: Drop irqchip from struct rzv2h_icu_priv
  irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
  irqchip/renesas-rzv2h: Use
    devm_reset_control_get_exclusive_deasserted()
  irqchip/renesas-rzv2h: Use devm_pm_runtime_enable()
  irqchip/renesas-rzv2h: Add struct rzv2h_hw_info with t_offs variable
  irqchip/renesas-rzv2h: Add max_tssel variable to struct rzv2h_hw_info
  irqchip/renesas-rzv2h: Add tssr_k variable to struct rzv2h_hw_info
  irqchip/renesas-rzv2h: Add tssel_mask and tssel_shift variables to
    struct rzv2h_hw_info
  irqchip/renesas-rzv2h: Add tien variable to struct rzv2h_hw_info
  irqchip/renesas-rzv2h: Add RZ/G3E support
  arm64: dts: renesas: r9a09g047: Add icu node

 .../renesas,rzv2h-icu.yaml                    |   6 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 108 ++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |   3 +
 drivers/irqchip/irq-renesas-rzv2h.c           | 195 ++++++++++++------
 4 files changed, 250 insertions(+), 62 deletions(-)

-- 
2.43.0


