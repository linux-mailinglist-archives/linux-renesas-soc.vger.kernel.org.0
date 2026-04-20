Return-Path: <linux-renesas-soc+bounces-31416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIK7FIQ/5mlutgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:00:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B6042DB39
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A01D0317E047
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 14:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB8F3A7827;
	Mon, 20 Apr 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4sj9cUB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74BD47D95B;
	Mon, 20 Apr 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691864; cv=none; b=MNjgamWXKDnXTyryLi3acjG6z1QB+s7lB5kFwCY6CdBusp86I7OvUshm4TLK21SiZM8mmB/fb+qYmxGiPuBNJg0aDluZqNLGM6UQRps7mOqdCAjRKN295wx8xhkOp2j7xwbXhOQ2EbEuAJZuAUkhDcBCGeYIg11x+pLUWp4nAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691864; c=relaxed/simple;
	bh=p+miuKebyEkDvBVixwjD7RhAs0poaZqjuya0RUreiyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H9fN9hUNGiRV9xu354pSVGRnfB00G004VMTuCFDThwS8P+NsKqDCLg569uM8P+GbrQrAIBxioft/7R5vtPfDP6PLcSx/MQzPor870+eon6MHtpYWGhEUdMyUvyL7Ja/M/C38eSRcQe/FyvKoAC7LfYYq4csgl0Y8O1Ri/h86/To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4sj9cUB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962B3C19425;
	Mon, 20 Apr 2026 13:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691864;
	bh=p+miuKebyEkDvBVixwjD7RhAs0poaZqjuya0RUreiyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H4sj9cUBIYGIpO0Tp+e4swjKrgoQDJ9Q4nssnz5tFcZnWXaqLIQhewLgE0tWiE7NV
	 s4oV36qpFraAA8nObpi76D6laKxxUdTftqQJRNUig0DD9JW/VPXpT9O8Bc4AdkRFVM
	 XhA4QYe2W62i/zEOfha5UcPGIIXl9PIc+6XJOizqFrA2y8Fx+JHX2blwfYdTr2LPMw
	 Err2oFKRSCf9p5939vp81xds/BBHbRWHET/2vH8m95SO5Xdd2DeIDAdb1Kno9UvBc6
	 ADqnGBeAsv4os+U6cOgF05NBH0jHBF1HINcn5gS5Skg6OhHaR0nxN/OJWHdLwf/3KY
	 OJ9VP0iBclnyQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	fabrizio.castro.jz@renesas.com,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0] spi: rzv2h-rspi: Fix max_speed_hz advertising prohibited bit rate
Date: Mon, 20 Apr 2026 09:20:33 -0400
Message-ID: <20260420132314.1023554-239-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31416-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url,renesas.com:email]
X-Rspamd-Queue-Id: 89B6042DB39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

[ Upstream commit 4e292cbf3890657db2f2692942cb0f168c80167e ]

On RZ/V2H(P), RZ/G3E and RZ/G3L, RSPI_n_TCLK is fixed at 200MHz.
The max_speed_hz was computed using clk_round_rate(tclk, ULONG_MAX)
with SPR=0 and BRDV=0, resulting in 100Mbps - the exact combination
prohibited on these SoCs. This could cause the SPI framework to request
a speed that rzv2h_rspi_find_rate_fixed() would skip, potentially
leading to a clock selection failure.

On RZ/T2H and RZ/N2H the max_speed_hz was correctly calculated as
50Mbps for both the variable PCLKSPIn and fixed PCLK clock sources.

Since the maximum supported bit rate is 50Mbps across all supported SoC
variants, replace the clk_round_rate() based calculation with a define
RSPI_MAX_SPEED_HZ set to 50MHz and use it directly for max_speed_hz.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Link: https://patch.msgid.link/20260410080517.2405700-2-prabhakar.mahadev-lad.rj@bp.renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a complete picture. Let me compile the full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `spi: rzv2h-rspi:`
- Action verb: "Fix" - explicit bug fix
- Summary: Fixes max_speed_hz advertising a prohibited bit rate (SPR=0,
  BRDV=0 = 100MHz on fixed-clock SoCs)

