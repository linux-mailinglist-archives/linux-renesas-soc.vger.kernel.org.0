Return-Path: <linux-renesas-soc+bounces-15289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FECAA78BEF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 12:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DD36170476
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 10:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D0D236422;
	Wed,  2 Apr 2025 10:21:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEB921ABC3;
	Wed,  2 Apr 2025 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589260; cv=none; b=XXpuoLrgFIhKqYCfXnEKWs7rUE2Qht11/jyk5Lif1Y/2KGouLVRYz6XAH1hebREkOht3jjaXuLWz5NBuAx7JsuELc0BjVackEUMBmjpt6mv/TY9yH1ky+OSZWClpPH/ziE4Q7aEeHES5mBlVCUQTXkGT5lSi1iII9M+uHyBdlbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589260; c=relaxed/simple;
	bh=Me7OUgOVepAtrtHTCUw4eo0nvqbAbb3ZE9zGuNAYJRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PL/AXttojipeOtGEhOvYfPWeV4+0cHt7iigC3gNy6Xeii4wBzbTNgxyPRb9HDkmAy3KAs1uNIzVpwch7/Z5L92f8BzmUzXu39Nyjav8s7kMBxppDOAouL/+uDPX4uMqzz+VMdtR8ANkWtCaHssSjURbKHCiPixrQRARYlDTLjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: tseEOo8pRLGQbD9fj8R1gg==
X-CSE-MsgGUID: J4lDgruCRBKn5dUdFySnBw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2025 19:20:55 +0900
Received: from localhost.localdomain (unknown [10.226.93.220])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2B0A4401C75A;
	Wed,  2 Apr 2025 19:20:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 00/19] Add support for RZ/G3E CANFD
Date: Wed,  2 Apr 2025 11:20:20 +0100
Message-ID: <20250402102047.27943-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CAN-FD module on RZ/G3E is very similar to the one on both R-Car V4H
and RZ/G2L, but differs in some hardware parameters:
 * No external clock, but instead has ram clock.
 * Support up to 6 channels.
 * 20 interrupts.

v7->v8:
 * Collected tags.
 * Updated commit description for patch#{5,9,15,16,17}.
 * Replaced the macro RCANFD_GERFL_EEF0_7->RCANFD_GERFL_EEF.
 * Dropped the redundant macro RCANFD_GERFL_EEF(ch).
 * Added patch for dropping the mask operation in RCANFD_GAFLCFG_SETRNC
   macro.
 * Converted RCANFD_GAFLCFG_SETRNC->rcar_canfd_setrnc().
 * Updated RCANFD_GAFLCFG macro by replacing the parameter ch->w, where w
   is the GAFLCFG index used in the hardware manual.
 * Renamed the parameter x->page_num in RCANFD_GAFLECTR_AFLPN macro to
   make it clear.
 * Renamed the parameter x->cftml in RCANFD_CFCC_CFTML macro to make it
   clear.
 * Updated {rzg2l,car_gen3_hw_info} with ch_interface_mode = 0.
 * Updated {rzg2l,rcar_gen3}_hw_info with shared_can_regs = 0.
 * Started using struct rcanfd_regs instead of LUT for reg offsets.
 * Started using struct rcar_canfd_shift_data instead of LUT for shift
   data.
 * Renamed only_internal_clks->external_clk to avoid negation.
 * Updated rcar_canfd_hw_info tables with external_clk entries.
 * Replaced 10->sizeof(name) in scnprintf().
v6->v7:
 * Collected tags
 * Replaced 'aswell'->'as well' in patch#11 commit description.
v5->v6:
 * Replaced RCANFD_RNC_PER_REG macro with rnc_stride variable.
 * Updated commit description for patch#7 and #8
 * Dropped mask_table:
     AFLPN_MASK is replaced by max_aflpn variable.
     CFTML_MASK is replaced by max_cftml variable.
     BITTIMING MASK's are replaced by {nom,data}_bittiming variables.
 * Collected tag from Geert.
