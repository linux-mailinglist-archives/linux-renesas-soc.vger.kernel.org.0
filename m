Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC082A3F17
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 09:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgKCIll (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Nov 2020 03:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgKCIll (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 03:41:41 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53082C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2020 00:41:41 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id nkhd2300l4C55Sk01khdkb; Tue, 03 Nov 2020 09:41:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kZrsn-002TJC-Da; Tue, 03 Nov 2020 09:41:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kZrsn-005mij-0F; Tue, 03 Nov 2020 09:41:37 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v5.10-rc1
Date:   Tue,  3 Nov 2020 09:41:36 +0100
Message-Id: <20201103084136.1378875-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM systems:
  - Reorder SoC-specific config options (cfr. commit 6d5aded8d57fc032
    ("soc: renesas: Sort driver description title")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.11.

 arch/arm/configs/shmobile_defconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 4a161b3c35b9e978..01a6ebdf033a6482 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -179,22 +179,22 @@ CONFIG_STAGING=y
 CONFIG_STAGING_BOARD=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_ARCH_EMEV2=y
+CONFIG_ARCH_R8A7794=y
+CONFIG_ARCH_R8A7779=y
+CONFIG_ARCH_R8A7790=y
+CONFIG_ARCH_R8A7778=y
+CONFIG_ARCH_R8A7793=y
+CONFIG_ARCH_R8A7791=y
+CONFIG_ARCH_R8A7792=y
+CONFIG_ARCH_R8A7740=y
+CONFIG_ARCH_R8A73A4=y
 CONFIG_ARCH_R7S72100=y
 CONFIG_ARCH_R7S9210=y
-CONFIG_ARCH_R8A73A4=y
-CONFIG_ARCH_R8A7740=y
+CONFIG_ARCH_R8A77470=y
+CONFIG_ARCH_R8A7745=y
 CONFIG_ARCH_R8A7742=y
 CONFIG_ARCH_R8A7743=y
 CONFIG_ARCH_R8A7744=y
-CONFIG_ARCH_R8A7745=y
-CONFIG_ARCH_R8A77470=y
-CONFIG_ARCH_R8A7778=y
-CONFIG_ARCH_R8A7779=y
-CONFIG_ARCH_R8A7790=y
-CONFIG_ARCH_R8A7791=y
-CONFIG_ARCH_R8A7792=y
-CONFIG_ARCH_R8A7793=y
-CONFIG_ARCH_R8A7794=y
 CONFIG_ARCH_R9A06G032=y
 CONFIG_ARCH_SH73A0=y
 CONFIG_IIO=y
-- 
2.25.1

