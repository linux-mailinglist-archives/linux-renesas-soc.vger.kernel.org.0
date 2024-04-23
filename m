Return-Path: <linux-renesas-soc+bounces-4816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00B8ADF7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Apr 2024 10:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19EF1F25FE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Apr 2024 08:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF24050291;
	Tue, 23 Apr 2024 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZfMWu7o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B25245BF3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Apr 2024 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713859828; cv=none; b=DQLVZOCjMjGMF+IRHilGaNy0NpOjYm/sqlvMkEUpJqUCzdv39r/pRTEkAz1nWD0X+co3SvkBt0h28h+KZiZPR5/69ILuqZwSitt2lCtW3xpvMTRu5uPU2J46AhCjIOuU5NCxrQs4RZMOMOXE0DF2Oi9zBGxokbyRTLdnxrmtfEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713859828; c=relaxed/simple;
	bh=v/6ej/Sd02i5Z2UYwqhLwIaWMqMTbApfjXifoNIVYWc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=t4ZPZO45hA6+S8TCCDMCN7oaD+nsQljdRzuQQ5CjX7w9GrAz9maQ2rVTp6WubK+HblCHtjGpZ5pI9q4ETLPTVyQ6ur5VLDGjuqmgSrrdmnFAtK8gZ+qPL6JrMOOk6SKD2QSFm88lmVe/hPuCNcq5YUHd4aOfqqDxxMH57HJ9XLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZfMWu7o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2217BC32781
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Apr 2024 08:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713859828;
	bh=v/6ej/Sd02i5Z2UYwqhLwIaWMqMTbApfjXifoNIVYWc=;
	h=Subject:From:Date:To:From;
	b=RZfMWu7oxKG9EroB+uzafg+I0hzYWN9ABtd4mzjVXaVJyG9i85nqjBfVmSF+XXwIU
	 Vf+JChXsz2WG35f1pi7kBjIHp7AXOB4xpPkCw6fmhPt8730IPnMpLYgYol2yfixe+v
	 s6sNFJQG9VPMQhFemBXYnTB0/VMa4Qa/4WfhwFpdI3f+R3uonekQlo64OPzeEvp5eb
	 bsIHM4oVGQc3VBJJSlW7Iu3dqhzaWirkQvru9SKtIAd+syBQmqQXm453dnKLK4Orta
	 wCMZfelrKnaZM93lUdurWpDtuBm/bLFOWJeEAqdGSkmHeBG0ftUFOFcOlo7bRMItn4
	 dEWQV7Mv9PQAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 114C7C4339F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Apr 2024 08:10:28 +0000 (UTC)
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
 <171385982800.8381.8921363907097127139.git-patchwork-summary@kernel.org>
Date: Tue, 23 Apr 2024 08:10:28 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r8a779h0: Add MSIOF nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=845104
  Lore link: https://lore.kernel.org/r/62d2a1424cabda06c53541d93f6a1a5110267a71.1713280753.git.geert+renesas@glider.be

Series: arm64: dts: renesas: r8a779h0: Add IOMMU support,
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=846118
  Lore link: https://lore.kernel.org/r/cover.1713526951.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Add IPMMU nodes
             [2/2] arm64: dts: renesas: r8a779h0: Link IOMMU consumers

Patch: arm64: dts: renesas: r8a779h0: Add INTC-EX node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=845113
  Lore link: https://lore.kernel.org/r/66aba473186df9a137e7f95393209b23a5916fd1.1713281889.git.geert+renesas@glider.be


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



