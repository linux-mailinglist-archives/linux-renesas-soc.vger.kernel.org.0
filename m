Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A49F57A3D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 17:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239704AbiGSP70 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 11:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233933AbiGSP7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 11:59:20 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 40C9F5B79B;
        Tue, 19 Jul 2022 08:59:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,284,1650898800"; 
   d="scan'208";a="128394749"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Jul 2022 00:59:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.160])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 011CB4007F3A;
        Wed, 20 Jul 2022 00:59:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/2] Add support for RZ/G2L GPT
Date:   Tue, 19 Jul 2022 16:59:08 +0100
Message-Id: <20220719155910.576265-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L General PWM Timer (GPT) composed of 8 channels with 32-bit timer
(GPT32E). It supports the following functions
 * 32 bits × 8 channels
 * Up-counting or down-counting (saw waves) or up/down-counting
   (triangle waves) for each counter.
 * Clock sources independently selectable for each channel
 * Two I/O pins per channel
 * Two output compare/input capture registers per channel
 * For the two output compare/input capture registers of each channel,
   four registers are provided as buffer registers and are capable of
   operating as comparison registers when buffering is not in use.
 * In output compare operation, buffer switching can be at crests or
   troughs, enabling the generation of laterally asymmetric PWM waveforms.
 * Registers for setting up frame cycles in each channel (with capability
   for generating interrupts at overflow or underflow)
 * Generation of dead times in PWM operation
 * Synchronous starting, stopping and clearing counters for arbitrary
   channels
 * Starting, stopping, clearing and up/down counters in response to input
   level comparison
 * Starting, clearing, stopping and up/down counters in response to a
   maximum of four external triggers
 * Output pin disable function by dead time error and detected
   short-circuits between output pins
 * A/D converter start triggers can be generated (GPT32E0 to GPT32E3)
 * Enables the noise filter for input capture and external trigger
   operation

This patch series aims to add basic pwm support for RZ/G2L GPT driver
by creating separate logical channels for each IOs.

v2->v3:
 * Added Rb tag from Rob for the bindings.
 * Updated limitation section
 * Added prefix "RZG2L_" for all macros
 * Modified prescale calculation
 * Removed pwm_set_chip_data
 * Updated comment related to modifying Mode and Prescaler
 * Updated setting of prescale value in rzg2l_gpt_config()
 * Removed else branch from rzg2l_gpt_get_state()
 * removed the err label from rzg2l_gpt_apply()
 * Added devm_clk_get_optional_enabled() to retain clk on status,
   in case bootloader turns on the clk of pwm.
 * Replaced devm_reset_control_get_exclusive->devm_reset_control_get_shared
   as single reset shared between 8 channels.
V1->v2:
 * Added '|' after 'description:' to preserve formatting.
 * Removed description for pwm_cells as it is common property.
 * Changed the reg size in example from 0xa4->0x100
 * Added Rb tag from Geert for bindings.
 * Added Limitations section
 * dropped "_MASK" from the define names.
 * used named initializer for struct phase
 * Added gpt_pwm_device into a flexible array member in rzg2l_gpt_chip
 * Revised the logic for prescale
 * Added .get_state callback
 * Improved error handling in rzg2l_gpt_apply
 * Removed .remove callback
 * Tested the driver with PWM_DEBUG enabled.

RFC->v1:
 * Added Description in binding patch
 * Removed comments from reg and clock
 * replaced rzg2l_gpt_write_mask()->rzg2l_gpt_modify()
 * Added rzg2l_gpt_read() and updated macros
 * Removed dtsi patches, will send it separately

RFC:
 * https://lore.kernel.org/linux-renesas-soc/20220430075915.5036-1-biju.das.jz@bp.renesas.com/T/#t

Biju Das (2):
  dt-bindings: pwm: Add RZ/G2L GPT binding
  pwm: Add support for RZ/G2L GPT

 .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 129 ++++++
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rzg2l-gpt.c                   | 367 ++++++++++++++++++
 4 files changed, 508 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
 create mode 100644 drivers/pwm/pwm-rzg2l-gpt.c


base-commit: 036ad6daa8f0fd357af7f50f9da58539eaa6f68c
-- 
2.25.1

