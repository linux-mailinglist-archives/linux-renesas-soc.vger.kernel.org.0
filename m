Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C23E252A16
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Aug 2020 11:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgHZJdJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Aug 2020 05:33:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:15396 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727956AbgHZJdH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 05:33:07 -0400
X-IronPort-AV: E=Sophos;i="5.76,355,1592838000"; 
   d="scan'208";a="55579352"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Aug 2020 18:33:05 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BEA6A400419A;
        Wed, 26 Aug 2020 18:33:03 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Russell King <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] ARM: shmobile: defconfig: enable CONFIG_PCIE_RCAR_HOST
Date:   Wed, 26 Aug 2020 10:32:20 +0100
Message-Id: <20200826093220.10266-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826093220.10266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200826093220.10266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

config option PCIE_RCAR internally selects PCIE_RCAR_HOST which builds the
same driver. So this patch renames CONFIG_PCIE_RCAR to
CONFIG_PCIE_RCAR_HOST so that PCIE_RCAR can be safely dropped from Kconfig
file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm/configs/shmobile_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index bbedc42bb2d9..a49c90714e63 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -37,7 +37,7 @@ CONFIG_CAN_RCAR=y
 CONFIG_PCI=y
 CONFIG_PCI_MSI=y
 CONFIG_PCI_RCAR_GEN2=y
-CONFIG_PCIE_RCAR=y
+CONFIG_PCIE_RCAR_HOST=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_SIMPLE_PM_BUS=y
-- 
2.17.1

