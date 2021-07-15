Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B833C9E4C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jul 2021 14:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbhGOMOq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jul 2021 08:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbhGOMOp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jul 2021 08:14:45 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74901C061760
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jul 2021 05:11:52 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:bcf3:b2b1:dff6:480b])
        by albert.telenet-ops.be with bizsmtp
        id VQBq2500E4sai0K06QBqSn; Thu, 15 Jul 2021 14:11:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m40DW-001M35-7O; Thu, 15 Jul 2021 14:11:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m40DV-00AprO-Q8; Thu, 15 Jul 2021 14:11:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] [LOCAL] arm64: renesas: defconfig: Enable R9A07G044 SoC
Date:   Thu, 15 Jul 2021 14:11:46 +0200
Message-Id: <822fe8c592d74c565dfd69b6ca3e0f183d2af4b1.1626351064.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <71851aa820379c8f9d749fd7b1c9650af2e2e008.1626351064.git.geert+renesas@glider.be>
References: <71851aa820379c8f9d749fd7b1c9650af2e2e008.1626351064.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the Renesas RAZ/G2L (R9A07G044) SoC in the ARM64
renesas_defconfig.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to topic/renesas-defconfig.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 5d5384994dfe7ccc..f57f4cf4d8cd9c34 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -326,6 +326,7 @@ CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A774E1=y
 CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774B1=y
+CONFIG_ARCH_R9A07G044=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_MEMORY=y
 CONFIG_RENESAS_RPCIF=y
-- 
2.25.1

