Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 817DAE1A92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389927AbfJWMdq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:33:46 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:44076 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391613AbfJWMdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:33:45 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id H0Zk2100D05gfCL060Zkk9; Wed, 23 Oct 2019 14:33:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpg-0003uI-79; Wed, 23 Oct 2019 14:33:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpg-0003Qi-5P; Wed, 23 Oct 2019 14:33:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL v2 11/11] arm64: renesas_defconfig: Enable R8A77961 SoC
Date:   Wed, 23 Oct 2019 14:33:42 +0200
Message-Id: <20191023123342.13100-12-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023123342.13100-1-geert+renesas@glider.be>
References: <20191023123342.13100-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the Renesas R-Car M3-W+ (R8A77961) SoC in the ARM64
renesas_defconfig.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Not intended for upstream inclusion.

v2:
  - Add Reviewed-by, Tested-by.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 2ad65929c95b63bf..8c3a3323b1859c7d 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -287,6 +287,7 @@ CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
+CONFIG_ARCH_R8A77961=y
 CONFIG_ARCH_R8A77965=y
 CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A77980=y
-- 
2.17.1

