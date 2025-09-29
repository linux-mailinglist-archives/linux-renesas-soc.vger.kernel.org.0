Return-Path: <linux-renesas-soc+bounces-22436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31408BA8CDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 12:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B09F57A4285
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 09:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C002ED143;
	Mon, 29 Sep 2025 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6C0/zty"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048542BDC23
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140042; cv=none; b=t2p1OUGfTLHl0W7OAnBPsLWef9vY3u2F6IMaabUjAYLlt07KaNHlCH9ulxR3RJDaM9SB7hzXrXvRQ4lz1yq04nEMC2j+U/mCLNeSG6umBfCuZtnpTLKm1awW8pkbJy0xXVFMtHJ4voC3PwHkgwDRSa4jFOCCgjXUcz4bcSZu9zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140042; c=relaxed/simple;
	bh=s7Z7Rk61tzlrBjMbXZwIXad/6bel7aZIYYFosIYto6Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=kosRWmaMDoopwPw3F27TaUBqrrgPv+Fq2+rSSp59SATf4OO/DsmBiatfx9/SjEY0QN1lXhg/9+kxQAIoYXm7/dx4MyU8nVrfobCb0DnEO9Yy9C1B7eaO/9YdkRb8ZvMOGVGed8vc6WCDRJsXbxSMKIldc+xmUipvz9kqQy2NEig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6C0/zty; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83424C4CEF4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759140041;
	bh=s7Z7Rk61tzlrBjMbXZwIXad/6bel7aZIYYFosIYto6Q=;
	h=Subject:From:Date:To:From;
	b=C6C0/ztyn3y3fxHKXpJOgIHI0hTci9ITlxzLMDZsfxi5fz/U+PkOt1oHEjnqwJ8XG
	 yQRq+zLXmCcpv21MOwscr+wXQZUj9LZdYIkI+R5UPl21QxXnQ6FU2m5GxShcXG+gix
	 LRNRUJBOSUrms+AIq98RMPzJwlaZ7FZiLz/XZDmGZjtJwZj2DSRgHhlCkJHUYnzumq
	 0q8ParYg4dIjRxwMw6S7o90aDcxxMYrlbc6Gif3gKzCjtpERx4hoXVBZI4RsAYtpGm
	 VidS9jlstp1JYDH3iQIpDXfBudnqPAg8+QxFKf/PK3a4rooXGIZpbgBV2dbyaFecKF
	 5ULRmBP57c4Pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74B2B39D0C1A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 10:00:36 +0000 (UTC)
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
 <175914003490.1158513.2376300550954849783.git-patchwork-summary@kernel.org>
Date: Mon, 29 Sep 2025 10:00:34 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO to Retronix R-Car V4H Sparrow Hawk
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999056
  Lore link: https://lore.kernel.org/r/20250904202838.172579-1-marek.vasut+renesas@mailbox.org

Patch: i2c: riic: Allow setting frequencies lower than 50KHz
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1005309
  Lore link: https://lore.kernel.org/r/20250923141826.3765925-1-claudiu.beznea.uj@bp.renesas.com

Patch: [v3] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO to Retronix R-Car V4H Sparrow Hawk
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999764
  Lore link: https://lore.kernel.org/r/20250907161130.218470-1-marek.vasut+renesas@mailbox.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



