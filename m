Return-Path: <linux-renesas-soc+bounces-20376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F2B21FEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 09:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D23C1889583
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 07:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A2D8248B;
	Tue, 12 Aug 2025 07:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eppjwtwn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C962C21FB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Aug 2025 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985217; cv=none; b=igQKrYeMx2OB0Gt+iIeaG0ds2x33DQVbvJsPBBJZEzCYcMp5Gr0fwQuCJw6rcB8NagclNsJOINJ6DdnsKlqERJJ+tVQc0hOaqJKVLCxMfRPW4xO2c4LtTP3hOrDiQX34EXEHKhB29FXjobR5DtM53mgSTixLYDZoOqK1nWccKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985217; c=relaxed/simple;
	bh=ZRr71AguJuxZzjW3W9oBpBoc7PIZQ5mNFDiKui9ahl0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Nimb6xmCDVGpY3VYKPJItB6+gYkV3uYRsqow/RU2faQT6jHClABDF7GBrvHuEcVz6uwoJH5IO/d7mZ2XR2VsW6EGzefvQ4rzi5H/Qyk282csAtZfc7X2O7dIJkndA19XYupmmYcn4e5xC9LaPi1ASKabxCEPI6bF0/cl7DPOFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eppjwtwn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704C5C4CEF8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Aug 2025 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754985214;
	bh=ZRr71AguJuxZzjW3W9oBpBoc7PIZQ5mNFDiKui9ahl0=;
	h=Subject:From:Date:To:From;
	b=Eppjwtwnuk76ndj9bCRKRyaIee6HQkYG5urdbhp+kJ6oViHMDo1yvrpArbmCKS9oC
	 T54qAaLGNGNXEbPCCtxiYBZZgmVtyRkysUWh3taEwlMiPpmyVt5H1G8ZY3ZWcFoVvP
	 Yq8sZoLOAUoH/bK8dB13Mbs/pwK+m03yAT5dyERjJT8Jps/PjupAL0OPkMoIn52mZ+
	 S5AiVz+XTV3+W/vBmc2inGiUXC0Q7U1UUYDvR0brJtJQY+slu9A0GThUy6JpPHbKLy
	 zY2TCWVQ9cB+Izh+19VLlcGMjFH/emYr7dbj5yj5tKskNPjA6SzwPRxLcVaRl2dToB
	 ofgD6idwhLXWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B15A5383BF51
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Aug 2025 07:53:47 +0000 (UTC)
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
 <175498522615.2437311.2984975336541823089.git-patchwork-summary@kernel.org>
Date: Tue, 12 Aug 2025 07:53:46 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Add I2C and SDHI nodes for RZ/T2H and RZ/N2H SoCs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=979733
  Lore link: https://lore.kernel.org/r/20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/4] arm64: dts: renesas: r9a09g077: Add I2C controller nodes
             [v2,2/4] arm64: dts: renesas: r9a09g087: Add I2C controller nodes
             [v2,3/4] arm64: dts: renesas: r9a09g077: Add SDHI nodes
             [v2,4/4] arm64: dts: renesas: r9a09g087: Add SDHI nodes

Series: Add initial support for RZ/N2H SoC and EVK
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=973071
  Lore link: https://lore.kernel.org/r/20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/4] arm64: dts: renesas: Add initial SoC DTSI for RZ/N2H SoC
             [v2,2/4] arm64: dts: renesas: Refactor RZ/T2H EVK device tree
             [v2,3/4] arm64: dts: renesas: Add DTSI for R9A09G087M44 variant of RZ/N2H SoC
             [v2,4/4] arm64: dts: renesas: Add initial support for RZ/N2H EVK

Series: Add initial support for Renesas RZ/T2H SoC and eval board
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=973054
  Lore link: https://lore.kernel.org/r/20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v11,1/2] arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



