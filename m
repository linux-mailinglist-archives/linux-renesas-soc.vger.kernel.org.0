Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7CAE5F55E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Oct 2022 15:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiJENzf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Oct 2022 09:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiJENzc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2022 09:55:32 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E09FF63F1E;
        Wed,  5 Oct 2022 06:55:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.95,159,1661785200"; 
   d="scan'208";a="135457105"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Oct 2022 22:55:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.36])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2511B4006190;
        Wed,  5 Oct 2022 22:55:20 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        William Breathitt Gray <william.gray@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, devicetree@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] Add RZ/G2L MTU3a MFD and pwm driver
Date:   Wed,  5 Oct 2022 14:55:15 +0100
Message-Id: <20221005135518.876913-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
channels and one 32-bit timer channel. It supports the following
functions
 - Counter
 - Timer
 - PWM

This patch series aim to add MFD and pwm driver for MTU3a.

The 8/16/32 bit registers are mixed in each channel. The HW
specifications of the IP is described in patch#1.

Current patch set is tested for PWM mode1 on MTU3 channel.

RFC->v1:
 * replaced devm_reset_control_get->devm_reset_control_get_exclusive
 * Dropped 'bindings' from the binding title
 * Updated the binding example
 * Added additionalProperties: false for counter bindings
 * Squashed all the binding patches
 * Modelled as a single counter device providing both 16-bit
   and 32-bit phase counting modes
 * Modelled as a single pwm device for supporting different pwm modes.
 * Moved counter and pwm bindings to respective subsystems.

Biju Das (3):
  dt-bindings: mfd: Document RZ/G2L MTU3a bindings
  mfd: Add RZ/G2L MTU3 driver
  pwm: Add support for RZ/G2L MTU3 PWM

 .../counter/renesas,rz-mtu3-counter.yaml      |  30 ++
 .../bindings/mfd/renesas,rz-mtu3.yaml         | 290 +++++++++++
 .../bindings/pwm/renesas,rz-mtu3-pwm.yaml     |  50 ++
 drivers/mfd/Kconfig                           |   9 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rz-mtu3.c                         | 395 +++++++++++++++
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rz-mtu3.c                     | 462 ++++++++++++++++++
 include/linux/mfd/rz-mtu3.h                   | 160 ++++++
 10 files changed, 1409 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/renesas,rz-mtu3-counter.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,rz-mtu3.yaml
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,rz-mtu3-pwm.yaml
 create mode 100644 drivers/mfd/rz-mtu3.c
 create mode 100644 drivers/pwm/pwm-rz-mtu3.c
 create mode 100644 include/linux/mfd/rz-mtu3.h

-- 
2.25.1

