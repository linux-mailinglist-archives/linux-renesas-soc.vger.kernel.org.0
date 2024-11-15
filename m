Return-Path: <linux-renesas-soc+bounces-10528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB59CDD57
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 12:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97EF41F222FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 11:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3987F1B218E;
	Fri, 15 Nov 2024 11:19:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE83C1A3035;
	Fri, 15 Nov 2024 11:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731669558; cv=none; b=I0G0yGZZl3b2dxNB+LdvpJ6oSzsCFGs5HSj9QXAG/39Bv/wkjYJaoULKGYVJeEYnMKTmDtemUj3QgeAKfEksBdD4nkUybiNVAwa3LCZc2YBxr7wMIfhYxkVa9GoymkhsPk3IzFy44MuMrj5vEo23EJcJrWSki9dt9XXlV+NiUzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731669558; c=relaxed/simple;
	bh=QVKpv5zpxOUM8qARMacSmN6G9pusrdKjXlUohyWSA38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7WzAdPIo+h7q/v3HIdEiDSIz/iFp+fkMjn1XVyHPmIPB0LHUkFmqUuLtjnPbsGi5jKDdPmK51+j6V44z4rVF7+yhlHNwbu0c5LKoXOi1MOUIR8aGmHqRqQ+ZCuzdmwg1T3CJuvXKIdZ1HxdAUuW3Z0NVLd/rQ3YZt/FSeEzzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.12,156,1728918000"; 
   d="scan'208";a="228956408"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Nov 2024 20:14:05 +0900
Received: from Ubuntu-22.. (unknown [10.226.92.40])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B25304007549;
	Fri, 15 Nov 2024 20:13:48 +0900 (JST)
From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kan Liang <kan.liang@linux.intel.com>,
	Colton Lewis <coltonlewis@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>
Subject: [PATCH] riscv: perf: Drop defining `perf_instruction_pointer()` and `perf_misc_flags()`
Date: Fri, 15 Nov 2024 11:13:45 +0000
Message-ID: <20241115111345.17750-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

With commit 2c47e7a74f44 ("perf/core: Correct perf sampling with guest
VMs"), the perf core now handles the functionality previously requiring
arch-specific definitions of `perf_instruction_pointer()` and
`perf_misc_flags()`. As these definitions are no longer necessary for
RISC-V, this patch removes their implementation and declarations.

This cleanup aligns the RISC-V architecture with the updated perf core
mechanism, reducing code redundancy and improving maintainability.

Fixes: 2c47e7a74f44 ("perf/core: Correct perf sampling with guest VMs")
Reported-by: Chris Paterson <Chris.Paterson2@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/include/asm/perf_event.h |  3 ---
 arch/riscv/kernel/perf_callchain.c  | 28 ----------------------------
 2 files changed, 31 deletions(-)

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index 38926b4a902d..bcc928fd3785 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -10,9 +10,6 @@
 
 #ifdef CONFIG_PERF_EVENTS
 #include <linux/perf_event.h>
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs) perf_misc_flags(regs)
 #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
 
 #define perf_arch_fetch_caller_regs(regs, __ip) { \
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index c2c81a80f816..b465bc9eb870 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -46,31 +46,3 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 
 	walk_stackframe(NULL, regs, fill_callchain, entry);
 }
-
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
-{
-	if (perf_guest_state())
-		return perf_guest_get_ip();
-
-	return instruction_pointer(regs);
-}
-
-unsigned long perf_misc_flags(struct pt_regs *regs)
-{
-	unsigned int guest_state = perf_guest_state();
-	unsigned long misc = 0;
-
-	if (guest_state) {
-		if (guest_state & PERF_GUEST_USER)
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
-	} else {
-		if (user_mode(regs))
-			misc |= PERF_RECORD_MISC_USER;
-		else
-			misc |= PERF_RECORD_MISC_KERNEL;
-	}
-
-	return misc;
-}
-- 
2.25.1


