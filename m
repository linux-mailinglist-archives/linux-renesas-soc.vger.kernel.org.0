Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88539477636
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 16:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238633AbhLPPoA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 10:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238636AbhLPPoA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 10:44:00 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16C1C061746
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 07:43:59 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by laurent.telenet-ops.be with bizsmtp
        id X3jy26001250X30013jym9; Thu, 16 Dec 2021 16:43:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxsvF-005RBr-Lz; Thu, 16 Dec 2021 16:43:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxsvE-00A3Op-Tc; Thu, 16 Dec 2021 16:43:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 2/5] arm64: renesas: defconfig: Errata update
Date:   Thu, 16 Dec 2021 16:43:53 +0100
Message-Id: <e1873f54280c98561a9fdec107d700f34432ef2f.1639669217.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639669217.git.geert+renesas@glider.be>
References: <cover.1639669217.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update support for hardware errata in the defconfig for Renesas R-Car
Gen3 and RZ/G2 systems:
  - Enable CONFIG_ARM64_ERRATUM_1530923 (R-Car S4 and RZ/G2L have
    Cortex-A55 r2p0),
  - Disable CONFIG_ARM64_ERRATUM_1508412 (no Cortex-A77),
  - Disable CONFIG_FUJITSU_ERRATUM_010001 (not applicable),
  - Disable CONFIG_QCOM_FALKOR_ERRATUM_E1041 (not applicable),
  - Disable CONFIG_NVIDIA_CARMEL_CNP_ERRATUM (not applicable).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 177100d7dcac94ac..805a14ca041ecbdc 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -27,8 +27,8 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
-# CONFIG_ARM64_ERRATUM_1530923 is not set
 # CONFIG_ARM64_ERRATUM_1542419 is not set
+# CONFIG_ARM64_ERRATUM_1508412 is not set
 # CONFIG_ARM64_ERRATUM_2054223 is not set
 # CONFIG_ARM64_ERRATUM_2067961 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
@@ -36,10 +36,13 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
 # CONFIG_CAVIUM_ERRATUM_30115 is not set
 # CONFIG_CAVIUM_TX2_ERRATUM_219 is not set
+# CONFIG_FUJITSU_ERRATUM_010001 is not set
 # CONFIG_HISILICON_ERRATUM_161600802 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1003 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1009 is not set
 # CONFIG_QCOM_QDF2400_ERRATUM_0065 is not set
+# CONFIG_QCOM_FALKOR_ERRATUM_E1041 is not set
+# CONFIG_NVIDIA_CARMEL_CNP_ERRATUM is not set
 # CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
-- 
2.25.1

