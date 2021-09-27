Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33455419F41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 21:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbhI0Thn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 15:37:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:35406 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229503AbhI0Thm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 15:37:42 -0400
X-IronPort-AV: E=Sophos;i="5.85,327,1624287600"; 
   d="scan'208";a="95188653"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Sep 2021 04:36:03 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F35654006366;
        Tue, 28 Sep 2021 04:36:00 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: defconfig: Enable RZG2L_ADC
Date:   Mon, 27 Sep 2021 20:35:51 +0100
Message-Id: <20210927193551.22422-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable ADC driver support for Renesas RZ/G2L based platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi Geert,

I have based this patch on top of renesas-arm-defconfig-for-v5.16.

Cheers,
Prabhakar
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 798d6cb28941..f4ee18d0667e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1077,6 +1077,7 @@ CONFIG_MAX9611=m
 CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
+CONFIG_RZG2L_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
 CONFIG_IIO_CROS_EC_SENSORS=m
 CONFIG_IIO_ST_LSM6DSX=m
-- 
2.17.1

