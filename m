Return-Path: <linux-renesas-soc+bounces-23599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC5C094F6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 18:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA4881C80840
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 16:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91557305064;
	Sat, 25 Oct 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6HgkXkS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6287A303A19;
	Sat, 25 Oct 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408866; cv=none; b=GcDCo7ap41vivcjy8tNT4Mv6gGQ0ey3F/DzSDhWMVV57Q8fepf3rEyIu9yACYAWgqmxnz+90de4W1pTo/7kNc0o+BlFnj4hrXrkv0U/g8A/nH08ZBbdzNJsbrGCcIht/mT6/SVSOInBKFyYo++86l+UTfM2DwpppuDfwS8R6jeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408866; c=relaxed/simple;
	bh=m/k3aiC9ytv1r6Mmlz3YHjyTPrD8qpfCAq05TIxMDeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXM7u/ZHla45UdEFao5IQvoT+9WQUAbBpdsb11wHzJsmwKHJQsKSIsj7nLjGx0nwGI/JfNZLgJaSCpEaTMKRDmp/hCCBxVGmew9Er8Cy0v+lWGyc9PBMwhlx5HJ6si7SiRqx8RFPnd77bNOpW9zIQI0bvC6WGZUJAXBE5HHnb8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6HgkXkS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23922C4CEF5;
	Sat, 25 Oct 2025 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408866;
	bh=m/k3aiC9ytv1r6Mmlz3YHjyTPrD8qpfCAq05TIxMDeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f6HgkXkSOKckr3uRgRDnc1qnd2JbEU+CyCdDz5FMDP8HE3SEHEduIkALN/AFRBS4a
	 X+LAWG4bo9l3e4HaDMWhPB0Xo9XZlhrX2pXxyokDLloLuifHWMb0ocFTDBVORoriMX
	 CymveiZEHpQKlZBcUR03GaRq+UajSlY++QJUdrbFDgjY/yqJfE4fX9jI7e/W27f2bt
	 lplhrnhfrcHqEYarV2Dv6NViKdYjOVpy4BvT1Lxl6UHG2VvAfkgtlOE8NPOVph7zy9
	 WqtQ1OU27WoREeg5N/BNFQ4KiTpIXnHoYQRXEECO/iavB9mqt8loEbQiOgMOKk2C6w
	 cWE4pqNXHQIrw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	niklas.soderlund@ragnatech.se,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] net: sh_eth: Disable WoL if system can not suspend
Date: Sat, 25 Oct 2025 11:55:38 -0400
Message-ID: <20251025160905.3857885-107-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

[ Upstream commit 9c02ea544ac35a9def5827d30594406947ccd81a ]

The MAC can't facilitate WoL if the system can't go to sleep. Gate the
WoL support callbacks in ethtool at compile time using CONFIG_PM_SLEEP.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://patch.msgid.link/20250909085849.3808169-1-niklas.soderlund+renesas@ragnatech.se
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it does
  - Gates the ethtool WoL callbacks behind `CONFIG_PM_SLEEP`, so WoL is
    only reported/configurable when the system can actually suspend.
  - Specifically wraps `sh_eth_get_wol()` and `sh_eth_set_wol()` with
    `#ifdef CONFIG_PM_SLEEP` and only sets the corresponding ethtool ops
    when sleep support is enabled.

- Code references
  - Function definitions are compiled only if sleep is enabled:
    drivers/net/ethernet/renesas/sh_eth.c:2363 and
    drivers/net/ethernet/renesas/sh_eth.c:2390
  - Etwttool ops pointers are likewise conditioned:
    drivers/net/ethernet/renesas/sh_eth.c:2406 and
    drivers/net/ethernet/renesas/sh_eth.c:2409
  - The driver’s suspend/resume path that actually uses WoL state
    (`mdp->wol_enabled`) is part of PM sleep handling:
    - `sh_eth_suspend()` checks `mdp->wol_enabled` to set up Magic
      Packet WoL: drivers/net/ethernet/renesas/sh_eth.c:3500
    - `sh_eth_resume()` mirrors that to restore state:
      drivers/net/ethernet/renesas/sh_eth.c:3519
  - The driver already declares PM sleep ops via `pm_sleep_ptr`, so
    suspend/resume are only active when `CONFIG_PM_SLEEP` is enabled,
    making the ethtool gating consistent:
    drivers/net/ethernet/renesas/sh_eth.c:3553

- Why this is a bug fix
  - Without system sleep support, the suspend/resume hooks that actually
    arm/disarm WoL are not used, so advertising WoL to userspace
    (`ethtool`) is misleading and non-functional. The patch prevents
    reporting/configuring WoL when it cannot work in practice.
  - This aligns the reported capability with the runtime behavior and
    avoids users enabling a feature that can’t take effect.

- Scope and risk
  - Change is small, compile-time only, and limited to `sh_eth` ethtool
    ops and two static helpers.
  - No data path changes; no architectural changes; only affects builds
    with `CONFIG_PM_SLEEP=n`.
  - When `CONFIG_PM_SLEEP=y`, behavior is unchanged.

- Stable backport criteria
  - Fixes a real user-visible correctness issue (capability
    misreporting).
  - Minimal and self-contained to a single driver file.
  - No new features or API changes; low regression risk.
  - Consistent with existing PM gating (`pm_sleep_ptr`) in the same
    driver.

Given the above, this is an appropriate, low-risk correctness fix to
backport.

 drivers/net/ethernet/renesas/sh_eth.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 5fc8027c92c7c..695fa3592c9a2 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2360,6 +2360,7 @@ static int sh_eth_set_ringparam(struct net_device *ndev,
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
 static void sh_eth_get_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
@@ -2386,6 +2387,7 @@ static int sh_eth_set_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
 
 	return 0;
 }
+#endif
 
 static const struct ethtool_ops sh_eth_ethtool_ops = {
 	.get_regs_len	= sh_eth_get_regs_len,
@@ -2401,8 +2403,10 @@ static const struct ethtool_ops sh_eth_ethtool_ops = {
 	.set_ringparam	= sh_eth_set_ringparam,
 	.get_link_ksettings = phy_ethtool_get_link_ksettings,
 	.set_link_ksettings = phy_ethtool_set_link_ksettings,
+#ifdef CONFIG_PM_SLEEP
 	.get_wol	= sh_eth_get_wol,
 	.set_wol	= sh_eth_set_wol,
+#endif
 };
 
 /* network device open function */
-- 
2.51.0


