Return-Path: <linux-renesas-soc+bounces-9256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB198B617
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 09:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 541CE1C20D6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 07:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA52B1BD513;
	Tue,  1 Oct 2024 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8Pk0azj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879081BD507
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Oct 2024 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727769011; cv=none; b=OIHmy1B8tXax0zy6gGzGv5NByuFBeA8MGfg97tPcAFvcO/vVXaRQ5x8syXh4/Jrau/enLSKF7eWjPfAHS8mtyD00ru9LxS/Z2067jlnITeKGFN9eT+MIQU3gpXpF3Lz4BmYYnQlj4E82DQpmAuhW/qagvc4Sn2nEST2DdRRjtjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727769011; c=relaxed/simple;
	bh=ZxViX+FybZG2f7xr9/r2IZoxLz7gjC/eITgFu85LNxA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=OVXbG3A6L0XxrF8x/aSB7tCxze9UCO7b4mt9mCd7RxlSVoS9rNwIxZuscC6F9KDS3Di/uYUVpQb9P4lIa4sKqN+ZJUyI3bJM/3AEKs+fLmtvbsWudolZUgfu/RpyQdY/9vcVVkaAOXrqfXZEebu6Tv5DCH/8Gc2aJgVhomP3Xy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8Pk0azj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2F5C4CEC6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Oct 2024 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727769010;
	bh=ZxViX+FybZG2f7xr9/r2IZoxLz7gjC/eITgFu85LNxA=;
	h=Subject:From:Date:To:From;
	b=C8Pk0azjLIWUKMrct9wUd2smFce/698kq26JEZeeiUmYB2p2ZLLeJLbBK9FNFo1mk
	 Vss8qBSubMf9IdtT8q63IZAQBUvM2Av+dypgVk2SQPZ7O5xxgd84hH/5g5mwH/SOUg
	 hXOaniSZpjZdEPVn3YisaVpNYAZmUZ39kuhjfSxSdu67nDJhFs1evf8xUfrw6JDpsC
	 4dNa3o++gNwqDFIRr5dCk9d8mPouit6HH5oWZaBFD39zSjecpqMvN9yRHZVQgyJXX7
	 NSTZq+lSSLkpu7DEls34sxnHcgFXJaCp5eZ+lMivGClE1uFFB4Yw78C2kRD3ptqTXe
	 cC1ZA5typDXxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A0BB380DBF7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Oct 2024 07:50:14 +0000 (UTC)
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
 <172776901269.219730.1351028986746210378.git-patchwork-summary@kernel.org>
Date: Tue, 01 Oct 2024 07:50:12 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: r8a779h0: Enable PCIe Host
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=886508
  Lore link: https://lore.kernel.org/r/20240904003409.1578212-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Add PCIe Host and Endpoint nodes
             [2/2] arm64: dts: renesas: r8a779h0: gray-hawk-single: Enable PCIe Host

Patch: ARM: dts: renesas: rskrza1: Enable watchdog timer
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893470
  Lore link: https://lore.kernel.org/r/fe72fb72acde4f5d9f8bd1a012435519592bd2bc.1727441772.git.geert+renesas@glider.be

Patch: ARM: dts: renesas: genmai: update audio codec bindings
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=892717
  Lore link: https://lore.kernel.org/r/20240925090812.14497-2-wsa+renesas@sang-engineering.com

Series: ARM: dts: renesas: use interrupts-extended for gpio-keys
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893404
  Lore link: https://lore.kernel.org/r/20240927095414.10241-6-wsa+renesas@sang-engineering.com
    Patches: [1/4] ARM: dts: renesas: marzen: use interrupts-extended for gpio-keys
             [3/4] ARM: dts: renesas: rskrza1: use interrupts-extended for gpio-keys
             [4/4] ARM: dts: renesas: rza2mevb: use interrupts-extended for gpio-keys

Series: ARM: dts: renesas: bring genmai up to date - the easy stuff
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=891830
  Lore link: https://lore.kernel.org/r/20240921114813.4124-7-wsa+renesas@sang-engineering.com
    Patches: [1/5] ARM: dts: renesas: genmai: enable watchdog
             [2/5] ARM: dts: renesas: genmai: enable OS timer modules
             [3/5] ARM: dts: renesas: genmai: sort nodes
             [5/5] ARM: dts: renesas: genmai: define keyboard switch

Patch: ARM: dts: renesas: genmai: Fix partition size for QSPI NOR Flash
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=890426
  Lore link: https://lore.kernel.org/r/20240914182948.94031-2-wsa+renesas@sang-engineering.com

Patch: arm64: dts: renesas: rcar-gen4: Switch PCIe to reset-gpios
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893443
  Lore link: https://lore.kernel.org/r/853019acdfcdf05fcb46d8124157ef298da55188.1727438172.git.geert+renesas@glider.be

Patch: ARM: dts: renesas: remove 'reg-io-width' properties from MMCIF nodes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=892820
  Lore link: https://lore.kernel.org/r/20240925150904.3582-2-wsa+renesas@sang-engineering.com


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



