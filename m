Return-Path: <linux-renesas-soc+bounces-26814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20277D23481
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 09:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A66A300719A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 08:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B0033E371;
	Thu, 15 Jan 2026 08:51:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF1B33507D;
	Thu, 15 Jan 2026 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768467110; cv=none; b=fCkBQqm7b5YNWpMUGZ50CqZxOgGGc3XTPZSs/U8kLbuLYHb+OdqGDKQ8+PCaSVo4O7E1Mkpxv9gPG+qjlgFC3pZyj+URfMrJu/scp/flYkiFBKgAXWsU32BkC23fVy51mlPC7BYy9YVJWtHunmb+MzOWxAIO3Pw6UjXvIECriBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768467110; c=relaxed/simple;
	bh=DulTbpl6Bf8gD9DhBYjgvV+p3x/9NniUJVhpNRY4uko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jU5P0/MocNXvfKOFF0G/Yn5xsY7JuhGOZm/SU2uAH9pNj7YJLNtzMQ4kCEmt99xfxmGHOmfPMycAyfVTdmP6fdsuFjGGqbY2Xbt6mid2mGxxvYhD/6VJCOqVNi0XJ857R0IlTD89diRGuTCbw6gg0YTyQOfJ3U5DvQfw+JWSfVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD87FC116D0;
	Thu, 15 Jan 2026 08:51:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lifeng Zheng <zhenglifeng1@huawei.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: topology: Do not warn on missing AMU in cpuhp_topology_online()
Date: Thu, 15 Jan 2026 09:51:45 +0100
Message-ID: <a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_CPUMASK_OFFSTACK is not enabled, and resuming from s2ram on
Renesas R-Car H3 (big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), during
enabling of the first little core, a warning message is printed:

    AMU: CPU[4] doesn't support AMU counters

This confuses users, as during boot amu_fie_setup() does not print such
a message, unless debugging is enabled (freq_counters_valid() prints
"CPU%d: counters are not supported.\n" at debug level in that case).

Hence drop the warning, freq_counters_valid() has already printed a
debug message anyway.

Fixes: 6fd9be0b7b2e957d ("arm64: topology: Handle AMU FIE setup on CPU hotplug")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/kernel/topology.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 539b3893518281ec..3fe1faab03620e78 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -332,7 +332,6 @@ static int cpuhp_topology_online(unsigned int cpu)
 	 * may use different source of the freq scale.
 	 */
 	if (!freq_counters_valid(cpu)) {
-		pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
 		topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
 						 policy->related_cpus);
 		cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);
-- 
2.43.0


