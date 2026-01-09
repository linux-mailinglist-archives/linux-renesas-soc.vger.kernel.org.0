Return-Path: <linux-renesas-soc+bounces-26507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F31D08DEF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 12:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE892304DE1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 11:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E725B358D1A;
	Fri,  9 Jan 2026 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKtu+3zW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C4733D4EA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767957817; cv=none; b=lD7U3epZ1jwfMWehz00xtJVM37zv3JVZpux3oi6bAc6CDZu83AHWV2zj8et2ct6D03gSMlY75xpqZB5o78GlYDpyk2hMOcc8ZZQ2HUrP/N+++xCdWeDlCWO1HXUa3q/LaJmKmVsu8h/v/DT+Kz0Ifkg6/gpJkiagM2R0iMfk1+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767957817; c=relaxed/simple;
	bh=WH4e/CUodGXCCzGqOCMMguELZHg2SeH6fPWIErIPZtw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=FGCtTx6FIcC32Lqkgxnkg79/zBBjO4FuOzpdpTQy9whGTjng7ur5NudtBmO0dmTExie6o5vQwJZOFJOgmGfRTvA8Pwbmq5Zu5PuQcW0n0m7FgGP3feYeekpjSR8FRfeC28gRCWzLQXCt1tTE7iMCPkpHGDATvU6xbtvdCJ1bgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKtu+3zW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A62C4CEF1
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767957816;
	bh=WH4e/CUodGXCCzGqOCMMguELZHg2SeH6fPWIErIPZtw=;
	h=Subject:From:Date:To:From;
	b=bKtu+3zWQsNIAbwMGP8WUXGK62xtmj7V2oDfO0NOfD+RTkmcN7QcVfEYshakpBuAj
	 oggSmjIXpoZwz7XuKJP9cHVxD9VL3SFu1WYFrVvQ4bA/BhEfnJphzFnu6GaETKJU40
	 vzJkOAqXOsC8UCzopKt3qKZ0TBXghQvHySVixHEPQ9HO0IUL7Jm0JnZUJHPWDDEhq4
	 DM0UNdc8qo5ItSOImZsVXJKKyJDCsjiVkfpwGgKXYgPKn8MsOTrpv5S2Dw2z4KnXLM
	 DFj2/S8Lx2AeGgsTxl+Qh3JrYHZeqe1wcz+pEG1m3xUpiILJso+cti3K8Ggr4Uf7dC
	 9Il6LKmDwjVDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC4EE3930CB0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 11:20:13 +0000 (UTC)
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
 <176795761221.214858.17728181791195142825.git-patchwork-summary@kernel.org>
Date: Fri, 09 Jan 2026 11:20:12 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add CANFD support for Renesas R9A09G056/057/077/087 SoCs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1036482
  Lore link: https://lore.kernel.org/r/20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/6] arm64: dts: renesas: r9a09g077: Add CANFD node
             [2/6] arm64: dts: renesas: r9a09g087: Add CANFD node
             [3/6] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable CANFD
             [4/6] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Enable CANFD
             [5/6] arm64: dts: renesas: r9a09g056: Add CANFD node
             [6/6] arm64: dts: renesas: r9a09g057: Add CANFD node

Series: Add RSCI nodes to RZ/V2N and RZ/V2H(P) SoC DTSIs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1035778
  Lore link: https://lore.kernel.org/r/20251222164238.156985-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g056: Add RSCI nodes
             [2/2] arm64: dts: renesas: r9a09g057: Add RSCI nodes

Series: Add support for GPIO IRQs for RZ/T2H and RZ/N2H
  Submitter: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1030874
  Lore link: https://lore.kernel.org/r/20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com
    Patches: [v2,1/8] pinctrl: renesas: rzt2h: move GPIO enable/disable into separate function
             [v2,5/8] arm64: dts: renesas: r9a09g077: add GPIO IRQ support
             [v2,6/8] arm64: dts: renesas: r9a09g087: add GPIO IRQ support
             [v2,7/8] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: add GPIO keys
             [v2,8/8] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: add GPIO keys

Series: Add CANFD clocks for R9A09G056/057/077/087 SoCs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1036469
  Lore link: https://lore.kernel.org/r/20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/4] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID

Patch: arm64: dts: renesas: rzt2h-n2h-evk-common: Use GPIO for SD0 write protect
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1038968
  Lore link: https://lore.kernel.org/r/20260106131319.643084-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: Add XSPI clocks and improve divider clock handling for R9A09G077 SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1016836
  Lore link: https://lore.kernel.org/r/20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/5] clk: renesas: r9a09g077: Propagate rate changes to parent clocks
             [v2,4/5] dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs


Total patches: 17

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



