Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E55FB1AF7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 06:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfEMEdl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 00:33:41 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:22974 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726075AbfEMEdl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 00:33:41 -0400
X-IronPort-AV: E=Sophos;i="5.60,464,1549897200"; 
   d="scan'208";a="15756846"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 May 2019 13:33:38 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7296F4182EFC;
        Mon, 13 May 2019 13:33:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] mmc: renesas_sdhi: improve performance by using IOMMU
Date:   Mon, 13 May 2019 13:29:02 +0900
Message-Id: <1557721744-30545-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch set is based on renesas-drivers.git /
renesas-drivers-2019-05-07-v5.1 tag.

Since SDHI host internal DMAC of the R-Car Gen3 cannot handle two or more
segments, the performance rate (especially, eMMC HS400 reading) is not good.
However, if IOMMU is enabled on the DMAC, since IOMMU will map multiple
scatter gather buffers as one contignous iova, the DMAC can handle the iova
as well and then the performance rate is possible to improve. In fact,
I have measured the performance by using bonnie++, "Sequential Input - block"
rate was improved on all platforms (r8a7795, r8a77965 and r8a77990).
Please refer to the following URL about the performance.
(I beleive if the performance is improved, the CPU load is also increased.)

https://marc.info/?l=linux-renesas-soc&m=155625619320165&w=2

However, in case of a sdio card (especiialy some WiFi cards/drivers),
scatter gather buffers are possible to be not contiguous iova because
each scatter gather buffer has only about 1500 bytes, the DMAC cannot
handle it. So, this patch set adds init_card() ops to detect the card
type, and then the driver changes the max_segs if the DMAC is under
IOMMU environment and an sd card/mmc is detected.

Changes from v1 [1]:
 - Remove adding init_card ops into struct tmio_mmc_dma_ops and
   tmio_mmc_host and just set init_card on renesas_sdhi_core.c.
 - Revise typos on "mmc: tmio: No memory size limitation if runs on IOMMU".
 - Add Simon-san's Reviewed-by on a tmio patch.

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=110485


Yoshihiro Shimoda (2):
  mmc: tmio: No memory size limitation if runs on IOMMU
  mmc: renesas_sdhi: use multiple segments if possible

 drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++++
 drivers/mmc/host/tmio_mmc_core.c     |  5 +++--
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.7.4

