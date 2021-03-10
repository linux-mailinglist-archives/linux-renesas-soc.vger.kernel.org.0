Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F209333A17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 11:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhCJKdl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 05:33:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhCJKdY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 05:33:24 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3F9C06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 02:33:17 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:49d1:bfd3:8c90:c612])
        by albert.telenet-ops.be with bizsmtp
        id eaYF2400v2YbTuX06aYF3R; Wed, 10 Mar 2021 11:32:49 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lJw8V-006dm7-AO; Wed, 10 Mar 2021 11:32:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lJw8U-00AcAw-N6; Wed, 10 Mar 2021 11:32:14 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v5.12-rc2
Date:   Wed, 10 Mar 2021 11:32:13 +0100
Message-Id: <20210310103213.2529983-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM systems:
  - Drop CONFIG_ENABLE_MUST_CHECK=n (removed in commit 1967939462641d8b
    ("Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.13.

 arch/arm/configs/shmobile_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 01a6ebdf033a6482..f25b09efb81640e3 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -220,6 +220,5 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_KERNEL=y
-- 
2.25.1

