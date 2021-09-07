Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAB4402525
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Sep 2021 10:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242048AbhIGIbt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Sep 2021 04:31:49 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:26606 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238139AbhIGIbr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 04:31:47 -0400
X-IronPort-AV: E=Sophos;i="5.85,274,1624287600"; 
   d="scan'208";a="93225460"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Sep 2021 17:30:40 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 61796400C4FB;
        Tue,  7 Sep 2021 17:30:40 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] iommu/ipmmu-vmsa: Add support for r8a779a0
Date:   Tue,  7 Sep 2021 17:30:18 +0900
Message-Id: <20210907083020.907648-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series adds support for r8a779a0 (R-Car V3U).

Changes from v1:
 - Add {Ack,Review}ed-by in the patch 1.
 - Add support 16 contexts in the patch 2.
 - Add Reviewed-by in the patch 2.
 https://lore.kernel.org/all/20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (2):
  dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779a0 support
  iommu/ipmmu-vmsa: Add support for r8a779a0

 .../bindings/iommu/renesas,ipmmu-vmsa.yaml    |  1 +
 drivers/iommu/ipmmu-vmsa.c                    | 29 ++++++++++++++++---
 2 files changed, 26 insertions(+), 4 deletions(-)

-- 
2.25.1

