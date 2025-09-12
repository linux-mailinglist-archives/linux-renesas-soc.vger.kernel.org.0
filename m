Return-Path: <linux-renesas-soc+bounces-21791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E43B5400F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 04:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 58D044E02AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 02:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41421F92E;
	Fri, 12 Sep 2025 02:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7NySabh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAFE33E7;
	Fri, 12 Sep 2025 02:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757642426; cv=none; b=tHKITZlasCasRJIYV2VE5wVMnTRwCcaGu9PjMqXLB0c4CANd5TvetB5Ijc21Zn6imbXJhcF6zWF0/di6VYMbHv1xiRm7e9Qe8AmVbEXGG0OPCMktybg+614Sf9tr+ukrgaTa1WF/LPguqXp8rCsh5qLQAMH3GPhqnVc9FwWiaC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757642426; c=relaxed/simple;
	bh=aU2h9QxXe4w357gjDc1xv71/YSvJ2iIm9TDJt4sIz/Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iOYM3PGS+GHz8Z1B1/+pJRXvIVS+G6zLi8yBmHNPssRH0m7mV4IXiY3oEU1zVQWBlYmNGMmidn+exia03DlMHMrhqCiv1V1u8PL2tlTZFQwOnjUfn0NcI9WJ2nNeRWLqA6FW00OWpl8DjcJPSYHqMF5hkjn3ZKoK63JayHOJmNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7NySabh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310D4C4CEF0;
	Fri, 12 Sep 2025 02:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757642426;
	bh=aU2h9QxXe4w357gjDc1xv71/YSvJ2iIm9TDJt4sIz/Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T7NySabh31MiXrHi+gUnqUMJX81s9fFUd4MdwTydv7/rDnfhsWLnC2K9GCHO/u7Sx
	 05YokBk8P+qPypZ++9N/Il+Xb8yz9lIcNf/2uJf2aTwy4XqP8eqGx5jRrjKE3Via3E
	 BNVD6epPhqbyuV3MqZxbeljtqRLROpEMs272/zc42zjTz9q3PkjijIjxldOX31qw2J
	 2xq3MnGytjB3pvnv7OmtgScpiwzVYLVEXmVnxLYqaRjxUMd5bNzgLYKl7QDE4G3aRM
	 oPKzzn8TRnK2M+KcQEkPpLSovQrlMBlKukww4JeYPkfSrbLjy9FTtv9Hd7zFtGKXSd
	 OVhAhD6DsFFew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF2C383BF69;
	Fri, 12 Sep 2025 02:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] net: ethernet: renesas: rcar_gen4_ptp: Simplify
 register
 layout
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175764242848.2373516.2098681536238652968.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 02:00:28 +0000
References: <20250908154426.3062861-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250908154426.3062861-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: yoshihiro.shimoda.uh@renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  8 Sep 2025 17:44:23 +0200 you wrote:
> Hello,
> 
> The daughter driver rcar_gen4_ptp used by both rswitch and rtsn where
> upstreamed with support for possible different memory layouts on
> different users. With all Gen4 boards upstream no such setup is
> documented.
> 
> [...]

Here is the summary with links:
  - [1/3] net: ethernet: renesas: rcar_gen4_ptp: Remove different memory layout
    https://git.kernel.org/netdev/net-next/c/4da47931a924
  - [2/3] net: ethernet: renesas: rcar_gen4_ptp: Hide register layout
    https://git.kernel.org/netdev/net-next/c/492d816b1793
  - [3/3] net: ethernet: renesas: rcar_gen4_ptp: Use lockdep to verify internal usage
    https://git.kernel.org/netdev/net-next/c/fd2b2429fbc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



