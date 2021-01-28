Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5F73076AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Jan 2021 14:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhA1NDy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Jan 2021 08:03:54 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:37695 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231137AbhA1NDy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jan 2021 08:03:54 -0500
X-IronPort-AV: E=Sophos;i="5.79,382,1602514800"; 
   d="scan'208";a="70357048"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jan 2021 22:03:17 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B748B4017D71;
        Thu, 28 Jan 2021 22:03:17 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] iommu/ipmmu-vmsa: Allow SDHI devices
Date:   Thu, 28 Jan 2021 22:03:00 +0900
Message-Id: <1611838980-4940-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611838980-4940-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1611838980-4940-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SDHI devices into devices_allowlist.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 0bdf354..5715fbe 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -750,6 +750,10 @@ static const struct soc_device_attribute soc_denylist[] = {
 };
 
 static const char * const devices_allowlist[] = {
+	"ee100000.mmc",
+	"ee120000.mmc",
+	"ee140000.mmc",
+	"ee160000.mmc"
 };
 
 static bool ipmmu_device_is_allowed(struct device *dev)
-- 
2.7.4

