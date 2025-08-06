Return-Path: <linux-renesas-soc+bounces-20058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE59B1C980
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 18:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3E1B17611B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 16:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950FF2918F1;
	Wed,  6 Aug 2025 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgtF60Pt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7114E3AC1C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Aug 2025 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754495994; cv=none; b=CjRaNGl95k+9nS6uCewAp7OSnQCjmz3I9NM5PblL+6gQZ0dc/dywyBg06Z+17F8+q43BHWTEML86vbnggYEh1cOYCo3CS7wEZZ9xxfAgVUgjEK5/9wuKVr+IWuj854A2lKqa3qjktxJ5THfVIgTaGUlaAuA3a2OM30LZ/P921m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754495994; c=relaxed/simple;
	bh=8Wm3sMm6efiLngLRqhVAwR4LdeEFOIMIqOrWoMD4j/k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=QW9G/mH9ON3vEb8FdxeuFuyNODR7k7lqEEYbisql0AreKcZBqey3AfLxtLG3QXWneLgxBdegRXBpSiAoXFg6E7R9gBh1f5jMuzgpxVvEFlWIhMJhZ6V8RZE19LdDc8ibduVVANo6nr4JXY9Gu4LDpqK2ZmSOreJzVXUXiJGTlvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgtF60Pt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08411C4CEE7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Aug 2025 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754495994;
	bh=8Wm3sMm6efiLngLRqhVAwR4LdeEFOIMIqOrWoMD4j/k=;
	h=Subject:From:Date:To:From;
	b=GgtF60PtWx0TZAEJ1hGWLdZ4joB5axgLy8jsaPEcvTVpVgSz5DxQzhM9/KQ0oQW2A
	 3+6KEocWXCEEWH7o47AGQxm68si0zSKtkhtlrBuffg/ums8XouapVsFojDgh/xBXge
	 9xHxl4yWAMUDmJwGSAizeVHSt48ULkfCt8Sn2mogHpWe0BAMroXnrxSh1MrAuk23tl
	 iHtPWqq+gReLd72e1NmDe3pEg6toT2BU32/CGGZ6qszonQi1VdqVnU5V+8jqj937uH
	 g1FjIsU7LvMbR6rMIVgbedbAPz1Fs0EFsvDoZwU07/2ais8wdxa6xYsIDa1mAbbAYJ
	 CZDzwHbzITKmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EEBF7383BF63
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Aug 2025 16:00:08 +0000 (UTC)
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
 <175449600743.2842447.87044147092639525.git-patchwork-summary@kernel.org>
Date: Wed, 06 Aug 2025 16:00:07 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: ARM: shmobile: rcar-gen2: Use SZ_256K definition
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=987271
  Lore link: https://lore.kernel.org/r/c54097a263eb3e451e5e223609a3630d4409dcdd.1753951039.git.geert+renesas@glider.be

Series: Add DMAC support to the RZ/G3E
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=987613
  Lore link: https://lore.kernel.org/r/20250801084825.471011-1-tommaso.merciai.xr@bp.renesas.com
    Patches: [1/3] clk: renesas: r9a09g047: Add entries for the DMACs
             [3/3] arm64: dts: renesas: r9a09g047: Add DMAC nodes

Series: Add support for RSCI driver
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=972979
  Lore link: https://lore.kernel.org/r/20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v12,1/7] dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
             [v12,7/7] arm64: defconfig: Enable Renesas RZ/T2H serial SCI

Patch: [v2] arm64: dts: renesas: r8a779g3: Describe generic SPI NOR support on Retronix R-Car V4H Sparrow Hawk board
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=988791
  Lore link: https://lore.kernel.org/r/20250806150048.9364-1-marek.vasut+renesas@mailbox.org

Patch: arm64: dts: renesas: r9a09g057h48-kakip: Fix misplaced article
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=987270
  Lore link: https://lore.kernel.org/r/280176885acf46d117a0ab9a02c314e2b5cf250f.1753950938.git.geert+renesas@glider.be

Patch: [v2] ARM: dts: renesas: Add boot phase tags marking to Renesas RZ/A1
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=988795
  Lore link: https://lore.kernel.org/r/20250806150448.9669-1-marek.vasut+renesas@mailbox.org


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



