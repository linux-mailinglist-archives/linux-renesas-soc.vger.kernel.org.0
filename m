Return-Path: <linux-renesas-soc+bounces-21789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E83B53BB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 20:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5725168CFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 18:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E05E2DC76D;
	Thu, 11 Sep 2025 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZm2e3h/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4492DC76A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616007; cv=none; b=ZTJ9kfvFoydrmXcbJJJQk+/hu89ZluJihMsi7Z8JH8Mkxa6iTsq0u/EGY0b2jedEIvnpR/XDRYym1/O/94VrnKrY5y667SS8HFjlFD29PEIirrLBh9KLUn/J2G8xsXAk/qyxMkbcFFIb4toyXCndfEGxG6L92NmqYRNEFS4ncz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616007; c=relaxed/simple;
	bh=HWp1W9ozaoC2DtbfTWFUgvSzBF61/77ruPcdyUqDhs0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=huqrgw9E4FYeSbQ7nmmeX1eDjFKIbfRNhI4jBimOk1uwWUCXxvLqD2DzI1XMAksCdAl+VUCn8vBBnCT/RMGYwEN1bkWRE8MR2V4DfNkIiV3nbnKug1MGQVB8OC6SB4kZaZBJI2UBCNmNhLrmISi9RfsIOE8MIt0dpLqIBgoAH5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZm2e3h/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1D1C4CEF0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 18:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757616007;
	bh=HWp1W9ozaoC2DtbfTWFUgvSzBF61/77ruPcdyUqDhs0=;
	h=Subject:From:Date:To:From;
	b=DZm2e3h/RENkFTn1hPILgk0erILWf/B4xKreab3ahJSK4JfwXWHlQawm2rCCDfiS8
	 ryP5rNRnCNoPYmQgpIqaEAzext96IloRAifeAZtbE633qHC6NTEVE7bHGNrkr49tCQ
	 uFBn6cX9UntbedfsDuRPG6WxgHJ2rYdHcCEU19/4jA6281Zw6BZihX31qRReoEhatx
	 qg8r5VIipkQ847FxwiRK+7kx+tdoNtUqK+cNBw1yUUZ4zB1eUIWzdc9zyOJkJPPTra
	 ZrDU4hyHoXaFihOgDhhv7UPIQWo1LRXXIU3TNsSGx4vZeqDeNiKd5Zr3JDLN7nfMjp
	 I9v1/mOZSt14w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1A30383BF69
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 18:40:10 +0000 (UTC)
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
 <175761600925.2281586.3070601761015685910.git-patchwork-summary@kernel.org>
Date: Thu, 11 Sep 2025 18:40:09 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: sparrow-hawk: Add overlays for camera sensors
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999224
  Lore link: https://lore.kernel.org/r/20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v5,1/4] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
             [v5,2/4] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
             [v5,3/4] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
             [v5,4/4] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2

Patch: arm64: dts: renesas: r9a09g047: enable tx coe support
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=991595
  Lore link: https://lore.kernel.org/r/20250814153456.268208-1-john.madieu.xa@bp.renesas.com

Patch: [v2] arm64: dts: renesas: rzt2h-n2h-evk: Enable USB2.0 support
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=998793
  Lore link: https://lore.kernel.org/r/20250904100435.4033858-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: Add Schmitt input for NMI function
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=992281
  Lore link: https://lore.kernel.org/r/20250817145135.166591-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g047e57-smarc: Fix gpio key's pin control node
             [2/2] arm64: dts: renesas: r9a09g047e57-smarc: Use schmitt input for NMI function

Series: Add I3C support to RZ/V2N and RZ/V2H(P) SoCs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=998975
  Lore link: https://lore.kernel.org/r/20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g057: Add I3C node
             [2/2] arm64: dts: renesas: r9a09g056: Add I3C node

Series: [v2,1/4] arm64: dts: renesas: r8a779a0: Rename dsi-encoder@ to dsi@
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999071
  Lore link: https://lore.kernel.org/r/20250904210147.186728-1-marek.vasut+renesas@mailbox.org
    Patches: [v2,1/4] arm64: dts: renesas: r8a779a0: Rename dsi-encoder@ to dsi@

Patch: arm64: dts: renesas: r8a779g3: Rework fan hwmon comment on Retronix R-Car V4H Sparrow Hawk fan DTO
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999809
  Lore link: https://lore.kernel.org/r/20250907225338.426253-1-marek.vasut+renesas@mailbox.org

Series: arm64: add R8A78000 support
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1000763
  Lore link: https://lore.kernel.org/r/87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com
    Patches: [v2,1/4] dt-bindings: soc: renesas: Document R-Car X5H Ironhide
             [v2,2/4] soc: renesas: Identify R-Car X5H


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



