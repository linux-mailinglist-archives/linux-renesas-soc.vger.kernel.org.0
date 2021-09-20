Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D758F4111FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 11:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234973AbhITJlT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 05:41:19 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:57657 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236106AbhITJlP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 05:41:15 -0400
X-IronPort-AV: E=Sophos;i="5.85,307,1624287600"; 
   d="scan'208";a="94564546"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Sep 2021 18:39:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.208])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A0E7F40065A6;
        Mon, 20 Sep 2021 18:39:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: defconfig: Enable SOUND_SOC_RZ
Date:   Mon, 20 Sep 2021 10:39:05 +0100
Message-Id: <20210920093905.10878-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210920093905.10878-1-biju.das.jz@bp.renesas.com>
References: <20210920093905.10878-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable sound driver support for Renesas RZ/G2L based platforms.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8eac462af4c4..5cab1996d263 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -765,6 +765,7 @@ CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
 CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
+CONFIG_SND_SOC_RZ=m
 CONFIG_SND_SUN4I_I2S=m
 CONFIG_SND_SUN4I_SPDIF=m
 CONFIG_SND_SOC_TEGRA=m
-- 
2.17.1

