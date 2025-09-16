Return-Path: <linux-renesas-soc+bounces-21929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFE2B59888
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 16:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BD8E7B7A6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 13:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6F5342C9C;
	Tue, 16 Sep 2025 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9w9Fd7l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC5234166D;
	Tue, 16 Sep 2025 13:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031184; cv=none; b=UvkJlJV2sChTdr66H25hy8+y6fz+OmtaxJOZ4jFiTd3cgFRSExKjBzY+9UBBWOfJXlpSlRyUwF2PNVts/aw/UEXlcvEpy/IHZVAx3jELgDyWgOdqSgfu0wGhUT5Me1Ncl+ZSZGGleSiGbq2ryLEJHipSXrsJ47/0bBV1a7cP0TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031184; c=relaxed/simple;
	bh=obzqtsgGe2J8HUx/Rq+9x8xS54ug5rpbbx4hokjPQNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFmYWngjkuuc4lS9zulNQOafVMgKMCCsPEDrnbGa+PzUxVJnESMtIn69Mv9OlVbSfTZsf1Otp7IRNJfMrsy7MGsQCsm2Zm/XQcAEQAlLkgRGi8qsXUMAGY5fTEfhudFNqmooyksuIz8sHnTQxA7x/+EwJvw7p2t7j6t1u0PsHik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9w9Fd7l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E239C4CEEB;
	Tue, 16 Sep 2025 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758031183;
	bh=obzqtsgGe2J8HUx/Rq+9x8xS54ug5rpbbx4hokjPQNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K9w9Fd7lIuv9tgO2AxN92VBO75svZZK5ykY2ve5DVks4itSoTqEZTokMX78JbCbQJ
	 m7wTsSlEyFxMZVGyRIiX1h8qMGWjVyFeaUn8e2OWH0VwQVPaKHYDsijxZiSbQORmTo
	 8v0g2XovlXYObhsE7ObgCWdWYxxdNZ+RJddq+A+kyTvLt67KSY9hVS3OTunDvaqIFX
	 UY8nd8ahr/jj4LPdIgRmAi+vpeoEoToSghvNA4SKa7T+NfoOKInGrfyF5kKB6Uhi74
	 4hmMyjgkPOt5pD2m2LkhkhZfTwjRdazt794fEhS4HrSF4I2MlD77DfKfXYu65u4DhO
	 llhhI68tGAzkw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] can: rcar_can: rcar_can_resume(): fix s2ram with PSCI
Date: Tue, 16 Sep 2025 09:58:57 -0400
Message-ID: <20250916135936.1450850-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916135936.1450850-1-sashal@kernel.org>
References: <20250916135936.1450850-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.7
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 5c793afa07da6d2d4595f6c73a2a543a471bb055 ]

On R-Car Gen3 using PSCI, s2ram powers down the SoC.  After resume, the
CAN interface no longer works, until it is brought down and up again.

Fix this by calling rcar_can_start() from the PM resume callback, to
fully initialize the controller instead of just restarting it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://patch.msgid.link/699b2f7fcb60b31b6f976a37f08ce99c5ffccb31.1755165227.git.geert+renesas@glider.be
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive investigation using multiple specialized
agents to thoroughly analyze this commit, here is my determination:

## **Backport Status: YES**

This commit is an excellent candidate for stable kernel backporting for
the following reasons:

### Critical Bug Fix
The commit fixes a **complete functional failure** of the CAN controller
after suspend/resume on R-Car Gen3 systems using PSCI. Without this fix,
the CAN interface becomes completely non-operational after resume,
requiring manual intervention (interface down/up) to restore
functionality.

### Meets All Stable Criteria
1. **Fixes a real bug**: CAN controller fails to work after s2ram with
   PSCI - a hardware quirk/behavior issue
2. **Small and contained**: Only ~5-10 lines changed, replacing manual
   register manipulation with a single function call
3. **Obviously correct**: Reuses the well-tested `rcar_can_start()`
   initialization function already used in the open path
4. **Already tested**: Has been in mainline without reported regressions

### Low Risk Profile
- **Minimal code change**: Simply calls existing initialization function
  instead of incomplete manual register manipulation
- **No new code paths**: Reuses proven initialization sequence from
  `rcar_can_open()`
- **Reduces complexity**: Removes duplicate code and consolidates
  initialization logic
- **Clean dependencies**: Only depends on existing `rcar_can_start()`
  function present in all relevant kernels

### High Impact
- **Safety-critical**: In automotive applications, CAN is used for
  critical vehicle functions
- **User-visible**: Complete loss of network functionality is
  immediately apparent
- **No workaround**: While manual interface cycling works, it's not
  viable for production systems

### Technical Correctness
The original resume code only cleared sleep/halt bits, assuming register
contents were preserved. However, PSCI completely powers down the SoC,
losing all register state. The fix properly reinitializes:
- Bit timing configuration
- Operating modes and FIFOs
- Acceptance filters
- Interrupt configuration
- Proper state machine transitions

### Important Note
While my analysis identified potential concerns about clock management
(can_clk not being re-enabled), this appears to be a pre-existing issue
in the suspend/resume implementation rather than a regression introduced
by this fix. The commit correctly addresses the primary initialization
problem.

**Recommendation**: Backport to all stable kernels supporting R-Car Gen3
hardware (likely 4.9+), with priority for automotive/industrial
distributions where CAN reliability is critical.

 drivers/net/can/rcar/rcar_can.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_can.c b/drivers/net/can/rcar/rcar_can.c
index 2b7dd359f27b7..8569178b66df7 100644
--- a/drivers/net/can/rcar/rcar_can.c
+++ b/drivers/net/can/rcar/rcar_can.c
@@ -861,7 +861,6 @@ static int __maybe_unused rcar_can_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct rcar_can_priv *priv = netdev_priv(ndev);
-	u16 ctlr;
 	int err;
 
 	if (!netif_running(ndev))
@@ -873,12 +872,7 @@ static int __maybe_unused rcar_can_resume(struct device *dev)
 		return err;
 	}
 
-	ctlr = readw(&priv->regs->ctlr);
-	ctlr &= ~RCAR_CAN_CTLR_SLPM;
-	writew(ctlr, &priv->regs->ctlr);
-	ctlr &= ~RCAR_CAN_CTLR_CANM;
-	writew(ctlr, &priv->regs->ctlr);
-	priv->can.state = CAN_STATE_ERROR_ACTIVE;
+	rcar_can_start(ndev);
 
 	netif_device_attach(ndev);
 	netif_start_queue(ndev);
-- 
2.51.0


