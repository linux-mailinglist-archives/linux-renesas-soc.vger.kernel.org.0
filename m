Return-Path: <linux-renesas-soc+bounces-1467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF9829518
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 09:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13AC01F276C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 08:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8051D446DE;
	Wed, 10 Jan 2024 08:25:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B134439F;
	Wed, 10 Jan 2024 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 40A7fxDl088767;
	Wed, 10 Jan 2024 15:41:59 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 40A7dWRX086371;
	Wed, 10 Jan 2024 15:39:32 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Wed, 10 Jan 2024
 15:39:28 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
        <alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
        <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
        <atishp@atishpatra.org>, <conor+dt@kernel.org>,
        <conor.dooley@microchip.com>, <conor@kernel.org>,
        <devicetree@vger.kernel.org>, <dminus@andestech.com>,
        <evan@rivosinc.com>, <geert+renesas@glider.be>, <guoren@kernel.org>,
        <heiko@sntech.de>, <irogers@google.com>, <jernej.skrabec@gmail.com>,
        <jolsa@kernel.org>, <jszhang@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <locus84@andestech.com>,
        <magnus.damm@gmail.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
        <n.shubin@yadro.com>, <namhyung@kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <peterlin@andestech.com>,
        <peterz@infradead.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <rdunlap@infradead.org>, <robh+dt@kernel.org>, <samuel@sholland.org>,
        <sunilvl@ventanamicro.com>, <tglx@linutronix.de>,
        <tim609@andestech.com>, <uwu@icenowy.me>, <wens@csie.org>,
        <will@kernel.org>, <ycliang@andestech.com>, <inochiama@outlook.com>,
        <chao.wei@sophgo.com>, <unicorn_wang@outlook.com>, <wefu@redhat.com>
Subject: [PATCH v7 01/16] riscv: errata: Rename defines for Andes
Date: Wed, 10 Jan 2024 15:39:02 +0800
Message-ID: <20240110073917.2398826-2-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110073917.2398826-1-peterlin@andestech.com>
References: <20240110073917.2398826-1-peterlin@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 40A7fxDl088767

Use "ANDES" rather than "ANDESTECH" to unify the naming
convention with directory, file names, Kconfig options
and other definitions.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Changes v1 -> v2:
  - No change
Changes v2 -> v3:
  - Rewrite commit message (suggested by Conor)
Changes v3 -> v4:
  - Include Conor's Acked-by tag
Changes v4 -> v5:
  - Include Prabhakar's RB tag
Changes v5 -> v6:
  - No change
Changes v6 -> v7:
  - No change
---
 arch/riscv/errata/andes/errata.c       | 10 +++++-----
 arch/riscv/include/asm/errata_list.h   |  4 ++--
 arch/riscv/include/asm/vendorid_list.h |  2 +-
 arch/riscv/kernel/alternative.c        |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index 17a904869724..f2708a9494a1 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -18,9 +18,9 @@
 #include <asm/sbi.h>
 #include <asm/vendorid_list.h>
 
-#define ANDESTECH_AX45MP_MARCHID	0x8000000000008a45UL
-#define ANDESTECH_AX45MP_MIMPID		0x500UL
-#define ANDESTECH_SBI_EXT_ANDES		0x0900031E
+#define ANDES_AX45MP_MARCHID		0x8000000000008a45UL
+#define ANDES_AX45MP_MIMPID		0x500UL
+#define ANDES_SBI_EXT_ANDES		0x0900031E
 
 #define ANDES_SBI_EXT_IOCP_SW_WORKAROUND	1
 
@@ -32,7 +32,7 @@ static long ax45mp_iocp_sw_workaround(void)
 	 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP is missing and
 	 * cache is controllable only then CMO will be applied to the platform.
 	 */
-	ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
+	ret = sbi_ecall(ANDES_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
 			0, 0, 0, 0, 0, 0);
 
 	return ret.error ? 0 : ret.value;
@@ -50,7 +50,7 @@ static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigne
 
 	done = true;
 
-	if (arch_id != ANDESTECH_AX45MP_MARCHID || impid != ANDESTECH_AX45MP_MIMPID)
+	if (arch_id != ANDES_AX45MP_MARCHID || impid != ANDES_AX45MP_MIMPID)
 		return;
 
 	if (!ax45mp_iocp_sw_workaround())
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 83ed25e43553..4ed21a62158c 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -12,8 +12,8 @@
 #include <asm/vendorid_list.h>
 
 #ifdef CONFIG_ERRATA_ANDES
-#define ERRATA_ANDESTECH_NO_IOCP	0
-#define ERRATA_ANDESTECH_NUMBER		1
+#define ERRATA_ANDES_NO_IOCP 0
+#define ERRATA_ANDES_NUMBER 1
 #endif
 
 #ifdef CONFIG_ERRATA_SIFIVE
diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index e55407ace0c3..2f2bb0c84f9a 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -5,7 +5,7 @@
 #ifndef ASM_VENDOR_LIST_H
 #define ASM_VENDOR_LIST_H
 
-#define ANDESTECH_VENDOR_ID	0x31e
+#define ANDES_VENDOR_ID		0x31e
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 319a1da0358b..0128b161bfda 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -43,7 +43,7 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info
 
 	switch (cpu_mfr_info->vendor_id) {
 #ifdef CONFIG_ERRATA_ANDES
-	case ANDESTECH_VENDOR_ID:
+	case ANDES_VENDOR_ID:
 		cpu_mfr_info->patch_func = andes_errata_patch_func;
 		break;
 #endif
-- 
2.34.1


