Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1C43076AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Jan 2021 14:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhA1NDw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Jan 2021 08:03:52 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:4261 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231137AbhA1NDs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jan 2021 08:03:48 -0500
X-IronPort-AV: E=Sophos;i="5.79,382,1602514800"; 
   d="scan'208";a="70577809"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jan 2021 22:03:17 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 961294017D71;
        Thu, 28 Jan 2021 22:03:17 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] iommu/ipmmu-vmsa: refactoring and allow SDHI devices
Date:   Thu, 28 Jan 2021 22:02:58 +0900
Message-Id: <1611838980-4940-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I intend to add new SoC support in near the future, but before that,
I would like to refactor the ipmmu_of_xlate() to improve
readability/scalability. Also, adds SDHI devices into the allow list.

Yoshihiro Shimoda (2):
  iommu/ipmmu-vmsa: refactor ipmmu_of_xlate()
  iommu/ipmmu-vmsa: Allow SDHI devices

 drivers/iommu/ipmmu-vmsa.c | 53 +++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 31 deletions(-)

-- 
2.7.4

