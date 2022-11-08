Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F787620572
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Nov 2022 01:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbiKHAzY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 19:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbiKHAzX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 19:55:23 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 058D51D9;
        Mon,  7 Nov 2022 16:55:21 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,145,1665414000"; 
   d="scan'208";a="139278947"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Nov 2022 09:55:21 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0E2374157802;
        Tue,  8 Nov 2022 09:55:21 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 0/2] phy: renesas: Add Renesas Ethernet SERDES driver for R-Car S4-8
Date:   Tue,  8 Nov 2022 09:54:58 +0900
Message-Id: <20221108005500.3011449-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on next-20221104.
Add support for R-Car S4-8 Etherent SERDES as a Generic PHY.

Changes from v3:
https://lore.kernel.org/all/20221027134006.2343164-1-yoshihiro.shimoda.uh@renesas.com/
 - Rebased on next-20221104.
 - Add Reviewed-by in the patch [1/2].
 - Sorted config names alphabetically in the Kconfig of patch [2/2].
 - Use dev_dbg() instead of pr_debug() in the patch [2/2].

Changes from v2:
https://lore.kernel.org/all/20221019083449.933005-1-yoshihiro.shimoda.uh@renesas.com/
 - Rebased on next-20221027.
 - Fix examples on the dt-bindings doc.
 - Remove unneeded variable in r8a779f0_eth_serdes_probe().

Changes from v1:
https://lore.kernel.org/all/20220922051645.3442321-1-yoshihiro.shimoda.uh@renesas.com/
 - Rebased on next-20221017.
 - Rename the dt-binding file.
 - Fix the node name of examples.
 - Fix Makefile.
 - Modify the initialized procedure for all channels.
 - Add commit description about the initialization.

Yoshihiro Shimoda (2):
  dt-bindings: phy: renesas: Document Renesas Ethernet SERDES
  phy: renesas: Add Renesas Ethernet SERDES driver for R-Car S4-8

 .../phy/renesas,r8a779f0-ether-serdes.yaml    |  54 +++
 drivers/phy/renesas/Kconfig                   |   8 +
 drivers/phy/renesas/Makefile                  |   1 +
 drivers/phy/renesas/r8a779f0-ether-serdes.c   | 417 ++++++++++++++++++
 4 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml
 create mode 100644 drivers/phy/renesas/r8a779f0-ether-serdes.c

-- 
2.25.1

