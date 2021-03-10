Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE04333A31
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 11:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhCJKjk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 05:39:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhCJKjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 05:39:37 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E220C06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 02:39:36 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id eaeJ2401C4C55Sk01aeJzp; Wed, 10 Mar 2021 11:39:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lJwCG-006dmu-L9; Wed, 10 Mar 2021 11:36:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lJwCF-00AcGb-EY; Wed, 10 Mar 2021 11:36:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas: defconfig: Refresh for v5.11-rc1
Date:   Wed, 10 Mar 2021 11:36:06 +0100
Message-Id: <20210310103606.2530334-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas R-Car Gen3 and RZ/G2 systems:
  - Drop CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=n (no longer
    auto-enabled since commit 6edcf9dc2e1aff3a ("efi/libstub:
    EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER should not default to yes")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index f641a2675d0a425b..e440845c96bd90b7 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -61,7 +61,6 @@ CONFIG_ARM_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
 # CONFIG_DMIID is not set
-# CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER is not set
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=y
 CONFIG_ARM64_CRYPTO=y
-- 
2.25.1

