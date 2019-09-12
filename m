Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0558CB077C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 06:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbfILEN7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 00:13:59 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:42304 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725794AbfILEN7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 00:13:59 -0400
X-IronPort-AV: E=Sophos;i="5.64,495,1559487600"; 
   d="scan'208";a="26391053"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Sep 2019 13:13:56 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C4F22417A2ED;
        Thu, 12 Sep 2019 13:13:56 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     hch@lst.de, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com
Cc:     treding@nvidia.com, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] mmc: queue: Fix bigger segments usage
Date:   Thu, 12 Sep 2019 13:13:54 +0900
Message-Id: <1568261636-25625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on the linux-next / next-20190904 tag.
Thierry reported an issue which caused the SDHCI environment [1]
so that I made this patch series to resolve the issue.

[1]
https://patchwork.kernel.org/patch/11137903/

Also, this patch adds the flag to enable the feature on my
environment.

Changes from v1:
 - Add Ulf's Acked-by.
  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=172079


Yoshihiro Shimoda (2):
  mmc: queue: Fix bigger segments usage
  mmc: renesas_sdhi_internal_dmac: Add MMC_CAP2_MERGE_CAPABLE

 drivers/mmc/core/queue.c                      | 8 +++++++-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 +-
 include/linux/mmc/host.h                      | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.7.4

