Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16B52DBEA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 11:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgLPKaL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 05:30:11 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:62267 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726143AbgLPKaK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 05:30:10 -0500
X-IronPort-AV: E=Sophos;i="5.78,424,1599490800"; 
   d="scan'208";a="65954219"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Dec 2020 19:29:39 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 21A6442C8FD4;
        Wed, 16 Dec 2020 19:29:39 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] mmc: renesas_internal_dmac: add pre_req and post_req support
Date:   Wed, 16 Dec 2020 19:29:30 +0900
Message-Id: <1608114572-1892-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve performance, add pre_req and post_req support into
renesas_internal_dmac. Note that the patch [1/2] is a bug fix patch.

Changes from v1:
 - Add a bug fix patch for hardware limitation in patch 1.
 - Remove a redundant argument in the unmap function in patch 2.
 - Describe the reason why we should not use host->sg_ptr in patch 2.
 - Rename argument of struct mmc_request from req to mrq in patch 2.

Takeshi Saito (1):
  mmc: renesas_sdhi_internal_dmac: Fix DMA buffer alignment from 8 to
    128-bytes

Yoshihiro Shimoda (1):
  mmc: renesas_internal_dmac: add pre_req and post_req support

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 91 ++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 8 deletions(-)

-- 
2.7.4