**Step 1.2: Tags**
- `Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
  lad.rj@bp.renesas.com>` - Renesas engineer, author
- `Link:
  https://patch.msgid.link/20260410080517.2405700-2-prabhakar.mahadev-
  lad.rj@bp.renesas.com` - patch series (patch 2)
- `Signed-off-by: Mark Brown <broonie@kernel.org>` - SPI subsystem
  maintainer
- No Fixes: tag, no Reported-by:, no Cc: stable (all expected for
  autosel review)

**Step 1.3: Commit Body**
- Bug: On RZ/V2H(P), RZ/G3E and RZ/G3L, RSPI_n_TCLK is fixed at 200MHz.
  With SPR=0, BRDV=0, calc gives 100MHz - a prohibited hardware
  combination. The max_speed_hz was set to 100MHz, so the SPI framework
  could request it.
- Symptom: Clock selection failure when SPI framework requests speed at
  the advertised maximum (100MHz)
- Root cause: `rzv2h_rspi_calc_bitrate(tclk_rate, RSPI_SPBR_SPR_MIN,
  RSPI_SPCMD_BRDV_MIN)` returns 100MHz for 200MHz fixed clock, but
  SPR=0/BRDV=0 is prohibited.
- The fix hardcodes max_speed_hz = 50MHz, matching the actual hardware
  limit across all SoC variants.

