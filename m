Return-Path: <linux-renesas-soc+bounces-22837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EC4BC9F42
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 18:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41A414FD9BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 16:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1817F2EDD62;
	Thu,  9 Oct 2025 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8jYx6GJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E194A205E25;
	Thu,  9 Oct 2025 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025500; cv=none; b=AyqT/3TjUN6Cz1CsL++sUnZQFwrplk7oZlYYsCLgNYfJ64d1fgfqcKc5COwY03Q6WavgvB7zDR0mc3YwuaTwv8e6vElWierlFXZ4QyLSgkC1y7HTDn3C4bG19VDasxP5jYlxBWe5VdHI5JcyiyfDsjsqhnAFZHa/I6EMchbvPYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025500; c=relaxed/simple;
	bh=ZdYtTT8vgPBSyoT1JT9Zmani2NF7yqTrLJhHnDSg+og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=anMwzzcnAI2HDKuu9O6uyLV28YkZ2ai8ZMDVVLAznv4h82tlVmzEID47ggTHfDffhtjsqpBylV1E7EyePs4V/sa5ksoj06y+kiCfjcgiOHUfgdJFBItz1iJQoLIhezOFFi8i57AInLoMpj/EJQQGYcFs0KKAcPrpHW697vfSjhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8jYx6GJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1912C4CEE7;
	Thu,  9 Oct 2025 15:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025499;
	bh=ZdYtTT8vgPBSyoT1JT9Zmani2NF7yqTrLJhHnDSg+og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L8jYx6GJhMl/IBc2nsjzA+J04KU1aFyzf2grz5XliBszwMZ0qeBeJmee4aoWpf93Q
	 kIVcfnis5ZWijz+jPDrdmgkDm0ouXPcWRpBz5WrgoWhlqbndhuJJjsG+Lj3XFOG8sN
	 NZNLqyRurSNQ8QI64xxQQKdt4ad/wrth6ocu0IOPrnHoUoGuQe8eLEouISbrmPBbAZ
	 oH0/Jj61y5elGe3Q7iJCSDS+cjiTxhtli3F6TR4Hvq1/bY7WZmEdGxK80j99Fehh5V
	 jGqaoEhdiglq/dqCb8X6LqukVgHeHhTWDyeI6AtQTsauXZZs9eLOcecSi1H9xTWC/C
	 H+6vZ1Xx6N7eg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sasha Levin <sashal@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.16] pinctrl: renesas: rzg2l: Add suspend/resume support for Schmitt control registers
Date: Thu,  9 Oct 2025 11:54:45 -0400
Message-ID: <20251009155752.773732-19-sashal@kernel.org>
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

[ Upstream commit 837afa592c6234be82acb5d23e0a39e9befdaa85 ]

Renesas RZ/G3E supports a power-saving mode where power to most of the
SoC components is lost, including the PIN controller.  Save and restore
the Schmitt control register contents to ensure the functionality is
preserved after a suspend/resume cycle.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/20250819084022.20512-1-biju.das.jz@bp.renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES — the patch fixes a suspend/resume regression on RZ/G3E-class parts
without introducing risky behaviour.

**Key Points**
- Extends the suspend cache to cover Schmitt-trigger registers so their
  runtime configuration survives deep sleep
  (`drivers/pinctrl/renesas/pinctrl-rzg2l.c:318`).
- Allocates `cache->smt` for every port and captures the live register
  contents during suspend (`drivers/pinctrl/renesas/pinctrl-
  rzg2l.c:2711`), mirroring how pull-up/down and IOLH state are already
  handled.
- Restores the saved Schmitt values only on ports advertising
  `PIN_CFG_SMT`, preventing writes on hardware that lacks the block
  (`drivers/pinctrl/renesas/pinctrl-rzg2l.c:2986` and
  `drivers/pinctrl/renesas/pinctrl-rzg2l.c:3026`).
- Without this change, any pin configured with
  `PIN_CONFIG_INPUT_SCHMITT_ENABLE` (see support added in commit
  725933a54f71) reverts to the default after system suspend because the
  controller loses power in RZ/G3E low-power modes; that is a user-
  visible functional bug.

**Dependencies**
- Requires prior Schmitt-trigger support (commit 725933a54f71) and the
  existing suspend cache framework for pull-up/down registers (commit
  b2bd65fbb6173) so that the new field fits cleanly.

**Next Steps**
- 1) Cherry-pick this change together with the prerequisites above into
  any stable branch shipping RZ/G3E/RZ/V2H pinctrl support so Schmitt-
  trigger inputs keep working across suspend.

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c52263c2a7b09..4c25d2a7966a0 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -320,6 +320,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @iolh: IOLH registers cache
  * @pupd: PUPD registers cache
  * @ien: IEN registers cache
+ * @smt: SMT registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
  * @eth_mode: ETH_MODE register cache
@@ -333,6 +334,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*iolh[2];
 	u32	*ien[2];
 	u32	*pupd[2];
+	u32	*smt;
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	eth_mode;
@@ -2719,6 +2721,10 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 	if (!cache->pfc)
 		return -ENOMEM;
 
+	cache->smt = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->smt), GFP_KERNEL);
+	if (!cache->smt)
+		return -ENOMEM;
+
 	for (u8 i = 0; i < 2; i++) {
 		u32 n_dedicated_pins = pctrl->data->n_dedicated_pins;
 
@@ -2980,7 +2986,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
 
 	for (u32 port = 0; port < nports; port++) {
-		bool has_iolh, has_ien, has_pupd;
+		bool has_iolh, has_ien, has_pupd, has_smt;
 		u32 off, caps;
 		u8 pincnt;
 		u64 cfg;
@@ -2993,6 +2999,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
 		has_ien = !!(caps & PIN_CFG_IEN);
 		has_pupd = !!(caps & PIN_CFG_PUPD);
+		has_smt = !!(caps & PIN_CFG_SMT);
 
 		if (suspend)
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PFC(off), cache->pfc[port]);
@@ -3031,6 +3038,9 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 							 cache->ien[1][port]);
 			}
 		}
+
+		if (has_smt)
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SMT(off), cache->smt[port]);
 	}
 }
 
-- 
2.51.0


