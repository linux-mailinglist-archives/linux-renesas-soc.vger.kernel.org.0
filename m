Return-Path: <linux-renesas-soc+bounces-12486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC2CA1BC9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 20:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D988188DF61
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 19:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999A51D9688;
	Fri, 24 Jan 2025 19:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmKewQEY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726961CFEB2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jan 2025 19:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737745810; cv=none; b=NEJHMIu+JXgv1gkMsd5Sy1BE61ifecD1Q+R5CkvvHR4HpF/EkWSeoA5Vbo9DGwpHK35tll8ApJRLa1X1T0NHqrrsiB+SryP2o+DIUlN5mReCj1QfoKyfYWYeLZrPRSV+lawauBEHZ4RN0EOEZCA8Y9ECzDB+fJS7EH0WXgPM9CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737745810; c=relaxed/simple;
	bh=paLcivCEqMUle9b1CU25c4nYPKadTiou1FZEXS94VgE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=s4eVXwnRrMjM/jc+DyZZu0GOA8FNkp4ZrFrJNI7FqM+zuu0WhpElF/FrBSRJoIXmwhosfq9bohsXLpelvUCcDu/TlzOHdlJ2afKDO1P3vrPDmohHO0EiIxOtKKgiIpEnEJQFr8Fww77Tp1M8FEGAmf8VDIkNv9yAokao4UF2GOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmKewQEY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED462C4CED2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jan 2025 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737745810;
	bh=paLcivCEqMUle9b1CU25c4nYPKadTiou1FZEXS94VgE=;
	h=Subject:From:Date:To:From;
	b=GmKewQEYrWNCSisNiLqgrkJF0fEAmOBxl9NeKWhL0f0ONZM2Bysu4jB5WP4cQ88Us
	 UXpEMbJM6cvgGEqFJfGyCXXULq1330HnvoTHahQcreEwK6GCjs+amLkbcfThrEPgsI
	 3S66fBgyeJfotc/7I6pqEuk2fj8QTzz3bM0cWkTtkHSMPgOqc8kcO2fX5bkUS7RXH1
	 mYBCTdXhOTK97ushzLtT0T5EjaCjlTzCrrI9B1y2YhKkAXCgKFIscIiq3xnI6A647+
	 Vp7gMuGbQSaE0paHCQWBKtr3wkBqp753Y5WR1gAVzsP1Yq8TrduX8nsRKY+JXQXToB
	 YbzZ1zER70+MA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EED02380AA79
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jan 2025 19:10:35 +0000 (UTC)
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
 <173774583473.2139256.1113878815112223479.git-patchwork-summary@kernel.org>
Date: Fri, 24 Jan 2025 19:10:34 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: soc: renesas: Add system controller support for RZ/G3E SoC
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=921689
  Lore link: https://lore.kernel.org/r/20250101163344.128139-1-john.madieu.xa@bp.renesas.com
    Patches: [v2,1/4] dt-bindings: soc: renesas: Add RZ/G3E variant SYS bindings

Series: soc: renesas: Add RZ/G3E SoC detection support
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=927891
  Lore link: https://lore.kernel.org/r/20250123170508.13578-1-john.madieu.xa@bp.renesas.com
    Patches: [v4,1/9] soc: renesas: Add SYSC driver for Renesas RZ family
             [v4,2/9] dt-bindings: soc: renesas: Add RZ/G3E variant SYS binding
             [v4,7/9] arm64: dts: renesas: r9a08g045: Enable the system controller
             [v4,8/9] arm64: dts: renesas: r9a09g047: Add sys node
             [v4,9/9] arm64: dts: renesas: r9a09g057: Enable SYS node

Series: arm64: dts: renesas: gray-hawk-single: Describe Marvell 88Q2110 PHYs
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=923037
  Lore link: https://lore.kernel.org/r/20250107160127.528933-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Remove address- and size-cells from AVB[0-2]
             [2/2] arm64: dts: renesas: gray-hawk-single: Describe AVB1 and AVB2

Series: Add support for RZ/G3E WDT
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=925655
  Lore link: https://lore.kernel.org/r/20250115103858.104709-1-biju.das.jz@bp.renesas.com
    Patches: [1/5] dt-bindings: watchdog: renesas,wdt: Document RZ/G3E support
             [4/5] arm64: dts: renesas: r9a09g047: Add WDT1-WDT3 nodes
             [5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable watchdog

Series: Add support for the rest of Renesas RZ/G3S serial interfaces
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=926933
  Lore link: https://lore.kernel.org/r/20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v4,1/4] serial: sh-sci: Update the suspend/resume support
             [v4,2/4] arm64: dts: renesas: rzg3s-smarc-switches: Add a header to describe different switches
             [v4,3/4] arm64: dts: renesas: rzg3s-smarc: Enable SCIF3
             [v4,4/4] arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add overlay for SCIF1

Series: Add support Yuridenki-Shokai Kakip board
  Submitter: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=926104
  Lore link: https://lore.kernel.org/r/20250116144752.1738574-1-iwamatsu@nigauri.org
    Patches: [v2,1/4] dt-bindings: soc: renesas: Document Renesas RZ/V2H SoC variants
             [v2,2/4] dt-bindings: vendor-prefixes: Add Yuridenki-Shokai Co. Ltd.
             [v2,3/4] dt-bindings: soc: renesas: Document Yuridenki-Shokai Kakip board
             [v2,4/4] arm64: dts: renesas: Add initial device tree for Yuridenki-Shokai Kakip board

Series: [1/5] arm64: dts: renesas: r8a779f0: Add labels for rswitch ports
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=926646
  Lore link: https://lore.kernel.org/r/20250118111344.361617-1-marek.vasut+renesas@mailbox.org
    Patches: [1/5] arm64: dts: renesas: r8a779f0: Add labels for rswitch ports
             [2/5] arm64: dts: renesas: spider-ethernet: Access rswitch ports via phandles
             [3/5] arm64: dts: renesas: s4sk: Access rswitch ports via phandles
             [4/5] arm64: dts: renesas: spider-ethernet: Add ethernetN aliases for rswitch
             [5/5] arm64: dts: renesas: s4sk: Fix ethernet0 alias for rswitch

Patch: arm64: dts: renesas: r8a779f0: Disable rswitch ports by default
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=927874
  Lore link: https://lore.kernel.org/r/c4688de8e3289ad82c2cd85f0893eac660ac8890.1737649969.git.geert+renesas@glider.be


Total patches: 25

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



