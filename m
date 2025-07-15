Return-Path: <linux-renesas-soc+bounces-19550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74184B04CF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jul 2025 02:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06B095604C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jul 2025 00:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2D7221FA8;
	Tue, 15 Jul 2025 00:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7JlgibV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0DFF9C1;
	Tue, 15 Jul 2025 00:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752539406; cv=none; b=IYU22kSmaMIYobVq6fST411QhN/CuKCJigZFVdiCs2InQxZQP0UG1q9E4pY4M9Mz7KrWTtVs0gNMVXpmcwcJ5+Q3mcd+jg3+uyd/Z6iRLTCgKTE4HEG2O/AwxWBCDgjT2b91gvZlx4KalCTSkQYGwpQ3oTf7LDG4K3RH79wePe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752539406; c=relaxed/simple;
	bh=0IagI1zat30udtHUUL9oMa1MM9a7xBwR1iXrFBogpCg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rQYy/T94rCdOzt2isSwiM31zNabPusVIt/Hq+A4gvVMb/8DpRo1PzD5uGGUKTFECVAx6RZPYS0WO+GwYPF9RjKab+g0BCyFKZlDtNwj2VBTMMEL4EV7DyoOIWt56947Tt6o2a9+cqgWq5wIYxYCADfqEhq5/uwnUsueMDINZ7JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7JlgibV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC6EC4CEED;
	Tue, 15 Jul 2025 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752539405;
	bh=0IagI1zat30udtHUUL9oMa1MM9a7xBwR1iXrFBogpCg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f7JlgibV20vrDi0ObQFP7vFtEC97V6dUaPKTEHbdxNIzfGQWcIOjxiXcTdhg60+OR
	 O0lvYQ/amiLc4o5RAUF1FmgSV58j0aTS5aalMaF0+kUfUs2z5qMc589cfa2EQ7q9wh
	 3mDD9vNXB4d62la9uakvzT+4S1M6H9uxALzAns2WZJf2Ae1AEPKZ/eR8QpqK8u3V2Q
	 w4Az8NRdbD4skCgG8m69D87gfPr4wUDgTsjWrsO3/EjyjIkKq88XtCrenAApMopJXE
	 njzPP+iwvOQJ9g8BK3k3CrZJlCDUiY6JwLdOnm1Op1ru2IJN/VknvvRL/E+a45vQqo
	 oxh672atXM2qg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCF4383B276;
	Tue, 15 Jul 2025 00:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: phy: micrel: Add ksz9131_resume()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175253942624.4037397.1130283220408120755.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jul 2025 00:30:26 +0000
References: <20250711054029.48536-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250711054029.48536-1-biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com,
 biju.das.au@gmail.com, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 11 Jul 2025 06:40:21 +0100 you wrote:
> The Renesas RZ/G3E SMARC EVK uses KSZ9131RNXC phy. On deep power state,
> PHY loses the power and on wakeup the rgmii delays are not reconfigured
> causing it to fail.
> 
> Replace the callback kszphy_resume()->ksz9131_resume() for reconfiguring
> the rgmii_delay when it exits from PM suspend state.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: phy: micrel: Add ksz9131_resume()
    https://git.kernel.org/netdev/net-next/c/f25a7eaa897f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



