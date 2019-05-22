Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3295C261A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 12:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbfEVKXZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 06:23:25 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:42569 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728527AbfEVKXZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 06:23:25 -0400
X-IronPort-AV: E=Sophos;i="5.60,498,1549897200"; 
   d="scan'208";a="16665267"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 May 2019 19:23:23 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0BE7C40065A0;
        Wed, 22 May 2019 19:23:23 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/3] mmc: renesas_sdhi: improve performance by changing max_segs
Date:   Wed, 22 May 2019 19:18:36 +0900
Message-Id: <1558520319-16452-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch set is based on renesas-drivers.git /
renesas-drivers-2019-05-21-v5.2-rc1 tag.

Since SDHI host internal DMAC of the R-Car Gen3 cannot handle two or more
segments, the performance rate (especially, eMMC HS400 reading) is not good.
However, if IOMMU is enabled on the DMAC, since IOMMU will map multiple
scatter gather buffers as one contignous iova, the DMAC can handle the iova
as well and then the performance rate is possible to improve. In fact,
I have measured the performance by using bonnie++, "Sequential Input - block"
rate was improved on r8a7795. Please refer to the end of this email about
the performance. (I beleive if the performance is improved, the CPU load
is also increased.)

However, in case of a sdio card (especiialy some WiFi cards/drivers),
scatter gather buffers are possible to be not contiguous iova because
each scatter gather buffer has only about 1500 bytes, the DMAC cannot
handle it. So, this patch set adds init_card() ops to detect the card
type, and then the driver changes the max_segs if the DMAC is under
IOMMU environment and an sd card/mmc is detected.

Remarks: I mentioned that Gen2 with the SYS-DMAC basis environment can
also improve the perfomance on the public ML [1], but there was
a measurement error so that I didn't make a patch for SYS-DMAC.

Changes from v2 [2]:
 - Add some conditions in the init_card().
 - Add a comment in the init_card().
 - Add definitions for some "MAX_SEGS".

Changes from v1 [3]:
 - Remove adding init_card ops into struct tmio_mmc_dma_ops and
   tmio_mmc_host and just set init_card on renesas_sdhi_core.c.
 - Revise typos on "mmc: tmio: No memory size limitation if runs on IOMMU".
 - Add Simon-san's Reviewed-by on a tmio patch.

[1]
https://patchwork.kernel.org/patch/10940225/#22635487

[2]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=116729

[3]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=110485

---
kernel v5.2-rc1 + local patches + HS400,,,,,,,,,,,,,,,,,,,,,,,,,,
Buildroot 2019.02.1,,,,,,,,,,,,,,,,,,,,,,,,,,
Bonnie++ 1.03e : bonnie\+\+ -d ./ -s 8192 -r 4096 -b -u root,,,,,,,,,,,,,,,,,,,,,,,,,,
,,,,,,,,,,,,,,,,,,,,,,,,,,
environment,Size,Sequential Output - per char (K/sec),<- (CPU %),Sequential Output - block (K/sec),<- (CPU %),Sequential Output - rewrite (K/sec),<- (CPU %),Sequential Input - per char (K/sec),<- (CPU %),Sequential Input ? block (K/sec),<- (CPU %),Random seeks,<- (CPU %),files,Sequential Create,<- (CPU %),Sequential Read,<- (CPU %),Sequential Delete,<- (CPU %),Random Create,<- (CPU %),Random Read,<- (CPU %),Random Delete,<- (CPU %)
H3_max_segs_1_on_IOMMU,8G,80858,96,121466,28,60602,16,71712,95,121427,15,4128.5,11,16,678,3,+++++,+++,593,2,616,3,+++++,+++,603,3
H3_max_segs_512_on_IOMMU,8G,76637,91,132994,31,81478,20,74522,98,197325,26,4526.5,12,16,864,4,+++++,+++,821,4,814,4,+++++,+++,786,4
---

Yoshihiro Shimoda (3):
  mmc: tmio: No memory size limitation if runs on IOMMU
  mmc: tmio: Add a definition for default max_segs
  mmc: renesas_sdhi: use multiple segments if possible

 drivers/mmc/host/renesas_sdhi_core.c | 25 +++++++++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h          |  1 +
 drivers/mmc/host/tmio_mmc_core.c     |  7 ++++---
 3 files changed, 30 insertions(+), 3 deletions(-)

-- 
2.7.4

