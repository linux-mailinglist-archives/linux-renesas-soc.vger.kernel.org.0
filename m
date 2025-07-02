Return-Path: <linux-renesas-soc+bounces-19047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF839AF62C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 21:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A9C16BA11
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 19:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B832F5C2A;
	Wed,  2 Jul 2025 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFA26RWg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15CD2E49B6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Jul 2025 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751485188; cv=none; b=oxApRBqOhHOtThFgwTWGWP/9W8ZuIfaQxsSvifHZdoX7Cr23a/oVbuSIQags/+H7PiEGADGY9KokQFVAWPqIRL1t61NsIjapJoGZcWluV3abMGsPkqwhIw2HIkoEjRHmeHdHE/bgcJY67ZEwu1zi1Np8AeXY/ZUTkZPG8qxUMLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751485188; c=relaxed/simple;
	bh=d+Cm1tRVUIKKwbckxKAFiFMBJTYeGZ9LESsF0mkUkk8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=YL0hWopU30YcxfZPaiJoRW9phaMRTrrOOd9h+ELx2CqvCZSoXM+z3YhGARO6WAih3UYf5q86rWhVihJzj7Uys8C1Id/nPHWVHipuavgHEhfTS4pfvYKVrO1UuRYCCxQbWPhlUBNpPoG18SgHGzdBPDOdVwWuwlr76v9S6ysHRmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFA26RWg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8329DC4CEE7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Jul 2025 19:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751485187;
	bh=d+Cm1tRVUIKKwbckxKAFiFMBJTYeGZ9LESsF0mkUkk8=;
	h=Subject:From:Date:To:From;
	b=fFA26RWgNBCDYaowIVY9eNzAhL84yImTIlVietKxzQdwqROsFI/RZMbecXNqje86n
	 Nts8CcXm0vQP0zlDk14XBu/59GGOhOmXXUQFv196t3kWS5W5IJN48BaaekyGxrcy3s
	 BppesxesjvFUtubU4xwlStMitdipHi8Ts36lXnrbyb1eeYWWUswVsCvyIWuE+U+Gmc
	 Xs2+9fQmzrBg1DLJk8LLYfSdZidR/hDdTlDb9KCpaVcnqwaOVnDGyVwd8RvkX3CXA9
	 LxArkT1Q5ap3WgZwE/Sf70wAThzHgu//1S/LcaM/rJZklp+AuEITHwP+iVCuTAPR/3
	 VpOM/uog65diA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37791383B273
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Jul 2025 19:40:13 +0000 (UTC)
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
 <175148521165.844310.1584736285964752165.git-patchwork-summary@kernel.org>
Date: Wed, 02 Jul 2025 19:40:11 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: renesas: Add support for Gray Hawk Single with R-Car V4M-7
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=976142
  Lore link: https://lore.kernel.org/r/cover.1750931027.git.geert+renesas@glider.be
    Patches: [1/4] dt-bindings: soc: renesas: Document R-Car V4M-7 Gray Hawk Single
             [3/4] arm64: dts: renesas: Add Renesas R8A779H2 SoC support
             [4/4] arm64: dts: renesas: r8a779h2: Add Gray Hawk Single support

Patch: [v2] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=978117
  Lore link: https://lore.kernel.org/r/20250702092755.70847-1-biju.das.jz@bp.renesas.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



