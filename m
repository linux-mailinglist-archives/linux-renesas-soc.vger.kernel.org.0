Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3A94E2CBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Mar 2022 16:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350512AbiCUPr2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 11:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244522AbiCUPrZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 11:47:25 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ACFF150073
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 08:46:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,198,1643641200"; 
   d="scan'208";a="114269529"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Mar 2022 00:46:00 +0900
Received: from vb.home (unknown [10.226.92.216])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1D1C84001960;
        Tue, 22 Mar 2022 00:45:56 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 12/14] arm64: defconfig: Enable Renesas RZ/V2M SoC
Date:   Mon, 21 Mar 2022 15:42:30 +0000
Message-Id: <20220321154232.56315-13-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220321154232.56315-1-phil.edworthy@renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the Renesas RZ/V2M SoC and the uart it uses.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 813e644b6af1..cc8196c48029 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -428,6 +428,7 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_8250_OMAP=y
 CONFIG_SERIAL_8250_MT6577=y
 CONFIG_SERIAL_8250_UNIPHIER=y
+CONFIG_SERIAL_8250_EM=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
@@ -1106,6 +1107,7 @@ CONFIG_ARCH_R8A774E1=y
 CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R9A07G044=y
+CONFIG_ARCH_R9A09G011=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARCH_TEGRA_132_SOC=y
-- 
2.32.0

