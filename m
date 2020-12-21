Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A4B2DF9FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 09:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgLUIhK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 03:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgLUIhJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 03:37:09 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5935DC0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 00:36:29 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id 6wcS2400P4C55Sk01wcSgC; Mon, 21 Dec 2020 09:36:27 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1krGg6-00CgLK-CT; Mon, 21 Dec 2020 09:36:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1krGg5-00HRPh-2E; Mon, 21 Dec 2020 09:36:25 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas: defconfig: Enable Transparent Hugepage madvise
Date:   Mon, 21 Dec 2020 09:36:23 +0100
Message-Id: <20201221083623.4156421-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enabling Transparent Hugepage always can increase the memory footprint
of applications without a guaranteed benefit.

Documentation/admin-guide/mm/transhuge.rst says:

    Embedded systems should enable hugepages only inside madvise regions
    to eliminate any risk of wasting any precious byte of memory and to
    only run faster.

Hence enable Transparent Hugepage madvise instead, which will only
provide a performance improvement benefit to the applications using
madvise(MADV_HUGEPAGE), but it won't risk to increase the memory
footprint of applications without a guaranteed benefit.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge; to be applied to the
topic/renesas-defconfig only.

Perhaps this should be changed in arch/arm64/configs/defconfig, too?
Perhaps the default should be changed in mm/Kconfig instead?
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 71a6cb34ca89229c..f641a2675d0a425b 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -75,6 +75,7 @@ CONFIG_BLK_DEV_INTEGRITY=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
 CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-- 
2.25.1

