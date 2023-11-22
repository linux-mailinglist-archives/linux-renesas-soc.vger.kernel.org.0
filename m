Return-Path: <linux-renesas-soc+bounces-106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE47F45AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 13:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26712281479
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 12:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159D14C616;
	Wed, 22 Nov 2023 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C26D51;
	Wed, 22 Nov 2023 04:18:16 -0800 (PST)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3AMCGcSl025142;
	Wed, 22 Nov 2023 20:16:38 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Wed, 22 Nov 2023
 20:16:34 +0800
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
        <will@kernel.org>, <ycliang@andestech.com>, <inochiama@outlook.com>
Subject: [PATCH v4 07/13] RISC-V: Move T-Head PMU to CPU feature alternative framework
Date: Wed, 22 Nov 2023 20:12:29 +0800
Message-ID: <20231122121235.827122-8-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122121235.827122-1-peterlin@andestech.com>
References: <20231122121235.827122-1-peterlin@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 3AMCGcSl025142

The custom PMU extension aims to support perf event sampling prior
to the ratification of Sscofpmf. Instead of diverting the bits and
register reserved for future standard, a set of custom registers is
added.  Hence, we may consider it as a CPU feature rather than an
erratum.

T-Head cores need to append "xtheadpmu" to the riscv,isa-extensions
for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_PMU
for proper functioning as of this commit.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Hi All,

This is in preparation for introducing other PMU alternative.
We follow Conor's suggestion [1][2] to use cpu feature alternative
framework rather than errata, I'm happy to drop the patch if someone
is willing to take care of this for T-Head's platforms (or sticking
with CPU errata alternative?)

[1] https://patchwork.kernel.org/project/linux-riscv/patch/20230907021635.1002738-4-peterlin@andestech.com/#25503860
[2] https://patchwork.kernel.org/project/linux-riscv/patch/20231023004100.2663486-8-peterlin@andestech.com/#25565650

Changes v1 -> v2:
  - New patch
Changes v2 -> v3:
  - Removed m{vendor/arch/imp}id checks in pmu_sbi_setup_irqs()
Changes v3 -> v4:
  - No change
---
 arch/riscv/Kconfig.errata            | 13 -------------
 arch/riscv/errata/thead/errata.c     | 19 -------------------
 arch/riscv/include/asm/errata_list.h | 15 +--------------
 arch/riscv/include/asm/hwcap.h       |  1 +
 arch/riscv/kernel/cpufeature.c       |  1 +
 drivers/perf/Kconfig                 | 13 +++++++++++++
 drivers/perf/riscv_pmu_sbi.c         | 19 ++++++++++++++-----
 7 files changed, 30 insertions(+), 51 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index e2c731cfed8c..0d19f47d1018 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -86,17 +86,4 @@ config ERRATA_THEAD_CMO
 
 	  If you don't know what to do here, say "Y".
 
-config ERRATA_THEAD_PMU
-	bool "Apply T-Head PMU errata"
-	depends on ERRATA_THEAD && RISCV_PMU_SBI
-	default y
-	help
-	  The T-Head C9xx cores implement a PMU overflow extension very
-	  similar to the core SSCOFPMF extension.
-
-	  This will apply the overflow errata to handle the non-standard
-	  behaviour via the regular SBI PMU driver and interface.
-
-	  If you don't know what to do here, say "Y".
-
 endmenu # "CPU errata selection"
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 0554ed4bf087..5de5f7209132 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -53,22 +53,6 @@ static bool errata_probe_cmo(unsigned int stage,
 	return true;
 }
 
