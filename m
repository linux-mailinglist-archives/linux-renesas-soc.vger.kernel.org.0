Return-Path: <linux-renesas-soc+bounces-23314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FEABF0003
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 10:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 425044E14D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 08:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521752E8DEF;
	Mon, 20 Oct 2025 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgZdw4eU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8DD1F1517
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 08:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949689; cv=none; b=u1UHb+qlN0Qg1Ciqqesdsr8mNV+I6VkUV5RA4THNHrDBeNUzSU0Xke750tUsP0hYM7DtOXcuY0JsxJe4TO9gfMS5PQsJ4rF+7AGKJusi5vFph1c+4F0cdxHprkns2IX7ftl751LxQ6YpFROrrO1aFR+Uqq4B7xLTWauHExHMsxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949689; c=relaxed/simple;
	bh=FIzajP3Xh/ZD3iJ4uhLNKVYf5RzQrLepZboUlQtY4DA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=SlBJ/IHdMqEhPsrUWMLjPn0zJLVXeCFNyC1p+jDfQOxPbop4FKxhNtX7Xiic948CKlMml2fMjOsuOIRqTvtUWGLQi4ggj+VZus9VfCI/SPrO7YjEI5qfXARoBUdnseiiP2YgKzMu/uaAbRcZMaxKjxwQPzHLD3GQBYahrOolpMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgZdw4eU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEC8C4CEF9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760949688;
	bh=FIzajP3Xh/ZD3iJ4uhLNKVYf5RzQrLepZboUlQtY4DA=;
	h=Subject:From:Date:To:From;
	b=hgZdw4eUqo3Jq/nb5RDeaofOC9G/a3ZNStteVUTB4O9vdwa8jp/FY6lx/MLHQ6a+G
	 rWQPMScvhXAGzHRlvooIiViJ339stS9k4aELDCq9ZrGK6hdsdS1ybbydsUKeVi/tKc
	 +JusmoG/cS6oblxMXh49a/Mtoyc50ocMg2wWZq4UQmVWgwCr8ggkx88tbnL7aVGVOu
	 QcGpL/a+J6HvWN/mH/V5Sl8sdtj6J2WdQQzOsgNaAKOpUEHJBFKUa4/R83DnLEHJHc
	 exSHhqitcuCLs9WPoGpfkZF79oOEn+HwBbQKtZxgp8pWc2BFJ9l6foyVgj/nJLM8LR
	 2MH0vjdPPkRqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EED2A3A40FDB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 08:41:11 +0000 (UTC)
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
 <176094967036.87244.4160510429955079496.git-patchwork-summary@kernel.org>
Date: Mon, 20 Oct 2025 08:41:10 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.18-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1011841
  Lore link: https://lore.kernel.org/r/4458f6e978684ce5a298c55d8a95edf9e611ca9d.1760530547.git.geert+renesas@glider.be

Patch: ARM: shmobile: defconfig: Refresh for v6.18-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1011840
  Lore link: https://lore.kernel.org/r/d0fcc82fb294021bf96f8a490234165e15aadb43.1760530468.git.geert+renesas@glider.be

Patch: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.18-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1011842
  Lore link: https://lore.kernel.org/r/c33e8d0a4102ea2a2758b855372f23bc2dc3abf7.1760530600.git.geert+renesas@glider.be


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



