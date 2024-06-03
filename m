Return-Path: <linux-renesas-soc+bounces-5767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B98D7DD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 10:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C32FE282ED5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 08:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA04B74420;
	Mon,  3 Jun 2024 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6ZFgHEl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957C374297
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717404523; cv=none; b=oKXiw5+QcSTDYaZLpT9qrXOyxHCs+w7HZ3G/4H77YuUMPKFJ0WPt+LAt+N2f6puwOIgTXY4BYUpFJ/Qm6on69jLjZPP6+B9N9MN7DZfW9+CSU8tWt0gkLfgK9Y4fPw4oXh09rJNON3Nyorb3EuS9ZOH6CkyNYnTPDT9OM6MLomU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717404523; c=relaxed/simple;
	bh=rL+uKGEfe1USxda0hMiw+eBqxvL+d7su+a0fLAX+a48=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=CG2cA8mXf2UrOrlofO1SeqEphUBxL6E2b9JW6kWJxHe4Wl8rrMGZe+IY+f3pNCtXV54VqVVqRWEUGq0qNecDuVZUbXLNIjaYaAoYKplQWJAm4aONcFScIH8tnaE+7ZoDozT7uj/b19WJYmrJKEQQXW9TXAStvqh9ByBGp6TiTtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6ZFgHEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 236ABC2BD10
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717404523;
	bh=rL+uKGEfe1USxda0hMiw+eBqxvL+d7su+a0fLAX+a48=;
	h=Subject:From:Date:To:From;
	b=c6ZFgHEl3PY/kbYCV0pc0VfaOY5N/COhWYw7G6Jg3nn39/cItGnEKfhmuM7nM/g6V
	 uOtL3baxmAFOqTtXxxbpHJNMWD6BY1gB8mup2LIhMYhr3SZ+lQryZTywTtAEdKsCtk
	 Y30QCyxU2key35Khd8N7Pe25t/8rSHBfna0+SIuHCPXOC6T8W//7Qnz8fHCo0HSppT
	 9KxQvbYPLuct9rgeexhJ8AmKFrcVF6N90U7eoU3X4MEPn7htPHCtrtvW5W0VZ5GsJ8
	 MgpA33RF/zwc2INL+f4UEKwrlqyfV0F3QaAjtjJeBPQvoj05TL5BXWm62tN+zFMqLy
	 ydhFyzZ3Os5Eg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 15FFAC32766
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 08:48:43 +0000 (UTC)
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
 <171740452303.9509.3915215095161817345.git-patchwork-summary@kernel.org>
Date: Mon, 03 Jun 2024 08:48:43 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: renesas: defconfig: Updates
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=857046
  Lore link: https://lore.kernel.org/r/cover.1716997002.git.geert+renesas@glider.be
    Patches: [PATCH/LOCAL,1/3] arm64: renesas: defconfig: Enable Synopsys DesignWare eDMA support
             [PATCH/LOCAL,2/3] arm64: renesas: defconfig: Enable Marvell 88Q2XXX PHY support
             [PATCH/LOCAL,3/3] arm64: renesas: defconfig: Refresh for v6.10-rc1

Patch: arm64: defconfig: Enable Marvell 88Q2XXX PHY support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=857057
  Lore link: https://lore.kernel.org/r/c5dcf03facd05e8b9c5ac89b2b81b005b141f086.1716998320.git.geert+renesas@glider.be


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



