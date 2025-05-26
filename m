Return-Path: <linux-renesas-soc+bounces-17509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CD6AC3F66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 14:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 305B31894A68
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 12:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363EE202C30;
	Mon, 26 May 2025 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0Ri3sw6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9CF20298D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263229; cv=none; b=avcfqSf/8+QeTp1rs35B/I/I2h2m56u8BX9TYsB+HyZxiYshOYCBxuKx0YrU4quc/UxA7jx8kUDYdkg2q5vkx8RPVjR9cnj2wqr8Lod/7D764st2Odzk9Mr3Yi0EqxVFIvy94jOVnzTwQvzdQni6UbO3GX6V8QdoAMo5Tj5ndQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263229; c=relaxed/simple;
	bh=11rOkk4rmhmGWMVF94L3Mp/ssY6iQlCTe8Xbr/qvLCE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=l3fzvh3ofM2gt6zVuMlFTV1uHdyL+ZIPdJnsdG0Nls0RWhmkbD7jC1dqMZ9j+6XDPb7qT85MtyhjYSYvQ1n4Obblo9K8cbqvjRo98Cx8kKUFTPJhodYwE5kt1W6vFxBy2iHSkK1p/vQ2tLbhZF2WKRWWczAY4lD8XJJWiGLG9pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0Ri3sw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D49C4CEE7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748263228;
	bh=11rOkk4rmhmGWMVF94L3Mp/ssY6iQlCTe8Xbr/qvLCE=;
	h=Subject:From:Date:To:From;
	b=l0Ri3sw6lIun3xOIcdRQIlQW1txEze2v/gGLH78lIrIklpp2qFMn2wfxTI/BZo1EQ
	 KxKtJ1z3+toJ66ncuG8AvSubnwBcnbYSLJzlqmSN+XEXdhXg5PUX58pD1B0P//UTTd
	 4fmftareRUuzcHOgqK84A2HHpJoaRSQhxAJNMGmMhtVDJ/xxD47ta6BEWJHAGn5ELf
	 4h/rQnY8i7BcvHgmOLxQOCn1G7FX4wJU6GCwp7j34bkEL/xv9Vf0QmB8D+gLzAf+F6
	 KiGa6l90rEckYTvazTwt9kUjjZIh9EanWp17MgZlfulW3MSuYuHb8QbKu9UnPZFCZu
	 Rl5Bz3x/YOoiA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37BA33805D8E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 12:41:04 +0000 (UTC)
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
 <174826326275.912465.17247793760869054347.git-patchwork-summary@kernel.org>
Date: Mon, 26 May 2025 12:41:02 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Add GBETH support to R9A09G057 SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=962436
  Lore link: https://lore.kernel.org/r/20250513131412.253091-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v3,1/2] arm64: dts: renesas: r9a09g057: Add GBETH nodes
             [v3,2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH

Patch: arm64: defconfig: Build STMMAC Ethernet driver into the kernel for NFS boot
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=959956
  Lore link: https://lore.kernel.org/r/20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: arm64: defconfig: Enable RZ/V2H(P) USB2 PHY controller reset driver
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=962431
  Lore link: https://lore.kernel.org/r/20250513125858.251064-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: arm64: dts: renesas: r9a09g047e57-smarc: Add OV5645 support
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=962893
  Lore link: https://lore.kernel.org/r/20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com
    Patches: [1/4] arm64: dts: renesas: r9a09g047: Add CRU, CSI2 nodes
             [2/4] arm64: dts: renesas: r9a09g047e57-smarc: Add I2C0 pincontrol
             [3/4] arm64: dts: renesas: renesas-smarc2: Enable I2C0 node
             [4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable CRU, CSI support

Series: Add GBETH, OSTM, RIIC, WDT, and GPU support for RZ/V2N SoC and EVK board
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=962773
  Lore link: https://lore.kernel.org/r/20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [01/10] arm64: dts: renesas: r9a09g056: Add GBETH nodes
             [02/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable GBETH
             [03/10] arm64: dts: renesas: r9a09g056: Add OSTM0-OSTM7 nodes
             [04/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable OSTM timers on RZ/V2N EVK
             [05/10] arm64: dts: renesas: r9a09g056: Add RIIC controllers
             [06/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RIIC controllers
             [07/10] arm64: dts: renesas: r9a09g056: Add WDT0-WDT3 nodes
             [08/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable WDT1
             [09/10] arm64: dts: renesas: r9a09g056: Add Mali-G31 GPU node
             [10/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable Mali-G31 GPU

Series: Enable serial NOR flash on RZ/G3E SMARC EVK
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=960999
  Lore link: https://lore.kernel.org/r/20250508183109.137721-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
             [2/2] arm64: dts: renesas: rzg3e-smarc-som: Enable serial nor flash

Patch: arm64: dts: renesas: r9a09g047e57-smarc: Reduce I2C2 clock frequency
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=963970
  Lore link: https://lore.kernel.org/r/20250518220812.1480696-1-john.madieu.xa@bp.renesas.com

Series: Add initial support for Renesas RZ/T2H SoC
  Submitter: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=965871
  Lore link: https://lore.kernel.org/r/20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com
    Patches: [v10,01/10] dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
             [v10,03/10] soc: renesas: Add RZ/T2H (R9A09G077) config option

Series: Add USB2.0 support for R9A09G057 SoC and RZ/V2H EVK
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=963339
  Lore link: https://lore.kernel.org/r/20250515183104.330964-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g057: Add USB2.0 support
             [2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2.0 support

Patch: arm64: dts: renesas: r8a779g3: Sort DT on V4H Sparrow Hawk
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=966244
  Lore link: https://lore.kernel.org/r/20250525160336.82960-1-marek.vasut+renesas@mailbox.org

Patch: MAINTAINERS: Drop myself to reviewer for ravb driver
  Submitter: Paul Barker <paul.barker.ct@bp.renesas.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=964182
  Lore link: https://lore.kernel.org/r/20250519133354.6564-1-paul.barker.ct@bp.renesas.com


Total patches: 27

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



