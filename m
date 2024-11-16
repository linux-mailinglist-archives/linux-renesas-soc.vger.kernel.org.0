Return-Path: <linux-renesas-soc+bounces-10549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557B9CFFC3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Nov 2024 17:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDC3A2859CB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Nov 2024 16:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD66542A80;
	Sat, 16 Nov 2024 16:05:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D48372;
	Sat, 16 Nov 2024 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731773138; cv=none; b=eeFEjCxlTm0nPkkGfZTebCAV6Gbp+qAtvAB70UTng0/a8HePda/I7hCcbYV/IfCPD1mvdsuJZykJNYhPsKj+GBUzvCOF0UeTMA4JDCtYH0PMSgtzHooDLEUWz6dtdrmiUMiHlNTF9mwmWmitX6nOyZZjf6UlP02MQXmUuaRqKZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731773138; c=relaxed/simple;
	bh=8E9fdTPH4z1JWEfAFPme5sq66UKNxpppxxaOanqA25I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXZX6lsjbqccUAHIINj8WBnvS57cw403OoYUY4x8vha0uB2TkHLdqF1YN7utSHBO0g7T+ULMyIFxcxqmy178sRMJHdKVzoiG2bsjTNdfhG4bXpAVTlMRrDTgFubfrD+q6uDmwc88ZwQYqLhWSWckXwpnG64KzRAbFI/ZVUVDiwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.12,160,1728918000"; 
   d="scan'208";a="225039180"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Nov 2024 01:05:34 +0900
Received: from Ubuntu-22.. (unknown [10.226.92.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 37BE54012505;
	Sun, 17 Nov 2024 01:05:16 +0900 (JST)
From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2] riscv: perf: Drop defining `perf_instruction_pointer()` and `perf_misc_flags()`
Date: Sat, 16 Nov 2024 16:05:06 +0000
Message-ID: <20241116160506.5324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This change also fixes the following build issue on RISC-V:

    ./include/linux/perf_event.h:1679:84: error: macro "perf_misc_flags" passed 2 arguments, but takes just 1
    ./include/linux/perf_event.h:1679:22: error: 'perf_misc_flags' redeclared as different kind of symbol
    ./include/linux/perf_event.h:1680:22: error: conflicting types for 'perf_instruction_pointer'; have 'long unsigned int(struct perf_event *, struct pt_regs *)'

The above errors arise from conflicts between the core definitions in
`linux/perf_event.h` and the RISC-V-specific definitions in
`arch/riscv/include/asm/perf_event.h`. Removing the RISC-V-specific
definitions resolves these issues and aligns the architecture with the
updated perf core.

Fixes: 2c47e7a74f44 ("perf/core: Correct perf sampling with guest VMs")
Reported-by: Chris Paterson <Chris.Paterson2@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
v1->v2
- Update commit message to say it fixes build issue
- Included RB tag from Andrew
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


