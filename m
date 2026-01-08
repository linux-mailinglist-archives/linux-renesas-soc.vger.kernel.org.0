Return-Path: <linux-renesas-soc+bounces-26397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D08AD02185
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 11:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECF5E30062D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 10:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF5D3AEF44;
	Thu,  8 Jan 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5qNZ8//"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C429D3B95E6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867209; cv=none; b=UyowkooiFa4dCC0XD3QPjNJwlUbtOKqodmhT6JMtDo2pLGAKAI4SCkGI32k57uD8YaMT3BRN9sQWjCimUWCFrysOfOuEWBNIsNycGwpo1HD9eP1iJW6xIimAUcq77tvbbZUrLlPyZGj6zOVguAAOvKZ3d3mzzFuS7onX8CTVZuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867209; c=relaxed/simple;
	bh=YfuDlrqQ3+gufAAiFYJsGFfK3cErAeM0p7OiQg8Tfa8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=MPRfgblzOIbqMquhqn3bC8DLi/8doFCFE5xRPqIh8AblYg9P9Il2k/BG+1PRgbVUPQblbrJ9ki3LrRJAQl/wA8HXP/FCNNnYXbSNaYbIbUosZgb+Y/UMnoyFCvy5eQcoL+ytaoDrGK8OHtTXt2QNDy2GZ4LskyYToZrIjgHHbgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5qNZ8//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D6DC116C6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767867209;
	bh=YfuDlrqQ3+gufAAiFYJsGFfK3cErAeM0p7OiQg8Tfa8=;
	h=Subject:From:Date:To:From;
	b=g5qNZ8//f9rGoj+Kp8TN7fCAxGNm0tOYarJO0l0Qw7V9jPhY6FKPaANdk8tle3GCM
	 stW7i1MxL5XPgR4boCw9jfD3TXkcHr+9SoLa9tGF5NzCVWe+kp+PXxkJ8DGJyyaj7O
	 T7fn1ZZwI13+wSLFGEKZ8yBHbLKdVbzkikRlJIauKfOwy3VKwMv/dxElBrPtXHTxhk
	 UlPt5+Uj9F8pb7/EtyLVu/O5Gj9oUIxOSvc2Ct25ImpaFVjH2OnI4YjZcMo/sXT6gb
	 3RefKaECCmbk/prW5118g+Xdpy8AAVu8MYouB2kky2PTt3mLHLwkl7qZo2UUozltyu
	 h9vuX5f4vHq+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC0953A78599
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:10:06 +0000 (UTC)
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
 <176786700526.3565265.13942045441330485766.git-patchwork-summary@kernel.org>
Date: Thu, 08 Jan 2026 10:10:05 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: of/irq: Fix root interrupt controller handling
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008226
  Lore link: https://lore.kernel.org/r/cover.1759485668.git.geert+renesas@glider.be
    Patches: [PATCH/RFC,1/2] of/irq: Ignore interrupt parent for nodes without interrupts
             [PATCH/RFC,2/2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node

Patch: [v2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1039071
  Lore link: https://lore.kernel.org/r/97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



