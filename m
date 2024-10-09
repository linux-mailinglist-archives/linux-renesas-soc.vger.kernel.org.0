Return-Path: <linux-renesas-soc+bounces-9611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F26995CF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 03:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4C3B1C21F7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 01:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9078745948;
	Wed,  9 Oct 2024 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vo5WxWuw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698F42BD1D;
	Wed,  9 Oct 2024 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728437428; cv=none; b=lQxzw1FeHUgqEpqPCEJoGsi82RxBOopo/mwAPEFHWlQa3zzoP7iL1emuQBCIwTPQq/GHjzLi+OjQPKpTJG6BxFmadl8ZapMO1ADA4+kmt5O+KLeXney+4pjKhAfj7RBQHABAZleBGVxm5Fd7dO3pYB+lfsutr+r8OT0deDJzZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728437428; c=relaxed/simple;
	bh=5uEnH8iHglsG7BOdCeBkSt7yFyVK3YkW5mRi7pGjXFo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NMQvHKQ3JXX+iKAd5rU7IjyJipY8hShHvWoFq+kHFPLxvTb0dy2XyFvMj8lMEF1+jf6VYF3baZgC76kEIv/c9G5KkIBfpRbmsA+ch1xVQb3blq4B5fRPY0fMDkM7HQJ/t7o7ifnFxMtdN38nF5e1XmAUrJDp/5XOVXrIcV9JmdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vo5WxWuw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0470FC4CEC7;
	Wed,  9 Oct 2024 01:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728437428;
	bh=5uEnH8iHglsG7BOdCeBkSt7yFyVK3YkW5mRi7pGjXFo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Vo5WxWuw3rxqsr4Yd6CyFiOTGdyw7qlA+lY8ltZWfvqS1ccnbxKP1Tu/7IYI7hwBo
	 7y3Edm0gEbG6xZkp3wpdKHOU/ncPJicpVFteWarfJSlwiq7/M+rKzybWXl/bh3vap6
	 LAKypeeikbYHAnrzj3r7REsRaIL6NC0XuC6bvXSo/2UjANoaBEk3dB4FC108cD74VQ
	 uMm9i6e1rLgnPNo4tJ4Ze8zNdYYAAAf0XVq4jpdx5QWwaB6BL5nFqV5slmn0sYoS+A
	 fNFMSeIcNHQDcpXqv79GoAE4epvcjdCyBiFdssmF2JEv3XYExCJebU7iFC6p+B4x5a
	 VMvEvXjcMzaLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 726173A8D14D;
	Wed,  9 Oct 2024 01:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v2 0/3] net: phy: marvell-88q2xxx: Enable auto negotiation
 for mv88q2110
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172843743198.746583.15521879309788420457.git-patchwork-notify@kernel.org>
Date: Wed, 09 Oct 2024 01:30:31 +0000
References: <20241005112412.544360-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241005112412.544360-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 eichest@gmail.com, dima.fedrau@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  5 Oct 2024 13:24:09 +0200 you wrote:
> Hello,
> 
> This series enables auto negotiation for the mv88q2110 device.
> Previously this feature have been disabled for mv88q2110, while enabled
> for other devices supported by this driver.
> 
> The initial driver implementation states this is due to the
> configuration sequence provided by the vendor did not work. By comparing
> the initialization sequence of other devices this driver supports and
> the out-of-tree PHY driver for mv88q2110 found in the Renesas BSP [1] I
> was able to figure out a working configuration.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: phy: marvell-88q2xxx: Align soft reset for mv88q2110 and mv88q2220
    https://git.kernel.org/netdev/net-next/c/21185019aa9c
  - [net-next,v2,2/3] net: phy: marvell-88q2xxx: Make register writer function generic
    https://git.kernel.org/netdev/net-next/c/0e58c188711d
  - [net-next,v2,3/3] net: phy: marvell-88q2xxx: Enable auto negotiation for mv88q2110
    https://git.kernel.org/netdev/net-next/c/20c7722a7aa3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



