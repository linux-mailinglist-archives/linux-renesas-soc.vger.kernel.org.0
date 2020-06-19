Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B162007C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2020 13:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731062AbgFSL3Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Jun 2020 07:29:16 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:20537 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729509AbgFSL3P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jun 2020 07:29:15 -0400
X-IronPort-AV: E=Sophos;i="5.75,255,1589209200"; 
   d="scan'208";a="49894100"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jun 2020 20:29:14 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 76FEC4007531;
        Fri, 19 Jun 2020 20:29:14 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mark.rutland@arm.com, lorenzo.pieralisi@arm.com,
        ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v2 0/2] treewide: fix _mmc_suspend() on PSCI
Date:   Fri, 19 Jun 2020 20:29:01 +0900
Message-Id: <1592566143-4546-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We can detect whether the system is going to suspend by using
pm_suspend_via_firmware() API. So, this patch series update
both PSCI and MMC driver for my environment (r8a77951-salvator-xs).

We can apply these patches to each subsystem. I believe this is
a correct way, but I still mark RFC now...

Changes from v1:
 - Use pm_suspend_via_firmware() API instead of pm_suspend_target_state.
 - Modify the psci driver to call pm_set_suspend_via_firmware.
 https://patchwork.kernel.org/patch/11557505/

Yoshihiro Shimoda (2):
  firmware: psci: call pm_set_suspend_via_firmware()
  mmc: core: Call mmc_power_off_nofity() if pm_suspend_via_firmware()

 drivers/firmware/psci/psci.c | 8 ++++++++
 drivers/mmc/core/mmc.c       | 4 +++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.7.4

