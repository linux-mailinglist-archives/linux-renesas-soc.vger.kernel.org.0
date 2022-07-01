Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48B0563817
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 18:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbiGAQj1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 12:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbiGAQj1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 12:39:27 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE40527FF5;
        Fri,  1 Jul 2022 09:39:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,237,1650898800"; 
   d="scan'208";a="124796647"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2022 01:39:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.33])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9FF39400967D;
        Sat,  2 Jul 2022 01:39:19 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/2] i2c: Add new driver for Renesas RZ/V2M controller
Date:   Fri,  1 Jul 2022 17:39:14 +0100
Message-Id: <20220701163916.111435-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

The Renesas RZ/V2M SoC (r9a09g011) has a new i2c controller. This series
add the driver. One annoying problem is that the SoC uses a single reset
line for two i2c controllers, and unfortunately one of the controllers
is managed by some firmware, not by Linux. Therefore, the driver just
deasserts the reset.

v3:
  - dt-binding: Fix example indentation
  driver:
  - Lots of small fixes based on Andy Shevchenko's review
  - Use devm_reset_control_get_shared() instead of devm_reset_control_get() 

v2:
  dt-binding:
  - Use an enum and set the default for clock-frequency
  - Add resets property
  driver:
  - Use the new NOIRQ_SYSTEM_SLEEP_PM_OPS() as suggested by Arnd
  - Lots of small fixes based on Geert's review

Phil Edworthy (2):
  dt-bindings: i2c: Document RZ/V2M I2C controller
  i2c: Add Renesas RZ/V2M controller

 .../bindings/i2c/renesas,rzv2m.yaml           |  80 +++
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-rzv2m.c                | 524 ++++++++++++++++++
 4 files changed, 615 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
 create mode 100644 drivers/i2c/busses/i2c-rzv2m.c

-- 
2.34.1

