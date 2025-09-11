Return-Path: <linux-renesas-soc+bounces-21750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D4B52585
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 03:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2A921C20EC0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 01:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882A61EE7D5;
	Thu, 11 Sep 2025 01:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQZra/eV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F31E8331;
	Thu, 11 Sep 2025 01:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553007; cv=none; b=Y+zBqZ3PgiCLBlTD5rnf4sQoIZxCN+LvSlY9uQZDVTOi3eKyHicn47lcckQWI1tQI/gu4bGmiRZJzGmyJcA+9yEEUE6M+3xnUbRl+NqJU7cKEzSbG5+vQkSwLU82F6sWPvSlENuX8rbyJeT+fvhxUPF2QbKQW3bxq+zDFqaazUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553007; c=relaxed/simple;
	bh=UJA9kHmEb7gX4ePCVJq0ikYNPPKrSZSwiQk2jS7FKd8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=U2pMUVH2m3hF/C2P95ak66zXyyvb6bwjW1EDt4enk0iUxp7YuuirXQ8IPMZBph1x+9rqOuahLSbIGjkGBoy3Jqj49M4tMKb5yTMHWJykzChITitDZuDBc5AZYBHga2Z+FHrL9Mgl0yIYLCVRo5GwKDONO9yrVSAQXEvS6Jbe2Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQZra/eV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B0EC4CEEB;
	Thu, 11 Sep 2025 01:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757553006;
	bh=UJA9kHmEb7gX4ePCVJq0ikYNPPKrSZSwiQk2jS7FKd8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YQZra/eVckrApaTOSwd7l1745QYzD00PHf6ebLDqRDKaMuXERtIHgzeKE/NqzkC3R
	 jX0dNCxSKNjPtua3sAQZ1+EtJptvROlgMmFqaBoeDVKmDtVqdU4eUzBrn8uFN/Ce8u
	 +wKLCOXiligz6dHevc2IQPDOuFfdIVuMd3S2G88WTSucq9zfAi3xZisg+GsPVuUMfA
	 fh6ikyDU5RPBswXAahk0DyOUDneboZFZaxkgtlyb3IyVnAi5J5lx1hKZ+FuVY6eSU0
	 HpO4x81Qt8jQTZloS0jPPh+FHZHVQhjLRScS1wchLCSSTC+eJGLHzIMQSx90KP1T1n
	 OI+23XZpT5r6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA4383BF69;
	Thu, 11 Sep 2025 01:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next] net: sh_eth: Disable WoL if system can not suspend
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175755300958.1617124.14583721373188480783.git-patchwork-notify@kernel.org>
Date: Thu, 11 Sep 2025 01:10:09 +0000
References: <20250909085849.3808169-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250909085849.3808169-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  9 Sep 2025 10:58:49 +0200 you wrote:
> The MAC can't facilitate WoL if the system can't go to sleep. Gate the
> WoL support callbacks in ethtool at compile time using CONFIG_PM_SLEEP.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Hi,
> 
> [...]

Here is the summary with links:
  - [net-next] net: sh_eth: Disable WoL if system can not suspend
    https://git.kernel.org/netdev/net-next/c/9c02ea544ac3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



