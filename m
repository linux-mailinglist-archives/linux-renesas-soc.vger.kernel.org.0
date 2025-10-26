Return-Path: <linux-renesas-soc+bounces-23607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE77C0ABA0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 15:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2B253B431B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 14:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8B32EA729;
	Sun, 26 Oct 2025 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vK6tBgXr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34272EA169;
	Sun, 26 Oct 2025 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761490292; cv=none; b=EP9MmyRNrhWyxkyHffJ+896COlq61GDeFuOIPb92LipZMpfiEfKnNCw8lLIOG7KiDFX6Dy8dtNxzOqbXlwPvXacbAPx+2giXzqt6rbi2Prz0C/+wyoN0U9D4KI6kChwFFF03sxvDWNJhLXmHeZDVj5SimBr+OBGzKVRtnaSm21U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761490292; c=relaxed/simple;
	bh=tTi4MHzT88X6XVu0HEP++yMrgXZ8vt0/1lW2TgRQeKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GyhxGYcwTn4vno6tlBx1Z2g1lboJuORFC58SQseNfJJ5Mx4FHgoRR1ZKpmtSnz/vyyEE8CXVFJQRLiKKX4+i6qS56QSs2y28x5dUlRkwyVycePEIxIBc8b7YSJzZyEtQWFnIb5lkhtNuYUQYnTZtPGAiV1sbQOFm5niV7VSLb20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vK6tBgXr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07E8C4CEE7;
	Sun, 26 Oct 2025 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490292;
	bh=tTi4MHzT88X6XVu0HEP++yMrgXZ8vt0/1lW2TgRQeKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vK6tBgXrWXQ8s986+u/jHxk/R5bY1yGlITMbv639WelsVd5fKnxWobuk2XzqxEbzf
	 xLwnb+t8UNJzz2LJw6/pJqLICbuoACShQWGwdDXDC2q4y5cMJYJHl0LkvcANuJUh5H
	 7J+WeVI8klb1SVnXQvgZcP4rOKbZvAfc6PIbGGqVqQCU/ceT+WhKiMzcNiRBSqJ9iC
	 eGeVYJY3Gx2MoK8FIkGZYWQY2BlCitjXdvi6+eM5VyMYxJqXnrhYoMCP7CHkco4NMi
	 iU7g2tgsw9NbZFzrNaQ/FmYKuNv51+frWouX7z2GlDUwcQBQM0JjloTKKSUDGEOata
	 /lY9roVPT5zEA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sasha Levin <sashal@kernel.org>,
	p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] clk: renesas: rzv2h: Re-assert reset on deassert timeout
Date: Sun, 26 Oct 2025 10:49:22 -0400
Message-ID: <20251026144958.26750-44-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

[ Upstream commit f8c002165ca27d95d3d15e865dd0a47c0a1b14dd ]

Prevent issues during reset deassertion by re-asserting the reset if a
timeout occurs when trying to deassert. This ensures the reset line is in a
known state and improves reliability for hardware that may not immediately
clear the reset monitor bit.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Link: https://lore.kernel.org/20250903082757.115778-4-tommaso.merciai.xr@bp.renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive analysis, I'll now provide my final
recommendation.

## **Backport Recommendation: YES**

### **Summary**

This commit improves hardware reliability by adding defensive error
handling to the reset controller for Renesas RZ/V2H/RZ/V2N/RZ/G3E SoCs.
While it's a preventive fix rather than addressing a specific user-
reported bug, it should be backported to stable kernels due to its
critical nature and minimal risk.

---

### **Detailed Analysis**

#### **1. What the Code Changes Do**

The commit modifies the `__rzv2h_cpg_assert()` function in
`drivers/clk/renesas/rzv2h-cpg.c` (lines 869-876):

**Before:**
```c
return readl_poll_timeout_atomic(priv->base + reg, value,
                 assert ? (value & mask) : !(value & mask),
                 10, 200);
```

**After:**
```c
ret = readl_poll_timeout_atomic(priv->base + reg, value,
                 assert ? (value & mask) : !(value & mask),
                 10, 200);
if (ret && !assert) {
    value = mask << 16;
    writel(value, priv->base +
GET_RST_OFFSET(priv->resets[id].reset_index));
}

return ret;
```

**What this does:**
- When attempting to **deassert** a reset (bring hardware out of reset),
  the code polls a monitor register with a 200µs timeout
- **NEW BEHAVIOR**: If the timeout occurs during deassert (`ret != 0`
  and `!assert`), the code now **re-asserts** the reset by writing `mask
  << 16` (which clears the bit)
- This ensures the hardware is returned to a **known state** (reset
  asserted) rather than being left in an undefined state

#### **2. Driver Context and Timeline**

- **v6.12 (Aug 2024)**: RZ/V2H CPG driver introduced (commit
  36932cbc3e6cc)
- **v6.16 (March 2025)**: Code refactored to create
  `__rzv2h_cpg_assert()` helper function (commit b224c42568bc4)
- **v6.18-rc1 (Sept 2025)**: This fix applied (commit f8c002165ca27)

The driver is relatively new but has been actively developed with 36+
commits between introduction and this fix.

#### **3. Technical Impact**

