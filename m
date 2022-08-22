Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2262459BD45
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 12:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbiHVKAq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 06:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234575AbiHVKAT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 06:00:19 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E652931EF1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 03:00:17 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id Aa0G2800S4C55Sk01a0GGh; Mon, 22 Aug 2022 12:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oQ4EB-0023pc-U2; Mon, 22 Aug 2022 12:00:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oQ4EB-00GUx0-7v; Mon, 22 Aug 2022 12:00:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: defconfig: Enable additional support for Renesas platforms
Date:   Mon, 22 Aug 2022 12:00:13 +0200
Message-Id: <bd863fdd098be394d57b9dc15f8bb0f6b1f2d78a.1661162345.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Increase build and test coverage by enabling support for more hardware
present on Renesas SoCs and boards:
  - Renesas RZ/V2M I2C,
  - Renesas Universal Flash Storage Controller on R-Car S4, as used on
    the Spider board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d5b2d2dd49043d26..6365e5bfbbd4182f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -474,6 +474,7 @@ CONFIG_I2C_QCOM_GENI=m
 CONFIG_I2C_QUP=y
 CONFIG_I2C_RIIC=y
 CONFIG_I2C_RK3X=y
+CONFIG_I2C_RZV2M=m
 CONFIG_I2C_S3C2410=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_TEGRA=y
@@ -939,6 +940,7 @@ CONFIG_SCSI_UFSHCD=y
 CONFIG_SCSI_UFSHCD_PLATFORM=y
 CONFIG_SCSI_UFS_QCOM=m
 CONFIG_SCSI_UFS_HISI=y
+CONFIG_SCSI_UFS_RENESAS=m
 CONFIG_SCSI_UFS_EXYNOS=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
-- 
2.25.1

