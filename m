Return-Path: <linux-renesas-soc+bounces-22838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369CBCA0A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 18:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B9023A5096
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 16:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D082FD7B9;
	Thu,  9 Oct 2025 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liCXkWYS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291332FD1C6;
	Thu,  9 Oct 2025 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025683; cv=none; b=DH2Kvst/Qj8Q+b1BM7tWuwXaCievS7vql8yH1rn5ZDyOcu9Q44FS4YcQUp8cMLZDRyWu2a7w5EQUCs0bzJ8RuKVBEYLCkYgOnZsTT/mzzX3GLv283mi3o1sypq7POmcz8ZqvcLiGQkYh27TjvlwRQI67y4Q4rDq4v68Yg9lblnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025683; c=relaxed/simple;
	bh=5GQW4BTVVGIA11a77VNxVUsz3AV1PVIa49c3M8dJv14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YXImHOzlgRfGWtHADBh0EJd4n+5+CwOPlbJYY8kThd5iGOcYhzaqGvqt0Zvf9QS2j364gk9Exc7vSHvScLkBFhWrdtlwzvbXg5SQoWWn+TSnnJDtLmcgLIVBvffavhLoeMSXDPwcGvzl06Gvxtu9f2XKmvsS4pRFA7rXAz4lzmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liCXkWYS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EE7C4CEE7;
	Thu,  9 Oct 2025 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025683;
	bh=5GQW4BTVVGIA11a77VNxVUsz3AV1PVIa49c3M8dJv14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=liCXkWYSylS9X0Muas6fekD9KhvPp5AFOu3cK7/pN7eoJZMU44NRvrgXuyUVsL7mD
	 kY+0e4Phc/fAEA5qDlXWfWZJoJsWpVP5LcmBWCI+mfY/WFpbOck6JIA9sVo7mNpk+N
	 Bf708xFUOIKTUxHW3liFewiwu779I+9KEUxayj7W31C6igHhCzLCeOwCFfBfoUWE9S
	 JphmR3oksXO/wQkktRecNOwdovmF7W5u3y6Iz9GbxGJz/NOdpfTBQAwqM9xJBRnwdW
	 Al2apLH43IjgPDJOXQFyfRzsdVrABGa7LGHJnw+fGJrPchLtkN1zetJjIHlXoLQvmx
	 V3sQBw2wk5GPQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	wsa+renesas@sang-engineering.com,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] mmc: host: renesas_sdhi: Fix the actual clock
Date: Thu,  9 Oct 2025 11:56:20 -0400
Message-ID: <20251009155752.773732-114-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

[ Upstream commit 9c174e4dacee9fb2014a4ffc953d79a5707b77e4 ]

Wrong actual clock reported, if the SD clock division ratio is other
than 1:1(bits DIV[7:0] in SD_CLK_CTRL are set to 11111111).

On high speed mode, cat /sys/kernel/debug/mmc1/ios
Without the patch:
clock:          50000000 Hz
actual clock:   200000000 Hz

After the fix:
clock:          50000000 Hz
actual clock:   50000000 Hz

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Link: https://lore.kernel.org/r/20250629203859.170850-1-biju.das.jz@bp.renesas.com
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive analysis of this commit, here is my
assessment:

## Backport Status: **YES**

### Extensive Analysis

#### Bug Description and Impact

The commit fixes an incorrect `actual_clock` reporting bug in the
Renesas SDHI MMC driver that has existed since v5.4 (commit
75eaf49f5d3d8 from 2019).

**The Problem:**
When the SD clock division ratio is not 1:1 (i.e., DIV[7:0] bits in
SD_CLK_CTRL register are not 0xff), the driver incorrectly reports
`actual_clock` as the parent clock frequency instead of the divided
frequency.

From the commit message example:
- Requested: 50 MHz
- Parent clock set to: 200 MHz
- Hardware divider: 1/4 (to get 50 MHz)
- **Bug**: `actual_clock` reports 200 MHz instead of 50 MHz

**Functional Impact Beyond Debugging:**

While this appears to be a debugfs reporting issue, it has **real
functional consequences**. The `actual_clock` value is used in
`drivers/mmc/core/block.c:1056` (`mmc_blk_clock_khz()`) to calculate
timeout values:

