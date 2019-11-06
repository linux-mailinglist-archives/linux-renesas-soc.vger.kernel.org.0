Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E52F0C16
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2019 03:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730606AbfKFCfv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 21:35:51 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:27307 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727252AbfKFCfv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 21:35:51 -0500
X-IronPort-AV: E=Sophos;i="5.68,272,1569250800"; 
   d="scan'208";a="30723677"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2019 11:35:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 538964181474;
        Wed,  6 Nov 2019 11:35:50 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/6] iommu/ipmmu-vmsa: minor updates
Date:   Wed,  6 Nov 2019 11:35:44 +0900
Message-Id: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on the latest iommu.git / next branch
to modify the driver in the future's new hardware.

Changes from v2:
 - Rebase on the latest iommu.git / next branch.
 - Add Geert-san's Reviewed-by into patch [345]/6.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=187665

Changes from v1:
 - Remove all unused register definitions instead of selective.
   so that I didn't add Geert-san's Reviewed-by in the patch [1/3].
 - To improve code readability, add comments to the register definitions
   and add some helper functions.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=184741

Yoshihiro Shimoda (6):
  iommu/ipmmu-vmsa: Remove all unused register definitions
  iommu/ipmmu-vmsa: tidyup register definitions
  iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
  iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
    macro
  iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
  iommu/ipmmu-vmsa: Add utlb_offset_base

 drivers/iommu/ipmmu-vmsa.c | 214 +++++++++++++++++++--------------------------
 1 file changed, 89 insertions(+), 125 deletions(-)

-- 
2.7.4

