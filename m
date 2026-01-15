Return-Path: <linux-renesas-soc+bounces-26850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D8D2426C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 12:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE53A300A360
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 11:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447A43793CA;
	Thu, 15 Jan 2026 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRg3Z2nu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225AA378D9E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768476217; cv=none; b=Ox/nJRgYJle1IHeXCBICXj4br/dZ92dctSE3wYuA+OjkZYlCUk5ia9iJktZuVT2AS/2uJPUIhYvA2zXM+sVYAalR2CRowC5Y3V6ycJZzYR3Jk47wL8wUsvkUSNJAnkfRll8+x9T0gDOu0eMOcJIoEDPrQYz8Qud1wbcTSAvKyyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768476217; c=relaxed/simple;
	bh=qICV2IgMUWH4lppFsSxk9Mf8IhU74e+MDYf6uWu4Dqo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=swmUMJSQ4SyAvB6BmDP5w3rzGkLM7cm0nC1gkzmbK5weTdRRNqIu/9OasX8HH6vtnPS3e5NaBSYSlL9kBP1FP2NrUb/k6gFhcMhWaYtOGo/rqRGQrIYiWac3xzuUI6zIDBDNC8y03YpcVo1oGKPJtvLAnwojQtU0FVgERHlV0IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRg3Z2nu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24DEC116D0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768476216;
	bh=qICV2IgMUWH4lppFsSxk9Mf8IhU74e+MDYf6uWu4Dqo=;
	h=Subject:From:Date:To:From;
	b=SRg3Z2nuM7CpHkHQguLZNNjoun8P1Dh2ULIdwiXBnzR/1W5ExCjHdVZIT8jDlBYk5
	 DC+5AERFAEZ10VbDmWhd2uNr53Hx7ZfV7pUg6VCSZIsVp4VubvVGbHpU56gTXerNDh
	 RG4GFdW1raypSxbTzGGD4fQT0Yi9w1YtHRDQsaCnTw62i7W91ZN5GbjvUVGafBaldH
	 szHFuboxyMZiSrnwpK9dqqJXsmKOdDC75sm0WS5TVy8fUs6MZru8uN/g9tWDOhLm+3
	 HTwXhV+Vn8/QNRLuzkX9HnLKuPQE6QI0VfJWxu0PCfoURH+6DoaSTLhEAO+sYIu8Yl
	 1ZJD/7EPuyEPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 47E453809A3D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 11:20:10 +0000 (UTC)
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
 <176847600910.3949842.7843150690615448939.git-patchwork-summary@kernel.org>
Date: Thu, 15 Jan 2026 11:20:09 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: gpio: renesas: Add support for GPIO and related interrupts in RZ/N1 SoC
  Submitter: Herve Codina <herve.codina@bootlin.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1042214
  Lore link: https://lore.kernel.org/r/20260114093938.1089936-1-herve.codina@bootlin.com
    Patches: [v8,1/8] of/irq: Introduce for_each_of_imap_item
             [v8,2/8] of: unittest: Add a test case for for_each_of_imap_item iterator
             [v8,3/8] irqchip/ls-extirq: Use for_each_of_imap_item iterator
             [v8,4/8] irqchip/renesas-rza1: Use for_each_of_imap_item iterator
             [v8,5/8] ARM: dts: r9a06g032: Add GPIO controllers
             [v8,6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1 GPIO Interrupt Multiplexer
             [v8,7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
             [v8,8/8] ARM: dts: r9a06g032: Add support for GPIO interrupts

Patch: arm64: dts: renesas: r9a09g047e57-smarc: Enable I3C
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1025787
  Lore link: https://lore.kernel.org/r/cover.1763638659.git.tommaso.merciai.xr@bp.renesas.com


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



