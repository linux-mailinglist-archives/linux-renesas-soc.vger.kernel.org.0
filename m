Return-Path: <linux-renesas-soc+bounces-10177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8A99B2D68
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 11:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40A63280D00
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 10:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920361D54FD;
	Mon, 28 Oct 2024 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/PC6337"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3EE1D9339
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Oct 2024 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112670; cv=none; b=G/ifTgfm7FB0qXn82AN0C28cl/cAQ6DR1n+EOvVGyLZFQw11Uf+yKmPWpqmfFuUnr9/2q001y4wI7iBGwvrYa05Q4ny3PXTBKahM58zzn4b5lReX5FS7z5hta4gNyzwNHT/yVBFv+79Rygtqy2HhNBSgB+LHbKjtMfqSjD9i93w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112670; c=relaxed/simple;
	bh=lLAasVGCyncQ04lm5rbjugJonYHcfNBlXmDI+4Lgc6Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=auD6weuIWlP7hDwurrANARH0XN1hLtd7hQVFAm9A0eD5DzzIVQi/1C6dDXIVg9wiCVrHILmC34M/JmXF54rtuR1/q80s2jIpqx80J4Ej8e41lq6kTRwmdhgJrQ3oFDoPgmRhDpHpwRlDQifnoD5ENPtip46YBHxcwvQXjImRiLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/PC6337; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1BDC4CEE3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Oct 2024 10:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112670;
	bh=lLAasVGCyncQ04lm5rbjugJonYHcfNBlXmDI+4Lgc6Y=;
	h=Subject:From:Date:To:From;
	b=N/PC6337bkYjyxAT48sZYTc8xZfgkHD62rjG/m8UVEYXn6fgJqVxI6ICXvq7/7K2F
	 ovCi4XMAAaTZUI3woLcPon5aEoWeGC8DjjCxM1fgL+9/oLPDg5UgbbdW4R0czlJiSJ
	 uodnNAS6joXrQ26nkzKrbcw+rOmOK3Mnh7LVk0zSyJtGelaKvh+OjNiJf02E7ozPaB
	 UQbNCGhBXPlWLVBXYm7tc9/zMqUG6yG9BpybNv+jzcshUDbWor0865r+w57d5krqZX
	 nSmLzYMKVjyOf+1ZrU3VQ0BO4S4oQJ8EuhKaXmiyRaZf+jV98xaZO65/SsMxWibtPn
	 GViI61yRrHL3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F31380CFD7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Oct 2024 10:51:18 +0000 (UTC)
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
 <173011267720.9924.1145037865710589585.git-patchwork-summary@kernel.org>
Date: Mon, 28 Oct 2024 10:51:17 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: white-hawk-cpu-common: Add pin control for DSI-eDP IRQ
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=900592
  Lore link: https://lore.kernel.org/r/89bab2008891be1f003a3c0dbcdf36af3b98da70.1729240573.git.geert+renesas@glider.be

Series: ARM: dts: renesas: r7s72100: add DMA for MMCIF
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=899528
  Lore link: https://lore.kernel.org/r/20241015224801.2535-4-wsa+renesas@sang-engineering.com
    Patches: [1/2] ARM: dts: renesas: r7s72100: add DMAC node
             [2/2] ARM: dts: renesas: r7s72100: add dma entries for MMCIF

Patch: arm64: dts: renesas: hihope: Drop #sound-dai-cells
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=897655
  Lore link: https://lore.kernel.org/r/20241010135332.710648-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



