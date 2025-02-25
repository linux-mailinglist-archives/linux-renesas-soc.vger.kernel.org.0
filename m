Return-Path: <linux-renesas-soc+bounces-13633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C520A432EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 03:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10FBD17B70B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 02:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F51913A41F;
	Tue, 25 Feb 2025 02:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/6QoWtp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D0136352;
	Tue, 25 Feb 2025 02:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740450005; cv=none; b=tjP6+HjdwfGxdPL8uiJ3kn2VvVBtsE4aR6kksyC9OVNNZrAlPbv6rjEIK5qFRA8OZGx3GPFXxQOj8E9zhJQDkmJbinQ6XIMcydwKuPpnO81SFShVv6moWdX/MMM5uAsIK2jjF9Vc61+4ijxqdVPNh+tnf4DyOW2XgSMJOAz5P+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740450005; c=relaxed/simple;
	bh=g8R/KExjsjMHU++fl86tL9WrJhnFGwtWyWYnw0yoGxk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=J9YGP80aC2MMeXWbDvwThW/zWcgvH/CEeQl4WLx81V+fcGJiT51NVXSyzqZdugK5bXP6wDVQxKKQlXdmhIVkIRT2ZLajjK6PHVRxE2sO9blHJyXCGtg6nOgDAT/H/g6Hmb7Z6kQSl+SyMzrbuAA27AnTZPWdGo0J6kn3G2KnthI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/6QoWtp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E75C4CEEA;
	Tue, 25 Feb 2025 02:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740450004;
	bh=g8R/KExjsjMHU++fl86tL9WrJhnFGwtWyWYnw0yoGxk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y/6QoWtpVm1ilManSvBLWHMWj7U8Nrqe1tpc0pfVugX92GijdTke6VPJqW+HPPZef
	 2LVeQGQvgrhZmimKUpuViZ3RQAzK93a3PW/fo581/g5CKyOwmG9FT6PG3aW3le7QX9
	 YB0yu1eROyWsaFqEsNqBaUGpeiXSgrLCo3r1c+bvG+P6av6aF98fRv6xoyUgb5Xf+d
	 H0uP0jNG+HAJxI/Cv+pVwzzlFSe50h0AnPVuANLrZZt8JeQ+iMyDXGZRm62AosCYKD
	 vCDKAWDMkm5nwwuzqehaO9vP1iEIS/YR8fEWlpgTEN+OvBea+3ZrVUvK6a6v6Ovfzl
	 wPsI3TFyhkzQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD27380CFD8;
	Tue, 25 Feb 2025 02:20:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: renesas: rcar_gen4_ptp: Remove bool
 conversion
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174045003649.3679724.9544329181307344377.git-patchwork-notify@kernel.org>
Date: Tue, 25 Feb 2025 02:20:36 +0000
References: <20250223233613.100518-2-thorsten.blum@linux.dev>
In-Reply-To: <20250223233613.100518-2-thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: yoshihiro.shimoda.uh@renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 24 Feb 2025 00:36:11 +0100 you wrote:
> Remove the unnecessary bool conversion and simplify the code.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] net: ethernet: renesas: rcar_gen4_ptp: Remove bool conversion
    https://git.kernel.org/netdev/net-next/c/6538c8ca8ee1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



