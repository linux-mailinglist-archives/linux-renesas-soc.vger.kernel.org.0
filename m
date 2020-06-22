Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE689202E4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 04:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731033AbgFVCZO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Jun 2020 22:25:14 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:41498 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726992AbgFVCZO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Jun 2020 22:25:14 -0400
X-IronPort-AV: E=Sophos;i="5.75,265,1589209200"; 
   d="scan'208";a="50022854"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jun 2020 11:25:12 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A8A0B415DFD8;
        Mon, 22 Jun 2020 11:25:12 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mark.rutland@arm.com, lorenzo.pieralisi@arm.com,
        ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/2] treewide: fix _mmc_suspend() on PSCI
Date:   Mon, 22 Jun 2020 11:24:57 +0900
Message-Id: <1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We can detect whether the system is going to suspend by using
pm_suspend_via_firmware() API. So, this patch series update
both PSCI and MMC driver for my environment (r8a77951-salvator-xs).

We can apply each patch to each subsystem without any dependency.

Changes from v2:
 - Fix typo of function name in patch2.
 - Remove RFC.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=305523

Changes from v1:
 - Use pm_suspend_via_firmware() API instead of pm_suspend_target_state.
 - Modify the psci driver to call pm_set_suspend_via_firmware.
 https://patchwork.kernel.org/patch/11557505/


Yoshihiro Shimoda (2):
  firmware: psci: call pm_set_suspend_via_firmware()
  mmc: core: Call mmc_poweroff_nofity() if pm_suspend_via_firmware()

 drivers/firmware/psci/psci.c | 8 ++++++++
 drivers/mmc/core/mmc.c       | 4 +++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.7.4

