Return-Path: <linux-renesas-soc+bounces-2145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A4C84423B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 15:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71F7928D663
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 14:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2425684A4E;
	Wed, 31 Jan 2024 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECfwmmnr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC27212BF10
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 14:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706712628; cv=none; b=lTVExWdh9OT3nFXyfIELmdLBe0vriXbg+bcgZBzq6ob3zRy7BoRJRqdtzBfKNYem9Yim5zvUlEvKAAQ0RwaL5529xQUVIcMSk9hkU3WdWT2YDeJAaqpsPCLbqbPPmMDbJNqdb6G9HvAzF6sY7Em9aWeWmphkPPdJWbnXWV0TDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706712628; c=relaxed/simple;
	bh=9vMGx1HnmW2hqSynwlYGn5MIV5FiHQVlpKuwDdLBgMk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=BtmuH5pNG/I6bHHLsEtuiAgTtdfzwSAFCl5C7u7to1hkIEKLzCdAtwR0X2Ukn0bw0EbrBx3JAK73nWlhzDLzfgQ3sHQYO4niewASrK952U9oM77u2+/8mNCmXOhaoCBFS3hQMf1lMuzMNCVPcaXua0bLccZ96mlPOhXn0+QBmsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECfwmmnr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68D97C43390
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706712627;
	bh=9vMGx1HnmW2hqSynwlYGn5MIV5FiHQVlpKuwDdLBgMk=;
	h=Subject:From:Date:To:From;
	b=ECfwmmnrelSA99JKTe2l82VOfEJmEB+r0joJAsbcPZfD0sscrKdmBMqitUj0j7o4w
	 XzxNrAiuSzDyFSG7JGSE8HoCxYwLOsf7dAdFVtTNy2dcw9HtFEpYUHs3qjGnY8Ahc2
	 p60tI2JFcUPXITBGvoUv78cL9IZBJ3B6iscsmktr588rQEy9iq2Kls/8bUDrOKlXjh
	 pvIp9aLxkDSQetUnsfzzB0HqLBmGcK1dGJbiBDI+NFBfPZbBDOH6g5XvNj+xgdVfE7
	 UQvASpSbNvvklABAD4h3alGa8l+Nd4xv0k7bp0/NQZl2UKoR9MC85SzWyfzjTbBZUF
	 f289oOpF/D5+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F400C4166F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 14:50:27 +0000 (UTC)
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
 <170671262726.7243.3057946819083126728.git-patchwork-summary@kernel.org>
Date: Wed, 31 Jan 2024 14:50:27 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: watchdog: rzg2l_wdt: Add support for RZ/G3S
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=821627
  Lore link: https://lore.kernel.org/r/20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v2,01/11] clk: renesas: r9a08g045: Add clock and reset support for watchdog
             [v2,10/11] arm64: dts: renesas: r9a08g045: Add watchdog node
             [v2,11/11] arm64: dts: renesas: rzg3s-smarc-som: Enable the watchdog interface

Series: arm64: renesas: Add R-Car V4M and Gray Hawk Single support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=819931
  Lore link: https://lore.kernel.org/r/cover.1706194617.git.geert+renesas@glider.be
    Patches: [v2,01/15] dt-bindings: clock: renesas,cpg-mssr: Document R-Car V4M support
             [v2,02/15] dt-bindings: clock: Add R8A779H0 V4M CPG Core Clock Definitions
             [v2,05/15] dt-bindings: reset: renesas,rst: Document R-Car V4M support
             [v2,06/15] dt-bindings: soc: renesas: Document R-Car V4M Gray Hawk Single
             [v2,10/15] soc: renesas: Introduce ARCH_RCAR_GEN4
             [v2,11/15] soc: renesas: Identify R-Car V4M
             [v2,12/15] soc: renesas: rcar-rst: Add support for R-Car V4M
             [v2,13/15] arm64: dts: renesas: Add Renesas R8A779H0 SoC support
             [v2,14/15] arm64: dts: renesas: Add Gray Hawk Single board support
             [v2,15/15] arm64: defconfig: Enable R8A779H0 SoC

Patch: [PATCH/[LOCAL] arm64: renesas: defconfig: Enable R-Car V4M (R8A779H0) SoC support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=820215
  Lore link: https://lore.kernel.org/r/378be6f9fb7a0e259eae7855697c6a0675411ce7.1706266517.git.geert+renesas@glider.be

Series: Add RZ/G2UL CRU and CSI support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=820255
  Lore link: https://lore.kernel.org/r/20240126133116.121981-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/5] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G2UL CSI-2 block
             [v2,3/5] arm64: dts: renesas: r9a07g043u: Add CSI and CRU nodes

Series: renesas: r8a779g0: Add missing SCIF_CLK2
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=817892
  Lore link: https://lore.kernel.org/r/cover.1705589612.git.geert+renesas@glider.be
    Patches: [1/2] pinctrl: renesas: r8a779g0: Add missing SCIF_CLK2 pin group/function
             [2/2] arm64: dts: renesas: r8a779g0: Add missing SCIF_CLK2


Total patches: 18

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



