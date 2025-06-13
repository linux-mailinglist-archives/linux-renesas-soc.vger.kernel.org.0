Return-Path: <linux-renesas-soc+bounces-18268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 583DBAD88F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 12:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 090613A1C8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 10:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAD92C15B6;
	Fri, 13 Jun 2025 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkDuArAx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480232C15B3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809406; cv=none; b=h0zRtxQGganR0SH9OZ/Y11B/T/acp3m/t38fb4mZDjE8FCU9XuSzbsz8OIKyFpjoqeodtIoatFvvwJ0R7oV3bQQuICj9E8Xvfd7ZeD2wTgAzusMCGzbuZPiDt3uTWb8TiavevOkejy0kkURi+8PiOLS5FFTMApdzcpCMtop5dj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809406; c=relaxed/simple;
	bh=dDI70yGCWfZpRne3xF8sbV+fHRUtVtjORGSx+qpOglE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=XMl2GN7sY8nwpHJ1NHpDL3KS0gcaozF2EXrmNvrPSt/FI2iz+aXY/+fT82wKTNfv5w+jtgrQ5Wp2TLRGpi9/fnWDFPsGIfA/aXI8dH34xX6GxOMQwfsbGx3Osvd9c2XWfcTGga1iip0GWGQYfg4GwGV/KQ1N46G9FwprImj+2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkDuArAx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90ACC4CEE3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749809404;
	bh=dDI70yGCWfZpRne3xF8sbV+fHRUtVtjORGSx+qpOglE=;
	h=Subject:From:Date:To:From;
	b=EkDuArAx8Lsh16qVOp9+vH6t+CCq87wqL/sMzc5K6Agm0A2VnK3+AZtPgkSJoyYqT
	 sRjIJX7NkEvgmwXC0IL5ct6bmaesTnbNxxY6VxbAGZvjA6FCjtTlGb52mpRB4ZPOiZ
	 TxGkaXc7i7f7AWZpPujBRb42B+MZaQabTCKzQITs5SdYP3g+Ihmlhw2eBFbxzdeyl8
	 19b28ixLAdaCKJDeR0YAa96JBBX7DGJIU6fyQk7nM8Zn2z1pBWKJwDbRGEXhC/f225
	 mXRhzZRK3t8SGYFwE7Y6iR0CpqhdfSCqvL3aGephqAZUw0Er3ps+G1xQtwAM6VhH6x
	 5aWaH/AB94jow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1BE539EFFD0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 10:10:35 +0000 (UTC)
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
 <174980943415.667161.3595647669617325482.git-patchwork-summary@kernel.org>
Date: Fri, 13 Jun 2025 10:10:34 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add support for Renesas RZ/N2H (R9A09G087) SoC and RZ/N2H EVK
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=969999
  Lore link: https://lore.kernel.org/r/20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/8] dt-bindings: soc: Add Renesas RZ/N2H (R9A09G087) SoC
             [2/8] soc: renesas: Add config option for RZ/N2H (R9A09G087) SoC

Patch: arm64: dts: renesas: Add bootph-all to sysinfo EEPROM on R-Car Gen3
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=969632
  Lore link: https://lore.kernel.org/r/20250608215212.1619182-1-marek.vasut+renesas@mailbox.org

Series: soc: use new GPIO line value setter callbacks
  Submitter: Bartosz Golaszewski <brgl@bgdev.pl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=970330
  Lore link: https://lore.kernel.org/r/20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org
    Patches: [1/2] soc: fsl: qe: use new GPIO line value setter callbacks
             [2/2] soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks

Series: Add USB2.0 support for R9A09G056 SoC and RZ/V2N EVK
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=967032
  Lore link: https://lore.kernel.org/r/20250528140453.181851-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g056: Add USB2.0 support
             [2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2.0 support

Patch: ARM: dts: renesas: r9a06g032: add second clock input to RTC
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=968554
  Lore link: https://lore.kernel.org/r/20250604084211.28090-2-wsa+renesas@sang-engineering.com


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



