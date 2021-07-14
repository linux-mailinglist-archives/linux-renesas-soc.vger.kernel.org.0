Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998DE3C84C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 14:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239445AbhGNMxr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 08:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239441AbhGNMxq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 08:53:46 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62496C06175F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 05:50:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by xavier.telenet-ops.be with bizsmtp
        id V0qX250091ccfby010qX5Y; Wed, 14 Jul 2021 14:50:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLO-0018dP-Vb; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLN-00AaEC-PF; Wed, 14 Jul 2021 14:50:29 +0200
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
Subject: [PATCH v4 04/10] of: fdt: Add generic support for parsing usable memory range property
Date:   Wed, 14 Jul 2021 14:50:14 +0200
Message-Id: <4064ea598a10ea0a4b9043aa771bcea1a00efac3.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for parsing the "linux,usable-memory-range" property in the
"/chosen" node to the FDT core code.  This can co-exist safely with the
architecture-specific parsing, until the latter has been removed.

Architecture-specific code still has to make sure the resulting memory
range limitation is applied, if present.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
About the change to chosen.txt: I have a similar change for
schemas/chosen.yaml in dt-schema.

v4:
  - New.
---
 Documentation/devicetree/bindings/chosen.txt |  6 ++---
 drivers/of/fdt.c                             | 24 ++++++++++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 5b0b94eb2d04e79d..1cc3aa10dcb10588 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -79,9 +79,9 @@ a different secondary CPU release mechanism)
 linux,usable-memory-range
 -------------------------
 
-This property (arm64 only) holds a base address and size, describing a
-limited region in which memory may be considered available for use by
-the kernel. Memory outside of this range is not available for use.
+This property holds a base address and size, describing a limited region in
+which memory may be considered available for use by the kernel. Memory outside
+of this range is not available for use.
 
 This property describes a limitation: memory within this range is only
 valid when also described through another mechanism that the kernel
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index f797d52c5b492cb7..1b4dd5418b44b9fb 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -935,6 +935,29 @@ static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
 		 elfcorehdr_addr, elfcorehdr_size);
 }
 
+/**
+ * early_init_dt_check_for_usable_mem_range - Decode usable memory range
+ * location from flat tree
+ * @node: reference to node containing usable memory range location ('chosen')
+ */
+static void __init early_init_dt_check_for_usable_mem_range(unsigned long node)
+{
+	const __be32 *prop;
+	int len;
+
+	pr_debug("Looking for usable-memory-range property... ");
+
+	prop = of_get_flat_dt_prop(node, "linux,usable-memory-range", &len);
+	if (!prop || (len < (dt_root_addr_cells + dt_root_size_cells)))
+		return;
+
+	cap_mem_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
+	cap_mem_size = dt_mem_next_cell(dt_root_size_cells, &prop);
+
+	pr_debug("cap_mem_start=%pa cap_mem_size=%pa\n", &cap_mem_addr,
+		 &cap_mem_size);
+}
+
 #ifdef CONFIG_SERIAL_EARLYCON
 
 int __init early_init_dt_scan_chosen_stdout(void)
@@ -1083,6 +1106,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	early_init_dt_check_for_initrd(node);
 	early_init_dt_check_for_elfcorehdr(node);
+	early_init_dt_check_for_usable_mem_range(node);
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
-- 
2.25.1

