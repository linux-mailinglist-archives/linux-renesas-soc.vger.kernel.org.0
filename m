Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E66B74A9986
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 13:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243067AbiBDM5D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 07:57:03 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:19119 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236192AbiBDM5D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 07:57:03 -0500
X-IronPort-AV: E=Sophos;i="5.88,342,1635174000"; 
   d="scan'208";a="109494520"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Feb 2022 21:57:02 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F21784005E01;
        Fri,  4 Feb 2022 21:57:01 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
Date:   Fri,  4 Feb 2022 21:56:51 +0900
Message-Id: <20220204125653.1194249-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes from v1:
 - Add Reviewed-by tag in patch 1. (Geert-san, thanks!)
 - Revise a comment in patch 2.
 https://lore.kernel.org/all/20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (2):
  dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779f0 support
  iommu/ipmmu-vmsa: Add support for R-Car Gen4

 .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml  |  4 ++++
 drivers/iommu/ipmmu-vmsa.c                             | 10 +++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.25.1