**Step 1.4: Hidden Bug Fix**
- This is explicitly labeled as a fix, not disguised.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file changed: `drivers/spi/spi-rzv2h-rspi.c`
- +2 lines (define + assignment), -7 lines (removed computation block)
- Net: -5 lines
- Functions modified: `rzv2h_rspi_probe()` (and one #define added)

**Step 2.2: Code Flow Change**
- Before: `max_speed_hz` computed via `clk_round_rate(tclk, ULONG_MAX)`
  → `rzv2h_rspi_calc_bitrate(tclk_rate, SPR_MIN=0, BRDV_MIN=0)` =
  200MHz/2 = 100MHz
- After: `max_speed_hz = RSPI_MAX_SPEED_HZ` = 50MHz
- The removed code also eliminated error handling for `clk_round_rate`
  return (3 lines) which is no longer needed

**Step 2.3: Bug Mechanism**
- Logic/correctness fix: The advertised maximum speed was 100MHz, but
  SPR=0/BRDV=0 is hardware-prohibited. The
  `rzv2h_rspi_find_rate_fixed()` function at line 536 doesn't reject
  SPR=0/BRDV=0, so requesting 100MHz leads to a prohibited register
  configuration.
- Category: Hardware-specific correctness bug

**Step 2.4: Fix Quality**
- Obviously correct: 50MHz is documented as the max supported speed
  across all variants
- Minimal/surgical: replaces computation with known-correct constant
- Regression risk: Very low - lowering max_speed_hz is always safe
  (slower, not broken)

## PHASE 3: GIT HISTORY

**Step 3.1: Blame**
- The buggy `max_speed_hz = rzv2h_rspi_calc_bitrate(tclk_rate, SPR_MIN,
  BRDV_MIN)` originates from commit `8b61c8919dff08` (original driver,
  v6.17-rc1, 2025-07-04), with `clk_round_rate()` refactor from
  `9c9bf4fdc5e5d0` (v6.19).
- Bug has existed since the driver was added.

**Step 3.2: No Fixes: tag** (expected)

**Step 3.3: File History**
- 21 changes since v6.17. Heavy refactoring occurred in v6.19 cycle
  (variable clock support, DMA, device-managed APIs).

**Step 3.4: Author**
- Lad Prabhakar is a Renesas engineer who regularly contributes to SPI
  and other Renesas drivers. Not the original driver author (Fabrizio
  Castro) but from the same company.

**Step 3.5: Dependencies**
- The link shows this is "patch 2" in a series. However, the fix is
  self-contained: it adds one define and simplifies the probe function.
  No dependency on patch 1 or 3.

## PHASE 4: MAILING LIST

- b4 dig could not find the commit (it hasn't been committed to the tree
  yet as a separate commit).
- The Link: tag points to the patch submission. lore.kernel.org was
  inaccessible due to bot protection.
- The patch was applied by Mark Brown (SPI subsystem maintainer),
  indicating maintainer review.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Modified function: `rzv2h_rspi_probe()`**
- Called during platform device registration for matching Renesas SoCs

**Step 5.2: Callers**
- Called via platform driver `.probe` callback during device boot or
  module load

**Step 5.3: Impact of max_speed_hz**
- `max_speed_hz` is used by the SPI framework to clamp requested speeds.
  If set too high, devices may request unsupported speeds.
- When `rzv2h_rspi_setup_clock()` is called with a speed > 50MHz,
  `find_rate_fixed()` computes SPR=0/BRDV=0 (prohibited) or finds no
  valid combination depending on the exact speed.

**Step 5.5: The calc verification**
- `rzv2h_rspi_calc_bitrate(200000000, 0, 0)` = `DIV_ROUND_UP(200000000,
  (2 * 1 * 1))` = 100000000 = 100MHz
- The 50MHz maximum = `rzv2h_rspi_calc_bitrate(200000000, 1, 0)` =
  `DIV_ROUND_UP(200000000, (2 * 2 * 1))` = 50000000 = 50MHz

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Driver existence**
- Driver first appeared in v6.17-rc1. Applicable to: 6.17.y, 6.18.y (if
  exists), 6.19.y, 7.0.y
- NOT applicable to: 6.12.y, 6.6.y, 6.1.y, 5.15.y, or older

**Step 6.2: Backport complications**
- For 7.0.y: should apply cleanly (current HEAD is v7.0)
- For 6.19.y: should apply cleanly (same `clk_round_rate` code)
- For 6.17.y/6.18.y: code used `clk_get_rate()` instead of
  `clk_round_rate()`, would need minor adaptation

## PHASE 7: SUBSYSTEM CONTEXT

- Subsystem: `drivers/spi/` - SPI bus driver for specific Renesas
  hardware
- Criticality: PERIPHERAL - affects Renesas RZ/V2H(P), RZ/G3E, RZ/G3L,
  RZ/T2H, RZ/N2H SoC users
- Active subsystem with regular development

## PHASE 8: IMPACT AND RISK

**Step 8.1: Affected population**
- Users of Renesas RZ/V2H(P), RZ/G3E, RZ/G3L SoCs (embedded/IoT
  systems). The RZ/T2H and RZ/N2H already correctly computed 50MHz as
  noted in the commit message.

**Step 8.2: Trigger conditions**
- Triggered when an SPI device requests exactly 100MHz speed (the
  advertised maximum), or more precisely when the framework attempts to
  configure SPR=0/BRDV=0.

**Step 8.3: Failure mode**
- Hardware clock selection failure → SPI transfer fails → device
  communication failure
- Severity: MEDIUM (functionality broken for affected transfers, but
  only at specific high speeds)

**Step 8.4: Risk-benefit ratio**
- BENEFIT: Medium - prevents SPI clock misconfiguration on specific SoCs
- RISK: Very low - replaces dynamic computation with safe constant, -5
  lines net, no behavior change for normal speeds
- Ratio: Favorable

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
- Explicit bug fix ("Fix" in subject)
- Prevents hardware-prohibited register configuration (SPR=0/BRDV=0)
- Small, surgical change (+2/-7 lines)
- Obviously correct (50MHz documented as hardware max)
- Applied by subsystem maintainer Mark Brown
- No regression risk (lowering max_speed is always safe)
- Self-contained, no dependencies

**Evidence AGAINST backporting:**
- Affects only specific Renesas SoCs (narrow user base)
- Bug only triggered at exact 100MHz speed request (not easily triggered
  in practice)
- Driver is very new (v6.17+, late 2025), limited to recent stable trees
- No Reported-by (no evidence of users hitting this in practice)

**Stable Rules Checklist:**
1. Obviously correct and tested? YES - hardcoded constant matching
   documented max
2. Fixes a real bug? YES - advertising prohibited speed
3. Important issue? MEDIUM - clock selection failure, but narrow trigger
4. Small and contained? YES - 2 lines added, 7 removed, single file
5. No new features? Correct - no new features
6. Can apply to stable? YES for 7.0.y and 6.19.y

---

**Verification:**
- [Phase 1] Parsed tags: Signed-off-by from Renesas engineer and Mark
  Brown (SPI maintainer), Link to patch submission
- [Phase 2] Diff analysis: +2/-7 lines in `rzv2h_rspi_probe()`, replaces
  dynamic max_speed_hz calc with RSPI_MAX_SPEED_HZ=50MHz
- [Phase 2] Verified calc: `rzv2h_rspi_calc_bitrate(200000000, 0, 0)` =
  100MHz (prohibited)
- [Phase 2] Verified fix: `rzv2h_rspi_find_rate_fixed()` line 536 does
  NOT reject SPR=0/BRDV=0, confirming the bug
- [Phase 3] git blame: buggy code from `8b61c8919dff08` (v6.17-rc1,
  2025-07-04), refactored in `9c9bf4fdc5e5d0` (v6.19)
- [Phase 3] git tag --contains: driver first in v6.17-rc1, variable
  clock in v6.19
- [Phase 3] git log: 21 changes since v6.17, active development
- [Phase 3] Author check: Prabhakar is a Renesas engineer with multiple
  SPI contributions
- [Phase 4] b4 dig: Could not find mainline commit (not yet committed).
  Lore inaccessible.
- [Phase 5] Verified call chain: `rzv2h_rspi_probe` → sets
  `max_speed_hz` → SPI framework uses for speed clamping
- [Phase 6] Driver exists in v6.17+ only. Not applicable to older stable
  trees.
- [Phase 8] Failure mode: SPI clock selection failure for prohibited
  speed, severity MEDIUM
- UNVERIFIED: Could not access lore.kernel.org to check review
  discussion or whether other patches in the series are needed

This is a small, correct bug fix for a driver-level issue that prevents
advertising a hardware-prohibited bit rate. The fix is safe (just caps
max speed at the documented limit) and self-contained. It meets stable
kernel criteria for trees containing this driver (v6.17+).

**YES**

 drivers/spi/spi-rzv2h-rspi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index 23f0e92ae208e..15270f19c69c1 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -77,6 +77,8 @@
 
 #define RSPI_RESET_NUM		2
 
+#define RSPI_MAX_SPEED_HZ	50000000
+
 struct rzv2h_rspi_best_clock {
 	struct clk *clk;
 	unsigned long clk_rate;
@@ -771,13 +773,7 @@ static int rzv2h_rspi_probe(struct platform_device *pdev)
 							   RSPI_SPBR_SPR_MAX,
 							   RSPI_SPCMD_BRDV_MAX);
 
-	tclk_rate = clk_round_rate(rspi->tclk, ULONG_MAX);
-	if (tclk_rate < 0)
-		return tclk_rate;
-
-	controller->max_speed_hz = rzv2h_rspi_calc_bitrate(tclk_rate,
-							   RSPI_SPBR_SPR_MIN,
-							   RSPI_SPCMD_BRDV_MIN);
+	controller->max_speed_hz = RSPI_MAX_SPEED_HZ;
 
 	controller->dma_tx = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(controller->dma_tx)) {
-- 
2.53.0


