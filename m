Return-Path: <linux-renesas-soc+bounces-20008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1F1B1B460
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 15:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 959C218A44B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 13:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E432737FA;
	Tue,  5 Aug 2025 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPiPLX6C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58583271A9A;
	Tue,  5 Aug 2025 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399476; cv=none; b=edlrWMN7W2yfn91N3dMkTkEQqTmJseheDuuzWvyRYLWdCQ4ozzAkTI3C8a5afilur18PfQKwJ5LYS/rm9icPO76UkgNTKA/6vpN6iLcyze3q9dwuH8WlT/uOe0D6LRYKYVg79bltkjicdcRaraMnfAc69Pi6brSlelCegzWDkQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399476; c=relaxed/simple;
	bh=fzM22NNYKBHcQXd2Lt8k68FlPhKjT9XZzR42GkvN4+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UF/xksm8TbEG/2PzkHNPZjKk8LymDPlSL5VwCE/VHZ43Wg4YTywSC0xDV2XTbSsX3X/S5auY7SVoNt+hHxtZWEupdWDQKiyN4C8SRfOeH/0W1UuF3uAq8YlKeZqfDrmWVaE1yPujlI/diMGx25BhDDSQBIAbS24D3I+ixt/s6XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPiPLX6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2D3C4CEF7;
	Tue,  5 Aug 2025 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399475;
	bh=fzM22NNYKBHcQXd2Lt8k68FlPhKjT9XZzR42GkvN4+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kPiPLX6CKsQZEnvX/altmzt+ve9KLD873FiPESG6mbN/BzGUbtkzVUkzQl4dzeAb2
	 x6zATDASSlg0IYZz3VMwrG0op7vfIWI/SiRPZUc8yADyVfloA01MpYGpEcRTIAGTRF
	 WVUdhF0LezCUG9bI3FK9leK5EF3NVO1ooSjUXUH/MXh6Rg1AXx5sZ2zIICyMrfQlTV
	 thV93py1Gbv88+EjOFJEJ380BuCSCyFLw0k3pHvbXQrUuBgZLzx49rCnv489bseu4y
	 n7pIEcHqE7nooq/AxjXSpYuCG3hIKKgpbdjug1PlIdilt111PD1Jb4BYc4EGC+023u
	 5nj7sE0/uvOGQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sasha Levin <sashal@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-6.12] clk: renesas: rzg2l: Postpone updating priv->clks[]
Date: Tue,  5 Aug 2025 09:09:16 -0400
Message-Id: <20250805130945.471732-41-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

[ Upstream commit 2f96afdffad4ef74e3c511207058c41c54a2d014 ]

Since the sibling data is filled after the priv->clks[] array entry is
populated, the first clock that is probed and has a sibling will
temporarily behave as its own sibling until its actual sibling is
populated. To avoid any issues, postpone updating priv->clks[] until after
the sibling is populated.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/20250514090415.4098534-2-claudiu.beznea.uj@bp.renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit fixes a legitimate race condition bug in the Renesas RZ/G2L
clock driver that affects coupled clock handling. Here's my detailed
analysis:

## Bug Description
The commit fixes a timing issue where `priv->clks[id]` was being
populated BEFORE the sibling relationship was established for coupled
clocks. This creates a race condition window where:

1. When the first coupled clock is registered, it gets added to
   `priv->clks[]` immediately
2. The `rzg2l_mod_clock_get_sibling()` function iterates through
   registered clocks looking for siblings
3. If the first clock looks for its sibling before the sibling is
   registered, it will find itself (since it's already in
   `priv->clks[]`)
4. This causes the clock to temporarily act as its own sibling until the
   actual sibling is registered

## Impact Analysis
- **User-visible bug**: Yes - This can cause incorrect clock behavior
  for coupled clocks (e.g., AXI and CHI clocks that share control bits)
- **Data corruption potential**: Possible - Incorrect clock handling
  could lead to hardware state inconsistencies
- **Security impact**: Low - No direct security implications
- **Regression risk**: Minimal - The fix simply reorders operations
  without changing logic

## Fix Characteristics
The fix is:
- **Small and contained**: Only 4 lines moved within the same function
- **Low risk**: Simply postpones updating `priv->clks[id]` until after
  sibling setup
- **Clear improvement**: Eliminates a race condition window
- **No new features**: Pure bugfix
- **No architectural changes**: Just reordering of operations

## Stable Kernel Criteria
This commit meets stable kernel backporting criteria because it:
1. Fixes a real bug that affects users (coupled clock handling race
   condition)
2. Is minimal and self-contained (4-line change)
3. Has low regression risk (simple reordering)
4. Fixes incorrect hardware state handling
5. Has been reviewed by subsystem maintainer (Geert Uytterhoeven)

The coupled clocks feature was introduced in commit 32897e6fff19 (Sep
2021), so this fix would be relevant for any stable kernel that includes
that feature. The bug has existed since the coupled clocks support was
added, making this an important fix for stable kernels using RZ/G2L
SoCs.

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a8628f64a03b..c87ad5a972b7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1389,10 +1389,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		goto fail;
 	}
 
-	clk = clock->hw.clk;
-	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
-	priv->clks[id] = clk;
-
 	if (mod->is_coupled) {
 		struct mstp_clock *sibling;
 
@@ -1404,6 +1400,10 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		}
 	}
 
+	clk = clock->hw.clk;
+	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
+	priv->clks[id] = clk;
+
 	return;
 
 fail:
-- 
2.39.5


