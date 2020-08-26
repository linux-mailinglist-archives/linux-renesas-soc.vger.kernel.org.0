Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4CB8252B14
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Aug 2020 12:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbgHZKEK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Aug 2020 06:04:10 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:17410 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728020AbgHZKEK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 06:04:10 -0400
X-IronPort-AV: E=Sophos;i="5.76,355,1592838000"; 
   d="scan'208";a="55365474"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2020 19:04:09 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 44D0D427E4EF;
        Wed, 26 Aug 2020 19:04:08 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH LOCAL 1/2] arm64: renesas: defconfig: Enable CONFIG_PCIE_RCAR_HOST
Date:   Wed, 26 Aug 2020 11:03:57 +0100
Message-Id: <20200826100358.5936-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826100358.5936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200826100358.5936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

config option PCIE_RCAR internally selects PCIE_RCAR_HOST which builds
the same driver. So this patch renames CONFIG_PCIE_RCAR to
CONFIG_PCIE_RCAR_HOST so that PCIE_RCAR can be safely dropped from
Kconfig file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index f9ca8f7d8bec..7e6290c6c56b 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -102,7 +102,7 @@ CONFIG_PCIEPORTBUS=y
 CONFIG_HOTPLUG_PCI_PCIE=y
 CONFIG_PCI_IOV=y
 CONFIG_HOTPLUG_PCI=y
-CONFIG_PCIE_RCAR=y
+CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-- 
2.17.1

