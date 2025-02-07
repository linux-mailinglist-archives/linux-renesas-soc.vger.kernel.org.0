Return-Path: <linux-renesas-soc+bounces-12938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E2A2C1A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 12:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98CF57A320F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 11:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC391A9B4C;
	Fri,  7 Feb 2025 11:37:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F0A1A83F5;
	Fri,  7 Feb 2025 11:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928224; cv=none; b=pPxk3NBtlZaiT4BMv6+Ysz533Ew6kb6RwILUefoCmCap0Ue7iig7y5TvQWVduOFr+hzEVF96Pe2EYswutoD2c/YNOmvxV6HpBXAJrGyMSZYnueNrjiaA9c2gULhdq+Iull3KxMTO/v90VD1QgNh8rEaMqGw1SLZr4ODe1Pa4OEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928224; c=relaxed/simple;
	bh=FwwC79TvC72dmqgJIX5HDYpCuDaHnMX3Db+IcKlxx4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l6R99bXu+qWI0zZKE5fe7OJi0Vyv2+o4+2Vd9ly+aX+vc1Y7hzoXhxZ5iShmUXvwS1BEtryeSjsn+CAXreME2OkWt67CH+rRPeDxzY3F1oGfHVFRpQL5SpvR+lCWimQ/hDcnpto9amN/7ZOiyNcscK1pzbvMatQwFZivybJAFhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 3ByFlFZ6QZirQs3AvQ0vSA==
X-CSE-MsgGUID: I+TD3u05T5mgN+zhzdagew==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Feb 2025 20:36:59 +0900
Received: from localhost.localdomain (unknown [10.226.93.6])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6EDA9400F31D;
	Fri,  7 Feb 2025 20:36:56 +0900 (JST)
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
Subject: [PATCH v4 00/12] Add Support for RZ/G3E ICU
Date: Fri,  7 Feb 2025 11:36:32 +0000
Message-ID: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
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
 - The TINT register base offset is 0x800 instead of zero.
 - The number of supported GPIO interrupts for TINT selection is 141
   instead of 86.
 - The pin index and TINT selection index are not in the 1:1 map
 - The number of TSSR registers is 16 instead of 8
 - Each TSSR register can program 2 TINTs instead of 4 TINTs

Add support for the RZ/G3E ICU driver.

v3->v4:
 * Updated typo in commit description register offset->register base offset.
 * Update typo 15->16 for the number of TSSR registers in RZ/G3E
 * Collected tags.
 * Fixed the typo varable->variable.
 * Started using field_width to handle the SoC differences ad dropped the
   variables tien, tssel_mask,tssel_shift and tssr_k.
 * Dropped RZG3E_* macros from SoC dtsi.
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

Biju Das (12):
  dt-bindings: interrupt-controller: renesas,rzv2h-icu: Document RZ/G3E
    SoC
  irqchip/renesas-rzv2h: Drop irqchip from struct rzv2h_icu_priv
  irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
  irqchip/renesas-rzv2h: Use
    devm_reset_control_get_exclusive_deasserted()
  irqchip/renesas-rzv2h: Use devm_pm_runtime_enable()
  irqchip/renesas-rzv2h: Add struct rzv2h_hw_info with t_offs variable
  irqchip/renesas-rzv2h: Add max_tssel variable to struct rzv2h_hw_info
  irqchip/renesas-rzv2h: Add field_width variable to struct
    rzv2h_hw_info
  irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
  irqchip/renesas-rzv2h: Drop macros ICU_TSSR_TSSEL_{MASK,PREP}
  irqchip/renesas-rzv2h: Add RZ/G3E support
  arm64: dts: renesas: r9a09g047: Add icu node

 .../renesas,rzv2h-icu.yaml                    |   6 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  90 +++++++++
 drivers/irqchip/irq-renesas-rzv2h.c           | 188 ++++++++++++------
 3 files changed, 222 insertions(+), 62 deletions(-)

-- 
2.43.0


