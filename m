Return-Path: <linux-renesas-soc+bounces-28273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ma+D+a9k2l78AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 02:01:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C82AE148578
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 02:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A894F300827D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 01:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88883231836;
	Tue, 17 Feb 2026 01:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFlKrI5R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651FA22541B;
	Tue, 17 Feb 2026 01:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771290082; cv=none; b=QLLsA2LbFjezeRXgzKrWYhJbd3KCawG/P7LXS7fTZyxZ1l/OPHhQ8NAAnKqmihLaR7CCmRbbVnWYDLmmo+d9G4Tz9C8fGbeaAYuLxILy25hqQvVyJQHkPgftg1VwfH4wlnQtST6bIGN6s4qELWotsR/iefw1D52Maa0USRyvBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771290082; c=relaxed/simple;
	bh=aBlsoCKqIY1rr8x2s305PSeMwbnfVD32M/6FirNmeEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWbPdO3Y7WTYwylJ0Om6Zt3CsjI56XBQ+9heNrcRiZ4pGsO+TPcGKFGl0cp6PJ55BRYtGHiF/gNZZBzJfCBDL3mDHCnIJqdPYt2MD3vrccokBgcjxo4AN1WJ5v326p3gcbi2M+akCzi2Vz+KBGCcv/9IqcuFB9qHmjXXJOoJOY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFlKrI5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30749C19423;
	Tue, 17 Feb 2026 01:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771290082;
	bh=aBlsoCKqIY1rr8x2s305PSeMwbnfVD32M/6FirNmeEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eFlKrI5RgHc+GLaQTN75d4zO4QH9zfsjTvHGYxwkRrTnQC1XWsZ5DY5b5bz8oIkJk
	 dhHYC7j3wI0RfDGvjjgb7Zn6LWjrWjp+GmBWwvtWrhllyeQzX2WH+N1WHLufX6K1xr
	 ss07hXcYY3M1T8N22j4HMdV0ZZoosm0XJk9QLpOn0Tb9g78p9S/wvZRaa9EO3ZxQkw
	 36/YFAEi9vXNeJGf8hnlnTc/dCyCfRHDhPMKy+0WoTw2NslUwQB+yf7C7MxY0xGpQT
	 5OlWL0d1ypQhQudNn15eRJldiX4M4xiGeGX/t0OSy5Q0JM/RxGj9WDVV7BhhwB6iCb
	 yQLU1etBUSu6Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.18] clk: renesas: rzg2l: Deassert reset on assert timeout
Date: Mon, 16 Feb 2026 20:01:13 -0500
Message-ID: <20260217010118.3503621-2-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260217010118.3503621-1-sashal@kernel.org>
References: <20260217010118.3503621-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-28273-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C82AE148578
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

[ Upstream commit 0b0201f259e1158a875c5fd01adf318ae5d32352 ]

If the assert() fails due to timeout error, set the reset register bit
back to deasserted state. This change is needed especially for handling
assert error in suspend() callback that expect the device to be in
operational state in case of failure.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://patch.msgid.link/20260108123433.104464-2-biju.das.jz@bp.renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The suspend/resume directly in this driver doesn't call assert. The
commit message mentions "suspend() callback" — this likely refers to
peripheral device drivers that use reset_control_assert() during their
own suspend callbacks, which then calls `rzg2l_cpg_assert()` through the
reset_control_ops.

## Summary of Analysis

### What the commit fixes:
1. **Variable shadowing bug**: `readl_poll_timeout_atomic` overwrites
   `value`, which is then needed for the error recovery path. The patch
   introduces a separate `mon` variable for the poll output, keeping
   `value` intact.
2. **Missing error recovery on assert timeout**: The original code only
   rolls back on deassert failure. If assert fails (e.g., during
   suspend), the device is left in an asserted (reset) state with no
   recovery, making the device non-operational even though the suspend
   callback returns an error. The fix uses `value ^= mask` to undo
   either direction of the operation.

### Dependencies:
This commit has **hard dependencies** on two v6.18 commits:
- `341b0f1b6cba5` - introduces `__rzg2l_cpg_assert()` helper
- `f8c5f0dc77d86` - introduces the deassert-only rollback code that this
  commit modifies

Without these two prerequisite commits, the patch cannot apply to any
stable tree older than v6.18.

### Risk Assessment:
- **Scope**: Small, contained change in one function (~10 lines changed)
- **Risk**: Low — only affects error paths in Renesas RZ/G2L clock/reset
  driver
- **Correctness**: The XOR approach is elegant and correct for both
  assert and deassert cases
- **Review**: Has "Reviewed-by: Geert Uytterhoeven" (Renesas clk
  subsystem maintainer)

### Stable Tree Applicability:
The fix only applies to v6.18.y since its prerequisites were merged in
v6.18-rc1. For older stable trees (6.12.y, 6.6.y, etc.), the code
structure is completely different (separate functions, no rollback
logic), so this specific bug doesn't exist there.

## Verification

- **git log master** showed the prerequisite commits 341b0f1b6cba5 and
  f8c5f0dc77d86 are only in v6.18+
- **git tag --contains** confirmed both prerequisites are in v6.18-rc1+,
  not in any earlier release
- **git show v6.12:drivers/clk/renesas/rzg2l-cpg.c** confirmed older
  stable trees have separate assert/deassert functions without the
  `__rzg2l_cpg_assert()` helper and without any error rollback logic
- **Read of current file** confirmed the code matches the "before" state
  of the diff
- **Code analysis** verified the XOR-based rollback logic is correct:
  when asserting, `value = mask << 16` (no lower mask), XOR with mask
  adds it → deasserts; when deasserting, `value = (mask << 16) | mask`,
  XOR with mask removes it → re-asserts
- **Variable shadowing confirmed**: `readl_poll_timeout_atomic` modifies
  the `value` parameter in-place, so using it for both the initial write
  value and poll output is a real bug (though in practice the old code's
  `if (ret && !assert)` branch reassigned `value`, masking the issue for
  deassert)

## Decision

This is a legitimate bug fix that:
1. Fixes a real issue where assert failure during suspend leaves
   hardware in a non-operational state
2. Also fixes a variable shadowing bug (reusing `value` for two
   different purposes)
3. Is small, contained, reviewed by the subsystem maintainer
4. Meets stable kernel criteria

However, it has hard dependencies on two refactoring/feature commits
from v6.18 that are not in any current stable tree. The only applicable
stable tree would be 6.18.y. Given that this is a genuine fix for an
error recovery path that matters during suspend/resume, and it's
applicable to 6.18.y, it should be backported.

**YES**

 drivers/clk/renesas/rzg2l-cpg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 64d1ef6e4c943..c20ea1212b360 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1647,6 +1647,7 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	u32 mask = BIT(info->resets[id].bit);
 	s8 monbit = info->resets[id].monbit;
 	u32 value = mask << 16;
+	u32 mon;
 	int ret;
 
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
@@ -1667,10 +1668,10 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 		return 0;
 	}
 
-	ret = readl_poll_timeout_atomic(priv->base + reg, value,
-					assert == !!(value & mask), 10, 200);
-	if (ret && !assert) {
-		value = mask << 16;
+	ret = readl_poll_timeout_atomic(priv->base + reg, mon,
+					assert == !!(mon & mask), 10, 200);
+	if (ret) {
+		value ^= mask;
 		writel(value, priv->base + CLK_RST_R(info->resets[id].off));
 	}
 
-- 
2.51.0


