Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F57BAE2B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2019 06:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfIJEDB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Sep 2019 00:03:01 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:54600 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725283AbfIJEDB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Sep 2019 00:03:01 -0400
X-IronPort-AV: E=Sophos;i="5.64,487,1559487600"; 
   d="scan'208";a="26188874"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 Sep 2019 13:02:59 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6835B4004D0D;
        Tue, 10 Sep 2019 13:02:59 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     treding@nvidia.com, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] mmc: queue: Fix bigger segments usage
Date:   Tue, 10 Sep 2019 13:02:57 +0900
Message-Id: <1568088179-16865-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

Yoshihiro Shimoda (2):
  mmc: queue: Fix bigger segments usage
  mmc: renesas_sdhi_internal_dmac: Add MMC_CAP2_MERGE_CAPABLE

 drivers/mmc/core/queue.c                      | 8 +++++++-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 +-
 include/linux/mmc/host.h                      | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.7.4

