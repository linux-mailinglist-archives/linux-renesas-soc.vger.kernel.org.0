Return-Path: <linux-renesas-soc+bounces-13574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A63FA4200C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63BC13A6728
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12B723BD17;
	Mon, 24 Feb 2025 13:13:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C4623BD0E;
	Mon, 24 Feb 2025 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402789; cv=none; b=kaDwYWJX5UYvF/OjqfHM/QND6Br50BjP4TWWCA35ev0/y0aSh5i+3yQ2H41nXl+luO1iIyOBGPREozKQchCCRrZ3rTXunutt4qox5tjG9NJnpL/i2KjzKghffYtaL7a+FL5pBOJCidFnmiyfSZxgu9eWpAusDCRjiZm7ZYMs44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402789; c=relaxed/simple;
	bh=25fhuJTpyumjNIr8WHwNa17tpMA1cqKte1iuegIYcPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKaeVUNKWf+/vsWeFxuWH+7FzSmojtLffZydI7xYcvQ92m01dYxu7xtdhbRKC7zj4f+0oicthLYa9q3Y+8e8BP8rC5f8W4syHhCr7z6a8Y9SiZ01EJ/Siwh/o/YJjTuWH6A917TTpBdpb2WxmT8/3bIiBK8fTS3ZfDLt2XQHrxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: rDn7d3OcTUuUfr86HYjt/g==
X-CSE-MsgGUID: HWNpBJm+SUKcxjMpafGU3g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Feb 2025 22:12:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.231])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3561F400F319;
	Mon, 24 Feb 2025 22:12:55 +0900 (JST)
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
Subject: [PATCH v6 00/12] Add Support for RZ/G3E ICU
Date: Mon, 24 Feb 2025 13:11:16 +0000
Message-ID: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
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

v5->v6:
 * Added Reported-by tag and Cced stable@vger.kernel.org for patch #2.
 * Retained the macro ICU_TSSR_TIEN by adding _field_width parameter.
 * Dropped Rb tag from Geert for patch#11 as it retain macros instead of
   dropping it.
 * Retained the macros  ICU_TSSR_TSSEL_PREP and ICU_TSSR_TSSEL_MASK by 
   adding field_width parameter.
v4->v5:
 * Collected tags from Geert.
 * Added a new patch for fixing wrong variable usage in
   rzv2h_tint_set_type().
 * Shortened tssr calculation in rzv2h_tint_irq_endisable().
 * Added tssr_shift_factor variable for optimizing the calculation
   in rzv2h_tint_set_type().
 * Dropped unnecessary parenthesis for calculating tssr in
   rzv2h_tint_set_type().
v3->v4:
 * Updated typo in commit description register offset->register
   base offset.
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
  irqchip/renesas-rzv2h: Fix wrong variable usage in
    rzv2h_tint_set_type()
  irqchip/renesas-rzv2h: Drop irqchip from struct rzv2h_icu_priv
  irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
  irqchip/renesas-rzv2h: Use
    devm_reset_control_get_exclusive_deasserted()
  irqchip/renesas-rzv2h: Use devm_pm_runtime_enable()
  irqchip/renesas-rzv2h: Add struct rzv2h_hw_info with t_offs variable
  irqchip/renesas-rzv2h: Add max_tssel variable to struct rzv2h_hw_info
  irqchip/renesas-rzv2h: Add field_width variable to struct
    rzv2h_hw_info
  irqchip/renesas-rzv2h: Update TSSR_TIEN macro
  irqchip/renesas-rzv2h: Update macros ICU_TSSR_TSSEL_{MASK,PREP}
  irqchip/renesas-rzv2h: Add RZ/G3E support

 .../renesas,rzv2h-icu.yaml                    |   6 +-
 drivers/irqchip/irq-renesas-rzv2h.c           | 198 ++++++++++++------
 2 files changed, 143 insertions(+), 61 deletions(-)

-- 
2.43.0


