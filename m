Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB6CB4EE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 15:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfIQNMd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 09:12:33 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:21221 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726131AbfIQNMc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 09:12:32 -0400
X-IronPort-AV: E=Sophos;i="5.64,516,1559487600"; 
   d="scan'208";a="26795102"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Sep 2019 22:12:31 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D10CE400857B;
        Tue, 17 Sep 2019 22:12:27 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] arm64: defconfig: enable R8A774B1 SoC
Date:   Tue, 17 Sep 2019 14:05:28 +0100
Message-Id: <1568725530-55241-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568725530-55241-1-git-send-email-biju.das@bp.renesas.com>
References: <1568725530-55241-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the Renesas RZ/G2N (R8A774B1) SoC in the ARM64 defconfig.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0e58ef0..6433d33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -721,6 +721,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_ARCH_R8A774A1=y
+CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
-- 
2.7.4

