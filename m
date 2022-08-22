Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF90659BD22
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 11:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbiHVJv7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 05:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiHVJv6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 05:51:58 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18B42DA89
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 02:51:56 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id AZrs2800W4C55Sk01Zrs4r; Mon, 22 Aug 2022 11:51:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oQ464-0023nq-BM; Mon, 22 Aug 2022 11:51:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oQ463-00G0ze-NX; Mon, 22 Aug 2022 11:51:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.0-rc1
Date:   Mon, 22 Aug 2022 11:51:49 +0200
Message-Id: <428755447c1abbc8f1f08a63e83353d23ab22dd6.1661154821.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM systems:
  - Enable RZ/N1 A5PSW Ethernet switch support incl. dependencies
    (RZN1D-DB),
  - Move CONFIG_CAN_RCAR=y (moved in commit d7786af59860a113 ("net:
    Kconfig: move the CAN device menu to the "Device Drivers"
    section")),
  - Enable RZ/N1 Gigabit Ethernet MAC support (RZN1D-DB),
  - Enable RZ/N1 Pin control support (RZN1D-DB),
  - Enable RZ/N1 DMA support incl. dependencies (RZN1D-DB).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index a29bebb3742ed386..ebdac79c10f5564e 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -32,8 +32,8 @@ CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
+CONFIG_NET_DSA=y
 CONFIG_CAN=y
-CONFIG_CAN_RCAR=y
 CONFIG_PCI=y
 CONFIG_PCI_MSI=y
 CONFIG_PCI_RCAR_GEN2=y
@@ -52,11 +52,14 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_SATA_RCAR=y
 CONFIG_NETDEVICES=y
+CONFIG_NET_DSA_RZN1_A5PSW=y
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_SMSC911X=y
+CONFIG_STMMAC_ETH=y
 CONFIG_MICREL_PHY=y
 CONFIG_SMSC_PHY=y
+CONFIG_CAN_RCAR=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 # CONFIG_INPUT_MOUSE is not set
@@ -91,6 +94,7 @@ CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SH_HSPI=y
 CONFIG_PINCTRL_RZA1=y
 CONFIG_PINCTRL_RZA2=y
+CONFIG_PINCTRL_RZN1=y
 CONFIG_GPIO_EM=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_PCA953X=y
@@ -180,6 +184,8 @@ CONFIG_RTC_DRV_DA9063=y
 CONFIG_RTC_DRV_SH=y
 CONFIG_RTC_DRV_RZN1=y
 CONFIG_DMADEVICES=y
+CONFIG_DW_DMAC=y
+CONFIG_RZN1_DMAMUX=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
 CONFIG_STAGING=y
-- 
2.25.1

