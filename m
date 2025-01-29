Return-Path: <linux-renesas-soc+bounces-12703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2046FA221C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 17:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 872FC160B63
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961D419D886;
	Wed, 29 Jan 2025 16:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k23uYR5V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F811DF72C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jan 2025 16:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738168207; cv=none; b=V5PkYyeSIVINYalFLxNhnO0jV4M7lcMzXDhEliHxn48Yx6TIF1NKX58jfekMkqSv69CLtL30r9oAQapHO+D3ZpIbYyTRbE8HPbADQmpu0864osxaxO7PrUf0mlDB6T453rCxikYPjvXSXQCGybf5I6DAt2u2iMIc/mdxpx1ffDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738168207; c=relaxed/simple;
	bh=qvkumRFW+BRb8QFmkR0V2kqtqeZtnPKN/TLIC0aJRSk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=UEi71Cn1lJN0n2CCLAutKbgyhSqpTU3ED7jZGOLiyiFj1K0Rh+sU9TBY/Y6vGXKIo8pZiT/hyIVCYlvq8usAIfklWqhvOOsM8y/ja5RlPykjRy5E2N/j5lacrl3j2tzCJkUeTWPC8PpCLkhbjxAIMZlf7dfHa19sPyNODJyfl3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k23uYR5V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB32DC4CED1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jan 2025 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738168206;
	bh=qvkumRFW+BRb8QFmkR0V2kqtqeZtnPKN/TLIC0aJRSk=;
	h=Subject:From:Date:To:From;
	b=k23uYR5VrwBBR3gI25s8/3lOK9E1BHPr45oJr9z2Kv74BmK2Bmbx1qbw3UURjPxiW
	 W7487JK4OZockcEDRh7IOS+qBDLaT8G0bvpDjPelGoG7ES9TuPozT6bdZDSkt2oqH0
	 rXUyCgZuj4VfJYyZZUpL9ZKtO8tpePrSxcGCtyB9DQ5ppdyfA0UcLoW/wJ7QU69Q/G
	 XgI++MC6jINc4HwyCAlLVGcRXJvq2VePBNWH8kN8ZAL2i8hu8faJmBeME98gr1A9J6
	 rSHAgAPpI0HpKvuxmnYX7uRkk4Sa9QGXZUd29kxOvqcuU1VQsakmTO40Nm0D7AniS6
	 8YTCVBDukjagg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F32BA380AA66
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jan 2025 16:30:33 +0000 (UTC)
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
 <173816823235.347379.8457717925832575019.git-patchwork-summary@kernel.org>
Date: Wed, 29 Jan 2025 16:30:32 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: soc: renesas: Add RZ/G3E SoC detection support
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=928713
  Lore link: https://lore.kernel.org/r/20250128031342.52675-1-john.madieu.xa@bp.renesas.com
    Patches: [v5,1/5] soc: renesas: Add SYSC driver for Renesas RZ family
             [v5,2/5] soc: renesas: rz-sysc: Move RZ/G3S SoC detection to the SYSC driver
             [v5,3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
             [v5,4/5] soc: renesas: rz-sysc: Move RZ/V2H SoC detection to the SYS driver
             [v5,5/5] soc: renesas: rzv2h: Add a callback to print SoC-specific extra features

Patch: ARM: shmobile: defconfig: Supplement DTB with ATAG information
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=926126
  Lore link: https://lore.kernel.org/r/20250116153204.615736-1-niklas.soderlund+renesas@ragnatech.se

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Disable CONFIG_PROVE_LOCKING
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=926994
  Lore link: https://lore.kernel.org/r/c8439b6b731cd44c0d2442f437d4ceef336125b0.1737390987.git.geert+renesas@glider.be


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



