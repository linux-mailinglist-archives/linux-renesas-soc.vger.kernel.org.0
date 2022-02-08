Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D50A84ACD78
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 02:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343913AbiBHBG1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 20:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344017AbiBHAZk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 19:25:40 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E38A2C0612A4;
        Mon,  7 Feb 2022 16:25:39 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,351,1635174000"; 
   d="scan'208";a="110545972"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Feb 2022 09:20:36 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7C83A400A108;
        Tue,  8 Feb 2022 09:20:36 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
Date:   Tue,  8 Feb 2022 09:20:28 +0900
Message-Id: <20220208002030.1319984-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        KHOP_HELO_FCRDNS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on renesas-drivers-2022-01-11-v5.16 [1].
Note that we have to prepare the following registers' setting
in a bootloader (U-Boot) because the registers are protected.
Otherwise, data mismatch happened if dmatest with the ipmmu is running.

 => mw eed01500 0xc0000000; mw eed41500 0xc0000000

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tag/?h=renesas-drivers-2022-01-11-v5.16

Changes from v2:
 - Add Reviewed-by tag in patch 1 and 2 (Geert-san, thanks!)
 - Revise commit description in patch 1.
 https://lore.kernel.org/all/20220204125653.1194249-1-yoshihiro.shimoda.uh@renesas.com/

Changes from v1:
 - Add Reviewed-by tag in patch 1. (Geert-san, thanks!)
 - Revise a comment in patch 2.
 https://lore.kernel.org/all/20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com/

Y

Yoshihiro Shimoda (2):
  dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779f0 support
  iommu/ipmmu-vmsa: Add support for R-Car Gen4

 .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml  |  4 ++++
 drivers/iommu/ipmmu-vmsa.c                             | 10 +++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.25.1

