Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D863C84C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 14:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239422AbhGNMxq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 08:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239381AbhGNMxl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 08:53:41 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8210DC061764
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 05:50:49 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by andre.telenet-ops.be with bizsmtp
        id V0qW2500C1ccfby010qWoz; Wed, 14 Jul 2021 14:50:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLO-0018dO-3E; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLN-00AaE5-OX; Wed, 14 Jul 2021 14:50:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Mike Rapoport <rppt@kernel.org>
Cc:     Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-mm@kvack.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 03/10] of: fdt: Add generic support for parsing elf core headers property
Date:   Wed, 14 Jul 2021 14:50:13 +0200
Message-Id: <24d93c713f6faeaee6105f57c3d94ac17f12405f.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are two methods to specify the location of the elf core headers:
using the "elfcorehdr=" kernel parameter, as handled by generic code in
kernel/crash_dump.c, or using the "linux,elfcorehdr" property under the
"/chosen" node in the Device Tree, as handled by architecture-specific
code in arch/arm64/mm/init.c.

Extend support for "linux,elfcorehdr" to all platforms supporting DT by
adding platform-agnostic handling for parsing this property to the FDT
core code.  This can co-exist safely with the architecture-specific
parsing, until the latter has been removed.

This requires moving the call to of_scan_flat_dt() up, as the code
scanning the "/chosen" node now needs to be aware of the values of
"#address-cells" and "#size-cells".

Architecture-specific code still has to reserve the memory used by the
elf core headers, if present.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
About the change to chosen.txt: I have a similar change for
schemas/chosen.yaml in dt-schema.

v4:
  - Use IS_ENABLED() instead of #ifdef,
  - Clarify what architecture-specific code is still responsible for.
---
 Documentation/devicetree/bindings/chosen.txt |  6 ++--
 drivers/of/fdt.c                             | 34 ++++++++++++++++++--
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 45e79172a646c537..5b0b94eb2d04e79d 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -106,9 +106,9 @@ respectively, of the root node.
 linux,elfcorehdr
 ----------------
 
-This property (currently used only on arm64) holds the memory range,
-the address and the size, of the elf core header which mainly describes
-the panicked kernel's memory layout as PT_LOAD segments of elf format.
+This property holds the memory range, the address and the size, of the elf
+core header which mainly describes the panicked kernel's memory layout as
+PT_LOAD segments of elf format.
 e.g.
 
 / {
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 344f16bb04ccf081..f797d52c5b492cb7 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt)	"OF: fdt: " fmt
 
+#include <linux/crash_dump.h>
 #include <linux/crc32.h>
 #include <linux/kernel.h>
 #include <linux/initrd.h>
@@ -908,6 +909,32 @@ static inline void early_init_dt_check_for_initrd(unsigned long node)
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
 
+/**
+ * early_init_dt_check_for_elfcorehdr - Decode elfcorehdr location from flat
+ * tree
+ * @node: reference to node containing elfcorehdr location ('chosen')
+ */
+static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
+{
+	const __be32 *prop;
+	int len;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	pr_debug("Looking for elfcorehdr property... ");
+
+	prop = of_get_flat_dt_prop(node, "linux,elfcorehdr", &len);
+	if (!prop || (len < (dt_root_addr_cells + dt_root_size_cells)))
+		return;
+
+	elfcorehdr_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
+	elfcorehdr_size = dt_mem_next_cell(dt_root_size_cells, &prop);
+
+	pr_debug("elfcorehdr_start=0x%llx elfcorehdr_size=0x%llx\n",
+		 elfcorehdr_addr, elfcorehdr_size);
+}
+
 #ifdef CONFIG_SERIAL_EARLYCON
 
 int __init early_init_dt_scan_chosen_stdout(void)
@@ -1055,6 +1082,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 		return 0;
 
 	early_init_dt_check_for_initrd(node);
+	early_init_dt_check_for_elfcorehdr(node);
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
@@ -1199,14 +1227,14 @@ void __init early_init_dt_scan_nodes(void)
 {
 	int rc = 0;
 
+	/* Initialize {size,address}-cells info */
+	of_scan_flat_dt(early_init_dt_scan_root, NULL);
+
 	/* Retrieve various information from the /chosen node */
 	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
 	if (!rc)
 		pr_warn("No chosen node found, continuing without\n");
 
-	/* Initialize {size,address}-cells info */
-	of_scan_flat_dt(early_init_dt_scan_root, NULL);
-
 	/* Setup memory, calling early_init_dt_add_memory_arch */
 	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
 }
-- 
2.25.1

