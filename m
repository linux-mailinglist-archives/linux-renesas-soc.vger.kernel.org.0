Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375DC216C69
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 13:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgGGL7L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 07:59:11 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:54798 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726879AbgGGL7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 07:59:08 -0400
X-IronPort-AV: E=Sophos;i="5.75,323,1589209200"; 
   d="scan'208";a="51316740"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jul 2020 20:59:06 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4C22C42325F2;
        Tue,  7 Jul 2020 20:59:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 0/2] mmc: core: add a new property/caps2
Date:   Tue,  7 Jul 2020 20:58:40 +0900
Message-Id: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some environment (like r8a77951-salvator-xs) is possible
to perform a full power cycle of the card in suspend via firmware
(PSCI on arm-trusted-firmware). However, the current MMC core
cannot issue Power Off Notification. This patch series can do it.

We discussed on the v3 email thread [1].

[1]
https://lore.kernel.org/linux-renesas-soc/1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/T/#m9c25f35d7126b1c14ea431a773757652ad094341


Changes from v4:
 - Just add a new property/caps2 flag of MMC bindings to fix the issue.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=308795

Changes from v3:
 - Modify regulator subsytem and regulator/fixed driver.
 - Use regulator_is_enabled() instead of firmware API.
 - Update R-Car Gen3 related dts files for the reference.
   But, I have only tested on r8a779{5,61}-salvaltor-xs.dts.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=306281

Changes from v2:
 - Fix typo of function name in patch2.
 - Remove RFC.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=305523

Changes from v1:
 - Use pm_suspend_via_firmware() API instead of pm_suspend_target_state.
 - Modify the psci driver to call pm_set_suspend_via_firmware.
 https://patchwork.kernel.org/patch/11557505/


*** BLURB HERE ***

Yoshihiro Shimoda (2):
  dt-bindings: mmc: Add full-pwr-cycle-in-suspend property
  mmc: core: Add MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND

 Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 5 +++++
 drivers/mmc/core/host.c                                   | 2 ++
 drivers/mmc/core/mmc.c                                    | 3 ++-
 include/linux/mmc/host.h                                  | 1 +
 4 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.7.4

