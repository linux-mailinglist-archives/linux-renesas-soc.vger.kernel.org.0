Return-Path: <linux-renesas-soc+bounces-23533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E30CC02B18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 19:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3FE29540261
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 17:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE61F2BE04B;
	Thu, 23 Oct 2025 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrZc6SlZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A953634402E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761239429; cv=none; b=r5Qw1vLLna8yuRo8junoWWMKzebfHjBDUxv9IBgTnDw/sbPjnciFAF7FoJhL7zBt0Fy/SFR/vcC4HdnwrbvSeB/I3fK5gQEagzjTHEiGCB3h1uMRmCw8XhnyfHKSVL6SwacJJ//4/k8vRpN/U5cQDiGPYuYhX17Jxg7m/cLzbzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761239429; c=relaxed/simple;
	bh=IDDsbm8cWYSiWjmQ8xEuhNVoGTIYZZqEJDcUx3iEUIk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=mkFhtfQiFlKc/g8Fcvw4X0NY1pZxHWZqV3BwUTIfMEIkqDURdzV8QKXxIwUjMhdLxF9MtGbImZo8MCaGVCSrQeJf6gkfW8IfeGxUSKbobqVCZGPX8RDEe3IQmogErNlHf7JpdulCYE2/QAoBhFtqmJItbOvPl69ZKQ6KzL/UHR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrZc6SlZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FFAC4CEE7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761239429;
	bh=IDDsbm8cWYSiWjmQ8xEuhNVoGTIYZZqEJDcUx3iEUIk=;
	h=Subject:From:Date:To:From;
	b=NrZc6SlZX2d/OeXu/mHU6vq6hpi18PNKU1dCPcKbpf+IVZ5HaFa9ijvGd4nolw0uV
	 emQrq1aWWufU8LwqUk57eD+KleO1Z2QwVOKDDs6P6Q/YPHgb8dSrYZ1FIPT8QbMYbQ
	 Yzx7JfizsNE37XIBcAeP4DCGZJndEAcGUwikRxHfgITKZ9lKDkzQOOAxD+eb70R0i1
	 GEka/EO7239GSgR1h7NEnMbOHJ1WVV+hCMngbMk+jQfasm0sagsMwowRusHhhZ8Wpf
	 PQZUFfYbIG2ioVcfmkp3OTbZml4tnYUNcIHC5Thx3jBLQECTvM6YYdSeZR/wW4nJlZ
	 +3WbhfchJ27XA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B13F2380A94B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 17:10:10 +0000 (UTC)
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
 <176123940929.3174320.9576869925330736570.git-patchwork-summary@kernel.org>
Date: Thu, 23 Oct 2025 17:10:09 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: add R8A78000 support
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1005488
  Lore link: https://lore.kernel.org/r/87h5wsa3h5.wl-kuninori.morimoto.gx@renesas.com
    Patches: [v6,1/2] arm64: dts: renesas: Add R8A78000 X5H DTs
             [v6,2/2] arm64: dts: renesas: R8A78000: Add initial Ironhide support

Patch: soc: renesas: rcar-rst: keep RESBAR2S in default state
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1012852
  Lore link: https://lore.kernel.org/r/20251017114234.2968-2-wsa+renesas@sang-engineering.com

Series: [v3,1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250 GPU in Renesas R-Car M3-W/M3-W+
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1014297
  Lore link: https://lore.kernel.org/r/20251022033847.471106-1-marek.vasut+renesas@mailbox.org
    Patches: [v3,1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250 GPU in Renesas R-Car M3-W/M3-W+
             [v3,2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
             [v3,3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node

Patch: [v2] ARM: dts: renesas: kzm9g: name interrupts for accelerometer
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1010393
  Lore link: https://lore.kernel.org/r/20251011212358.3347-2-wsa+renesas@sang-engineering.com

Series: Add ADCs support for RZ/T2H and RZ/N2H
  Submitter: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008494
  Lore link: https://lore.kernel.org/r/20251005111323.804638-1-cosmin-gabriel.tanislav.xa@renesas.com
    Patches: [v4,1/6] dt-bindings: iio: adc: document RZ/T2H and RZ/N2H ADC
             [v4,3/6] arm64: dts: renesas: r9a09g077: Add ADCs support
             [v4,4/6] arm64: dts: renesas: r9a09g087: Add ADCs support
             [v4,5/6] arm64: dts: renesas: rzt2h/rzn2h-evk: enable ADCs
             [v4,6/6] arm64: defconfig: enable RZ/T2H / RZ/N2H ADC driver


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



