Return-Path: <linux-renesas-soc+bounces-16320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A843A9ABCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 13:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C79D43AF46F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 11:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA92227E99;
	Thu, 24 Apr 2025 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBYcMSBv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C26225A20;
	Thu, 24 Apr 2025 11:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494191; cv=none; b=f8JH8kZwQNbq+jrkz0p5Q7qsvwPNXzidwSEL5i/lyh2U58b0vTyKm1nVCZkiByslSyWt4DnsYnTIEGf08NB70RRPrsNnoJXYgy0nP1Bf3T5d90RjtR2z+TQh3+pPNb+uzC17PLuSxnrMYTkWsZx+FwmbRtlyAyTagsuZDAo9JWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494191; c=relaxed/simple;
	bh=B8TtwX8xu0ydCpvwD+wF6ZlJo+pxxLXqelvivpWEft0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rDgKfsSb+/0VhV5stUYU7Yt0y4E05EDtY1fBN/Y82yWCpCBIj3eDwqR9tIFR12SBuFWbXPVbSBO9sEihhuShYEz3JMd3b7vf/A4KwaWLhzlWFLwrk1OqNuEPm61W/TdhSypHezaqODZQAoZol8UlhAWRoVegrfi/t0kdcrX07L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBYcMSBv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62322C4CEE3;
	Thu, 24 Apr 2025 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745494190;
	bh=B8TtwX8xu0ydCpvwD+wF6ZlJo+pxxLXqelvivpWEft0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DBYcMSBvT4BHJZ6BgE6AMJ4656RRMPO+DEN63a8bbRYXCB342xnFI/zMI/2Rg/aaX
	 R1PiUMrllv7/knwrBlXW1LsMNg29w//JHjYzAYvrs5x91DNHnMKVB3MtOI6cKngC6f
	 kFscnxrkec1uARccU31pJ9ZY2BctwAKg556GSFIvjhJr+hj3GlYFSI30hOB3j/hfiS
	 rBZoOOYx7PzeNcbUj/zoL2w5vUW3E1L+VUA5YhNJqAX8ri1N1PDqnWQFxNSV/DdCgc
	 1FgEPhXzW8hFV4v+8KleB/+22bYV6XyXCdR4YuwSEiFvs9RW/oET37lV7US/PSCrNh
	 MkK8S7QdkGP4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D51380CFD9;
	Thu, 24 Apr 2025 11:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v2] net: phy: marvell-88q2xxx: Enable temperature sensor
 for mv88q211x
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174549422900.3318223.9121982783788263714.git-patchwork-notify@kernel.org>
Date: Thu, 24 Apr 2025 11:30:29 +0000
References: <20250418145800.2420751-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250418145800.2420751-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 dima.fedrau@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 18 Apr 2025 16:58:00 +0200 you wrote:
> The temperature sensor enabled for mv88q222x devices also functions for
> mv88q211x based devices. Unify the two devices probe functions to enable
> the sensors for all devices supported by this driver.
> 
> The same oddity as for mv88q222x devices exists, the PHY link must be up
> for a correct temperature reading to be reported.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: phy: marvell-88q2xxx: Enable temperature sensor for mv88q211x
    https://git.kernel.org/netdev/net-next/c/bef4f1156b74

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