**Problem being solved:**
According to the commit message and mailing list discussion, some
hardware may not immediately clear the reset monitor bit. Without this
fix:
- Timeout during reset deassertion leaves hardware in **undefined
  state** (partially out of reset)
- Can lead to **hardware malfunction** or **instability**
- No recovery mechanism exists

**With this fix:**
- Hardware is returned to **known reset state** on timeout
- Improves **reliability** for slow-responding hardware
- Enables proper error recovery

#### **4. Risk Assessment**

**Very Low Risk:**
- ✅ Only adds code to **error path** (when timeout occurs)
- ✅ **No changes** to normal operation (when reset succeeds)
- ✅ Only 10 lines of code added
- ✅ Same pattern successfully used in `rzg2l-cpg.c` driver (commit
  f8c5f0dc77d86)
- ✅ Reviewed by Geert Uytterhoeven (Renesas maintainer)
- ✅ No functional dependencies beyond the driver itself

#### **5. Affected Hardware**

This fix affects the reset controller for:
- Renesas RZ/V2H (r9a09g057) SoC
- Renesas RZ/V2N (r9a09g056) SoC
- Renesas RZ/G3E (r9a09g047) SoC

These are industrial/embedded SoCs used in:
- Industrial automation
- Camera systems
- Edge computing devices

Reset controller failures can cause:
- Device initialization failures
- System instability
- Hardware lockups

#### **6. Backporting Considerations**

**For stable kernels v6.16+ and v6.17:**
- Can apply cleanly (has `__rzv2h_cpg_assert()` function from commit
  b224c42568bc4)

**For stable kernels v6.12-v6.15:**
- Would require adaptation to apply to `rzv2h_cpg_deassert()` function
  directly
- The older code structure (before refactoring) had separate functions
- Fix is still applicable but needs modification

**Code before refactoring (v6.12-v6.15) at
drivers/clk/renesas/rzv2h-cpg.c:**
```c
static int rzv2h_cpg_deassert(struct reset_controller_dev *rcdev,
                              unsigned long id)
{
    ...
    return readl_poll_timeout_atomic(priv->base + reg, value,
                                     !(value & mask), 10, 200);
}
```

Would need to change to:
```c
static int rzv2h_cpg_deassert(struct reset_controller_dev *rcdev,
                              unsigned long id)
{
    ...
    ret = readl_poll_timeout_atomic(priv->base + reg, value,
                                     !(value & mask), 10, 200);
    if (ret) {
        unsigned int reset_reg =
GET_RST_OFFSET(priv->resets[id].reset_index);
        u32 reset_mask = BIT(priv->resets[id].reset_bit);
        writel(reset_mask << 16, priv->base + reset_reg);
    }
    return ret;
}
```

#### **7. Why This Should Be Backported**

**Meets stable kernel criteria:**
1. ✅ **Fixes important bug**: Prevents hardware undefined state
2. ✅ **Small and self-contained**: Only 10 lines
3. ✅ **Low regression risk**: Only affects error path
4. ✅ **Critical subsystem**: Reset controller is fundamental
5. ✅ **Improves reliability**: Defensive programming for hardware quirks

**Additional factors:**
- Identical pattern used in rzg2l driver indicates this is a
  **systematic issue** across Renesas clock drivers
- Reset controller failures are **difficult to debug** in the field
- Industrial/embedded users need **maximum reliability**
- No side effects or architectural changes

#### **8. Caveats**

**Note:** This commit does NOT have:
- `Cc: stable@vger.kernel.org` tag
- `Fixes:` tag pointing to a specific buggy commit

This suggests the **author did not explicitly request stable backport**.
However, the technical merits (critical subsystem, low risk, clear
improvement) support backporting despite the lack of explicit request.

---

### **Conclusion**

**Recommendation: YES - Backport to stable kernels v6.16+ and v6.17**

This is a **defensive fix** that prevents potential hardware failures in
reset controller operations. While not fixing a specific reported bug,
it addresses a **real hardware reliability issue** with **minimal risk**
and clear benefit. The reset controller is a **critical subsystem**
where failures can cause system-wide instability.

**For kernels v6.12-v6.15**: Consider backporting with adaptation if
there's evidence of reset timeout issues in the field for these SoCs,
otherwise optional.

**For kernels v6.16+**: Strongly recommend backporting - applies cleanly
and provides important reliability improvement.

 drivers/clk/renesas/rzv2h-cpg.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index f468afbb54e2d..5dfe660d13422 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -864,6 +864,7 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 	u32 mask = BIT(priv->resets[id].reset_bit);
 	u8 monbit = priv->resets[id].mon_bit;
 	u32 value = mask << 16;
+	int ret;
 
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
 		assert ? "assert" : "deassert", id, reg);
@@ -875,9 +876,15 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 	reg = GET_RST_MON_OFFSET(priv->resets[id].mon_index);
 	mask = BIT(monbit);
 
-	return readl_poll_timeout_atomic(priv->base + reg, value,
-					 assert ? (value & mask) : !(value & mask),
-					 10, 200);
+	ret = readl_poll_timeout_atomic(priv->base + reg, value,
+					assert ? (value & mask) : !(value & mask),
+					10, 200);
+	if (ret && !assert) {
+		value = mask << 16;
+		writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index));
+	}
+
+	return ret;
 }
 
 static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
-- 
2.51.0


