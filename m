Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D114F6FD8BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 May 2023 09:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236512AbjEJH52 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 May 2023 03:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbjEJH5Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2023 03:57:25 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6A51FEF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2023 00:56:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:5484:c4b7:4aff:589c])
        by andre.telenet-ops.be with bizsmtp
        id uvwn2900B2rLuoZ01vwnvT; Wed, 10 May 2023 09:56:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pwegh-001lU8-Ut;
        Wed, 10 May 2023 09:56:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pwegp-00F2SG-KQ;
        Wed, 10 May 2023 09:56:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.4-rc1
Date:   Wed, 10 May 2023 09:56:43 +0200
Message-Id: <420669d925bf4a8527c80dd294568df3b0556058.1683705341.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM systems:
  - Move CONFIG_PCI_RCAR_GEN2=y (moved in commit 81c362e798d41592
    ("PCI: Sort controller Kconfig entries by vendor")),
  - Drop CONFIG_SERIAL_8250_PCI1XXXX=n (no longer auto-enabled since
    commit 5d943b5d69c032de ("serial: 8250_pci1xxxx: Disable
    SERIAL_8250_PCI1XXXX config by default")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.5.

 arch/arm/configs/shmobile_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 0b21c0a4758286ef..99748cff1ca44b0e 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -36,8 +36,8 @@ CONFIG_NET_DSA=y
 CONFIG_CAN=y
 CONFIG_PCI=y
 CONFIG_PCI_MSI=y
-CONFIG_PCI_RCAR_GEN2=y
 CONFIG_PCIE_RCAR_HOST=y
+CONFIG_PCI_RCAR_GEN2=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
@@ -76,7 +76,6 @@ CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_PCI is not set
-# CONFIG_SERIAL_8250_PCI1XXXX is not set
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_8250_EM=y
 # CONFIG_SERIAL_8250_PERICOM is not set
-- 
2.34.1

