Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8088760F957
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Oct 2022 15:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236252AbiJ0NkP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Oct 2022 09:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236248AbiJ0NkN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2022 09:40:13 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 38BA012D06;
        Thu, 27 Oct 2022 06:40:11 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.95,217,1661785200"; 
   d="scan'208";a="140602794"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Oct 2022 22:40:11 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2E37140083E4;
        Thu, 27 Oct 2022 22:40:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RESEND PATCH v3 0/2] phy: renesas: Add Renesas Ethernet SERDES driver for R-Car S4-8
Date:   Thu, 27 Oct 2022 22:40:04 +0900
Message-Id: <20221027134006.2343164-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

(I resent this patch series because an email address was wrong.)

This patch series is based on next-20221027.
Add support for R-Car S4-8 Etherent SERDES as a Generic PHY.

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
 drivers/phy/renesas/Kconfig                   |   7 +
 drivers/phy/renesas/Makefile                  |   1 +
 drivers/phy/renesas/r8a779f0-ether-serdes.c   | 416 ++++++++++++++++++
 4 files changed, 478 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml
 create mode 100644 drivers/phy/renesas/r8a779f0-ether-serdes.c

-- 
2.25.1