```c
if (data->timeout_clks) {
    khz = mmc_blk_clock_khz(host);  // Uses actual_clock
    ms += DIV_ROUND_UP(data->timeout_clks, khz);
}
```

With incorrect `actual_clock` (e.g., 200 MHz instead of 50 MHz),
timeouts are calculated **4x too short**, potentially causing premature
timeout errors and data transfer failures.

#### Code Analysis

**The Hardware Divider Mechanism:**

From commit 0196c8db8363f7 (2018), the SD_CLK_CTRL register DIV[7:0]
bits work as follows:
- `0x80` (bit 7): 1/512 divider
- `0x40` (bit 6): 1/256 divider
- `0x20` (bit 5): 1/128 divider
- ... (each bit represents a power-of-2 division)
- `0x01` (bit 0): 1/4 divider
- `0x00` (all clear): 1/2 divider
- `0xff` (Renesas extension): 1/1 (no division)

**The Fix - Mathematical Verification:**

The fix adds lines 224-226 in `renesas_sdhi_core.c:205`:

```c
clock = clk & CLK_CTL_DIV_MASK;
if (clock != 0xff)
    host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
```

Formula verification for all divider values:
- `clock=0x80`: `ffs(0x80)=8` → `(1<<9)=512` → divides by 512 ✓
- `clock=0x40`: `ffs(0x40)=7` → `(1<<8)=256` → divides by 256 ✓
- `clock=0x01`: `ffs(0x01)=1` → `(1<<2)=4` → divides by 4 ✓
- `clock=0x00`: `ffs(0x00)=0` → `(1<<1)=2` → divides by 2 ✓
- `clock=0xff`: skips division (1:1 ratio) ✓

The formula is **mathematically correct** for all possible hardware
divider configurations.

#### Backporting Criteria Assessment

**Positive Factors:**
1. ✅ **Fixes real functional bug**: Incorrect timeout calculations, not
   just cosmetic
2. ✅ **Small and contained**: Only 3 lines added, affecting one function
3. ✅ **No architectural changes**: Simple calculation fix
4. ✅ **Minimal regression risk**: Mathematically sound, verified formula
5. ✅ **Hardware-specific**: Limited to Renesas SDHI driver (contained
   blast radius)
6. ✅ **No known issues**: No reverts or subsequent fixes (only a cleanup
   commit 5d0702dc9c2f6 replacing magic number with macro)
7. ✅ **Stable in mainline**: Merged August 19, 2025, no problems
   reported

**Considerations:**
- ⚠️ **No explicit Fixes: tag** (though it clearly fixes commit
  75eaf49f5d3d8)
- ⚠️ **No Cc: stable tag**
- ⚠️ **Author couldn't test HS400 mode** (mentioned in lore.kernel.org
  thread)
- ℹ️ **Long-standing bug** (since v5.4, 2019) without major reports
  suggests real-world impact may be limited

**Dependencies:**
- Requires `actual_clock` field (present since v5.4)
- Requires current `renesas_sdhi_set_clock()` structure (present since
  v4.19)
- Should apply cleanly to kernels v5.4+

#### Conclusion

This commit **should be backported** to stable trees (v5.4+) because:

1. It fixes a **functional bug with real-world consequences** (timeout
   calculation errors leading to potential data transfer failures)
2. The fix is **small, simple, and mathematically verified**
3. **Very low regression risk** - the formula correctly implements the
   hardware specification
4. **Confined scope** - only affects Renesas SDHI hardware
5. **Stable in mainline** - no issues found since merge

The absence of Fixes:/Cc:stable tags is not disqualifying given the
clear functional impact and the quality of the fix. The commit already
has been staged for backport (6693c63ffc49e in linux-autosel-6.17),
which is appropriate.

 drivers/mmc/host/renesas_sdhi_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index fb8ca03f661d7..a41291a28e9bd 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -222,7 +222,11 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 			clk &= ~0xff;
 	}
 
-	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clk & CLK_CTL_DIV_MASK);
+	clock = clk & CLK_CTL_DIV_MASK;
+	if (clock != 0xff)
+		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
+
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
 	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
 		usleep_range(10000, 11000);
 
-- 
2.51.0


