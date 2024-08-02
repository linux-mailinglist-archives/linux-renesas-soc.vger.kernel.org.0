Return-Path: <linux-renesas-soc+bounces-7705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06933945BD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 12:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 387BC1C20D80
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 10:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569051C69D;
	Fri,  2 Aug 2024 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIifM8nr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3249A1DAC50
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Aug 2024 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722593434; cv=none; b=jZSLOtsi5Bd1cCABj6lPvrY+wb/MMpYM53KylkmXR060zI+4rNh78XpXhW1Ys9N2pe2DXJVOp/T7p4ESXPSmWiU7suCJTqRo9CPZEprPYxGWVI4mXuB21mbTjJGBt6bRLiWifGxq0gPr9hqJKgCKn1RCDow2cQLjdcahQCjEKUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722593434; c=relaxed/simple;
	bh=OKzA/fHiNQud4pQLuctLA0S6a1s5INR2Ye9/AJfGTLg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=SzsEr7k7SnithOV8imD7qr6Kcb6Kq+jI7Cajt0U8T81LxnWImo9p7vBztNszzZemISAxmYgFM/DLYitoFLEr20QdxGm/aQNhraXYgTfztB+s5fHRmaP9/uyAHMLi4AZh9a1EvEvUE+Mg0xK1JNZJQZ1kJ1fnwVMZxVsoqdJzfJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIifM8nr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5810C32782
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Aug 2024 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722593433;
	bh=OKzA/fHiNQud4pQLuctLA0S6a1s5INR2Ye9/AJfGTLg=;
	h=Subject:From:Date:To:From;
	b=nIifM8nrnhaC2tmdAvmyjbbWiut+Txymr+YvFiKyaYw5CJGnLncDdKGX1kQV0odWn
	 Radyd4gKHbzxFUTVs4TR8Jo11zl5oC7Bro+LHRcXw5ksTC0MEgq/kghV356HGP0Ibf
	 aMzv5FpohQ///Px4pko2rVqAOfbZ3V/4E/xtEIiGHr6vN24wDDv0BjYXblvQKji3/x
	 gv8+udiI3nWIVKgk97UrjctvGS317tH6gb1N1VkJg4ZHhOL/iMRtI7gXzZspaaCpw8
	 PZLLsHkzJD7MBhxjvqonlzLCGbQp4gEUrfyG0cU+lFmqBFNQzFhiDsP+5Wlx7/2LEG
	 LpIqNlW5FJFxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A3E3DC4332C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Aug 2024 10:10:33 +0000 (UTC)
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
 <172259343361.14879.14600100181836922793.git-patchwork-summary@kernel.org>
Date: Fri, 02 Aug 2024 10:10:33 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: ARM: shmobile: defconfig: Enable slab hardening and kmalloc buckets
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=875102
  Lore link: https://lore.kernel.org/r/96fc3f0ed509b6364d8aeb297d5acf4abed18404.1722349907.git.geert+renesas@glider.be

Series: arm64: renesas: defconfig: Updates after v6.11-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=875107
  Lore link: https://lore.kernel.org/r/cover.1722349965.git.geert+renesas@glider.be
    Patches: [PATCH/LOCAL,1/3] arm64: renesas: defconfig: Enable slab hardening and kmalloc buckets
             [PATCH/LOCAL,2/3] arm64: renesas: defconfig: Enable Renesas Ethernet-TSN support
             [PATCH/LOCAL,3/3] arm64: renesas: defconfig: Refresh for v6.11-rc1

Patch: arm64: defconfig: Enable R-Car Ethernet-TSN support
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=875423
  Lore link: https://lore.kernel.org/r/20240731105321.3196788-1-niklas.soderlund+renesas@ragnatech.se

Series: Configure GbEth for RGMII on RZ/G2L family
  Submitter: Paul Barker <paul.barker.ct@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=865494
  Lore link: https://lore.kernel.org/r/20240625200316.4282-1-paul.barker.ct@bp.renesas.com
    Patches: [v3,1/9] pinctrl: renesas: rzg2l: Clarify OEN read/write support
             [v3,4/9] arm64: dts: renesas: rzg2l: Enable Ethernet TXC output
             [v3,5/9] arm64: dts: renesas: rzg2lc: Enable Ethernet TXC output
             [v3,6/9] arm64: dts: renesas: rzg2ul: Enable Ethernet TXC output
             [v3,7/9] arm64: dts: renesas: rzg2l: Set Ethernet PVDD to 1.8V
             [v3,8/9] arm64: dts: renesas: rzg2lc: Set Ethernet PVDD to 1.8V
             [v3,9/9] arm64: dts: renesas: rzg2ul: Set Ethernet PVDD to 1.8V

Series: dma: Enable DMA support for the Renesas RZ/G3S SoC
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=870478
  Lore link: https://lore.kernel.org/r/20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [1/3] clk: renesas: r9a08g045-cpg: Add DMA clocks and resets
             [3/3] arm64: dts: renesas: r9a08g045: Add DMAC node


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