-static bool errata_probe_pmu(unsigned int stage,
-			     unsigned long arch_id, unsigned long impid)
-{
-	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
-		return false;
-
-	/* target-c9xx cores report arch_id and impid as 0 */
-	if (arch_id != 0 || impid != 0)
-		return false;
-
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
-		return false;
-
-	return true;
-}
-
 static u32 thead_errata_probe(unsigned int stage,
 			      unsigned long archid, unsigned long impid)
 {
@@ -80,9 +64,6 @@ static u32 thead_errata_probe(unsigned int stage,
 	if (errata_probe_cmo(stage, archid, impid))
 		cpu_req_errata |= BIT(ERRATA_THEAD_CMO);
 
-	if (errata_probe_pmu(stage, archid, impid))
-		cpu_req_errata |= BIT(ERRATA_THEAD_PMU);
-
 	return cpu_req_errata;
 }
 
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 4ed21a62158c..9bccc2ba0eb5 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -25,8 +25,7 @@
 #ifdef CONFIG_ERRATA_THEAD
 #define	ERRATA_THEAD_PBMT 0
 #define	ERRATA_THEAD_CMO 1
-#define	ERRATA_THEAD_PMU 2
-#define	ERRATA_THEAD_NUMBER 3
+#define	ERRATA_THEAD_NUMBER 2
 #endif
 
 #ifdef __ASSEMBLY__
@@ -147,18 +146,6 @@ asm volatile(ALTERNATIVE_2(						\
 	    "r"((unsigned long)(_start) + (_size))			\
 	: "a0")
 
-#define THEAD_C9XX_RV_IRQ_PMU			17
-#define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
-
-#define ALT_SBI_PMU_OVERFLOW(__ovl)					\
-asm volatile(ALTERNATIVE(						\
-	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
-	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
-		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
-		CONFIG_ERRATA_THEAD_PMU)				\
-	: "=r" (__ovl) :						\
-	: "memory")
-
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 06d30526ef3b..c85ee34c78d9 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -57,6 +57,7 @@
 #define RISCV_ISA_EXT_ZIHPM		42
 #define RISCV_ISA_EXT_SMSTATEEN		43
 #define RISCV_ISA_EXT_ZICOND		44
+#define RISCV_ISA_EXT_XTHEADPMU		45
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3785ffc1570..e606f588d366 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -185,6 +185,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(xtheadpmu, RISCV_ISA_EXT_XTHEADPMU),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 273d67ecf6d2..c71b6f16bdfa 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -86,6 +86,19 @@ config RISCV_PMU_SBI
 	  full perf feature support i.e. counter overflow, privilege mode
 	  filtering, counter configuration.
 
+config THEAD_CUSTOM_PMU
+	bool "T-Head custom PMU support"
+	depends on RISCV_ALTERNATIVE && RISCV_PMU_SBI
+	default y
+	help
+	  The T-Head C9xx cores implement a PMU overflow extension very
+	  similar to the core SSCOFPMF extension.
+
+	  This will patch the overflow CSR and handle the non-standard
+	  behaviour via the regular SBI PMU driver and interface.
+
+	  If you don't know what to do here, say "Y".
+
 config ARM_PMU_ACPI
 	depends on ARM_PMU && ACPI
 	def_bool y
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 2edbc37abadf..31ca79846399 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -20,10 +20,21 @@
 #include <linux/cpu_pm.h>
 #include <linux/sched/clock.h>
 
-#include <asm/errata_list.h>
 #include <asm/sbi.h>
 #include <asm/cpufeature.h>
 
+#define THEAD_C9XX_RV_IRQ_PMU		17
+#define THEAD_C9XX_CSR_SCOUNTEROF	0x5c5
+
+#define ALT_SBI_PMU_OVERFLOW(__ovl)					\
+asm volatile(ALTERNATIVE(						\
+	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
+	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
+		0, RISCV_ISA_EXT_XTHEADPMU,				\
+		CONFIG_THEAD_CUSTOM_PMU)				\
+	: "=r" (__ovl) :						\
+	: "memory")
+
 #define SYSCTL_NO_USER_ACCESS	0
 #define SYSCTL_USER_ACCESS	1
 #define SYSCTL_LEGACY		2
@@ -808,10 +819,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
 		riscv_pmu_irq_num = RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
-	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
-		   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
-		   riscv_cached_marchid(0) == 0 &&
-		   riscv_cached_mimpid(0) == 0) {
+	} else if (riscv_isa_extension_available(NULL, XTHEADPMU) &&
+		   IS_ENABLED(CONFIG_THEAD_CUSTOM_PMU)) {
 		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
 	}
-- 
2.34.1


