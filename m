Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66060252B15
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Aug 2020 12:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbgHZKEN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Aug 2020 06:04:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:1743 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728504AbgHZKEL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 06:04:11 -0400
X-IronPort-AV: E=Sophos;i="5.76,355,1592838000"; 
   d="scan'208";a="55582390"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Aug 2020 19:04:10 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BC60A427E4F7;
        Wed, 26 Aug 2020 19:04:09 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH LOCAL 2/2] arm64: renesas: defconfig: Enable R-Car PCIe endpoint driver
Date:   Wed, 26 Aug 2020 11:03:58 +0100
Message-Id: <20200826100358.5936-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826100358.5936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200826100358.5936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable R-Car PCIe endpoint driver on RZ/G2E board, including enabling
endpoint configurations CONFIG_PCI_ENDPOINT, CONFIG_PCI_ENDPOINT_CONFIGFS,
CONFIG_PCI_EPF_TEST and CONFIG_PCI_ENDPOINT_TEST required to use and test
the driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 7e6290c6c56b..28cc850de15c 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -103,7 +103,11 @@ CONFIG_HOTPLUG_PCI_PCIE=y
 CONFIG_PCI_IOV=y
 CONFIG_HOTPLUG_PCI=y
 CONFIG_PCIE_RCAR_HOST=y
+CONFIG_PCIE_RCAR_EP=y
 CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCI_ENDPOINT=y
+CONFIG_PCI_ENDPOINT_CONFIGFS=y
+CONFIG_PCI_EPF_TEST=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
@@ -112,6 +116,7 @@ CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_SRAM=y
+CONFIG_PCI_ENDPOINT_TEST=y
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_SAS_LIBSAS=y
-- 
2.17.1

