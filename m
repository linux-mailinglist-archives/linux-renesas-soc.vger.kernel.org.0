Return-Path: <linux-renesas-soc+bounces-22800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E065BC52B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 15:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DC534E207C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 13:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057FE2836A3;
	Wed,  8 Oct 2025 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhwU7AKn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB8277009
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759929624; cv=none; b=EOrpMpolTPB+XRybyikz34jPORA4DRis3TqO2Z1I3mWvXgm/VsKUJ92NwKxVZQ+AZLHySwKqUeY89oTBtw0ppmLFUxAJSXJWaKTH2KMF78C9lJ7pQTZ0A9gYbB0t/nPNEiUqYkF1CiSTo08FE51nR/0wkPJRy9tNqqvbz2Qh2Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759929624; c=relaxed/simple;
	bh=ZyXE1gB3ikOy2dEPl6Jces1EYqY/TB+Nmxg0r/vrWjo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=c6UOdd07FtoNvhoBPguIqzKYq9QBzdQBgRZShPDzYHmqil4IGTdtgd3g87aFyhm44R5l44nRffuTVfYjCePhFiZYprMkcgiD6P+cNEeDUDqhv0FvT14J+mtI3IW0Dlpw/JRI6edKAzhLhABGYbJSK87x6gdzgiN+P7RfI/k1J0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhwU7AKn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2EEC4CEF4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 13:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759929624;
	bh=ZyXE1gB3ikOy2dEPl6Jces1EYqY/TB+Nmxg0r/vrWjo=;
	h=Subject:From:Date:To:From;
	b=WhwU7AKnoMa3NnYBznXrqdCYd09UMsK7iwcNZnYabWOOKZwQf5vPC5gVnhij0z9Co
	 vtAmGy9lpIEG9PIX1zBKzskMnffaRn1TVmU1hKndLt9mlHDAZ3ZRavBldYW+MESdQ+
	 2v0V4v63lFlDYwy3vouY7KbVL7kTdL1wRTOAmCHH+8W5bHd4MNQLMWHzWbe7AfK1zl
	 QNEM+z5ij6X8atK8OvpQepmWPo8LnjWTkZAhnwwoU3SPpzW07KjYCk9wcIyQvG2LiT
	 yjeoZl5c/9PV1g+gnb/hYbss5tVywETKrMNl4h5niQtKDq+j00yjPO9q2fKwoP6+gC
	 CaIkJRmFigzHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74A193A40FF3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 13:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <175992961293.3447604.4710477411370561195.git-patchwork-summary@kernel.org>
Date: Wed, 08 Oct 2025 13:20:12 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ARM: dts: renesas: Move interrupt-parent to root node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008039
  Lore link: https://lore.kernel.org/r/cover.1759414774.git.geert+renesas@glider.be
    Patches: [01/13] ARM: dts: renesas: r7s72100: Move interrupt-parent to root node
             [02/13] ARM: dts: renesas: r7s9210: Remove duplicate interrupt-parent
             [03/13] ARM: dts: renesas: r8a7742: Move interrupt-parent to root node
             [04/13] ARM: dts: renesas: r8a7743: Move interrupt-parent to root node
             [05/13] ARM: dts: renesas: r8a7744: Move interrupt-parent to root node
             [06/13] ARM: dts: renesas: r8a7745: Move interrupt-parent to root node
             [07/13] ARM: dts: renesas: r8a77470: Move interrupt-parent to root node
             [08/13] ARM: dts: renesas: r8a7790: Move interrupt-parent to root node
             [09/13] ARM: dts: renesas: r8a7791: Move interrupt-parent to root node
             [10/13] ARM: dts: renesas: r8a7792: Move interrupt-parent to root node
             [11/13] ARM: dts: renesas: r8a7793: Move interrupt-parent to root node
             [12/13] ARM: dts: renesas: r8a7794: Move interrupt-parent to root node
             [13/13] ARM: dts: renesas: r9a06g032: Move interrupt-parent to root node

Patch: arm64: dts: renesas: v3msk: Enable watchdog timer
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008974
  Lore link: https://lore.kernel.org/r/e30fb396d73307f2538a638cdda06ca58a1a4e60.1759830182.git.geert+renesas@glider.be

Series: arm64: dts: renesas: gen4: handle SWDT
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008616
  Lore link: https://lore.kernel.org/r/20251006082520.10570-11-wsa+renesas@sang-engineering.com
    Patches: [1/9] arm64: dts: renesas: r8a779a0: add SWDT node
             [2/9] arm64: dts: renesas: falcon: mark SWDT as reserved
             [3/9] arm64: dts: renesas: r8a779f0: add SWDT node
             [4/9] arm64: dts: renesas: s4: mark SWDT as reserved
             [5/9] arm64: dts: renesas: r8a779g0: add SWDT node
             [7/9] arm64: dts: renesas: v4h: mark SWDT as reserved
             [8/9] arm64: dts: renesas: r8a779h0: add SWDT node
             [9/9] arm64: dts: renesas: gray-hawk: mark SWDT as reserved

Patch: ARM: dts: renesas: koelsch: Update ADV7180 binding
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008388
  Lore link: https://lore.kernel.org/r/20251003215318.39757-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 23

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



