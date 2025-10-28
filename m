Return-Path: <linux-renesas-soc+bounces-23712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A7790C12853
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 02:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 54551354162
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 01:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45222226173;
	Tue, 28 Oct 2025 01:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCmvE60q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D752225788;
	Tue, 28 Oct 2025 01:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761614453; cv=none; b=DVrbCZ9AqM+UoYvy1Tl2W/sLZZ7tZjqJUtb4iHvIO/VP1Mb9kws1LCJ3FH/7ejn7xXFq2rPwOtTf18Kp/tjPrJLMrKRcBH0ujViaGdxK0WpHepKc8hPaJ59P903gGC9F0I3GYJaohJqXW8tI/R1/C/8S4KQYfbgCXW16bXBMTqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761614453; c=relaxed/simple;
	bh=zEWRBnfP++561c+hL3LHaBk8829cXR+Sa0dDa6dDuds=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Kohm7pploKn0az0fWoFmsXmgqgwThSwM91k0LGsCabXm+N4i4hkVLd5XYdbo9JXN9MLIo3viirT5/o4+mTHdmeXEM4v90Qjq5zjqC5o0RKP6/wK32Tb9MLpN/oDxtYHRatJU3MMoI4I9XAIPIn1VoRhbrDYEjFUbpFB+0KkdUUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCmvE60q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EA6C4CEF1;
	Tue, 28 Oct 2025 01:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761614452;
	bh=zEWRBnfP++561c+hL3LHaBk8829cXR+Sa0dDa6dDuds=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HCmvE60qeuSj9x2KsY5VKfX/WYmhx6x2GTyLWWMVN3WhIhNfmilAhE4GBUy65i6oB
	 Fnd1jQ84NEF5120jMVrmIJPNwf27eC7grbKM2bG/HmSTd6+fFJNDoAmR1zfRm5XWFX
	 GOYIzS7FNIeN274DUot8y+0uDuMDtGGfY0GKnA3jGhi8VhE10LFPeu1eRO7ZO+N302
	 23tPp5QefYkGwsyvZMqF81OSwvPpt631sKAW74El50/63dZHhYTp7ixyfEDKeA9rdl
	 XbGwHPBOdHF3kXsquPvH5AfOVuq2tJCRRS/cmsalbSuCPGgeKuhR8s/wNDUMY/+YTk
	 xN9bw2CoYcu8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADE439D60B9;
	Tue, 28 Oct 2025 01:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/6] convert net drivers to ndo_hwtstamp API
 part
 2
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176161443074.1651448.3590346832482597545.git-patchwork-notify@kernel.org>
Date: Tue, 28 Oct 2025 01:20:30 +0000
References: <20251023220457.3201122-1-vadim.fedorenko@linux.dev>
In-Reply-To: <20251023220457.3201122-1-vadim.fedorenko@linux.dev>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: shenjian15@huawei.com, salil.mehta@huawei.com, shaojijie@huawei.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, sgoutham@marvell.com, gakula@marvell.com,
 sbhatta@marvell.com, bbhushan2@marvell.com, tariqt@nvidia.com,
 brett.creeley@amd.com, niklas.soderlund@ragnatech.se, paul@pbarker.dev,
 yoshihiro.shimoda.uh@renesas.com, linux-renesas-soc@vger.kernel.org,
 richardcochran@gmail.com, linux@armlinux.org.uk, vladimir.oltean@nxp.com,
 horms@kernel.org, jacob.e.keller@intel.com, netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 23 Oct 2025 22:04:51 +0000 you wrote:
> This is part 2 of patchset to convert drivers which support HW
> timestamping to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
> The new API uses netlink to communicate with user-space and have some
> test coverage.
> 
> v4 -> v5:
>  fix ionic dirver build with CONFIG_PTP_1588_CLOCK=n
> v3 -> v4:
>  fix commit message in patch 6
> v2 -> v3:
>  use NL_SET_ERR_MSG_MOD() variant to report errors back to user-space
> v1 -> v2:
>  hns3: actually set up new ndo callbacks
>  ionic: remove _lif_ portion from name to align with other ndo callbacks
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/6] octeontx2: convert to ndo_hwtstamp API
    https://git.kernel.org/netdev/net-next/c/a5c12b060efe
  - [net-next,v5,2/6] mlx4: convert to ndo_hwtstamp API
    https://git.kernel.org/netdev/net-next/c/7a07dc723fad
  - [net-next,v5,3/6] ionic: convert to ndo_hwtstamp API
    https://git.kernel.org/netdev/net-next/c/38efb0ba3cd0
  - [net-next,v5,4/6] net: ravb: convert to ndo_hwtstamp API
    https://git.kernel.org/netdev/net-next/c/faac57cddfc2
  - [net-next,v5,5/6] net: renesas: rswitch: convert to ndo_hwtstamp API
    https://git.kernel.org/netdev/net-next/c/87e1b590f776
  - [net-next,v5,6/6] net: hns3: add hwtstamp_get/hwtstamp_set ops
    https://git.kernel.org/netdev/net-next/c/329021eeae03

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



