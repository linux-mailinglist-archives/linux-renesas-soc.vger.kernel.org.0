Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA02B106440
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2019 07:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729515AbfKVGNx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Nov 2019 01:13:53 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:37970 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729503AbfKVGNx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Nov 2019 01:13:53 -0500
X-IronPort-AV: E=Sophos;i="5.69,228,1571670000"; 
   d="scan'208";a="32153142"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2019 15:13:51 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 83A22400D0F4;
        Fri, 22 Nov 2019 15:13:51 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 0/4] mmc: host: renesas_sdhi_sys_dmac: change dma_buswidth
Date:   Fri, 22 Nov 2019 15:13:47 +0900
Message-Id: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch can improve performance when a sd card transfer size
is multiples of 32 like a sd memory card. However, this may
disimprove performance when a sd card transfer size is not
multiples of 32 because this patch uses PIO instead of SYS-DMAC.
So, I marked as "RFC" and sent linux-renesas-soc ML only
for the reference.

Yoshihiro Shimoda (4):
  mmc: host: renesas_sdhi_sys_dmac: Use dma_buswidth instead of
    hardcoded value
  mmc: host: renesas_sdhi_sys_dmac: Do not fall back to PIO
  mmc: host: renesas_sdhi_sys_dmac: add DMACR setting
  mmc: host: renesas_sdhi_sys_dmac: Set dma_buswidth value to 32 byte

 drivers/mmc/host/renesas_sdhi_core.c     | 35 +++++++++++++++++++++++
 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 49 +++++++++-----------------------
 2 files changed, 49 insertions(+), 35 deletions(-)

-- 
2.7.4

