Return-Path: <linux-renesas-soc+bounces-23436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D7BFC483
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 15:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C98F96618E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 13:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8072347BBD;
	Wed, 22 Oct 2025 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QthS67Nr";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nuQQfQDw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8452919994F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 13:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140205; cv=none; b=omdO4EVpGV3/aorgsRLpwQqg61rg+LfHBXuNklifQFe8PeZhupnKydmgzgcManOUlZ5ik3DSh0GKR+eKGhJ/WySx+SlxNXjnXChIqp04tUyogm6BDZkuXHsvxcd7AgRpl65gOsSGDeqjkaJ44kiHcCsRR/OL2rc/6Grb/dVcfXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140205; c=relaxed/simple;
	bh=cilz0kob70BRwrrGWiNOyu+i9ybX/JQG22riruUwlF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gyXZsOaCLFtjTXacmNBTxicYGOkTMMAE+a/r7mr0eufJl02+Wq2G2ual8BkAVY/sRemHHKNbIchHeQVQS4eAH9j5qkZZIIg2UbBfwJct1W/ZD9e9P6loWJ4htN48o4sEDWHuuCTWfQF17OlSlWKzLWSY2+PftxE9pT3PVePYfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QthS67Nr; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nuQQfQDw; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cs9Dn2s2sz9tTY;
	Wed, 22 Oct 2025 15:36:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761140201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pSXvFHnsg3gE0TnhtI6deEWwdXcIUCjdU1iFuLYkx6E=;
	b=QthS67NrFA51itYxmyCjrd13ia2jXXgjDANyNqjRbU+K6EzpWkG58KSMtL3VzSCZjNgeXG
	0WCFQJT3G5LQ+xZSH4rWZwtoraurEAJkj9vRRyO8aBbjnAWy8EI1Z8wgd/UoiWbaY82DK/
	Ph3naii/TvfhILosfDjG8zk4Kp4aSfr+nu7Hl28v1kiatWMFGSERVxodZJRwa6OgHjyY7k
	sKGii8Jy+ktQmp/EcOVoCRlTLths6agdrYnJFKXFxVyTOpmq1oH2yIvtyFRbQdVj34O4ga
	9tNkxkucjaX/ITvePg81gCmneOocz1RVOcRjhcJf+ICP+LOYbyuuunlRZ+agCg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=nuQQfQDw;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761140199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pSXvFHnsg3gE0TnhtI6deEWwdXcIUCjdU1iFuLYkx6E=;
	b=nuQQfQDwRj0nrsG0sUOKFHzuJnTWCuDjRvrD4KzqURc/vnh5VedFlhmPlYJWXH1ABEPgcg
	iYCo5IuCfNtImeBJVxGIG3Q2Wm9Gr6UyGRdAJLli4RN1l91U89dsR+SFIdQ8BJOcVmxmwh
	gtBQPsCKMTi3+w9v+wzoR4BDqT0nJxnCThr0EaWaE+oO+JimrR4seuN5dvdi48akSHTM24
	2q/F3q7q9GyJhCJl2QwxXEczB0zH1nVcL4tifgMaS3m82j6+9KRTZZp5Vk/Xfy5aKoYDWR
	jEsDkEyYEj8SCJDu10fkZDPsWYURnxFc894FMKw3bBfiJEOP+0i60GNlVANxnQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
Date: Wed, 22 Oct 2025 15:35:28 +0200
Message-ID: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5qzjs5xwh74r54byqbt4ttz9b7joqbh8
X-MBO-RS-ID: 88e9880ea370458bc62
X-Rspamd-Queue-Id: 4cs9Dn2s2sz9tTY

The AMU configuration register access may fault and prevent successful
kernel boot. This can occur for example in case the firmware does not
allow AMU counter access from EL1. Guard the AMU configuration register
access with ARM64_HAS_AMU_EXTN to prevent this fault if ARM64_HAS_AMU_EXTN
Kconfig option is explicitly disabled. Other interaction with the AMU is
already guarded by similar ifdeffery.

Fixes: 87a1f063464a ("arm64: trap to EL1 accesses to AMU counters from EL0")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/mm/proc.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 86818511962b6..123538ffeda6b 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -145,7 +145,9 @@ SYM_FUNC_START(cpu_do_resume)
 	ubfx	x11, x11, #1, #1
 	msr	oslar_el1, x11
 	reset_pmuserenr_el0 x0			// Disable PMU access from EL0
+alternative_if ARM64_HAS_AMU_EXTN
 	reset_amuserenr_el0 x0			// Disable AMU access from EL0
+alternative_else_nop_endif
 
 alternative_if ARM64_HAS_RAS_EXTN
 	msr_s	SYS_DISR_EL1, xzr
@@ -470,7 +472,9 @@ SYM_FUNC_START(__cpu_setup)
 	mov	x1, MDSCR_EL1_TDCC		// Reset mdscr_el1 and disable
 	msr	mdscr_el1, x1			// access to the DCC from EL0
 	reset_pmuserenr_el0 x1			// Disable PMU access from EL0
+alternative_if ARM64_HAS_AMU_EXTN
 	reset_amuserenr_el0 x1			// Disable AMU access from EL0
+alternative_else_nop_endif
 
 	/*
 	 * Default values for VMSA control registers. These will be adjusted
-- 
2.51.0


