Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455041DC73F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2020 09:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgEUHBV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 May 2020 03:01:21 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:14295 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727030AbgEUHBV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 May 2020 03:01:21 -0400
X-IronPort-AV: E=Sophos;i="5.73,416,1583161200"; 
   d="scan'208";a="47438472"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 May 2020 16:01:19 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5229E400C45F;
        Thu, 21 May 2020 16:01:19 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma unmapping
Date:   Thu, 21 May 2020 16:01:03 +0900
Message-Id: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on mmc.git / next branch.

I guess we should add such a code into renesas_sdhi_sys_dmac and
uniphier-sd drivers too. But, for now, I fixed
renesas_sdhi_internal_dmac only.

Yoshihiro Shimoda (3):
  mmc: tmio: core: Add end operation into tmio_mmc_dma_ops
  mmc: renesas_sdhi_internal_dmac: clean up the code for dma complete
  mmc: renesas_sdhi_internal_dmac: Fix dma unmapping in error cases

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 28 +++++++++++++++++++++++----
 drivers/mmc/host/tmio_mmc.h                   |  3 +++
 drivers/mmc/host/tmio_mmc_core.c              |  8 ++++++++
 3 files changed, 35 insertions(+), 4 deletions(-)

-- 
2.7.4

