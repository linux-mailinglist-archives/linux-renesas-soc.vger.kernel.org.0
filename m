Return-Path: <linux-renesas-soc+bounces-3266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B986912B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 14:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56656B24042
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 13:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D62813AA55;
	Tue, 27 Feb 2024 13:00:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AA213AA5C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038824; cv=none; b=s5Pe/DrHC4FCQvnhUa1cuoPS4ygbp+3AVz+rBOprKuXke1l0V/T9cka6lfcb0eKFVifVsK+hx1wIDEgzPKN8ah6KSiMnfUUhEDwesZuSj9AHhr7Vx2Ux8nWIKC6a1iotVaDl2voh2htIpf7otPLwh63fSd5WLxqUvdYgIWABoys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038824; c=relaxed/simple;
	bh=z9JBwE0U9wYOlu3cTs0+gIZ6C0a9qdNf9jg6xHr9+3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fxzZ0v3zIJ9E08EMFGzstJyHOfrDjLp44GNdr15O1zVglX4W7WD6d7mtBL4BTfRcVJQik4v/zWQOMEKKC0gvhG31IT8yVtg6auW0Obp/vQnXAh9iDClPskAX8b/GZtGbazJcaBzY1HoYafC2mQkJvsNdEw9JC0gtQts/Vs6lh0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,187,1705330800"; 
   d="scan'208";a="199464881"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Feb 2024 22:00:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1FD8342714A9;
	Tue, 27 Feb 2024 22:00:15 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] arm64: defconfig: Enable Renesas DA9062 PMIC
Date: Tue, 27 Feb 2024 13:00:10 +0000
Message-Id: <20240227130010.45361-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the config for the Renesas DA9062 PMIC and built-in RTC,
GPIO and ONKEY drivers as it is populated on RZ/G2UL SMARC EVK
development board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped RZ/Five from commit description.
 * Made CONFIG option MFD_DA9062 as modular.
v1->v2:
 * Enabled CONFIG_INPUT_DA9063_ONKEY and CONFIG_PINCTRL_DA9062
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 34681284043f..4de49628ddec 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -442,6 +442,7 @@ CONFIG_INPUT_TPS65219_PWRBUTTON=m
 CONFIG_INPUT_PWM_BEEPER=m
 CONFIG_INPUT_PWM_VIBRA=m
 CONFIG_INPUT_RK805_PWRKEY=m
+CONFIG_INPUT_DA9063_ONKEY=m
 CONFIG_INPUT_HISI_POWERKEY=y
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_AMBAKMI=y
@@ -559,6 +560,7 @@ CONFIG_SPI_TEGRA114=m
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
 CONFIG_PINCTRL_SINGLE=y
@@ -724,6 +726,7 @@ CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
+CONFIG_MFD_DA9062=m
 CONFIG_MFD_EXYNOS_LPASS=m
 CONFIG_MFD_HI6421_PMIC=y
 CONFIG_MFD_HI655X_PMIC=y
@@ -1166,6 +1169,7 @@ CONFIG_RTC_DRV_RV8803=m
 CONFIG_RTC_DRV_S5M=y
 CONFIG_RTC_DRV_DS3232=y
 CONFIG_RTC_DRV_PCF2127=m
+CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
-- 
2.25.1


