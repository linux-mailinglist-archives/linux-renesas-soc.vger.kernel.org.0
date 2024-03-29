Return-Path: <linux-renesas-soc+bounces-4173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779C9891315
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Mar 2024 06:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7F971C220CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Mar 2024 05:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94CE3B290;
	Fri, 29 Mar 2024 05:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWa6yq7q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3503A27B;
	Fri, 29 Mar 2024 05:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711689031; cv=none; b=OfY5ufbp+qurTnRhyfMUWY47TlN32OjerCHxWNiLnAeIgymKOmkg+nu8AIS3vn1BlFEKnBxuZBgmVxfPvw54C/tavN1Bcdoh/AyCVAVcV8YpoU1ztOUrEbc2WGFNyzTTpUW4YUNyCDC5ETP1Wh7x97m/i0qiLo9g0Ybuc07yf0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711689031; c=relaxed/simple;
	bh=JTlplW2/Out9DISgdpv3W0wq4268A6szm5K/uLb8+M4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tCeYh/B6qsgWeSWhPHpxRY3Lrwt3/Ii3nz2G2i8XhnxKNwJRflHd2upiBiK/gkjJRZ28jR8tubQMPstrVRJBTOvGaH8P9duadRb6rAIAdhtK0pUSDnnsrnYVRt+8D7O09kttUOjX7OwZIQndH8WZPe/mjkFv3EEd2qxzqIi4CT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWa6yq7q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CE90C43390;
	Fri, 29 Mar 2024 05:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711689031;
	bh=JTlplW2/Out9DISgdpv3W0wq4268A6szm5K/uLb8+M4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nWa6yq7q0+RkYhBkUumSxNQlbGHy/y8vaJShXUfvvnWsticJ7QRiexJr9pvtKzF0L
	 VF2u1sTAt1cyN2Uaw7C9FUp/xkc9WXItgrBsqZjABHyBdH4O4A1Jbp3JI2U3aNKVPa
	 PHLeHoF8sME4ifJ8LI3agjOPzrXDwHRbpJVCqwBXjcp9lJpPgT4KIIq1206OqjbqqU
	 YfQaboUPO/Bkgo8xsORi8zjPETbGH+XLB/py9xvx+QucO6GiZhpcg39fnoffgb7fML
	 OKLeV8eJY3C8NbGqimf3ZS82clxP5b0D4jxijQh6iG5J0JBTu5B9HpAmwUfWCJG6uc
	 3+JwNmWddmB3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 169F6D2D0EB;
	Fri, 29 Mar 2024 05:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next RESEND v6 0/7] Fix missing PHY-to-MAC RX clock
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171168903108.21197.8126750416012356121.git-patchwork-notify@kernel.org>
Date: Fri, 29 Mar 2024 05:10:31 +0000
References: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
In-Reply-To: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, clement.leger@bootlin.com,
 maxime.chevallier@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, xiaoning.wang@nxp.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 26 Mar 2024 14:32:06 +0100 you wrote:
> Hello everyone,
> 
> This is version six of my series that addresses the issue with some MAC/PHY
> combinations.
> 
> Notable changes in v6:
>   - Corrected trailers
> 
> [...]

Here is the summary with links:
  - [RESEND,net-next,v6,1/7] net: phylink: add PHY_F_RXC_ALWAYS_ON to PHY dev flags
    https://git.kernel.org/netdev/net-next/c/21d9ba5bc551
  - [RESEND,net-next,v6,2/7] net: phylink: add rxc_always_on flag to phylink_pcs
    https://git.kernel.org/netdev/net-next/c/dceb393a0a8e
  - [RESEND,net-next,v6,3/7] net: stmmac: don't rely on lynx_pcs presence to check for a PHY
    https://git.kernel.org/netdev/net-next/c/10658e99d952
  - [RESEND,net-next,v6,4/7] net: stmmac: Support a generic PCS field in mac_device_info
    https://git.kernel.org/netdev/net-next/c/f7bff228a616
  - [RESEND,net-next,v6,5/7] net: stmmac: Signal to PHY/PCS drivers to keep RX clock on
    https://git.kernel.org/netdev/net-next/c/58329b03a595
  - [RESEND,net-next,v6,6/7] net: phy: qcom: at803x: Avoid hibernating if MAC requires RX clock
    https://git.kernel.org/netdev/net-next/c/30dc5873967e
  - [RESEND,net-next,v6,7/7] net: pcs: rzn1-miic: Init RX clock early if MAC requires it
    https://git.kernel.org/netdev/net-next/c/0f671b3b6edf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



