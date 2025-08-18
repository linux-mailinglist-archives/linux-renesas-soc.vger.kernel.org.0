Return-Path: <linux-renesas-soc+bounces-20605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED432B29CC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 10:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22B151890A60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 08:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E89304972;
	Mon, 18 Aug 2025 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIi/KSS/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2541A304962
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 08:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507039; cv=none; b=lT8vyZfR7Slw0USW7/9y3tcvxvLsGz3827QUAl6jkmiPVTpPCBt3aJ8EQyHM9e5DiyMJBJzxEw0JCj35b4uMW5A3BSF+4IA4VvhJSuD/aknPCtCVxn0E/k1JA6k43Q6ZSGas95bQlHd3iZgTdh3UQdxUTusZXvj2cJ0vPTFbw4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507039; c=relaxed/simple;
	bh=3e9zdDn/5pv/Tp6PnRaUA/+xymWw9g9IPcTWp0YaD70=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=WGqIBmywdOHtyWw7Y70/iv1GTa/MTCuawkofmkfy/sFUp+K4uE1N5mTkOZJfoID+JuDsawX7be/1SORhdrM557M907RnteNz2Ca9dPCy7Wxwo/x0qlHBACIqOzWsS0FX+PJjg9LTLkSpScAbyw8XibvTz4hffcv/rKE138Kk9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIi/KSS/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3F2C4CEED
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 08:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755507038;
	bh=3e9zdDn/5pv/Tp6PnRaUA/+xymWw9g9IPcTWp0YaD70=;
	h=Subject:From:Date:To:From;
	b=OIi/KSS/5+VIcSsDO5BLLlsE6M7MkG7yJmsOlguj7jfq73yJzfRa66VMVpAD/yvgA
	 LYxWeND0LszlEaO+dbHNkuC9u1h4YSJzAwLXUa0l2BZ7BxooB0UyFTgPdTxJcncA68
	 01sqPTW/5iZtE9igH/muOiDOM3uarZ5YVF7IUnZ9ze92jE4a7PKk8j9lpl117Udy6A
	 /QggRAEzS51/mvpLoE0Woa1wvf9FDBtp8g0PGpGhHFSB8wisq4QgsDuJRDFOMuPzf8
	 XyySmGYgdGoIWE7imMU4G0J4419Z3w6lxF1CESNDf6fiQYCwT2cyw2EPkHnmLwlMiI
	 hvCsa0odxDiJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE760383BF68
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 08:50:49 +0000 (UTC)
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
 <175550704850.2667313.12238106281766230539.git-patchwork-summary@kernel.org>
Date: Mon, 18 Aug 2025 08:50:48 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Increase CANFD clock rates
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=991022
  Lore link: https://lore.kernel.org/r/cover.1755090456.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: rcar-gen3: Increase CANFD clock rates
             [2/2] arm64: dts: renesas: rzg2: Increase CANFD clock rates

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.17-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=991380
  Lore link: https://lore.kernel.org/r/66827be4b9db9bfa813edaa27310c6f65534ccfa.1755161250.git.geert+renesas@glider.be

Patch: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.17-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=991381
  Lore link: https://lore.kernel.org/r/23551e5d104a43431dc53abc58b124abf11a3838.1755161299.git.geert+renesas@glider.be

Patch: [v3] arm64: dts: renesas: r8a779g3: Update thermal trip points on V4H Sparrow Hawk
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=991715
  Lore link: https://lore.kernel.org/r/20250814233529.191874-1-marek.vasut+renesas@mailbox.org

Patch: ARM: dts: renesas: porter: Fix CAN pin group
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=976662
  Lore link: https://lore.kernel.org/r/70ad9bc44d6cea92197c42eedcad6b3d0641d26a.1751032025.git.geert+renesas@glider.be


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



