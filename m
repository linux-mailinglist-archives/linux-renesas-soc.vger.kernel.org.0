Return-Path: <linux-renesas-soc+bounces-3084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B03F85F34B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 09:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ACDB1C20FC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 08:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DD8364B3;
	Thu, 22 Feb 2024 08:42:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F8236102;
	Thu, 22 Feb 2024 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708591326; cv=none; b=oYHjMAvyzeYsvwHLMuShrby8JDtHEoFeBSaBXLWtjTjuTxA6gnHJrn6iAPFhtANxA26J6jRCbO/jfMLq+E2P+PiQ9WTE9dVbWFccBhqskphD7HfkuXKT+7jnUWeifJPJKIDvp27Ir/fnzcKeqhmToASLkr6MYKRsQEnGQMylvw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708591326; c=relaxed/simple;
	bh=uljTOuzXt+KrJZAyFNxhQO6u9YyvVKbJNV18W80R9+U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j5otVgRvkiilm0XTPwZHyPeKEL2iOEA4RtpATTbrFI87qnpewakorLhSoi/3WTJj8W3xMUZ1PvGUKFizxLut3GEWcuQ4wLbiCs18LNuYN3k5db1JFlgN3Z/Z5hirzfVmK9fZXoJW20mDkrYTo7E7+JqW1l2MWpy6Ekldsnhlt7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 41M8eXLD074713;
	Thu, 22 Feb 2024 16:40:33 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 22 Feb 2024
 16:40:29 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
        <alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
        <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
        <atishp@atishpatra.org>, <conor+dt@kernel.org>,
        <conor.dooley@microchip.com>, <conor@kernel.org>,
        <devicetree@vger.kernel.org>, <evan@rivosinc.com>,
        <geert+renesas@glider.be>, <guoren@kernel.org>, <heiko@sntech.de>,
        <irogers@google.com>, <jernej.skrabec@gmail.com>, <jolsa@kernel.org>,
        <jszhang@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
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
        <will@kernel.org>, <inochiama@outlook.com>, <unicorn_wang@outlook.com>,
        <wefu@redhat.com>
Subject: [PATCH v9 08/10] dt-bindings: riscv: Add Andes PMU extension description
Date: Thu, 22 Feb 2024 16:39:44 +0800
Message-ID: <20240222083946.3977135-9-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222083946.3977135-1-peterlin@andestech.com>
References: <20240222083946.3977135-1-peterlin@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 41M8eXLD074713

Document the ISA string for Andes Technology performance monitor
extension which provides counter overflow interrupt and mode
filtering mechanisms.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Changes v2 -> v3:
  - New patch
Changes v3 -> v4:
  - Include Conor's Acked-by
Changes v4 -> v5:
  - Include Prabhakar's Reviewed-by
Changes v5 -> v6:
  - No change
Changes v6 -> v7:
  - No change
Changes v7 -> v8:
  - No change
Changes v8 -> v9:
  - No change
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 63d81dc895e5..468c646247aa 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,5 +477,12 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        - const: xandespmu
+          description:
+            The Andes Technology performance monitor extension for counter overflow
+            and privilege mode filtering. For more details, see Counter Related
+            Registers in the AX45MP datasheet.
+            https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
+
 additionalProperties: true
 ...
-- 
2.34.1


