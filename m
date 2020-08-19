Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A687C2499F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 12:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgHSKMt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Aug 2020 06:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbgHSKMn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 06:12:43 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE22C061757
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2020 03:12:42 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id HNCh2300G4C55Sk06NChFi; Wed, 19 Aug 2020 12:12:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8L5F-0008TK-BG; Wed, 19 Aug 2020 12:12:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8L5F-0003CT-9o; Wed, 19 Aug 2020 12:12:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: defconfig: Enable RPC-IF support
Date:   Wed, 19 Aug 2020 12:12:40 +0200
Message-Id: <20200819101240.12260-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the Renesas SPI Multi I/O Bus Controller (RPC-IF),
which is used on the Condor, Eagle, V3HSK, and V3MSK boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.10.
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3bd5de74019b4088..edcb2368fc4f3e6c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -458,6 +458,7 @@ CONFIG_SPI_MESON_SPIFC=m
 CONFIG_SPI_ORION=y
 CONFIG_SPI_PL022=y
 CONFIG_SPI_ROCKCHIP=y
+CONFIG_SPI_RPCIF=y
 CONFIG_SPI_QCOM_QSPI=m
 CONFIG_SPI_QUP=y
 CONFIG_SPI_QCOM_GENI=m
@@ -921,6 +922,7 @@ CONFIG_ARCH_K3_J721E_SOC=y
 CONFIG_TI_SCI_PM_DOMAINS=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y
+CONFIG_RENESAS_RPCIF=y
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
 CONFIG_MAX9611=m
-- 
2.17.1

