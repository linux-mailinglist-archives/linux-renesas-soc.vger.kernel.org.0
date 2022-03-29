Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD844EACF3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 14:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbiC2MVF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 08:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236232AbiC2MVE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 08:21:04 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D52340DE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Mar 2022 05:19:21 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by laurent.telenet-ops.be with bizsmtp
        id CCKL2700749QC4401CKL5q; Tue, 29 Mar 2022 14:19:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZAoh-007GVH-Na; Tue, 29 Mar 2022 14:19:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZAog-00CDaA-Sb; Tue, 29 Mar 2022 14:19:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     u-boot@lists.denx.de
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH u-boot 2/3] ARM: renesas: Propagate RPC-IF enablement to subsequent software
Date:   Tue, 29 Mar 2022 14:19:08 +0200
Message-Id: <9e42cfdcb14eef5c75bbb8dd3e761b66257d492e.1648544792.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648544792.git.geert+renesas@glider.be>
References: <cover.1648544792.git.geert+renesas@glider.be>
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

As the Renesas Reduced Pin Count Interface may be locked by TF-A, it is
disabled by default[1].  When unlocked, TF-A passes a DT fragment to
enable it, which is applied to the U-Boot DT[2].

Unlike the memory layout, the RPC-IF enablement is not propagated to
subsequent software.  Hence e.g. Linux cannot know if the RPC-IF is
locked or not, and will lock-up when trying to access the RPC-IF when
locked.

Fix this by checking if the RPC-IF is enabled in the TF-A DT fragment, and
setting the status of the RPC-IF device node in the target DT, if
present, to "okay".  Do this only when a "flash" subnode is found, to
avoid errors in subsequent software when the RPC-IF is not intended to
be used.

Note that this requires the status of the RPC-IF node to be set to
"disabled" in the target DT, just like in the U-Boot DT.

[1] commit 3d5f45c95c9db73d ("ARM: dts: rmobile: Disable RPC HF by
    default")
[2] commit 361377dbdbc9f0f5 ("ARM: rmobile: Merge prior-stage firmware
    DT fragment into U-Boot DT on Gen3")

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 board/renesas/rcar-common/common.c | 46 ++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/board/renesas/rcar-common/common.c b/board/renesas/rcar-common/common.c
index 0352d341e757bed9..daa1beb14f807800 100644
--- a/board/renesas/rcar-common/common.c
+++ b/board/renesas/rcar-common/common.c
@@ -9,6 +9,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <fdt_support.h>
 #include <init.h>
 #include <asm/global_data.h>
 #include <dm/uclass-internal.h>
@@ -19,9 +20,11 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-/* If the firmware passed a device tree use it for U-Boot DRAM setup. */
+/* If the firmware passed a device tree use it for e.g. U-Boot DRAM setup. */
 extern u64 rcar_atf_boot_args[];
 
+#define FDT_RPC_PATH	"/soc/spi@ee200000"
+
 int fdtdec_board_setup(const void *fdt_blob)
 {
 	void *atf_fdt_blob = (void *)(rcar_atf_boot_args[1]);
@@ -81,7 +84,7 @@ static int is_mem_overlap(void *blob, int first_mem_node, int curr_mem_node)
 	return 0;
 }
 
-int ft_board_setup(void *blob, struct bd_info *bd)
+static void scrub_duplicate_memory(void *blob)
 {
 	/*
 	 * Scrub duplicate /memory@* node entries here. Some R-Car DTs might
@@ -119,6 +122,45 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 		first_mem_node = 0;
 		mem = 0;
 	}
+}
+
+static void update_rpc_status(void *blob)
+{
+	void *atf_fdt_blob = (void *)(rcar_atf_boot_args[1]);
+	int offset, enabled;
+
+	/*
+	 * Check if the DT fragment received from TF-A had its RPC-IF device node
+	 * enabled.
+	 */
+	if (fdt_magic(atf_fdt_blob) != FDT_MAGIC)
+		return;
+
+	offset = fdt_path_offset(atf_fdt_blob, FDT_RPC_PATH);
+	if (offset < 0)
+		return;
+
+	enabled = fdtdec_get_is_enabled(atf_fdt_blob, offset);
+	if (!enabled)
+		return;
+
+	/*
+	 * Find the RPC-IF device node, and enable it if it has a flash subnode.
+	 */
+	offset = fdt_path_offset(blob, FDT_RPC_PATH);
+	if (offset < 0)
+		return;
+
+	if (fdt_subnode_offset(blob, offset, "flash") < 0)
+		return;
+
+	fdt_status_okay(blob, offset);
+}
+
+int ft_board_setup(void *blob, struct bd_info *bd)
+{
+	scrub_duplicate_memory(blob);
+	update_rpc_status(blob);
 
 	return 0;
 }
-- 
2.25.1

