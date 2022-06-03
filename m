Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA7A53C91C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jun 2022 13:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243932AbiFCLFl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jun 2022 07:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243923AbiFCLFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jun 2022 07:05:40 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A3ABB3BFB8;
        Fri,  3 Jun 2022 04:05:38 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,274,1647270000"; 
   d="scan'208";a="123226928"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Jun 2022 20:05:37 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A986642849B8;
        Fri,  3 Jun 2022 20:05:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v6 0/7] treewide: ufs: Add support for Renesas R-Car UFS controller
Date:   Fri,  3 Jun 2022 20:05:17 +0900
Message-Id: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        KHOP_HELO_FCRDNS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series adds support Renesas R-Car S4-8 UFS controller.
This controller has some restrictions so adds some quirks for it.
Before using this driver, we have to initialize a clock generator
on the environment board (named "Spider") by using the commands of
U-Boot like below:
 => i2c dev 0
 => i2c mw 0x6c 0x26 0x05
 => i2c olen 0x6c 2
 => i2c mw 0x6c 0x13a 0x86
 => i2c mw 0x6c 0x268 0x06
 => i2c mw 0x6c 0x269 0x00
 => i2c mw 0x6c 0x26a 0x3c
 => i2c mw 0x6c 0x26b 0x00
 => i2c mw 0x6c 0x26c 0x06
 => i2c mw 0x6c 0x26d 0x00
 => i2c mw 0x6c 0x26e 0x3f
 => i2c mw 0x6c 0x26f 0x00

Changes from v5:
 - Rebase on the following repositories:
   - Based on renesas-drivers-2022-05-24-v5.18
   - Merged jejb/for-next
 - Add Reviewed-by and Acked-by tags in patch [1/7].
   Note that the document has an error about number of interrupts.
   So, the Renesas UFS has one interrupt and it's the same with ufs-common.yaml.
 - Clear hda->capabilities of MASK_64_ADDRESSING_SUPPORT instead in patch [2/7].
 - Fix some issues in patch [4/7].
 - Add Reviewed-by in patch [6/7] and [7/7].
https://lore.kernel.org/all/20220427123706.555166-2-yoshihiro.shimoda.uh@renesas.com/

Changes from v4:
 - Fix ufs_renesas_of_match was not terminated in patch [4/7].
   (from kernel test robot, thanks!)
https://lore.kernel.org/all/20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com/

Changes from v3:
 - Fix build warning by clang in patch [4/7].
https://lore.kernel.org/all/20220419120316.209151-1-yoshihiro.shimoda.uh@renesas.com/

Changes from v2:
 - Add Reviewed-by in patch [1/7]. (Krzysztof, thanks!)
 - Use WARN_ON() instead of BUG_ON in patch [4/7].
https://lore.kernel.org/all/20220414023115.4190736-1-yoshihiro.shimoda.uh@renesas.com/

Changes from v1:
 - Fix dt-binding doc in patch [1/7].
 - Add __maybe_unused for compile test on other platforms in patch [4/7].
 - Fix node names in patch [5/7].
https://lore.kernel.org/all/20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (7):
  dt-bindings: ufs: Document Renesas R-Car UFS host controller
  ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
  ufs: add UFSHCD_QUIRK_HIBERN_FASTAUTO
  scsi: ufs-renesas: Add support for Renesas R-Car UFS controller
  scsi: MAINTAINERS: Add maintainer for Renesas UFS driver
  arm64: dts: renesas: r8a779f0: Add UFS node
  arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS device

 .../devicetree/bindings/ufs/renesas,ufs.yaml  |  61 +++
 MAINTAINERS                                   |   7 +
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |   8 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     |  19 +
 drivers/ufs/core/ufshcd.c                     |  11 +-
 drivers/ufs/host/Kconfig                      |  12 +
 drivers/ufs/host/Makefile                     |   1 +
 drivers/ufs/host/ufs-renesas.c                | 412 ++++++++++++++++++
 include/ufs/ufshcd.h                          |  12 +
 9 files changed, 541 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
 create mode 100644 drivers/ufs/host/ufs-renesas.c

-- 
2.25.1