v4->v5:
 * Collected tag from Geert.
 * The rules for R-Car Gen3/4 could be kept together, reducing the number
   of lines. Similar change for rzg2l-canfd aswell.
 * Keeping interrupts and resets together allows to keep a clear
   separation between RZ/G2L and RZ/G3E, at the expense of only
   a single line.
 * Retained the tags for binding patches as it is trivial changes.
 * Dropped the unused macro RCANFD_GAFLCFG_GETRNC.
 * Updated macro RCANFD_GERFL_ERR by using gpriv->channels_mask and
   dropped unused macro RCANFD_GERFL_EEF0_7.
 * Replaced RNC mask in RCANFD_GAFLCFG_SETRNC macro by using
   info->num_supported_rules variable.
 * Updated the macro RCANFD_GAFLCFG by using info->rnc_field_width
   variable.
 * Updated shift value in RCANFD_GAFLCFG_SETRNC macro by using a formula
   (32 - (n % rnc_per_reg + 1) * field_width).
 * Replaced the variable name shared_can_reg->shared_can_regs.
 * Improved commit description for patch{#11,#12}by replacing has->have.
 * Dropped RCANFD_EEF_MASK and RCANFD_RNC_MASK as it is taken
   care by gpriv->channels_mask and info->num_supported_rules.
 * Dropped RCANFD_FIRST_RNC_SH and RCANFD_SECOND_RNC_SH by using a
   formula (32 - (n % rnc_per_reg + 1) * rnc_field_width.
 * Improved commit description by "All SoCs supports extenal clock"->
   "All existing SoCs support an external clock".
 * Updated error description in probe as "cannot get enabled ram clock"
 * Updated r9a09g047_hw_info table.
v3->v4:
 * Added Rb tag from Rob for patch#2.
 * Added prefix RCANFD_* to enum rcar_canfd_reg_offset_id.
 * Added prefix RCANFD_* to enum rcar_canfd_mask_id.
 * Added prefix RCANFD_* to enum rcar_canfd_shift_id.
v2->v3:
 * Collected tags.
 * Dropped reg_gen4() and is_gen4() by adding mask_table, shift_table,
   regs, ch_interface_mode and shared_can_reg variables to
   struct rcar_canfd_hw_info.
v1->v2:
 * Split the series with fixes patch separately.
 * Added patch for Simplify rcar_canfd_probe() using
   of_get_available_child_by_name() as dependency patch hit on can-next.
 * Added Rb tag from Vincent Mailhol.
 * Dropped redundant comment from commit description for patch#3.

Biju Das (19):
  dt-bindings: can: renesas,rcar-canfd: Simplify the conditional schema
  dt-bindings: can: renesas,rcar-canfd: Document RZ/G3E support
  can: rcar_canfd: Use of_get_available_child_by_name()
  can: rcar_canfd: Drop RCANFD_GAFLCFG_GETRNC macro
  can: rcar_canfd: Update RCANFD_GERFL_ERR macro
  can: rcar_canfd: Drop the mask operation in RCANFD_GAFLCFG_SETRNC
    macro
  can: rcar_canfd: Add rcar_canfd_setrnc()
  can: rcar_canfd: Update RCANFD_GAFLCFG macro
  can: rcar_canfd: Add rnc_field_width variable to struct
    rcar_canfd_hw_info
  can: rcar_canfd: Add max_aflpn variable to struct rcar_canfd_hw_info
  can: rcar_canfd: Add max_cftml variable to struct rcar_canfd_hw_info
  can: rcar_canfd: Add {nom,data}_bittiming variables to struct
    rcar_canfd_hw_info
  can: rcar_canfd: Add ch_interface_mode variable to struct
    rcar_canfd_hw_info
  can: rcar_canfd: Add shared_can_regs variable to struct
    rcar_canfd_hw_info
  can: rcar_canfd: Add struct rcanfd_regs variable to struct
    rcar_canfd_hw_info
  can: rcar_canfd: Add sh variable to struct rcar_canfd_hw_info
  can: rcar_canfd: Add external_clk variable to struct
    rcar_canfd_hw_info
  can: rcar_canfd: Enhance multi_channel_irqs handling
  can: rcar_canfd: Add RZ/G3E support

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 171 ++++++++---
 drivers/net/can/rcar/rcar_canfd.c             | 277 +++++++++++++-----
 2 files changed, 339 insertions(+), 109 deletions(-)

-- 
2.43.0


